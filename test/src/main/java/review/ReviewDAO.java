package review;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			
			
		} catch (Exception e) { e.printStackTrace(); return 0; }
			
	}
	
	

	
	
}