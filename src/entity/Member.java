package entity;

import java.sql.Timestamp;

public class Member {
	private int idTV;
	private String usernameTV;
	private String fullnameTV;
	private String emailTV;
	private String passwordTV;
	private String phoneTV;
    private Timestamp createdTV;
	public int getIdTV() {
		return idTV;
	}
	public void setIdTV(int idTV) {
		this.idTV = idTV;
	}
	public String getUsernameTV() {
		return usernameTV;
	}
	public void setUsernameTV(String usernameTV) {
		this.usernameTV = usernameTV;
	}
	public String getFullnameTV() {
		return fullnameTV;
	}
	public void setFullnameTV(String fullnameTV) {
		this.fullnameTV = fullnameTV;
	}
	public String getEmailTV() {
		return emailTV;
	}
	public void setEmailTV(String emailTV) {
		this.emailTV = emailTV;
	}
	public String getPasswordTV() {
		return passwordTV;
	}
	public void setPasswordTV(String passwordTV) {
		this.passwordTV = passwordTV;
	}
	public String getPhoneTV() {
		return phoneTV;
	}
	public void setPhoneTV(String phoneTV) {
		this.phoneTV = phoneTV;
	}
	public Timestamp getCreatedTV() {
		return createdTV;
	}
	public void setCreatedTV(Timestamp createdTV) {
		this.createdTV = createdTV;
	}
	public Member(int idTV, String usernameTV, String fullnameTV, String emailTV, String passwordTV, String phoneTV,
			Timestamp createdTV) {
		super();
		this.idTV = idTV;
		this.usernameTV = usernameTV;
		this.fullnameTV = fullnameTV;
		this.emailTV = emailTV;
		this.passwordTV = passwordTV;
		this.phoneTV = phoneTV;
		this.createdTV = createdTV;
	}
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Member [idTV=" + idTV + ", usernameTV=" + usernameTV + ", fullnameTV=" + fullnameTV + ", emailTV="
				+ emailTV + ", passwordTV=" + passwordTV + ", phoneTV=" + phoneTV + ", createdTV=" + createdTV + "]";
	}
    
}
