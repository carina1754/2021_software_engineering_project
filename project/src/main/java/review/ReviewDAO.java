package review;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import user.User;

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
			
			
		} catch (Exception e) { e.printStackTrace(); return 0; }
			
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
			
			
		} catch (Exception e) { e.printStackTrace(); return 0; }
			
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
			if (Float.parseFloat(rs.getString(1)) == -1.0) {
				return 0;
			}
			else
				return Float.parseFloat(rs.getString(1));
			
			
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
//				System.out.println(idx+" 踰덉� 寃곌낵 : " + UserReviews.get(idx).getjsonFormat());
//				idx ++;
//			}
			return UserReviews;
		} catch (Exception e) { e.printStackTrace(); return null; }	
	}	
	
	
}