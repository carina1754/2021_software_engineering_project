package feeling;

public class Feeling {

	private int feeling_id=0;
	private String user_id = "";
	private String review_id = "";
	private int feeling_state = 0;
	
	public int getFeeling_id() {
		return feeling_id;
	}
	public void setFeeling_id(int feeling_id) {
		this.feeling_id = feeling_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public int getFeeling_state() {
		return feeling_state;
	}
	public void setFeeling_state(int feeling_state) {
		this.feeling_state = feeling_state;
	}
	
	
}