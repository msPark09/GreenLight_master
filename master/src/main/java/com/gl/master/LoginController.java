package com.gl.master;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.master.model.customer.CustomerVo;
import com.gl.master.model.login.LoginDao;
import com.gl.master.model.login.LoginVo;

@Controller
@RequestMapping("/test/")
public class LoginController {

	@Autowired
	private LoginDao loginDao;

	@RequestMapping(value = "loginform")
	public String loginList(Model model) {


		return "login/loginform";
	}

	@RequestMapping(value = "welcome")
	public String loginDetail(LoginVo bean, Model model,
			HttpServletRequest request) {
		HashMap cntMap = loginDao.selectOne(bean);
		System.out.println(cntMap.toString() + "cnt : "
				+ cntMap.get("CNT").toString());
		int cnt = Integer.parseInt(cntMap.get("CNT").toString());

		if (cnt > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("id", bean.getMid());
			return "redirect:/voc/list?field=OneQ";
		} else {
			model.addAttribute("error", "아이디와 비밀번호를 확인해주세요");
			return "login/loginform";
			
		}
		
		
	}

	@RequestMapping(value = "logout")
	public String logout(LoginVo bean, Model model,
			HttpSession session) {
		
		session.invalidate();
		return "redirect:/test/loginform";
	}
	
	@RequestMapping(value = "error")
	public String errorView() {		
		return "error";
	}
	
}
