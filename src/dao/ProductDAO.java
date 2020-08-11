package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Cat;
import entity.Product;
@Repository
public class ProductDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	//admin
	//index
	public List<Product> getItemsProduct(int offset, int row_count) {
		return jdbcTemplate.query("select * from product limit ?,?", new Object[] {offset, row_count}, new BeanPropertyRowMapper<Product>(Product.class));
	}
	public int getSumAll() {
		return jdbcTemplate.queryForObject("select count(*) as total from product", Integer.class);
	}
	//add
	public List<Cat> getItemCatInProduct() {
		return jdbcTemplate.query("select * from category where id_parent_cat = 1", new BeanPropertyRowMapper<Cat>(Cat.class) );
	}
	public int addItemProduct(Product objProduct) {
		return jdbcTemplate.update("insert into product(name_sp,id_cat_in_product,price,image_link,thongtin_sp) value(?,?,?,?,?)", new Object[] {objProduct.getName_sp(),objProduct.getId_cat_in_product(), objProduct.getPrice(), objProduct.getImage_link(), objProduct.getThongtin_sp()});
	}
	//edit
	public Product getItemProductfromId(int idsp) {
		return jdbcTemplate.queryForObject("select * from product where id_sp = ?", new Object[] {idsp}, new BeanPropertyRowMapper<Product>(Product.class));
	}
	public int editItemProduct(Product objProduct) {
		return jdbcTemplate.update("update product set name_sp=?, id_cat_in_product=?, price=?, image_link=?, thongtin_sp=? where id_sp = ?", new Object[] {objProduct.getName_sp(),objProduct.getId_cat_in_product(), objProduct.getPrice(),objProduct.getImage_link(),objProduct.getThongtin_sp(),objProduct.getId_sp()});
	}
	//dell
	public int delItemProduct(int idsp) {
		return jdbcTemplate.update("delete from product where id_sp = ?", new Object[] {idsp});
	}
	
	//public
	//index
	public List<Product> getItemsProductInnerCat() {
		return jdbcTemplate.query("select * from product as p INNER JOIN category as c ON p.id_cat_in_product = c.id_cat", new BeanPropertyRowMapper<Product>(Product.class));
	}
	public List<Product> getItemProductFromIdcat(int offset, int row_count, int idcat) {
		return jdbcTemplate.query("select * from product as p INNER JOIN category as c ON p.id_cat_in_product = c.id_cat where id_cat = ? limit ?,?", new Object[] {idcat,offset,row_count}, new BeanPropertyRowMapper<Product>(Product.class));
	}
	public int getSumAll(int idcat) {
		return jdbcTemplate.queryForObject("select count(*) as total from product as p INNER JOIN category as c ON p.id_cat_in_product = c.id_cat where id_cat = ?", new Object[] {idcat}, Integer.class);
	}
//	public Product getItemProductPublicfromId(int idsp) {
//		return jdbcTemplate.queryForObject("select * from product as p INNER JOIN category as c ON p.id_cat_in_product = c.id_cat where id_sp = ?", new Object[] {idsp}, new BeanPropertyRowMapper<Product>(Product.class));
//	}
	//search
	public List<Product> searchKeyword(String keyword) {
		return jdbcTemplate.query("select * from product as p INNER JOIN category as c ON p.id_cat_in_product = c.id_cat where name_sp Like '%" +keyword+ "%' || name_cat Like '%" +keyword + "%'", new BeanPropertyRowMapper<Product>(Product.class));
	}
}















