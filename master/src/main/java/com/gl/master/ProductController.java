package com.gl.master;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.junit.runners.Parameterized.Parameters;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.Marker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gl.master.model.CatVo;
import com.gl.master.model.LocVo;
import com.gl.master.model.MasterDao;
import com.gl.master.model.product.ProDetailVo;
import com.gl.master.model.product.ProductDaoImp;
import com.gl.master.model.product.ProductVo;

@Controller
@RequestMapping("/product/")
public class ProductController {
	// ��ǰ ��Ʈ�ѷ�

	private static final Logger logger = LoggerFactory
			.getLogger(ProductController.class);

	@Autowired
	private ProductDaoImp proDaoImp;

	@RequestMapping(value = "list")
	public String productList(Model model, HttpServletRequest request) {
		// ��ǰ ����Ʈ �����ֱ�
		HttpSession session = request.getSession();
		String id= (String) session.getAttribute("id");
		if(id==null||id.equals("")){
			return "error";
		}
		
		
		logger.info("productList index");

		List<ProductVo> list = proDaoImp.selectAll();

		for (ProductVo bean : list) {
			logger.info(bean.toString());
		}
		model.addAttribute("plist", list);
		return "product/list";
	}

	@RequestMapping(value = "cat")
	public void catList(@RequestParam("catName") String catName, Model model,
			HttpServletResponse response) throws UnsupportedEncodingException {
		// code�� �޾ƿ� ���� ã�Ƴ���
		logger.info("ajax-�񵿱� ���");
		List<LocVo> list = proDaoImp.selectLoc(catName);
		String data = "<select name=\"loc\" class=\"ms form-control input-default loc\">";
		if (list.size() > 0) {
			for (LocVo bean : list) {
				data += "<option value=\"" + bean.getLocname() + "\">"
						+ bean.getLocname() + "</option>";
			}
			data += "</select>";
		} else {
			data = "<input type=\"text\" class=\"form-control\" id=\"loc\" name=\"loc\""
					+ "placeholder=\"������ �Է��ϼ���.\">";
		}

		PrintWriter print = null;
		String dataEnco = "";
		try {
			print = response.getWriter();
			dataEnco = URLEncoder.encode(data, "UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataEnco = URLEncoder.encode("�����Ͱ� �����ϴ�.", "UTF-8");
		}
		logger.info(data);
		print.print(dataEnco);
	}

	@RequestMapping(value = "detail")
	public String productDetail(@RequestParam("id") String proid, Model model,
			HttpServletRequest request) {
		// add:�׳� �Է����� �� �����ֱ�
		// proid:���� ���� �Է� ������ ���������ϰ� �����ֱ�

		List<CatVo> cat = proDaoImp.selectCat();
		for (CatVo bean : cat) {
			logger.info("code : " + bean.getCode() + " name : "
					+ bean.getName());
		}

		if (proid.equals("add")) {

			logger.info("product-detail/add form");
			model.addAttribute("title", "�Է�");
			model.addAttribute("catList", cat);
			model.addAttribute("url", "insert");
		} else {
			logger.info("product-detail/parameter ok");
			ProductVo bean = proDaoImp.selectOne(proid);
			logger.info(bean.toString());

			model.addAttribute("title", "����");
			model.addAttribute("bean", bean);
			model.addAttribute("catList", cat);
			model.addAttribute("url", "update");
		}
		return "product/detail";
	}

	@RequestMapping(value = "del")
	public String productDelete(@RequestParam("id") String proid) {
		// �׸����

		proDaoImp.deleteOne(proid);

		return "redirect:/product/list";
	}

	// bean=>getter, setter��!
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insertProduct(@Valid ProductVo bean, BindingResult result,
			Model model, HttpServletRequest request) {
		logger.info("vaildation check");
		if (result.hasErrors()) {
			logger.info("vaildation check");
			Map errMsgs = new HashMap<String, String>();
			List<FieldError> errs = result.getFieldErrors();
			for (FieldError err : errs) {
				logger.info(err.getField() + ":" + err.getDefaultMessage());
				errMsgs.put(err.getField(), "has-error");
			}
			model.addAttribute("errs", errMsgs);

			model.addAttribute("bean", bean);
			List<CatVo> cat = proDaoImp.selectCat();
			model.addAttribute("title", "�Է�");
			model.addAttribute("catList", cat);
			model.addAttribute("url", "insert");
			return "product/detail";

		}
		logger.info("file upload BE : " + bean.toString());

		MultipartFile thumbFile = bean.getThumbFile();
		MultipartFile detailFile = bean.getImgFile();

		if (thumbFile != null && detailFile != null) {
			// ���� �Ѵ� ����
			String thumb = makeFile(thumbFile, bean, request);
			String img = makeFile(detailFile, bean, request);
			bean.setImg(img);
			bean.setThumb(thumb);
		}

		String proid = bean.getCat() + bean.getLoc().substring(0, 2)
				+ (char) (Math.random() * 26 + 65) + (int) (Math.random() * 10)
				+ (char) (Math.random() * 26 + 65) + (int) (Math.random() * 10);
		bean.setProid(proid);
		logger.info(bean.getProid());
		logger.info("file upload AF : " + bean.toString());

		proDaoImp.updateDetail(proid);
		proDaoImp.insertOne(bean);

		return "redirect:/product/list";
	}

	// bean=>getter, setter��!
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateProduct(@Valid ProductVo bean, BindingResult result,
			Model model, HttpServletRequest request) {
		logger.info("vaildation check");
		if (result.hasErrors()) {
			logger.info("vaildation check");
			Map errMsgs = new HashMap<String, String>();
			List<FieldError> errs = result.getFieldErrors();
			for (FieldError err : errs) {
				logger.info(err.getField() + ":" + err.getDefaultMessage());
				errMsgs.put(err.getField(), "has-error");
			}
			model.addAttribute("errs", errMsgs);

			model.addAttribute("bean", bean);
			List<CatVo> cat = proDaoImp.selectCat();
			model.addAttribute("title", "����");
			model.addAttribute("catList", cat);
			model.addAttribute("url", "update");
			return "product/detail";

		}// end if(validation)
		logger.info("file upload BE : " + bean.toString());

		// ���� ����
		MultipartFile thumbFile = bean.getThumbFile();
		MultipartFile detailFile = bean.getImgFile();

		if (thumbFile != null && detailFile != null) {
			// ���� �Ѵ� ����
			String thumb = makeFile(thumbFile, bean, request);
			String img = makeFile(detailFile, bean, request);
			bean.setImg(img);
			bean.setThumb(thumb);

		} else if (thumbFile != null && detailFile == null) {
			// ����� ���ϸ� ����
			String thumb = makeFile(thumbFile, bean, request);
			bean.setThumb(thumb);
		} else if (thumbFile == null && detailFile != null) {
			// �����ϸ� ����
			String img = makeFile(detailFile, bean, request);
			bean.setImg(img);
		}
		// ���� ����

		logger.info("file upload AF : " + bean.toString());

		proDaoImp.updateOne(bean);

		return "redirect:/product/list";
	}

	// �����&�װ��� ����
	// view : proDetail?id=${bean.proid
	@RequestMapping(value = "proDetail")
	public String proDetail(@RequestParam("id") String proid, Model model) {
		// �׸��Է�

		if (proid.equals("add")) {
			model.addAttribute("id", "add");			
			long time = System.currentTimeMillis();
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
			String sysdate = dayTime.format(new Date(time));
			model.addAttribute("sysdate", sysdate);
		} else {
			model.addAttribute("id", proid);
			model.addAttribute("pdlist", proDaoImp.selectDetail(proid));
			long time = System.currentTimeMillis();
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
			String sysdate = dayTime.format(new Date(time));
			model.addAttribute("sysdate", sysdate);
		}
		return "product/prodetail";
	}

	// �Է� : insertDetail
	@RequestMapping(value = "insertDetail")
	public String proDetail(ProDetailVo bean, Model model) {
		// ��ǰ ������ �Է�

		proDaoImp.insertDetail(bean);
		model.addAttribute("id", bean.getProid());
		model.addAttribute("pdlist", proDaoImp.selectDetail(bean.getProid()));
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = dayTime.format(new Date(time));
		model.addAttribute("sysdate", sysdate);
		return "product/prodetail";
	}

	// ���� : delDetail
	@RequestMapping(value = "delDetail")
	public String proDetailDel(ProDetailVo bean, Model model) {
		// ��ǰ ������ ����

		proDaoImp.delDetail(bean);
		model.addAttribute("id", bean.getProid());
		model.addAttribute("pdlist", proDaoImp.selectDetail(bean.getProid()));
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = dayTime.format(new Date(time));
		model.addAttribute("sysdate", sysdate);
		return "product/prodetail";
	}

	//

	// ���� ���ε� ���� method
	public String makeFile(MultipartFile file, ProductVo bean,
			HttpServletRequest request) {
		MultipartFile mFile = file;
		String mFileName = "";

		if (mFile != null) {
			mFileName = mFile.getOriginalFilename();
			try {
				mFileName = URLDecoder.decode(mFileName, "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String url = request.getRealPath("file") + "/";
			logger.info(url);
			try {

				File fileNew = new File(url + mFileName);
				mFile.transferTo(fileNew);
				fileCopy(url + mFileName,
						"C:\\Tomcat 7.0\\webapps\\market\\file\\" + mFileName);
			} catch (IOException e) {
				e.printStackTrace();
			} // try - catch
		}// if
		return mFileName;
	}// makeFile
		// ���� ī�� ����

	public void fileCopy(String inFileName, String outFileName) {
		try {
			FileInputStream fis = new FileInputStream(inFileName);
			FileOutputStream fos = new FileOutputStream(outFileName);

			int data = 0;
			while ((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// filecopy
}
