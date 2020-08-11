package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Member;


@Repository 
public class MemberDAO {
   
	@Autowired
	private JdbcTemplate jdbcTemplate;
	//index
	public List<Member> getItemsMember(int offset,int row_count){ 
		return jdbcTemplate.query("SELECT * from member limit ?,?",new Object[]{offset,row_count}, new BeanPropertyRowMapper<Member>(Member.class) );
	}
	public int getSumAll() {
		return jdbcTemplate.queryForObject("select count(*) as total from member", Integer.class );
	}
	//edit
	public Member getItemMemberFromId(int idTV) {
	  return jdbcTemplate.queryForObject("select * from member where idTV = ? ", new Object[]{idTV}, new BeanPropertyRowMapper<Member>(Member.class));
	}

	public int editItemMember(Member objMember) {
		 return jdbcTemplate.update("update member set fullnameTV = ?,emailTV = ?, passwordTV=?,phoneTV = ?  where idTV = ? ",
    		        new Object[] {objMember.getFullnameTV(),objMember.getEmailTV(),objMember.getPasswordTV(),
				                   objMember.getPhoneTV(), objMember.getIdTV()});
	}
	//del
	public int delItemMember(int idTV) {
		  return jdbcTemplate.update("delete from member where idTV = ?" , new Object[]{idTV});
	}
	
	//public
	//checkUsername
	public List<Member> checkUsername(String usernameTV) {
		 return jdbcTemplate.query("select  * from member where usernameTV = ? ",new Object[]{usernameTV} , new BeanPropertyRowMapper<Member>(Member.class) );
	}
	//add member
	public int addItemMember(Member objRegister) {
		 return jdbcTemplate.update("insert into member(usernameTV,fullnameTV,emailTV,passwordTV,phoneTV) value(?,?,?,?,?) ",
				 new Object[]{ objRegister.getUsernameTV(),objRegister.getFullnameTV(),objRegister.getEmailTV(),objRegister.getPasswordTV() , objRegister.getPhoneTV() });
	}
	//xử lí đăng nhập
	public Member getPassDBFromUsername(String usernameTV) {
		 return jdbcTemplate.queryForObject("select  * from member  where usernameTV = ?", 
	                new Object[]{usernameTV} , new BeanPropertyRowMapper<Member>(Member.class) );
	}
	
//
//	/*public List<Member> getItems(){ 
//		return jdbcTemplate.query("SELECT * FROM thanhvien order by idTV DESC ",
//				  new BeanPropertyRowMapper<Member>(Member.class) );
//	}*/
	
}
