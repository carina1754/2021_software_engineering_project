package subscribe;

public class UserSubscribe {
	private String subscribe_id = "0";
	private String subscribe_name="";
	private int subscribe_count=0;
	private int subscribe_star=0;
	private float user_review_average=0;
	
	public String get_subscribe_id() {
		return subscribe_id;
	}
	public void set_subscribe_id(String subscribe_id) {
		this.subscribe_id =  subscribe_id;
	}
	public String getsubscribe_name() {
		return subscribe_name;
	}
	public void setsubscribe_name(String subscribe_name) {
		this.subscribe_name = subscribe_name;
	}
	public int getsubscribe_count() {
		return subscribe_count;
	}
	public void setsubscribe_count(int subscribe_count) {
		this.subscribe_count = subscribe_count;
	}
	public int getsubscribe_star() {
		return subscribe_star;
	}
	public void setsubscribe_star(int subscribe_star) {
		this.subscribe_star = subscribe_star;
	}
	public float getuser_review_average() {
		return user_review_average;
	}
	public void set_user_review_average(float user_review_average) {
		this.user_review_average = user_review_average;
	}
	public String getjsonFormat() {
		return "subscribe_name : "+subscribe_name+"\n"+
				"subscribe_id : "+subscribe_id+"\n"+
				"subscribe_count : "+subscribe_count+"\n"+
				"subscribe_star : "+subscribe_star+"\n"+
				"user_review_average : "+user_review_average;
	}
	
}
