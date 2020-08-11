package controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import dao.IntroduceDAO;
import dao.UserDAO;
import entity.Introduce;
import entity.User;

@Controller
@RequestMapping("admin/introduce")
public class AdminIntroduceController {

	@Autowired
	private Defines defines;
	@Autowired
	private IntroduceDAO introduceDao;
	@Autowired
	private UserDAO userDAO;

	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, HttpServletRequest request, Principal principal) {
		modelMap.addAttribute("defines", defines);

		User objUser = userDAO.getItemUserfromUsername(principal.getName());
		HttpSession session = request.getSession();
		session.setAttribute("sessionObjUser", objUser);
	}

	@RequestMapping("/index")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page) {

			int row_count = defines.getROW_COUNT_ADMIN();
			int offset = (page - 1)*row_count;
			
			modelMap.addAttribute("listIntroduce", introduceDao.getItemsIntroduce(offset,row_count));
			
			int totalPage = (int) Math.ceil((float) introduceDao.getSumAll()/row_count);
			modelMap.addAttribute("totalPage", totalPage);

			modelMap.addAttribute("page", page);
			
			return "admin.introduce.index";
	}

	@RequestMapping("/add") 
	public String add(ModelMap modelMap) {
		return "admin.introduce.add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("objIntroduce") Introduce objIntro, RedirectAttributes ra) {

		if (introduceDao.addItemIntroduce(objIntro) > 0) {
			// them ok
			ra.addFlashAttribute("msg", "Thêm thành công");
		} else {
			// them that bai
			ra.addFlashAttribute("msg", "Thêm thất bại");
		}
		return "redirect:/admin/introduce/index";

	}

	@RequestMapping("/edit/{id_intro}")
	public String edit(@PathVariable("id_intro") int idintro, ModelMap modelMap) {
		modelMap.addAttribute("objIntroduce", introduceDao.getItemIntroduceFromId(idintro));
		return "admin.introduce.edit";
	}

	@RequestMapping(value = "/edit/{id_intro}", method = RequestMethod.POST)
	public String edit(@PathVariable("id_intro") int idintro, ModelMap modelMap, RedirectAttributes ra,
			@ModelAttribute("objIntro") Introduce objIntro) {
		
		System.out.println("objIntro: " +objIntro);
		
		if (introduceDao.editItemIntroduce(objIntro) > 0) {
			// thanh cong
			ra.addFlashAttribute("msg", "Sửa Thành Công !");
		} else {
			// that bai
			ra.addFlashAttribute("msg", "Sửa Thành Công !");
		}
		return "redirect:/admin/introduce/index";
	}

	@RequestMapping("/del/{id_intro}") // hien thi form
	public String delete(@PathVariable("id_intro") int idintro, RedirectAttributes ra) {

		if (introduceDao.delItemIntroduce(idintro) > 0) {
			// thanh cong
			ra.addFlashAttribute("msg", "Xóa Thành Công !");
		} else {
			// that bai
			ra.addFlashAttribute("msg", "Xóa Thành Công !");
		}

		return "redirect:/admin/introduce/index";

	}
}
