package menu;

public class BrandMenu {

	private String brand_id = "";
	private String brand_name = "";
	private String menu_id="";
	private String menu_name="";
	private String review_info="";
	
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	public String getReview_info() {
		return review_info;
	}
	public void setReview_info(String review_info) {
		this.review_info = review_info;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(String brand_id) {
		this.brand_id = brand_id;
	}
	
}
