package entity;

import java.sql.Timestamp;

public class Product {
	private int id_sp;
	private String name_sp;
	private int id_cat_in_product;
	private int price;
	private String image_link;
	private String thongtin_sp;
	private int view;
	private Timestamp created_sp;
	
	private int id_cat;
	private String name_cat;
	
	public int getId_sp() {
		return id_sp;
	}
	public void setId_sp(int id_sp) {
		this.id_sp = id_sp;
	}
	public String getName_sp() {
		return name_sp;
	}
	public void setName_sp(String name_sp) {
		this.name_sp = name_sp;
	}
	public int getId_cat_in_product() {
		return id_cat_in_product;
	}
	public void setId_cat_in_product(int id_cat_in_product) {
		this.id_cat_in_product = id_cat_in_product;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage_link() {
		return image_link;
	}
	public void setImage_link(String image_link) {
		this.image_link = image_link;
	}
	public String getThongtin_sp() {
		return thongtin_sp;
	}
	public void setThongtin_sp(String thongtin_sp) {
		this.thongtin_sp = thongtin_sp;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public Timestamp getCreated_sp() {
		return created_sp;
	}
	public void setCreated_sp(Timestamp created_sp) {
		this.created_sp = created_sp;
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
	public Product(int id_sp, String name_sp, int id_cat_in_product, int price, String image_link, String thongtin_sp,
			int view, Timestamp created_sp, int id_cat, String name_cat) {
		super();
		this.id_sp = id_sp;
		this.name_sp = name_sp;
		this.id_cat_in_product = id_cat_in_product;
		this.price = price;
		this.image_link = image_link;
		this.thongtin_sp = thongtin_sp;
		this.view = view;
		this.created_sp = created_sp;
		this.id_cat = id_cat;
		this.name_cat = name_cat;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Product [id_sp=" + id_sp + ", name_sp=" + name_sp + ", id_cat_in_product=" + id_cat_in_product
				+ ", price=" + price + ", image_link=" + image_link + ", thongtin_sp=" + thongtin_sp + ", view=" + view
				+ ", created_sp=" + created_sp + ", id_cat=" + id_cat + ", name_cat=" + name_cat + "]";
	}


}
