package feeling;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import review.Review;

public class FeelingDAO {
	
	private Connection con;
	private ResultSet rs;

	public int insertFeeling(Feeling feelingDAO) {
		
		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("INSERT INTO feeling(user_id,review_id,feeling_state) VALUES (?,?,?)");
			pst.setString(1, feelingDAO.getUser_id());
			pst.setString(2, feelingDAO.getReview_id());
			pst.setInt(3, feelingDAO.getFeeling_state());
			
			rs = pst.executeQuery();
			rs.close();
			return 1;
		} catch (Exception e) { e.printStackTrace(); return -1; }
		
	}
	
	public Feeling getFeeling(String user_id, String review_id){

		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			
			String sql ="select * from Feeling where user_id = ? and review_id = ?";
			
			PreparedStatement pst = con.prepareStatement(sql);
			
			pst.setString(1, user_id);
			pst.setString(2, review_id);
			
			rs = pst.executeQuery();
			Feeling feelDAO = new Feeling();
			
			while(rs.next()) {
				feelDAO.setFeeling_id(rs.getInt("feeling_id"));
	        	feelDAO.setUser_id(rs.getString("user_id"));
	        	feelDAO.setReview_id(rs.getString("review_id"));
	        	feelDAO.setFeeling_state(rs.getInt("feeling_state"));
	        	
			}
			rs.close();
			return feelDAO;
		} catch (Exception e) { e.printStackTrace(); return null; }	
	}
	
	
	public int updateFeeling(Feeling feelingDAO) {
		
		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			String sql = "update feeling set feeling_state = ? where user_id = ? and review_id = ?";
			
			PreparedStatement pst = con.prepareStatement(sql);
			
			
			pst.setInt(1, feelingDAO.getFeeling_state());
			pst.setString(2, feelingDAO.getUser_id());
			pst.setString(3, feelingDAO.getReview_id());
			
			
			rs = pst.executeQuery();
			rs.close();
			return 1;
		} catch (Exception e) { e.printStackTrace(); return -1; }
		
	}
	
	public int getHateCount(String user_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			String sql = "select count(*) from feeling where user_id = ? AND feeling_state='2'";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			rs.next();
			return Integer.parseInt(rs.getString(1));
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
			
	}
		
	public int getFeelingCount(String user_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			String sql = "select count(*) from feeling where user_id = ?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			rs.next();
			return Integer.parseInt(rs.getString(1));
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
			
	}
		
	
	
	
}
