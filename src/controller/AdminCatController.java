package controller;

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
import dao.CatDAO;
import entity.Cat;

@Controller
@RequestMapping("/admin/cat")
public class AdminCatController {
	@Autowired
	private Defines defines;
	@Autowired
	private CatDAO catDao;
	
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap) {
		modelMap.addAttribute("defines",defines);
		modelMap.addAttribute("listParentCat", catDao.getItemsParentCat());
	}
	@RequestMapping("/index")
	public String index(ModelMap modelMap,  @RequestParam(value="page", defaultValue="1") int page) {
		int row_count = defines.getROW_COUNT_ADMIN();
		int offset = (page - 1)*row_count;
		
		modelMap.addAttribute("listCat", catDao.getItemsCat(offset,row_count));
		
		int totalPage = (int) Math.ceil((float) catDao.getSumAll()/row_count);
		modelMap.addAttribute("totalPage", totalPage);

		modelMap.addAttribute("page", page);
		
		return "admin.cat.index";
	}
	@RequestMapping("/add") //hiển thị form
	public String add(ModelMap modelMap) {
		return "admin.cat.add";
	}
	@RequestMapping(value= "/add", method= RequestMethod.POST) //xữ lí form
	public String add(@ModelAttribute("objParentCat") Cat objItem, RedirectAttributes ra) {
		System.out.println(objItem.toString());

		if(!catDao.checkCat(objItem.getName_cat()).isEmpty()){ 
			// đã tồn tại tên người dùng
			ra.addFlashAttribute("msg"," Tên danh mục đã tồn tại !"); //hien thi 1 lần 
			return "redirect:/admin/cat/index"; 
		}else {
			if(catDao.addItemCat(objItem) > 0) {
				ra.addFlashAttribute("msg", "Thêm thành công");
			}else {
				ra.addFlashAttribute("msg", "Thêm thất bại");
			}
			return "redirect:/admin/cat/index";
		}
	}
	
	@RequestMapping("/edit/{id_cat}") //hiển thị form
	public String edit(@PathVariable("id_cat") int id, ModelMap modelMap) {
		modelMap.addAttribute("objCatfromId", catDao.getItemCatfromId(id));
		return "admin.cat.edit";
	}
	
	@RequestMapping(value= "/edit/{id_cat}", method= RequestMethod.POST) //xữ lí form
	public String edit(@PathVariable("id_cat") int id, @ModelAttribute("objCatEdit") Cat objCatEdit, RedirectAttributes ra) {
	   System.out.println(objCatEdit.toString());
		if(id == 1 || id == 2 ){ //la cha
	    	  ra.addFlashAttribute("msg", "Không được sửa danh mục gốc!");
	  		  return "redirect:/admin/cat/index";
	    }else {
			objCatEdit.setId_cat(id);
			//objCatEdit có name_cat mới, danh mục cha mới và id_cat của dah mục cha mới
			if(catDao.editItemCat(objCatEdit) > 0) {
				ra.addFlashAttribute("msg", "Sửa thành công");
			}else {
				ra.addFlashAttribute("msg", "Sửa thất bại");
			}
			return "redirect:/admin/cat/index";	    	
	    }
	}
	
	@RequestMapping("/del/{id_cat}") 
	public String del(@PathVariable("id_cat") int idCat , RedirectAttributes ra){  		
	    
	    if(idCat == 1 || idCat == 2 ){ //la cha
	    	  ra.addFlashAttribute("msg", "Không được xóa danh mục gốc!");
	  		  return "redirect:/admin/cat/index";
	  		
	    }else{//la con
	    	  if(catDao.delItemCon(idCat) > 0){
		  	    	//thanh cong
	  	    	ra.addFlashAttribute("msg", "Xóa Thành Công !");
	  	      }else{
	  	    	//that bai
	  	    	ra.addFlashAttribute("msg", "Xóa Thành Công !");
	  	      }
	  		
	  		  return "redirect:/admin/cat/index";
	    }
	}
}



