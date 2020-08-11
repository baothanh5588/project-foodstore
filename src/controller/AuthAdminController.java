package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import constant.Defines;
@Controller
@RequestMapping("auth/admin")
public class AuthAdminController {
	@Autowired
	private Defines defines;
	
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap) {
		modelMap.addAttribute("defines",defines);
	}
	
	@RequestMapping("/login")
	public String login(ModelMap modelMap) {
		return "auth.admin.login";
	}
	
	@RequestMapping("/403")
	public String login() {
		return "auth.admin.err403";
	}
}
