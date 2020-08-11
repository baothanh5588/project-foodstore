package controller;

import java.util.ArrayList;
import java.util.List;

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
import dao.BlogDAO;
import dao.CatDAO;
import dao.FeedbackDAO;
import dao.IntroduceDAO;
import dao.ProductDAO;
import entity.Cart;
import entity.Feedback;
import utils.SlugUtils;

@Controller
@RequestMapping("/public")
public class PublicIndexController {
	@Autowired
	private Defines defines;
	@Autowired
	private SlugUtils slugUtils;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private BlogDAO blogDAO;
	@Autowired
	private CatDAO catDAO;
	@Autowired
	private IntroduceDAO introduceDAO;
	@Autowired
	private FeedbackDAO feedbackDAO;
	
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap) {
		modelMap.addAttribute("defines",defines);
		modelMap.addAttribute("slugUtils",slugUtils);
		
		modelMap.addAttribute("listCatParent",catDAO.getItemsParentCatAll());//lấy tất cả trong bảng category
		modelMap.addAttribute("listCatInProduct",productDAO.getItemCatInProduct());
		modelMap.addAttribute("listCatInBlog",blogDAO.getItemCatInBlog());
		
	}
	
	//trang chủ
	@RequestMapping("/index")
	public String index(ModelMap modelMap) {
		//product
		modelMap.addAttribute("listProductInnerCat",productDAO.getItemsProductInnerCat());
		//blog
		modelMap.addAttribute("listBlogInnerCat",blogDAO.getItemsBlogInnerCat());
		return "public.index.index";
	}
	
	//trang danh mục + chi tiết của product và blog
	@RequestMapping("/cat_sp/{slug}-{idcat}.html")
	public String cat_product(ModelMap modelMap, @PathVariable("idcat") int idcat, @RequestParam(value="page", defaultValue="1") int page) {
		
		//phân trang
		int row_count = defines.getROW_COUNT_ADMIN();
		int offset = (page - 1)*row_count;
		modelMap.addAttribute("listItemProductFromIdcat",productDAO.getItemProductFromIdcat(offset,row_count,idcat));
		int totalPage = (int) Math.ceil((float) productDAO.getSumAll(idcat)/row_count);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("page", page);
		
		//vì ta ms chỉ lấy "list" nó k dùng để phân trang dc, nên ta cần gửi qa 1 object (objCat) để makeSlug 1 tên cụ thể
		modelMap.addAttribute("objCat",catDAO.getItemCatfromId(idcat));
		
		//hiển thi các danh mục sản phẩm
		modelMap.addAttribute("listItemCatProduct",productDAO.getItemCatInProduct());
		
		return "public.cat_sp.cat_sp";
	}
	@RequestMapping("/detail_sp/{slug}-{idsp}.html")
	public String detail_product(ModelMap modelMap, @PathVariable("idsp") int idsp) {
		modelMap.addAttribute("objItemProduct",productDAO.getItemProductfromId(idsp));
		return "public.detail_sp.detail_sp";
	}
	
	@RequestMapping("/cat_blog/{slug}-{idcat}.html")
	public String cat_blog(ModelMap modelMap, @PathVariable("idcat") int idcat, @RequestParam(value="page", defaultValue="1") int page) {
		
		//phân trang
		int row_count = defines.getROW_COUNT_ADMIN();
		int offset = (page - 1)*row_count;
		modelMap.addAttribute("listItemBlogFromIdcat",blogDAO.getItemBlogFromIdcat(offset,row_count,idcat));
		int totalPage = (int) Math.ceil((float) blogDAO.getSumAll(idcat)/row_count);
		modelMap.addAttribute("totalPage", totalPage);
		modelMap.addAttribute("page", page);
		
		//vì ta ms chỉ lấy "list" nó k dùng để phân trang dc, nên ta cần gửi qa 1 object (objCat) để makeSlug 1 tên cụ thể
		modelMap.addAttribute("objCat",catDAO.getItemCatfromId(idcat));
		
		//hiển thi các danh mục blog
		modelMap.addAttribute("listItemCatBlog",blogDAO.getItemCatInBlog());
		
		return "public.cat_blog.cat_blog";
	}
	@RequestMapping("/detail_blog/{slug}-{idblog}.html")
	public String detail_blog(ModelMap modelMap, @PathVariable("idblog") int idblog) {
		modelMap.addAttribute("objItemBlog",blogDAO.getItemBlogfromId(idblog));
		return "public.detail_blog.detail_blog";
	}
	
	//giới thiệu
	@RequestMapping("/gioi-thieu")
	public String gioithieu(ModelMap modelMap) {
		modelMap.addAttribute("listIntroduce",introduceDAO.getItemsIntroducePublic());
		return "public.gioi_thieu.gioi_thieu";
	}
	
	//liên hệ
	@RequestMapping("/lien-he")
	public String lienhe(ModelMap modelMap) {
		return "public.lien_he.lien_he";
	}
	@RequestMapping(value= "/lien-he" , method = RequestMethod.POST)
	public String lienhe(@ModelAttribute("objLienhe") Feedback objLH, RedirectAttributes ra) {
		System.out.println(objLH);
		if(feedbackDAO.addFeedback(objLH) > 0) {
			//thêm thành công
			ra.addFlashAttribute("msg", "<p style='color : green'> Phản hồi của bạn đã được gửi đến admin! Vui lòng vào Email để nhận phản hồi ! </p>");
		}else {
			//thêm thất bại
			ra.addFlashAttribute("msg", "<p style='color : red'> Gửi liên hệ thất bại, Vui lòng kiểm tra lại thông tin ! </p>");
		}
		return "redirect:/public/lien-he";
	}
	
	//search
	@RequestMapping("/search")
	public String timkiem(ModelMap modelMap, HttpServletRequest request, RedirectAttributes ra) {
		String key_word = request.getParameter("key_word");//Lấy từ khóa mà ng dùng nhập vào từ máy khách
		System.out.println(key_word);
		
		if(!"".equals(key_word)) {//có nhập từ khóa
			if(productDAO.searchKeyword(key_word).size() > 0) {
				//thêm thành công(size>0)
				modelMap.addAttribute("msg", "<p style='color : green'> CÁC KẾT QUẢ ĐƯỢC TÌM THẤY: </p>");
				modelMap.addAttribute("listSearch", productDAO.searchKeyword(key_word));
				return "public.search.search";
			}else {
				//thêm thất bại(size=0)
				modelMap.addAttribute("msg", "<p style='color : red'> KHÔNG TÌM THẤY KẾT QUẢ MONG MUỐN !! </p>");
				return "public.search.search";
			}	
		}else {//k nhập từ khóa
			modelMap.addAttribute("msg", "<p style='color : red'> VUI LÒNG NHẬP VÀO TỪ KHÓA CẦN TÌM ! </p>");
			return "public.search.search";
		}
	}
	
	//Thêm vào giỏ hàng
	//Ơ trang index
	@RequestMapping(value = "/cart/add/{id_sp}.html")
	public String AddCart(HttpSession session, @PathVariable("id_sp") int idsp, RedirectAttributes ra) {
		if(session.getAttribute("listCart")==null) { //chưa có session-tạo 1 tên session bất kì, để bắt đầu sử dụng session
			List<Cart> cart = new ArrayList<Cart>();//tạo mảng để lưu nhìu sản phẩm 
			cart.add(new Cart(productDAO.getItemProductfromId(idsp),1));//Thêm sp vào mảng (hàm khởi tạo của Cart(Product product, int soluong))
			session.setAttribute("listCart", cart);//lưu mảng đó vào session
		}else {
			@SuppressWarnings("unchecked")
			List<Cart> cart = (List<Cart>)session.getAttribute("listCart");//đã có session
			
			int index = isExisting(idsp, session);//kiểm tra sự tồn tại của sản phẩm vừa thêm, index là số thứ tự của sản phẩm trong giỏ hàng
			if(index == -1) {//sp này chưa có trong giỏ hàng-thêm cái mới vào
				cart.add(new Cart(productDAO.getItemProductfromId(idsp),1));
			}else {// đã có trong giỏ hàng, sẻ tự cập nhật số lượng của sản phẩm thứ "index" trong giỏ hàng
				int soluong = cart.get(index).getSoluong() + 1;
				cart.get(index).setSoluong(soluong);
			}
			session.setAttribute("listCart", cart);//cập nhật lại session
		}
      return "redirect:/public/index";
	}
	//Sẻ không thêm các sản phẩm đã tồn tại trong giỏ hàng
	private int isExisting(int id, HttpSession session) {
		@SuppressWarnings("unchecked")
		List<Cart> cart = (List<Cart>)session.getAttribute("listCart");
		for (int i = 0; i < cart.size(); i++) {//duyệt các phần tử trong session
			if(cart.get(i).getProduct().getId_sp() == id) { //trùng sản phẩm: nếu idsp của ptu thứ i trùng vs id đã có trong session
				return i;
			}
		}
		return -1;//chọn -1,-2... để nó k nằm trong phạm vi chạy của i(i chạy từ  0)
	}
	
	//Thêm vào giỏ hàng
	//Ơ trang chi tiết sản phẩm
	@RequestMapping(value = "/cart/detail_sp/add/{id_sp}.html")
	public String AddDetailCart(ModelMap modelMap, HttpSession session, @PathVariable("id_sp") int idsp, RedirectAttributes ra) {
		if(session.getAttribute("listCart")==null) {
			List<Cart> cart = new ArrayList<Cart>();
			cart.add(new Cart(productDAO.getItemProductfromId(idsp),1));
			session.setAttribute("listCart", cart);
		}else {
			@SuppressWarnings("unchecked")
			List<Cart> cart = (List<Cart>)session.getAttribute("listCart");
			
			int index = isExisting(idsp, session);
			if(index == -1) {
				cart.add(new Cart(productDAO.getItemProductfromId(idsp),1));
			}else {
				int soluong = cart.get(index).getSoluong() + 1;
				cart.get(index).setSoluong(soluong);
			}
			session.setAttribute("listCart", cart);
		}
      return "redirect:/public/index";
	}
	
	//hiển thị giỏ hàng
	@RequestMapping("/cart/index")
	public String cartindex(ModelMap modelMap) {
		return "public.cart.index";
	}
	
	//Xóa sản phẩm trong giỏ hàng
	@RequestMapping(value = "/cart/delete/{id_sp}")
	public String DelCart(HttpSession session, @PathVariable("id_sp") int idsp, RedirectAttributes ra) {
		@SuppressWarnings("unchecked")
		List<Cart> cart = (List<Cart>)session.getAttribute("listCart");
		int index = isExisting(idsp, session);//có tồn tại sản phẩm có idsp trên, thì ta xóa nó đi
		cart.remove(index);
		session.setAttribute("listCart", cart);//cập nhật lại session

      return "redirect:/public/cart/index";
	}
	
	//Xóa tất cả sp trong giỏ hàng = xóa session
	@RequestMapping(value="/cart/deleteAll")
	public String DelAllCart(HttpSession session, HttpServletRequest request , RedirectAttributes ra){
		@SuppressWarnings("unchecked")
		List<Cart> cart = (List<Cart>)session.getAttribute("listCart");
		
		if(cart !=null){
			session.removeAttribute("listCart");
			ra.addFlashAttribute("msg", "<p style='color: red'>Không có sản phẩm nào trong giỏ hàng !</p>");
		}
		return "redirect:/public/cart/index";
	}
	//Cập nhât giỏ hàng, sau khi thay đổi số lượng
	@RequestMapping(value = "/cart/update", method=RequestMethod.POST)
	public String UpdateCart(HttpSession session, RedirectAttributes ra,HttpServletRequest request) {
		@SuppressWarnings("unchecked")
		List<Cart> cart = (List<Cart>)session.getAttribute("listCart");
		
		String [] soluong = request.getParameterValues("UpdateSL");//mỗi sp trong giỏ hàng, có 1 "số lượng" riêng, nên ta dùng "[] soluong" để xác định dc sô lượng của từng sp
		for (int i = 0; i < cart.size(); i++) {
			cart.get(i).setSoluong(Integer.parseInt(soluong[i])); //cập nhật số lượng của sp thứ i trong giỏ hàng. Integer.parseInt(soluong[i]): sô lượng của sản phẩm thứ i mà ta nhập
		}
		session.setAttribute("listCart", cart);

      return "redirect:/public/cart/index";
	}

}



