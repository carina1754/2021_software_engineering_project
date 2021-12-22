package feeling;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class feelingDAO {
	
	private Connection con;
	private ResultSet rs;

	public int feeling_like(String user_id, String review_id) {
		
		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("INSERT INTO feeling(user_id,review_id,feeling_state) VALUES (?,?,1)");
			pst.setString(1, user_id);
			pst.setString(2, review_id);
			rs = pst.executeQuery();
			rs.close();
			return 1;
		} catch (Exception e) { e.printStackTrace(); return -1; }
		
	}
	
	
	
}
