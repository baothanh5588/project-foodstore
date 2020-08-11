package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.lookup.TypeSystem.HashedParameterizedTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PlaintextPasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import dao.BlogDAO;
import dao.CatDAO;
import dao.MemberDAO;
import dao.ProductDAO;
import entity.Member;
import utils.SlugUtils;
import utils.StringUtils;

@Controller
@RequestMapping("/public")
public class PublicLoginController {
	@Autowired
	private Defines defines;
	@Autowired
	private SlugUtils slugUtils;
	@Autowired
	private StringUtils stringUtils;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private BlogDAO blogDAO;
	@Autowired
	private CatDAO catDAO;
	@Autowired
	private MemberDAO memberDAO;
	
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap) {
		modelMap.addAttribute("defines",defines);
		modelMap.addAttribute("slugUtils",slugUtils);
		
		modelMap.addAttribute("listCatParent",catDAO.getItemsParentCatAll());//lấy tất cả trong bảng category
		modelMap.addAttribute("listCatInProduct",productDAO.getItemCatInProduct());
		modelMap.addAttribute("listCatInBlog",blogDAO.getItemCatInBlog());
		
	}
	//trang đăng nhập public
	@RequestMapping("/login")
	public String login() {
		return "public.login.login";
	}
	
	//trang tạo tài khoản: thực hiện thêm tài khoản vào DB
	@RequestMapping("/register")
	public String register() {
		return "public.register.register";
	}
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(ModelMap modelMap, @ModelAttribute("objRegister") Member objRegister, RedirectAttributes ra) {
		
		//Mã hóa Bcrybt
		String passW = objRegister.getPasswordTV();
		PasswordEncoder pwe = new BCryptPasswordEncoder();
		String encodePass = pwe.encode(passW);
		objRegister.setPasswordTV(encodePass);
		
		//Mã hóa pass bằng "md5" sử dụng ph thức md5 trong stringUtils
		//objRegister.setPasswordTV(stringUtils.md5(objRegister.getPasswordTV()));
		
		System.out.println(objRegister);
		
		if(! memberDAO.checkUsername(objRegister.getUsernameTV()).isEmpty() ){ //user đã tồn tại
			ra.addFlashAttribute("msg", "<p style='color : #FF6500;' align='center' > Username đã tồn tại ! </br> Vui lòng đặt tên khác ! </p>");
			return "redirect:/public/register";
		}else{
			if(memberDAO.addItemMember(objRegister) > 0 ){
				//them ok
				ra.addFlashAttribute("msg", " <p style='color : #FF6500; ' align='center'>Bạn đã đăng ký tài khoản thành công ! </br> Vui lòng đăng nhập để mua hàng ! </p>");
			}else{
				//them that bai
				ra.addFlashAttribute("msg", "<p style='color : #FF6500;' align='center' >Đăng ký tài khoản thất bại ! </br> Vui lòng kiểm tra lại thông tin ! </p>");
			}
			return "redirect:/public/register";
		}
	}
	
	//Xử lí đăng nhập
	@RequestMapping(value="/login", method= RequestMethod.POST)
	public String login(@ModelAttribute("objLogin") Member objLogin, HttpServletRequest request, RedirectAttributes ra) {
		
		//pass mà người dùng nhập vào từ form
		String passUser = objLogin.getPasswordTV();
		System.out.println("passUeeer: " +passUser);
		
		//pass lấy từ DB 
		Member a = memberDAO.getPassDBFromUsername(objLogin.getUsernameTV());
		String passDB = a.getPasswordTV();
		System.out.println("passDB: " +passDB);
		
		PasswordEncoder pwe = new BCryptPasswordEncoder();
		boolean soSanh = pwe.matches(passUser, passDB);
		System.out.println("So sánh passUser và passDB:" +soSanh);
		
		if(soSanh == true) {
			//login thành công => Tạo session
			HttpSession session = request.getSession();
			session.setAttribute("sessionObjLogin", a);
			return "redirect:/public/index";
		}else {//login thất bai
			ra.addFlashAttribute("msg","<p style='color : #FF6500;'> Đăng nhập thất bại </br> Vui lòng kiểm tra lại tài khoản ! </p>");
			return "redirect:/public/login";
		}
	}
	
	//Xử lí đăng xuất
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, RedirectAttributes ra) {
		HttpSession session = request.getSession();
		if(session.getAttribute("sessionObjLogin")!= null) {
			session.removeAttribute("sessionObjLogin");
		}
		return "redirect:/public/index";
	}
	
}



