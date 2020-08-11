package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Introduce;

@Repository
public class IntroduceDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	//index
	public List<Introduce> getItemsIntroduce(int offset, int row_count) {
		return jdbcTemplate.query("select * from introduce limit ?,?", new Object[] {offset, row_count}, new BeanPropertyRowMapper<Introduce>(Introduce.class));
	}
	public int getSumAll() {
		return jdbcTemplate.queryForObject("select count(*) as total from introduce", Integer.class);
	}
	//add
	public int addItemIntroduce(Introduce objIntro) {
		return jdbcTemplate.update("insert into introduce(name_intro,detail_intro) value(?,?)", new Object[] {objIntro.getName_intro(),objIntro.getDetail_intro()});
	}
	//edit
	public Introduce getItemIntroduceFromId(int idintro) {
		return jdbcTemplate.queryForObject("select * from introduce where id_intro=?", new Object[] {idintro}, new BeanPropertyRowMapper<Introduce>(Introduce.class));
	}
	public int editItemIntroduce(Introduce objIntro) {
		return jdbcTemplate.update("update introduce set name_intro=?, detail_intro=? where id_intro=?", new Object[] {objIntro.getName_intro(),objIntro.getDetail_intro(),objIntro.getId_intro()});
	}
	//del
	public int delItemIntroduce(int idintro) {
		return jdbcTemplate.update("delete from introduce where id_intro=?", new Object[] {idintro});
	}

	//public
	public List<Introduce> getItemsIntroducePublic() {
		return jdbcTemplate.query("select * from introduce", new BeanPropertyRowMapper<Introduce>(Introduce.class));
	}
}
