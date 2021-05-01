package com.gl.master.ui;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UiController {
	@RequestMapping(value = "NewFile")
	public String loginList(Model model) {

		return "template/NewFile";
	}
}
