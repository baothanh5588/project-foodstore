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
import dao.RoleDAO;
import dao.UserDAO;
import entity.User;
import utils.StringUtils;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {
	@Autowired
	private Defines defines;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private RoleDAO roleDAO;
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
	public String index(ModelMap modelMap, @RequestParam(value="page",defaultValue="1") int page){ 
		
		int row_count = defines.getROW_COUNT_ADMIN();
		int offset = (page - 1)*row_count;
		modelMap.addAttribute("listUser",userDAO.getItemsUser(offset,row_count));

		int totalPage =(int) Math.ceil((float) userDAO.getSumAll()/row_count );
		modelMap.addAttribute("totalPage",totalPage);
		
		modelMap.addAttribute("page", page);
		return "admin.user.index";
	}
	
	//xử lí ajax
	@RequestMapping("/xu-ly") 
	public void xuly(PrintWriter out, @RequestParam("bidUser") int bidUser, @RequestParam("bstatus") int bstatus, HttpServletRequest request){  
		String str = "";
		if(userDAO.updateStatus(bidUser,bstatus) > 0) {
			if (bstatus == 1) {
				str = " <a href=\"javascript:void(0)\" onclick=\"return turnOn(this.id)\"  id='" + bidUser
						+ "' class=\"turnOn\">  <img src='" + request.getContextPath()
						+ "/templates/admin/assets/img/ok.png ' alt=\"ok\"> </a>";
				out.print(str);
			} else {
				str = " <a href=\"javascript:void(0)\" onclick=\"return turnOff(this.id)\" id='" + bidUser
						+ "' class=\"turnOff\">  <img src='" + request.getContextPath()
						+ "/templates/admin/assets/img/cancel.png ' alt=\"cancel\"> </a>";
				out.print(str);
			}
		}
	}	
	
	@RequestMapping("/add") 
	public String add(ModelMap modelMap){  
		modelMap.addAttribute("listRole",roleDAO.getItemsRole());	
		return "admin.user.add";
	}	

	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(@Valid @ModelAttribute("objUser") User objUser, BindingResult rs, RedirectAttributes ra, ModelMap modelMap){ 
		
		if(rs.hasErrors()) {
			modelMap.addAttribute("listRole",roleDAO.getItemsRole());	
			return "admin.user.add";
		}
		//Mã hóa pass bằng "BCrypt" trong spring security
		//BCrypt bảo mật và an toàn MD5 và SHA vì mỗi lần thực hiện băm nó lại cho một giá trị khác nhau
		//=> làm cho việc dò tìm mật khẩu trở nên khó hơn
		String passW = objUser.getPassword();
		PasswordEncoder pwe = new BCryptPasswordEncoder();
		String encodePass = pwe.encode(passW);
		objUser.setPassword(encodePass);
		
		//Mã hóa pass bằng "md5" sử dụng ph thức md5 trong stringUtils
		//objUser.setPassword(stringUtils.md5(objUser.getPassword()) );
		
		System.out.println(objUser.toString());
		
		if(!userDAO.checkUser(objUser.getUsername()).isEmpty()){ 
			// đã tồn tại tên người dùng
			ra.addFlashAttribute("msg"," Tên người dùng đã tồn tại !"); //hien thi 1 lần 
			return "redirect:/admin/user/index"; 
		}else{ //neu user chua ton tai thi them
			if(userDAO.addItemUser(objUser) > 0 ){
				ra.addFlashAttribute("msg", "Thêm thành công");
			}else{
				ra.addFlashAttribute("msg", "Thêm thất bại");
			}
			return "redirect:/admin/user/index";
		}
	}
	
	@RequestMapping("/edit/{id_user}") //HIỂN THỊ FORM
	public String edit(@PathVariable("id_user") int id_user, ModelMap modelMap) {
		modelMap.addAttribute("objUserfromId", userDAO.getItemUserfromId(id_user));
		modelMap.addAttribute("listRole",roleDAO.getItemsRole());	
		return "admin.user.edit";
	}

	@RequestMapping(value="/edit/{id_user}",method=RequestMethod.POST)  //XỬ LÍ FORM 
	public String edit(@PathVariable("id_user") int id_user,@ModelAttribute("objUser") User objUser, RedirectAttributes ra, ModelMap modelMap){

		if(!objUser.getPassword().isEmpty()) {//có nhập pass
			//Lưu pass mới
			//Mã hóa Bcrybt
			String passW = objUser.getPassword();
			PasswordEncoder pwe = new BCryptPasswordEncoder();
			String encodePass = pwe.encode(passW);
			objUser.setPassword(encodePass);
			
			//Mã hóa pass bằng "md5" sử dụng ph thức md5 trong stringUtils
			//objUser.setPassword(stringUtils.md5(objUser.getPassword()));
			
		}else {
			//Lưu pass cũ
			objUser.setPassword(userDAO.getItemUserfromId(id_user).getPassword());
		}
		System.out.println(objUser.toString());

		if(userDAO.editItemUser(objUser) > 0 ){
			ra.addFlashAttribute("msg", "Sửa thành công");
		}else{
			ra.addFlashAttribute("msg", "Sửa thất bại");
		}
		return "redirect:/admin/user/index";
	}
	
	@RequestMapping("/del/{id_user}")  //hien thi form addCat
	public String edit(@PathVariable("id_user") int id_user , RedirectAttributes ra){

		if(userDAO.getItemUserfromId(id_user).getId_role() == 1 ){
			ra.addFlashAttribute("msg","Bạn không có quyền xóa admin !"); 
			return "redirect:/admin/user/index"; 
		
		}else{
			 if(userDAO.getItemUserfromId(id_user).getId_role() != 3){
				if(userDAO.delItemUser(id_user) > 0){
					//them thanh cong 
					ra.addFlashAttribute("msg","Xóa thành công !"); //hien thi 1 lần  
				}else{
					//them thanh cong 
					ra.addFlashAttribute("msg","Xóa thất bại !");  
				}
				return "redirect:/admin/user/index"; 
			 }else{
				 ra.addFlashAttribute("msg","Bạn là 1 USER. Bạn không có quyền xóa user khác !"); 
				 return "redirect:/admin/user/index"; 
			 }
		}
	}
	
}
