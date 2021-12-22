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
			
			if (rs.getString(1) != null) {
				return Float.parseFloat(rs.getString(1));
			}
			
			
			return 0;
			
			
		} catch (Exception e) { e.printStackTrace(); return 0; }
			
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
	

	
	
}