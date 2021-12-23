package burger;

import java.sql.*;


public class insertReview {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;

		try {
			String jdbcDriver = "jdbc:mariadb://localhost:3306/hamburger_db";
			String dbUser = "root";
			String dbPass = "root";
			
			String insert_value = "insert into review (review_id,menu_id,user_id,review_date,review_star,review_info,review_like,review_hate) "
						+ "values('A123','menu_id','user_id','2021-11-23','s5','goooood!!',1,0);";	
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			stmt.executeUpdate(insert_value);
		
						
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
