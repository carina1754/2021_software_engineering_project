package menu;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MenuDAO {
	
	private Connection con;
	private ResultSet rs;
	
	
	public int get_menu_brand_id(int menu_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT brand_id FROM menu WHERE menu_id = ?");
			pst.setString(1, Integer.toString(menu_id));
			rs = pst.executeQuery();
			rs.next();
			
			return Integer.parseInt(rs.getString(1));
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
	}
	
	public String get_menu_name(int menu_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT menu_name FROM menu WHERE menu_id = ?");
			pst.setString(1, Integer.toString(menu_id));
			rs = pst.executeQuery();
			rs.next();
			
			return rs.getString(1);
			
			
		} catch (Exception e) { e.printStackTrace(); return ""; }
	}
	
	
	
}