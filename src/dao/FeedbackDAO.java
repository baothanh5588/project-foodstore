package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Feedback;

@Repository
public class FeedbackDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	//index
	public List<Feedback> getItemsFeedback(int offset, int row_count) {
		return jdbcTemplate.query("select * from contact limit ?,?", new Object[] {offset, row_count}, new BeanPropertyRowMapper<Feedback>(Feedback.class));
	}
	public int getSumAll() {
		return jdbcTemplate.queryForObject("select count(*) as total from contact", Integer.class);
	}
	//reply
	public Feedback getItemFeedbackFromId(int idLH) {
		return jdbcTemplate.queryForObject("select * from contact where id_LH=?", new Object[] {idLH}, new BeanPropertyRowMapper<Feedback>(Feedback.class));
	}
	//del
	public int delItemFeedback(int idLH) {
		return jdbcTemplate.update("delete from contact where id_LH=?", new Object[] {idLH});
	}
	//public
	//add
	public int addFeedback(Feedback objLH) {
		return jdbcTemplate.update("insert into contact(fullname_LH, email_LH, content) value(?,?,?)", new Object[] {objLH.getFullname_LH(),objLH.getEmail_LH(),objLH.getContent()});
	}
}
