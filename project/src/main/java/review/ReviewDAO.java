package review;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.*;
import java.text.*;
public class ReviewDAO {
	
	private Connection con;
	private ResultSet rs;
	
	
	// -1 : server error / else : menu count
	public int get_menu_count() {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT COUNT(DISTINCT menu_id) FROM review"); 
			rs = pst.executeQuery();
			rs.next();
			
			return Integer.parseInt(rs.getString(1));
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
		
	}
	
	public int get_review_count(int menu_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT COUNT(review_star) FROM review WHERE menu_id = ?");
			pst.setString(1, Integer.toString(menu_id));
			rs = pst.executeQuery();
			rs.next();
			
			
			return Integer.parseInt(rs.getString(1));
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
			
	}
	public int get_user_review_count(String user_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT COUNT(review_star) FROM review WHERE user_id = ?");
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			rs.next();
			
			
			return Integer.parseInt(rs.getString(1));
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
			
	}
	public float get_user_review_average(String user_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT AVG(review_star) FROM review WHERE user_id = ?");
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			rs.next();
			
			
			return Float.parseFloat(rs.getString(1));
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
			
	}
	public int get_total_review_count() {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT COUNT(review_id) FROM review");
			
			rs = pst.executeQuery();
			rs.next();
			
			
			return Integer.parseInt(rs.getString(1));
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
			
	}
	
	public float get_review_average(int menu_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT AVG(review_star) FROM review WHERE menu_id = ?");
			pst.setString(1, Integer.toString(menu_id));
			rs = pst.executeQuery();
			rs.next();
			
			if (rs.getString(1) == null)
				return 0;
			
			return Float.parseFloat(rs.getString(1));
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
			
	}

	public ArrayList<Review> getReviews(){

		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT * FROM review");
			rs = pst.executeQuery();
			
	        ArrayList<Review> Reviews = new ArrayList<Review>();

			while(rs.next()){
				
				Review reviewDAO = new Review();
				
	        	reviewDAO.set_review_id(rs.getString("review_id"));
	        	reviewDAO.set_menu_id(rs.getString("menu_id"));
	        	reviewDAO.set_user_id(rs.getString("user_id"));
	        	reviewDAO.set_review_date(rs.getDate("review_date"));
	        	reviewDAO.set_review_star(rs.getString("review_star"));
	        	reviewDAO.set_review_like(rs.getInt("review_like"));
	        	reviewDAO.set_review_hate(rs.getInt("review_hate"));
	        	reviewDAO.set_review_info(rs.getString("review_info"));
				
	        	Reviews.add(reviewDAO);
				
			}
			rs.close();
			return Reviews;
		} catch (Exception e) { e.printStackTrace(); return null; }	
	}
	
	public ArrayList<HotReview> getHotReviews(){

		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			
			String sql ="select T.menu_name, T.review_info "
					+ "from (select R.review_id, M.menu_id, M.menu_name, R.review_star, R.review_info, R.review_like from review R left outer join menu M on R.menu_id = M.menu_id) as T "
					+ "order by review_like desc;";
			
			PreparedStatement pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			
	        ArrayList<HotReview> hotReviews = new ArrayList<HotReview>();

			while(rs.next()){
				
				HotReview reviewDAO = new HotReview();
				
	        	reviewDAO.setMenu_name(rs.getString("menu_name"));
	        	reviewDAO.setReview_info(rs.getString("review_info"));
				
	        	hotReviews.add(reviewDAO);
				
			}
			rs.close();
			return hotReviews;
		} catch (Exception e) { e.printStackTrace(); return null; }	
	}
	
	public Review getReview(String review_id){

		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			
			String sql ="select * from review where review_id = ?";
			
			PreparedStatement pst = con.prepareStatement(sql);
			
			pst.setString(1,review_id);
			rs = pst.executeQuery();
			Review reviewDAO = new Review();
			while(rs.next()) {
	        	reviewDAO.set_review_id(rs.getString("review_id"));
	        	reviewDAO.set_menu_id(rs.getString("menu_id"));
	        	reviewDAO.set_user_id(rs.getString("user_id"));
	        	reviewDAO.set_review_date(rs.getDate("review_date"));
	        	reviewDAO.set_review_star(rs.getString("review_star"));
	        	reviewDAO.set_review_like(rs.getInt("review_like"));
	        	reviewDAO.set_review_hate(rs.getInt("review_hate"));
	        	reviewDAO.set_review_info(rs.getString("review_info"));
			}
			rs.close();
			return reviewDAO;
		} catch (Exception e) { e.printStackTrace(); return null; }	
	}
	
	
	public int DeletationReviews(String review_id) {
		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("delete FROM review where review_id = ?");
			pst.setString(1, review_id);
			rs = pst.executeQuery();
			rs.close();
			return 1;
		} catch (Exception e) { e.printStackTrace(); return 0; }	
	}
	public ArrayList<Review> getUserReviews(String id){

		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT R.review_id as review_id, M.menu_name as menu_name,R.review_star as review_star,R.review_info as review_info "
					+ "from  review AS R INNER JOIN menu AS M "
					+ "where R.user_id = ? "
					+ "and M.menu_id = R.menu_id");
			pst.setString(1, id);
			rs = pst.executeQuery();
			
	        ArrayList<Review> UserReviews = new ArrayList<Review>();

			while(rs.next()){
				Review reviewDAO = new Review();
				reviewDAO.set_review_id(rs.getString("review_id"));
	        	reviewDAO.set_menu_id(rs.getString("menu_name"));
	        	reviewDAO.set_review_star(rs.getString("review_star"));
	        	reviewDAO.set_review_info(rs.getString("review_info"));
				
	        	UserReviews.add(reviewDAO);
				
			}
			
			rs.close();
//			int idx=0;
//			while(idx < UserReviews.size()) {
//				System.out.println(idx+" ���� ��� : " + UserReviews.get(idx).getjsonFormat());
//				idx ++;
//			}
			return UserReviews;
		} catch (Exception e) { e.printStackTrace(); return null; }	
	}	
	
	public int review_like_inc(String review_id) {
		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("update review set review_like = review_like+ 1 where review_id = ?");
			pst.setString(1, review_id);
			rs = pst.executeQuery();
			rs.close();
			return 1;
		} catch (Exception e) { e.printStackTrace(); return -1; }	
		
	}
	
	public int review_like_dec(String review_id) {
		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("update review set review_like = review_like - 1 where review_id = ?");
			pst.setString(1, review_id);
			rs = pst.executeQuery();
			rs.close();
			return 1;
		} catch (Exception e) { e.printStackTrace(); return -1; }	
		
	}
	public int review_hate_inc(String review_id) {
		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("update review set review_hate = review_hate + 1 where review_id = ?");
			pst.setString(1, review_id);
			rs = pst.executeQuery();
			rs.close();
			return 1;
		} catch (Exception e) { e.printStackTrace(); return -1; }	
		
	}
	
	public int review_hate_dec(String review_id) {
		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("update review set review_hate = review_hate - 1 where review_id = ?");
			pst.setString(1, review_id);
			rs = pst.executeQuery();
			rs.close();
			return 1;
		} catch (Exception e) { e.printStackTrace(); return -1; }	
		
	}
	
	
	public int del_review (String review_id) {
		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("delete from review where review_id = ?");
			pst.setString(1, review_id);
			rs = pst.executeQuery();
			rs.close();
			return 1;
		} catch (Exception e) { e.printStackTrace(); return -1; }	
		
	}
	public int get_review_index() {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			
			PreparedStatement pst = con.prepareStatement("select max(length(review_id)) from review");
			rs = pst.executeQuery();
			rs.next();
			String max_length = rs.getString(1);
			
			pst = con.prepareStatement("select max(review_id) from review where length(review_id) = ?");
			pst.setString(1, max_length);
			rs = pst.executeQuery();
			rs.next();
			
			
			//PreparedStatement pst = con.prepareStatement("SELECT MAX(review_id) from review where length(review_id) = (select max(length(review_id)) from review");
			
			//rs = pst.executeQuery();
			//rs.next();
			
			
			return Integer.parseInt(rs.getString(1)) + 1;
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
			
	}
	
	public int add_review(String user_id, int menu_id, float review_star, String review_info) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("INSERT INTO review(review_id, menu_id, user_id, review_date, review_star, review_info) VALUES (?, ?, ?, ?, ?, ?)");
			int review_id = this.get_review_index();
			
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
			String today = simpleDate.format(new java.util.Date());
			java.sql.Date s_date = java.sql.Date.valueOf(today); 
			
			String form_float = String.format("%.1f", review_star);
			
			pst.setString(1, Integer.toString(review_id));
			pst.setString(2, Integer.toString(menu_id));
			pst.setString(3, user_id);
			pst.setDate(4, s_date);
			pst.setString(5, form_float);
			pst.setString(6, review_info);
			
			pst.executeUpdate();
			
			return 1;

			
		} catch (Exception e) { e.printStackTrace(); return -1; }
		
		
	}	
	
	public int user_review_count(String user_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT count(*) FROM review WHERE user_id=?");
			
			pst.setString(1, user_id);
			
			rs = pst.executeQuery();
			rs.next();
			
			
			return Integer.parseInt(rs.getString(1));

			
		} catch (Exception e) { e.printStackTrace(); return -1; }
		
		
	}
	
	public float user_review_average(String user_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT avg(review_star) FROM review WHERE user_id=?");
			
			pst.setString(1, user_id);
			
			rs = pst.executeQuery();
			rs.next();
			
			
			return Float.parseFloat(rs.getString(1));

			
		} catch (Exception e) { e.printStackTrace(); return -1; }
		
		
	}
	
}