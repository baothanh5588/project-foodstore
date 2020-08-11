package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Role;
@Repository
public class RoleDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Role> getItemsRole() {
		return jdbcTemplate.query("select * from roles", new BeanPropertyRowMapper<Role>(Role.class));
	}
	
}
