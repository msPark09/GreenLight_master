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
import com.gl.master.model.event.EventDaoImp;
import com.gl.master.model.event.EventVo;
import com.gl.master.model.product.ProductDaoImp;
import com.gl.master.model.product.ProductVo;

@Controller
@RequestMapping("/event/")
public class EventController {
	// �̺�Ʈ ��Ʈ�ѷ�

	private static final Logger logger = LoggerFactory
			.getLogger(EventController.class);

	@Autowired
	// set��� ���
	private EventDaoImp eventDaoImp;

	// 1. �̺�Ʈ ��ü����Ʈ
	@RequestMapping(value = "list")
	public String eventList(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if(id==null||id.equals("")){
			return "error";
		}
		logger.info("eventList index");

		List<EventVo> list = eventDaoImp.selectAll();

		for (EventVo bean : list) {
			logger.info(bean.toString());
		}
		model.addAttribute("elist", list);
		return "event/list";
	}

	// 2. �̺�Ʈ ������
	@RequestMapping(value = "detail")
	public String eventDetail(@RequestParam("id") String eid, Model model,
			HttpServletRequest request) {
		// add:�׳� �Է����� �� �����ֱ�
		// eid:���� ���� �Է� ������ ���������ϰ� �����ֱ�

		if (eid.equals("add")) {

			logger.info("event-detail/add form");
			model.addAttribute("title", "�Է�");
			model.addAttribute("url", "insert");
		} else {
			logger.info("event-detail/parameter ok");
			EventVo bean = eventDaoImp.selectOne(eid);
			logger.info(bean.toString());

			model.addAttribute("title", "����");
			model.addAttribute("bean", bean);
			model.addAttribute("url", "update");
		}
		return "event/detail";
	}

	// 3. �̺�Ʈ ����
	@RequestMapping(value = "del")
	public String eventDelete(@RequestParam("id") String eid) {
		// �׸����

		eventDaoImp.deleteOne(eid);

		return "redirect:/event/list";
	}

	// 4. �̺�Ʈ �Է�

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	// bean=>getter, setter��!
	public String insertEvent(@Valid EventVo bean, BindingResult result,
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
			model.addAttribute("title", "�Է�");
			model.addAttribute("url", "insert");
			return "event/detail";

		}

		logger.info("file upload BE : " + bean.toString());

		MultipartFile eimgFile = bean.getEimgFile();

		if (eimgFile != null) {
			String eimgFileName = eimgFile.getOriginalFilename();
			try {
				eimgFileName = URLDecoder.decode(eimgFileName, "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			bean.setEimg(eimgFileName);
			String url = request.getRealPath("file") + "/";
			logger.info(url);
			try {
				File fileTb = new File(url + eimgFileName);
				eimgFile.transferTo(fileTb);
				fileCopy(url + eimgFileName,
						"C:\\Tomcat 7.0\\webapps\\market\\file\\"
								+ eimgFileName);

			} catch (IOException e) {
				e.printStackTrace();
			} // try - catch

		} // if

		String eid = bean.getEname().substring(0, 2)
				+ bean.getEduring().toString().substring(8, 10) + "_"
				+ (char) (Math.random() * 25 + 65)
				+ (char) (Math.random() * 25 + 65);
		bean.setEid(eid);
		logger.info(bean.getEid());
		logger.info("file upload AF : " + bean.toString());

		eventDaoImp.insertOne(bean);

		return "redirect:/event/list";
	}

	// bean=>getter, setter��!
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateEvent(@Valid EventVo bean, BindingResult result,
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
			model.addAttribute("title", "����");
			model.addAttribute("url", "update");
			return "event/detail";

		}// end if(validation)
		logger.info("file upload BE : " + bean.toString());

		// ���� ����
		MultipartFile eimgFile = bean.getEimgFile();

		if (eimgFile != null) {
			String eimg = makeFile(eimgFile, bean, request);
			bean.setEimg(eimg);
		}
		logger.info("file upload AF : " + bean.toString());
		eventDaoImp.updateOne(bean);
		return "redirect:/event/list";
	}

	// ���� ���ε� ���� method
	public String makeFile(MultipartFile file, EventVo bean,
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

	//���� ī�� ����
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
