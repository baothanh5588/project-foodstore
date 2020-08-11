package controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import constant.Defines;
import dao.UserDAO;
import entity.User;

@Controller
@RequestMapping("/admin")
public class AdminIndexController {
	@Autowired
	private Defines defines;
	@Autowired
	private UserDAO userDAO;
	
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal, HttpServletRequest request) {
		modelMap.addAttribute("defines",defines);
		
//		System.out.println("Username: "+principal.getName());
//		User objUser = userDAO.getItemUserfromUsername(principal.getName());
//		
//		HttpSession session = request.getSession();
//		session.setAttribute("objUser", objUser);
	}
	@RequestMapping("/index")
	public String index() {
		return "admin.index.index";
	}
}
