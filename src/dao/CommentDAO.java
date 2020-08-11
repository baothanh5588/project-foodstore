package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Comment;

@Repository
public class CommentDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	//index
	public List<Comment> getItemsComment(int offset, int row_count) {
		return jdbcTemplate.query("select * from comment limit ?,?", new Object[] {offset, row_count}, new BeanPropertyRowMapper<Comment>(Comment.class));
	}
	public int getSumAll() {
		return jdbcTemplate.queryForObject("select count(*) as total from comment", Integer.class);
	}
	//xử lí ajax
	public int updateStatus(int bidCmt, int bstatus) {
	       return jdbcTemplate.update("update comment set check_cm = ? where id_cm = ? " , new Object[]{bstatus , bidCmt});
	}
	//del
	public int delItemComment(int idcm) {
		return jdbcTemplate.update("delete from comment where id_cm=?", new Object[] {idcm});
	}
}
