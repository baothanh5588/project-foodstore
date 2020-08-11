package entity;

import java.sql.Timestamp;

public class Blog {
	private int id_blog;
	private String name_blog;
	private String mota_blog;
	private String chitiet_blog;
	private int id_cat_in_blog;
	private String picture;
	private Timestamp created_blog;
	
	private int id_cat;
	private String name_cat;
	
	public int getId_blog() {
		return id_blog;
	}
	public void setId_blog(int id_blog) {
		this.id_blog = id_blog;
	}
	public String getName_blog() {
		return name_blog;
	}
	public void setName_blog(String name_blog) {
		this.name_blog = name_blog;
	}
	public String getMota_blog() {
		return mota_blog;
	}
	public void setMota_blog(String mota_blog) {
		this.mota_blog = mota_blog;
	}
	public String getChitiet_blog() {
		return chitiet_blog;
	}
	public void setChitiet_blog(String chitiet_blog) {
		this.chitiet_blog = chitiet_blog;
	}
	public int getId_cat_in_blog() {
		return id_cat_in_blog;
	}
	public void setId_cat_in_blog(int id_cat_in_blog) {
		this.id_cat_in_blog = id_cat_in_blog;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Timestamp getCreated_blog() {
		return created_blog;
	}
	public void setCreated_blog(Timestamp created_blog) {
		this.created_blog = created_blog;
	}
	
	
	public int getId_cat() {
		return id_cat;
	}
	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}
	public String getName_cat() {
		return name_cat;
	}
	public void setName_cat(String name_cat) {
		this.name_cat = name_cat;
	}
	public Blog(int id_blog, String name_blog, String mota_blog, String chitiet_blog, int id_cat_in_blog,
			String picture, Timestamp created_blog, int id_cat, String name_cat) {
		super();
		this.id_blog = id_blog;
		this.name_blog = name_blog;
		this.mota_blog = mota_blog;
		this.chitiet_blog = chitiet_blog;
		this.id_cat_in_blog = id_cat_in_blog;
		this.picture = picture;
		this.created_blog = created_blog;
		this.id_cat = id_cat;
		this.name_cat = name_cat;
	}
	public Blog() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Blog [id_blog=" + id_blog + ", name_blog=" + name_blog + ", mota_blog=" + mota_blog + ", chitiet_blog="
				+ chitiet_blog + ", id_cat_in_blog=" + id_cat_in_blog + ", picture=" + picture + ", created_blog="
				+ created_blog + ", id_cat=" + id_cat + ", name_cat=" + name_cat + "]";
	}
	
}
