package entity;

public class Introduce {
	private int id_intro;
	private String name_intro;
	private String detail_intro;
	public int getId_intro() {
		return id_intro;
	}
	public void setId_intro(int id_intro) {
		this.id_intro = id_intro;
	}
	public String getName_intro() {
		return name_intro;
	}
	public void setName_intro(String name_intro) {
		this.name_intro = name_intro;
	}
	public String getDetail_intro() {
		return detail_intro;
	}
	public void setDetail_intro(String detail_intro) {
		this.detail_intro = detail_intro;
	}
	public Introduce(int id_intro, String name_intro, String detail_intro) {
		super();
		this.id_intro = id_intro;
		this.name_intro = name_intro;
		this.detail_intro = detail_intro;
	}
	public Introduce() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Introduce [id_intro=" + id_intro + ", name_intro=" + name_intro + ", detail_intro=" + detail_intro
				+ "]";
	}
	
	
}
