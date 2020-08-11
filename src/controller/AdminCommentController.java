package controller;

import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import dao.CommentDAO;
import dao.UserDAO;
import entity.User;

@Controller
@RequestMapping("admin/comment")
public class AdminCommentController {

	@Autowired
	private Defines defines;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CommentDAO commentDAO;

	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, HttpServletRequest request, Principal principal) {
		modelMap.addAttribute("defines", defines);

		User objUser = userDAO.getItemUserfromUsername(principal.getName());
		HttpSession session = request.getSession();
		session.setAttribute("sobjUser", objUser);
	}

	@RequestMapping("/index")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page) {

		int row_count = defines.getROW_COUNT_ADMIN();
		int offset = (page - 1) * row_count;

		modelMap.addAttribute("listComment", commentDAO.getItemsComment(offset, row_count));

		int totalPage = (int) Math.ceil((float) commentDAO.getSumAll() / row_count);
		modelMap.addAttribute("totalPage", totalPage);

		modelMap.addAttribute("page", page);

		return "admin.comment.index";
	}

	// xu ly ajax
	@RequestMapping(value = "/xu-ly", method = RequestMethod.POST) // hien thi form
	public void xuly(PrintWriter out, @RequestParam("bidCmt") int bidCmt, @RequestParam("bstatus") int bstatus,
			HttpServletRequest request, HttpServletResponse response) {

		String str = "";
		if (commentDAO.updateStatus(bidCmt, bstatus) > 0) {//		 \" = '
			if (bstatus == 1) {
				str = " <a href=\"javascript:void(0)\" onclick=\"return turnOn(this.id)\"  id='" + bidCmt
						+ "' class=\"turnOn\">  <img src='" + request.getContextPath()
						+ "/templates/admin/assets/img/ok.png ' alt=\"ok\"> </a>";
				out.print(str);
			} else {
				str = " <a href=\"javascript:void(0)\" onclick=\"return turnOff(this.id)\" id='" + bidCmt
						+ "' class=\"turnOff\">  <img src='" + request.getContextPath()
						+ "/templates/admin/assets/img/cancel.png ' alt=\"cancel\"> </a>";
				out.print(str);
			}
			
		}
	}

	@RequestMapping("/del/{id_cm}") // hien thi form
	public String delete(@PathVariable("id_cm") int idcm, RedirectAttributes ra) {

		if (commentDAO.delItemComment(idcm) > 0) {
			// thanh cong
			ra.addFlashAttribute("msg", "Xóa Thành Công !");
		} else {
			// that bai
			ra.addFlashAttribute("msg", "Xóa Thành Công !");
		}
		return "redirect:/admin/comment/index";
	}
}
