package user;

public class ProfileUser {
	private String id="";
	private String pw="";
	private String email="";
	private String phone="";
	
	public String getuserid() {
		return id;
	}
	public void setuserid(String id) {
		this.id = id;
	}
	public String getuserpw() {
		return pw;
	}
	public void setuserpw(String pw) {
		this.pw = pw;
	}
	public String getuseremail() {
		return email;
	}
	public void setuseremail(String email) {
		this.email = email;
	}
	public String getuserphone() {
		return phone;
	}
	public void setuserphone(String phone) {
		this.phone = phone;
	}
}
