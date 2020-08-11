package entity;

public class Feedback {
	private int id_LH;
	private String fullname_LH;
	private String email_LH;
	private String content;
	public int getId_LH() {
		return id_LH;
	}
	public void setId_LH(int id_LH) {
		this.id_LH = id_LH;
	}
	public String getFullname_LH() {
		return fullname_LH;
	}
	public void setFullname_LH(String fullname_LH) {
		this.fullname_LH = fullname_LH;
	}
	public String getEmail_LH() {
		return email_LH;
	}
	public void setEmail_LH(String email_LH) {
		this.email_LH = email_LH;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Feedback(int id_LH, String fullname_LH, String email_LH, String website, String content) {
		super();
		this.id_LH = id_LH;
		this.fullname_LH = fullname_LH;
		this.email_LH = email_LH;
		this.content = content;
	}
	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Feedback [id_LH=" + id_LH + ", fullname_LH=" + fullname_LH + ", email_LH=" + email_LH + ", content="
				+ content + "]";
	}

	
	
}
