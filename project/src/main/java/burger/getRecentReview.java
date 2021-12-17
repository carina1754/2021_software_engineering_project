package burger;
import java.sql.*;
import java.util.*;


public class getRecentReview {
	public String review_id;
	public String menu_id;
	public String user_id;
	public String review_date;
	public String review_star;
	public String review_info;
	public int review_like = 0;
	public int review_hate = 0;

	public getRecentReview(String review_id, String menu_id, String user_id, String review_date, String review_star, String review_info, int review_like, int review_hate)
	{
		this.review_id = review_id;
		this.menu_id = menu_id;
		this.user_id = user_id;
		this.review_date = review_date;
		this.review_star = review_star;
		this.review_info = review_info;
		this.review_like = review_like;
		this.review_hate = review_hate;
	}
	
	
	public static void main(String[] args) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String jdbcDriver = "jdbc:mariadb://localhost:3306/hamburger_db";
		String dbUser = "root";
		String dbPass = "root";

		try{
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

			String sql = "select * from Review";
			ArrayList<getRecentReview> getRecentReviews = new ArrayList<getRecentReview>();

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				getRecentReviews.add(new getRecentReview(rs.getString("review_id"),rs.getString("menu_id"),rs.getString("user_id"),rs.getString("review_date"),rs.getString("review_star"),rs.getString("review_info"),rs.getInt("review_like"),rs.getInt("review_hate")));
			}

			for(int i = 0; i<getRecentReviews.size();i++){
				System.out.println(getRecentReviews.get(i).review_id);
				System.out.println(getRecentReviews.get(i).menu_id);
				System.out.println(getRecentReviews.get(i).user_id);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
}



