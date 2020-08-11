package controller;

import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import dao.MemberDAO;
import dao.RoleDAO;
import dao.UserDAO;
import entity.Member;
import entity.User;
import utils.StringUtils;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	@Autowired
	private Defines defines;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private StringUtils stringUtils;

	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal, HttpServletRequest request) {
		modelMap.addAttribute("defines", defines);

		User objUser = userDAO.getItemUserfromUsername(principal.getName());
		HttpSession session = request.getSession();
		session.setAttribute("sessionObjUser", objUser);
	}

	@RequestMapping("/index")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page) {

		int row_count = defines.getROW_COUNT_ADMIN();
		int offset = (page - 1) * row_count;
		modelMap.addAttribute("listMember", memberDAO.getItemsMember(offset, row_count));

		int totalPage = (int) Math.ceil((float) memberDAO.getSumAll() / row_count);
		modelMap.addAttribute("totalPage", totalPage);

		modelMap.addAttribute("page", page);
		return "admin.member.index";
	}

	@RequestMapping("/edit/{idTV}") // hien thi form
	public String edit(@PathVariable("idTV") int idTV, ModelMap modelMap) {
		modelMap.addAttribute("objMember", memberDAO.getItemMemberFromId(idTV));
		return "admin.member.edit";
	}

	@RequestMapping(value = "/edit/{idTV}", method = RequestMethod.POST) // xu ly form
	public String edit(@PathVariable("idTV") int idTV, ModelMap modelMap, RedirectAttributes ra,
			@ModelAttribute("objMember") Member objMember) {
		
		//Mã hóa Bcrybt
		String passW = objMember.getPasswordTV();
		PasswordEncoder pwe = new BCryptPasswordEncoder();
		String encodePass = pwe.encode(passW);
		objMember.setPasswordTV(encodePass);
		
		//Mã hóa pass bằng "md5" sử dụng ph thức md5 trong stringUtils
		//objMember.setPasswordTV(stringUtils.md5(objMember.getPasswordTV()));
		
		System.out.println(objMember);
		
		if (memberDAO.editItemMember(objMember) > 0) {
			// thanh cong
			ra.addFlashAttribute("msg", "Sửa Thành Công !");
		} else {
			// that bai
			ra.addFlashAttribute("msg", "Sửa Thành Công !");
		}
		return "redirect:/admin/member/index";

	}

	@RequestMapping("/del/{idTV}") // hien thi form
	public String delete(@PathVariable("idTV") int idTV, RedirectAttributes ra) {

		if (memberDAO.delItemMember(idTV) > 0) {
			// thanh cong
			ra.addFlashAttribute("msg", "Xóa Thành Công !");
		} else {
			// that bai
			ra.addFlashAttribute("msg", "Xóa Thành Công !");
		}

		return "redirect:/admin/member/index";
	}

}
