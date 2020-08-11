package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.User;
@Repository
public class UserDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//index
	public List<User> getItemsUser(int offset, int row_count) {
		return jdbcTemplate.query("select * from users limit ?,?", new Object[] {offset, row_count}, new BeanPropertyRowMapper<User>(User.class));
	}
	public int getSumAll() {
		return jdbcTemplate.queryForObject("select count(*) as total from users", Integer.class);
	}
	//xử lí ajax
	public int updateStatus(int bidUser, int bstatus) {
		return jdbcTemplate.update("update users set active = ? where id_user = ?", new Object[] {bstatus,bidUser});
	}
	//add
	public List<User> checkUser(String username) {
		return jdbcTemplate.query("select * from users where username = ?", new Object[] {username}, new BeanPropertyRowMapper<User>(User.class));
	}
	public int addItemUser(User objUser) {
		return jdbcTemplate.update("insert into users(username,password,fullname,active,id_role) value(?,?,?,?,?)", new Object[] {objUser.getUsername(),objUser.getPassword(),objUser.getFullname(),objUser.getActive(),objUser.getId_role()});
	}
	//edit
	public User getItemUserfromId(int id_user) {
		return jdbcTemplate.queryForObject("select * from users where id_user = ?", new Object[] {id_user}, new BeanPropertyRowMapper<User>(User.class));
	}
	public int editItemUser(User objUser) {
		return jdbcTemplate.update("update users set username=?, password=?, fullname=?, active=?, id_role=? where id_user = ?", new Object[] {objUser.getUsername(), objUser.getPassword(), objUser.getFullname(), objUser.getActive(), objUser.getId_role(), objUser.getId_user()});
	}
	public int delItemUser(int id_user) {
		return jdbcTemplate.update("delete from users where id_user = ?", new Object[] {id_user});
	}
	//session
	public User getItemUserfromUsername(String username) {
		return jdbcTemplate.queryForObject("select * from users where username = ?", new Object[] {username}, new BeanPropertyRowMapper<User>(User.class));
	}

}
