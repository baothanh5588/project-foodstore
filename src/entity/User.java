package entity;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class User {
	private int id_user;
	
	@NotEmpty(message="Vui lòng nhập vào username")
	@Size(min = 5, max = 20, message="Độ dài min = 5 , max = 20")
	private String username;
	
	@NotEmpty(message="Vui lòng nhập vào password")
	@Size(min = 5, max = 20, message="Độ dài min = 5 , max = 20")
	private String password;
	
	@NotEmpty(message="Vui lòng nhập vào fullname")
	@Size(min = 5, max = 20, message="Độ dài min = 5 , max = 20")
	private String fullname;
	
	private int active;
	private int id_role;
	private String name_role;
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public int getId_role() {
		return id_role;
	}
	public void setId_role(int id_role) {
		this.id_role = id_role;
	}
	public String getName_role() {
		return name_role;
	}
	public void setName_role(String name_role) {
		this.name_role = name_role;
	}
	public User(int id_user, String username, String password, String fullname, int active, int id_role,
			String name_role) {
		super();
		this.id_user = id_user;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.active = active;
		this.id_role = id_role;
		this.name_role = name_role;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "User [id_user=" + id_user + ", username=" + username + ", password=" + password + ", fullname="
				+ fullname + ", active=" + active + ", id_role=" + id_role + ", name_role=" + name_role + "]";
	}
	
	
}
