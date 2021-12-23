package user;

public class User {
	private String id="";
	private String pw="";
	private String email="";
	private String phone="";
	private String state="";
	private String info="";
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
	public String getuserstate() {
		return state;
	}
	public void setuserstate(String state) {
		this.state = state;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
}
