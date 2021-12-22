package user;

public class User {
	private String id="";
	private String pw="";
	private String email="";
	private String phone="";
	private String address = "";
	private String info ="";
	private String state ="";
	
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
