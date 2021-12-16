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
	
	
}