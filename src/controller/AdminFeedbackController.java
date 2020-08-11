package controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;
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
import dao.FeedbackDAO;
import dao.UserDAO;
import entity.Reply;
import entity.User;

@Controller
@RequestMapping("admin/feedback")
public class AdminFeedbackController {

	@Autowired
	private Defines defines;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private FeedbackDAO feedbackDAO;

	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, HttpServletRequest request, Principal principal) {
		modelMap.addAttribute("defines", defines);

//		User objUser = userDAO.getItemUserfromUsername(principal.getName());
//		HttpSession session = request.getSession();
//		session.setAttribute("sessionObjUser", objUser);
	}

	@RequestMapping("/index")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page) {

		int row_count = defines.getROW_COUNT_ADMIN();
		int offset = (page - 1) * row_count;

		modelMap.addAttribute("listFeedback", feedbackDAO.getItemsFeedback(offset, row_count));

		int totalPage = (int) Math.ceil((float) feedbackDAO.getSumAll() / row_count);
		modelMap.addAttribute("totalPage", totalPage);

		modelMap.addAttribute("page", page);

		return "admin.feedback.index";
	}

	@RequestMapping("/reply/{id_LH}")
	public String add(@PathVariable("id_LH") int idLH, ModelMap modelMap) {
		modelMap.addAttribute("objFeedbackFromId", feedbackDAO.getItemFeedbackFromId(idLH));
		return "admin.feedback.reply";
	}

	@RequestMapping(value = "/reply/{id_LH}", method = RequestMethod.POST)
	public String add(@ModelAttribute("objReply") Reply objReply, RedirectAttributes ra) {
		System.out.println("objReply" + objReply);
		try {
			Email email = new SimpleEmail();
			// Cấu hình thông tin Email Server
			email.setHostName("smtp.gmail.com");
			email.setSmtpPort(465);
			email.setAuthenticator(new DefaultAuthenticator(objReply.getEmailNguoiGui(), objReply.getPassEmailNguoiGui()));
			// Với gmail cái này là bắt buộc.
			email.setSSLOnConnect(true);
			// Người gửi
			email.setFrom(objReply.getEmailNguoiGui());
			// Tiêu đề
			email.setSubject(objReply.getTieude());
			// Nội dung email
			email.setMsg(objReply.getNoidung());
			// Người nhận
			email.addTo(objReply.getEmailNguoiNhan());
			email.send();
			System.out.println("Sent!!");
			ra.addFlashAttribute("msg", "Reply thành công!!");
			return "redirect:/admin/feedback/index";
		} catch (Exception e) {
			System.err.println(e.getMessage());
			ra.addFlashAttribute("msg", "Reply thất bại.</br> Vui lòng kiểm tra lại email, password hoặc kết nối mạng.");
			return "redirect:/admin/feedback/index";
		}
	}

	@RequestMapping("/del/{id_LH}") // hien thi form
	public String delete(@PathVariable("id_LH") int idLH, RedirectAttributes ra) {

		if (feedbackDAO.delItemFeedback(idLH) > 0) {
			// thanh cong
			ra.addFlashAttribute("msg", "Xóa Thành Công !");
		} else {
			// that bai
			ra.addFlashAttribute("msg", "Xóa Thành Công !");
		}
		return "redirect:/admin/feedback/index";

	}
}
