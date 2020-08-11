package entity;

public class Reply {
	private String emailNguoiGui;
	private String passEmailNguoiGui;
	private String tieude;
	private String noidung;
	private String emailNguoiNhan;
	
	public String getEmailNguoiGui() {
		return emailNguoiGui;
	}
	public void setEmailNguoiGui(String emailNguoiGui) {
		this.emailNguoiGui = emailNguoiGui;
	}
	public String getPassEmailNguoiGui() {
		return passEmailNguoiGui;
	}
	public void setPassEmailNguoiGui(String passEmailNguoiGui) {
		this.passEmailNguoiGui = passEmailNguoiGui;
	}
	public String getTieude() {
		return tieude;
	}
	public void setTieude(String tieude) {
		this.tieude = tieude;
	}
	public String getNoidung() {
		return noidung;
	}
	public void setNoidung(String noidung) {
		this.noidung = noidung;
	}
	public String getEmailNguoiNhan() {
		return emailNguoiNhan;
	}
	public void setEmailNguoiNhan(String emailNguoiNhan) {
		this.emailNguoiNhan = emailNguoiNhan;
	}
	public Reply(String emailNguoiGui, String passEmailNguoiGui, String tieude, String noidung, String emailNguoiNhan) {
		super();
		this.emailNguoiGui = emailNguoiGui;
		this.passEmailNguoiGui = passEmailNguoiGui;
		this.tieude = tieude;
		this.noidung = noidung;
		this.emailNguoiNhan = emailNguoiNhan;
	}
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Reply [emailNguoiGui=" + emailNguoiGui + ", passEmailNguoiGui=" + passEmailNguoiGui + ", tieude="
				+ tieude + ", noidung=" + noidung + ", emailNguoiNhan=" + emailNguoiNhan + "]";
	}
	
	
}
