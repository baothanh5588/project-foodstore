package controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import dao.ProductDAO;
import entity.Product;
import utils.RenameFile;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {
	@Autowired
	private Defines defines;
	@Autowired
	private ProductDAO productDao;
	@Autowired
	private RenameFile renamefile;

	@ModelAttribute
	public void addCommonObject(ModelMap modelMap) {
		modelMap.addAttribute("defines", defines);
	}

	@RequestMapping("/index")
	public String index(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page) {

		int row_count = defines.getROW_COUNT_ADMIN();
		int offset = (page - 1) * row_count;
		modelMap.addAttribute("listProduct", productDao.getItemsProduct(offset, row_count));

		int totalPage = (int) Math.ceil((float) productDao.getSumAll() / row_count);
		modelMap.addAttribute("totalPage", totalPage);

		modelMap.addAttribute("page", page);
		return "admin.product.index";
	}

	@RequestMapping("/add")
	public String add(ModelMap modelMap) {
		modelMap.addAttribute("listCatInProduct", productDao.getItemCatInProduct());
		return "admin.product.add";
	}

	private final String DIR_UPLOAD = "files";// tên thư mục lưu hình : files,tên thư mục k thay đổi, nên ta khai báo 1 hằng số
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("objProduct") Product objProduct, ModelMap modelMap,
			@RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra) {

		// 1_Tạo ra đường dẫn đến thư mục chứa file
		String filenamebandau = cmf.getOriginalFilename();// lấy tên file mà ta sẻ upload lên
		System.out.println("filename ban dau: " + filenamebandau);
		String fileName = renamefile.renameFile(filenamebandau);

		if (!fileName.isEmpty()) {// khác rỗng
			// đường dẫn thực của dự án => để uploadfile phải dùng đường dẫn thực của dự án
			String appPath = request.getServletContext().getRealPath("");
			// đường dẫn đến thư mục chứa file
			String dirPath = appPath /* + File.separator */ + DIR_UPLOAD;// có thể k dùng "File.separator"
			System.out.println("apppath: " + appPath);
			System.out.println("dirpath:" + dirPath);
			File saveDirPath = new File(dirPath);
			if (!saveDirPath.exists()) {
				saveDirPath.mkdir();// mkdir: tạo đường dẫn đến thư mục chứa file
			}

			// 2_Lưu file vào folder
			String filePath = dirPath + File.separator + fileName;// Lấy đường dẫn đến fileupload, có thể k dùng
																	// "File.separator"
			System.out.println("filepath:" + filePath);
			File fileUpload = new File(filePath);// đây có thể là lúc lưu fileupload vào folder chứa fileupload
			// 3_Upload
			try {
				cmf.transferTo(fileUpload);// mọi thông tin file dc lưu trong cmf. Dùng transferTo: để uploadfile lên
											// server
			} catch (Exception e) {
				System.err.println(e.getMessage());
			}
		}

		System.out.println(objProduct.toString());

		// Thêm truyện vào DB
		objProduct.setImage_link(fileName);

		if (productDao.addItemProduct(objProduct) > 0) {
			ra.addFlashAttribute("msg", "Thêm thành công");
		} else {
			ra.addFlashAttribute("msg", "Thêm thất bại");
		}
		return "redirect:/admin/product/index";
	}

	@RequestMapping("/edit/{id_sp}") // HIỂN THỊ FORM
	public String edit(@PathVariable("id_sp") int idsp, ModelMap modelMap) {
		modelMap.addAttribute("objProductfromId", productDao.getItemProductfromId(idsp));
		modelMap.addAttribute("listCatInProduct", productDao.getItemCatInProduct());
		return "admin.product.edit";
	}

	@RequestMapping(value = "/edit/{id_sp}", method = RequestMethod.POST) // XỬ LÍ FORM
	public String edit(@PathVariable("id_sp") int idsp, @ModelAttribute("objProduct") Product objProduct,
			RedirectAttributes ra, ModelMap modelMap, @RequestParam("hinhanh") CommonsMultipartFile cmf,
			HttpServletRequest request) {
		// Lưu lại đối tượng product trước khi sửa để sử dụng cho việc câp nhật hình ms
		Product productOld = productDao.getItemProductfromId(idsp);
		System.out.println("doi tuong cu :" + productOld);

		// 1_Tạo ra đường dẫn đến thư mục chứa file
		String filenamebandau = cmf.getOriginalFilename();// lấy tên file mà ta sẻ upload lên
		System.out.println("filename ban dau: " + filenamebandau);

		if (!filenamebandau.isEmpty()) {// có upload
			String fileName = renamefile.renameFile(filenamebandau);
			// đường dẫn thực của dự án => để uploadfile phải dùng đường dẫn thực của dự án
			String appPath = request.getServletContext().getRealPath("");
			// đường dẫn đến thư mục chứa file
			String dirPath = appPath /* + File.separator */ + DIR_UPLOAD;// có thể k dùng "File.separator"
			System.out.println("apppath: " + appPath);
			System.out.println("dirpath:" + dirPath);
			File saveDirPath = new File(dirPath);
			if (!saveDirPath.exists()) {
				saveDirPath.mkdir();// mkdir: tạo đường dẫn đến thư mục chứa file
			}

			// 2_Lưu file vào folder
			String filePath = dirPath + File.separator + fileName;// Lấy đường dẫn đến fileupload, có thể k dùng
																	// "File.separator"
			System.out.println("filepath:" + filePath);
			File fileUpload = new File(filePath);// đây có thể là lúc lưu fileupload vào folder chứa fileupload
			// 3_Upload
			try {
				cmf.transferTo(fileUpload);// mọi thông tin file dc lưu trong cmf. Dùng transferTo: để uploadfile lên
											// server
			} catch (Exception e) {
				System.err.println(e.getMessage());
			}
			objProduct.setImage_link(fileName);// nếu có upload thì lưu vào objProduct
		} else {
			objProduct.setImage_link(productOld.getImage_link());// nếu k upload thì lưu lại hình cũ
		}
		System.out.println("doi tuong moi:" + objProduct.toString());

		if (productDao.editItemProduct(objProduct) > 0) {
			ra.addFlashAttribute("msg", "Sửa thành công");
		} else {
			ra.addFlashAttribute("msg", "Sửa thất bại");
		}
		return "redirect:/admin/product/index";
	}

	@RequestMapping("/del/{id_sp}")
	public String edit(@PathVariable("id_sp") int idsp, RedirectAttributes ra, HttpServletRequest request) {

		Product productOld = productDao.getItemProductfromId(idsp);
		String hinhxoa = productOld.getImage_link();

		if (productDao.delItemProduct(idsp) > 0) {
			// xóa tin trước rồi xóa hình
			// xóa hình nếu có
			if (!"".equals(hinhxoa)) {
				String filePath = request.getServletContext().getRealPath("files") + File.separator + hinhxoa;
				File file = new File(filePath);
				file.delete();
			}
			ra.addFlashAttribute("msg", "Xóa thành công !");
		} else {
			ra.addFlashAttribute("msg", "Xóa thất bại !");
		}
		return "redirect:/admin/product/index";
	}

}
