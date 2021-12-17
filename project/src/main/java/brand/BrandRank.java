package brand;

public class BrandRank {
	private String brand_name="";
	private float review_star=0;
	private int review_count=0;
	
	
	
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public float getReview_star() {
		return review_star;
	}
	public void setReview_star(float review_star) {
		this.review_star = review_star;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	
}
