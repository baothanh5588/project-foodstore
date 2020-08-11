package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Blog;
import entity.Cat;
@Repository
public class BlogDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//index
	public List<Blog> getItemsBlog(int offset, int row_count) {
		return jdbcTemplate.query("select * from blog limit ?,?", new Object[] {offset, row_count}, new BeanPropertyRowMapper<Blog>(Blog.class));
	}
	public int getSumAll() {
		return jdbcTemplate.queryForObject("select count(*) as total from blog", Integer.class);
	}
	//add
	public List<Cat> getItemCatInBlog() {
		return jdbcTemplate.query("select * from category where id_parent_cat = 2", new BeanPropertyRowMapper<Cat>(Cat.class) );
	}
	public int addItemBlog(Blog objBlog) {
		return jdbcTemplate.update("insert into blog(name_blog,mota_blog,chitiet_blog,id_cat_in_blog,picture) value(?,?,?,?,?)", new Object[] {objBlog.getName_blog(),objBlog.getMota_blog(),objBlog.getChitiet_blog(),objBlog.getId_cat_in_blog(),objBlog.getPicture()});
	}
	//edit
	public Blog getItemBlogfromId(int idblog) {
		return jdbcTemplate.queryForObject("select * from blog where id_blog = ?", new Object[] {idblog}, new BeanPropertyRowMapper<Blog>(Blog.class));
	}
	public int editItemBlog(Blog objBlog) {
		return jdbcTemplate.update("update blog set name_blog=?, mota_blog=?, chitiet_blog=?, id_cat_in_blog=?, picture=? where id_blog = ?", new Object[] {objBlog.getName_blog(), objBlog.getMota_blog(), objBlog.getChitiet_blog(),objBlog.getId_cat_in_blog(),objBlog.getPicture(),objBlog.getId_blog()});
	}
	//dell
	public int delItemBlog(int idblog) {
		return jdbcTemplate.update("delete from blog where id_blog = ?", new Object[] {idblog});
	}

	//public
	//index
	public List<Blog> getItemsBlogInnerCat() {
		return jdbcTemplate.query("select * from blog as b INNER JOIN category as c ON b.id_cat_in_blog = c.id_cat", new BeanPropertyRowMapper<Blog>(Blog.class));
	}
	public List<Blog> getItemBlogFromIdcat(int offset, int row_count, int idcat) {
		return jdbcTemplate.query("select * from blog as b INNER JOIN category as c ON b.id_cat_in_blog = c.id_cat where id_cat = ? limit ?,?", new Object[] {idcat,offset,row_count}, new BeanPropertyRowMapper<Blog>(Blog.class));
	}
	public int getSumAll(int idcat) {
		return jdbcTemplate.queryForObject("select count(*) as total from blog as b INNER JOIN category as c ON b.id_cat_in_blog = c.id_cat where id_cat = ?", new Object[] {idcat}, Integer.class);
	}
}
