package entity;

public class Cat {
	private int id_cat;
	private String name_cat;
	private int id_parent_cat;
	
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
	public int getId_parent_cat() {
		return id_parent_cat;
	}
	public void setId_parent_cat(int id_parent_cat) {
		this.id_parent_cat = id_parent_cat;
	}
	public Cat(int id_cat, String name_cat, int id_parent_cat) {
		super();
		this.id_cat = id_cat;
		this.name_cat = name_cat;
		this.id_parent_cat = id_parent_cat;
	}
	public Cat() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Cat [id_cat=" + id_cat + ", name_cat=" + name_cat + ", id_parent_cat=" + id_parent_cat + "]";
	}

	
	
}
