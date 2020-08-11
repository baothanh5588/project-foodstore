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
import dao.BlogDAO;
import entity.Blog;
import utils.RenameFile;

@Controller
@RequestMapping("/admin/blog")
public class AdminBlogController {
	@Autowired
	private Defines defines;
	@Autowired
	private BlogDAO blogDao;
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
		modelMap.addAttribute("listBlog", blogDao.getItemsBlog(offset, row_count));

		int totalPage = (int) Math.ceil((float) blogDao.getSumAll() / row_count);
		modelMap.addAttribute("totalPage", totalPage);

		modelMap.addAttribute("page", page);
		return "admin.blog.index";
	}

	@RequestMapping("/add")
	public String add(ModelMap modelMap) {
		modelMap.addAttribute("listCatInBlog", blogDao.getItemCatInBlog());
		return "admin.blog.add";
	}

	private final String DIR_UPLOAD = "files";// tên thư mục lưu hình : files,tên thư mục k thay đổi, nên ta khai báo 1 hằng số
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("objBlog") Blog objBlog, ModelMap modelMap,
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

		System.out.println(objBlog.toString());

		objBlog.setPicture(fileName);

		if (blogDao.addItemBlog(objBlog) > 0) {
			ra.addFlashAttribute("msg", "Thêm thành công");
		} else {
			ra.addFlashAttribute("msg", "Thêm thất bại");
		}
		return "redirect:/admin/blog/index";
	}

	@RequestMapping("/edit/{id_blog}") // HIỂN THỊ FORM
	public String edit(@PathVariable("id_blog") int idblog, ModelMap modelMap) {
		modelMap.addAttribute("objBlogfromId", blogDao.getItemBlogfromId(idblog));
		modelMap.addAttribute("listCatInBlog", blogDao.getItemCatInBlog());
		return "admin.blog.edit";
	}

	@RequestMapping(value = "/edit/{id_blog}", method = RequestMethod.POST) // XỬ LÍ FORM
	public String edit(@PathVariable("id_blog") int idblog, @ModelAttribute("objBlog") Blog objBlog,
			RedirectAttributes ra, ModelMap modelMap, @RequestParam("hinhanh") CommonsMultipartFile cmf,
			HttpServletRequest request) {
		// Lưu lại đối tượng blog trước khi sửa để sử dụng cho việc câp nhật hình ms
		Blog blogOld = blogDao.getItemBlogfromId(idblog);
		System.out.println("doi tuong cu :" + blogOld);

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
			objBlog.setPicture(fileName);// nếu có upload thì lưu vào objProduct
		} else {
			objBlog.setPicture(blogOld.getPicture());// nếu k upload thì lưu lại hình cũ
		}
		System.out.println("doi tuong moi:" + objBlog.toString());

		if (blogDao.editItemBlog(objBlog) > 0) {
			ra.addFlashAttribute("msg", "Sửa thành công");
		} else {
			ra.addFlashAttribute("msg", "Sửa thất bại");
		}
		return "redirect:/admin/blog/index";
	}

	@RequestMapping("/del/{id_blog}")
	public String edit(@PathVariable("id_blog") int idblog, RedirectAttributes ra, HttpServletRequest request) {

		Blog blogOld = blogDao.getItemBlogfromId(idblog);
		String hinhxoa = blogOld.getPicture();

		if (blogDao.delItemBlog(idblog) > 0) {
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
		return "redirect:/admin/blog/index";
	}

}
