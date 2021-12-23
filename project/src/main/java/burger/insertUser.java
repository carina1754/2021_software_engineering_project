package burger;

import java.sql.*;


public class insertUser {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;

		try {
			String jdbcDriver = "jdbc:mariadb://222.113.57.39:3306/hamburger_db";
			String dbUser = "swe4";
			String dbPass = "123123";
			
			String insert_value = "insert into review (user_id,user_pw,user_phone,user_address,user_info,user_state) "
						+ "values('pwkih','123123','01032412232','seoul','nameanmeka','admin';";	
			
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
