package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Cat;

@Repository
public class CatDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	//index
	public List<Cat> getItemsCat(int offset, int row_count) {
		return jdbcTemplate.query("select * from category limit ?,?", new Object[] {offset, row_count}, new BeanPropertyRowMapper<Cat>(Cat.class));
	}
	public int getSumAll() {
		return jdbcTemplate.queryForObject("select count(*) as total from category", Integer.class);
	}
	//add
	public List<Cat> getItemsParentCat() {
		return jdbcTemplate.query("select * from category where id_cat=1 or id_cat=2", new BeanPropertyRowMapper<Cat>(Cat.class));
	}
	public List<Cat> checkCat(String namecat) {
		return jdbcTemplate.query("select * from category where name_cat = ?", new Object[] {namecat}, new BeanPropertyRowMapper<Cat>(Cat.class));
	}
	public int addItemCat(Cat objItem) {
		return jdbcTemplate.update("insert into category(name_cat,id_parent_cat) value(?,?)", new Object[] {objItem.getName_cat(),objItem.getId_parent_cat()});
	}
	//edit
	public Cat getItemCatfromId(int id_cat) {
		return jdbcTemplate.queryForObject("select * from category where id_cat=?", new Object[] {id_cat}, new BeanPropertyRowMapper<Cat>(Cat.class));
	}
	public int editItemCat(Cat objCatEdit) {
		return jdbcTemplate.update("update category set name_cat=?, id_parent_cat=? where id_cat=?", new Object[] {objCatEdit.getName_cat(), objCatEdit.getId_parent_cat(), objCatEdit.getId_cat()});
	}
	public int delItemCon(int idCat) {
		return jdbcTemplate.update("delete from category where id_cat=?", new Object[] {idCat});
	}
	
	//public
	public List<Cat> getItemsParentCatAll() {
		return jdbcTemplate.query("select * from category", new BeanPropertyRowMapper<Cat>(Cat.class));
	}

}
