package entity;

import java.sql.Timestamp;

public class Comment {
	private int id_cm;
	private String name_cm;
	private String message_cm;
	private Timestamp time_cm;
	private int check_cm;
	private int id_blog;
	public int getId_cm() {
		return id_cm;
	}
	public void setId_cm(int id_cm) {
		this.id_cm = id_cm;
	}
	public String getName_cm() {
		return name_cm;
	}
	public void setName_cm(String name_cm) {
		this.name_cm = name_cm;
	}
	public String getMessage_cm() {
		return message_cm;
	}
	public void setMessage_cm(String message_cm) {
		this.message_cm = message_cm;
	}
	public Timestamp getTime_cm() {
		return time_cm;
	}
	public void setTime_cm(Timestamp time_cm) {
		this.time_cm = time_cm;
	}
	public int getCheck_cm() {
		return check_cm;
	}
	public void setCheck_cm(int check_cm) {
		this.check_cm = check_cm;
	}
	public int getId_blog() {
		return id_blog;
	}
	public void setId_blog(int id_blog) {
		this.id_blog = id_blog;
	}
	public Comment(int id_cm, String name_cm, String message_cm, Timestamp time_cm, int check_cm, int id_blog) {
		super();
		this.id_cm = id_cm;
		this.name_cm = name_cm;
		this.message_cm = message_cm;
		this.time_cm = time_cm;
		this.check_cm = check_cm;
		this.id_blog = id_blog;
	}
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Comment [id_cm=" + id_cm + ", name_cm=" + name_cm + ", message_cm=" + message_cm + ", time_cm="
				+ time_cm + ", check_cm=" + check_cm + ", id_blog=" + id_blog + "]";
	}
	
}
