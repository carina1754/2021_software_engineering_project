package review;
import java.sql.Date;

public class Review {
	private String review_id="";
	private String menu_id="";
	private String user_id="";
	private Date review_date;
	private String review_star="";
	private String review_info="";
	private int review_like = 0;
	private int review_hate = 0;
	
	public String get_review_id() {
		return review_id;
	}
	
	public void set_review_id(String review_id) {
		this.review_id = review_id;
	}
	
	public String get_menu_id() {
		return menu_id;
	}
	
	public void set_menu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public String get_user_id() {
		return user_id;
	}

	public void set_user_id(String user_id) {
		this.user_id = user_id;
	}
	
	public Date get_review_date() {
		return review_date;
	}

	public void set_review_date(Date review_date) {
		this.review_date = review_date;
	}
	
	public String get_review_star() {
		return review_star;
	}

	public void set_review_star(String review_star) {
		this.review_star = review_star;
	}

	public int get_review_like() {
		return review_like;
	}

	public void set_review_like(int review_like) {
		this.review_like = review_like;
	}

	public int get_review_hate() {
		return review_hate;
	}

	public void set_review_hate(int review_hate) {
		this.review_hate = review_hate;
	}

	public String get_review_info() {
		return review_info;
	}

	public void set_review_info(String review_info) {
		this.review_info = review_info;
	}


	
	
	
}
