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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gl.master.model.CatVo;
import com.gl.master.model.LocVo;
import com.gl.master.model.MasterDao;
import com.gl.master.model.product.ProductDaoImp;
import com.gl.master.model.product.ProductVo;
import com.gl.master.model.slide.SlideDaoImp;
import com.gl.master.model.slide.SlideVo;

@Controller
@RequestMapping("/slide/")
public class SlideController {
	// 슬라이드 컨트롤러

	private static final Logger logger = LoggerFactory
			.getLogger(SlideController.class);

	@Autowired
	// set대신 사용
	private SlideDaoImp slideDaoImp;

	// 1. 슬라이드 전체리스트
	@RequestMapping(value = "list")
	public String slideList(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id= (String) session.getAttribute("id");
		if(id==null||id.equals("")){
			return "error";
		}
		logger.info("slideList index");

		List<SlideVo> list = slideDaoImp.selectAll();

		for (SlideVo bean : list) {
			logger.info(bean.toString());
		}
		model.addAttribute("sdlist", list);
		return "slide/list";
	}

	// 2. 슬라이드 디테일
	@RequestMapping(value = "detail")
	public String slideDetail(@RequestParam("id") String mainid, Model model,
			HttpServletRequest request) {
		// add:그냥 입력으로 폼 보여주기
		// eid:값을 가진 입력 폼으로 수정가능하게 보여주기

		if (mainid.equals("add")) {

			logger.info("slide-detail/add form");
			model.addAttribute("title", "입력");
			model.addAttribute("url", "insert");
		} else {
			logger.info("slide-detail/parameter ok");
			SlideVo bean = slideDaoImp.selectOne(mainid);
			logger.info(bean.toString());

			model.addAttribute("title", "수정");
			model.addAttribute("bean", bean);
			model.addAttribute("url", "update");
		}
		return "slide/detail";
	}

	// 3. 슬라이드 삭제
	@RequestMapping(value = "del")
	public String slideDelete(@RequestParam("id") String sdid) {
		// 항목삭제

		slideDaoImp.deleteOne(sdid);

		return "redirect:/slide/list";
	}

	// 4. 슬라이드 입력

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	// bean=>getter, setter로!
	public String insertslide(@Valid SlideVo bean, BindingResult result,
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
			model.addAttribute("title", "입력");
			model.addAttribute("url", "insert");
			return "slide/detail";

		}

		logger.info("file upload BE : " + bean.toString());

		MultipartFile sdimgFile = bean.getSdimgFile();

		if (sdimgFile != null) {
			String sdimgFileName = sdimgFile.getOriginalFilename();
			try {
				sdimgFileName = URLDecoder.decode(sdimgFileName, "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			bean.setImg(sdimgFileName);
			String url = request.getRealPath("file") + "/";
			logger.info(url);
			try {
				File fileTb = new File(url + sdimgFileName);
				sdimgFile.transferTo(fileTb);
				fileCopy(url + sdimgFileName,
						"C:\\Tomcat 7.0\\webapps\\market\\file\\"
								+ sdimgFileName);

			} catch (IOException e) {
				e.printStackTrace();
			} // try - catch

		} // if

		String mainid = bean.getTitle().toString().substring(1, 3) + "_"
				+	+ (char) (Math.random() * 25 + 65)
				+ (char) (Math.random() * 25 + 65);
		
		bean.setMainid(mainid);
		logger.info(bean.getMainid());
		logger.info("file upload AF : " + bean.toString());

		slideDaoImp.insertOne(bean);

		return "redirect:/slide/list";
	}

	// bean=>getter, setter로!
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateslide(SlideVo bean, BindingResult result,
			Model model, HttpServletRequest request) {
		logger.info("vaildation check");
		logger.info(bean.toString());
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
			model.addAttribute("title", "수정");
			model.addAttribute("url", "update");
			return "slide/detail";

		}// end if(validation)
		logger.info("file upload BE : " + bean.toString());

		// 파일 수정
		MultipartFile sdimgFile = bean.getSdimgFile();

		if (sdimgFile != null) {
			String sdimg = makeFile(sdimgFile, bean, request);
			bean.setImg(sdimg);
		}
		logger.info("file upload AF : " + bean.toString());
		slideDaoImp.updateOne(bean);
		return "redirect:/slide/list";
	}

	// 파일 업로드 관련 method
	public String makeFile(MultipartFile file, SlideVo bean,
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
						"C:\\Tomcat 7.0\\webapps\\market\\file\\"
								+ mFileName);
			} catch (IOException e) {
				e.printStackTrace();
			} // try - catch
		}// if
		return mFileName;
	}// makeFile

	//파일 카피 관련
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
