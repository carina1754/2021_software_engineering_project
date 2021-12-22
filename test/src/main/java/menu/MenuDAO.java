package menu;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MenuDAO {
	
	private Connection con;
	private ResultSet rs;
	
	public int get_menu_count() {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT COUNT(menu_id) FROM menu");
			rs = pst.executeQuery();
			rs.next();
			
			int num_menu =Integer.parseInt(rs.getString(1)); 
			rs.close();
			
			return num_menu;
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }	
	}
	
	
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
			int brand_id =Integer.parseInt(rs.getString(1));
			rs.close();
			
			return brand_id;
			
			
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
			String menu_name = rs.getString(1);
			rs.close();
			
			return menu_name;
			
			
		} catch (Exception e) { e.printStackTrace(); return ""; }
	}
	
	public int get_menu_id(String menu_name) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT menu_id FROM menu WHERE menu_name = ?");
			pst.setString(1, menu_name);
			rs = pst.executeQuery();
			rs.next();
			int menu_id = Integer.parseInt(rs.getString(1));
			rs.close();
			
			return menu_id;
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
	}
	
	public int delete_menu(int menu_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			
			PreparedStatement pst = con.prepareStatement("DELETE FROM menu WHERE menu_id= ?");
			pst.setString(1, Integer.toString(menu_id));
			pst.executeUpdate();
			
			pst = con.prepareStatement("DELETE FROM review WHERE menu_id = ?");
			pst.setString(1, Integer.toString(menu_id));
			pst.executeUpdate();
			pst.close();

			return 1;
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
		
	}
	
	public ArrayList<Integer> burger_rank() {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			
			PreparedStatement pst = con.prepareStatement("SELECT T.menu_id, AVG(T.review_star) AS review_star_avg from "
					+ "(SELECT M.menu_id, R.review_star from menu M LEFT JOIN review R ON M.menu_id = R.menu_id) AS T "
					+ "GROUP BY T.menu_id ORDER BY review_star_avg DESC");
			rs = pst.executeQuery();
			
			
			ArrayList<Integer> ranking = new ArrayList<Integer>();
			while(rs.next()) {
				ranking.add(Integer.parseInt(rs.getString(1)));
			}

			rs.close();

			return ranking;
			
			
		} catch (Exception e) { e.printStackTrace(); return null; }		
		
	}
	
	// true : menu is already exist  // false : menu isn't exist
	public boolean check_menu(String menu_name, int brand_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			
			PreparedStatement pst = con.prepareStatement("SELECT EXISTS (SELECT * FROM menu WHERE brand_id = ? AND menu_name = ?);");
			pst.setString(2,  menu_name);
			pst.setString(1, Integer.toString(brand_id));
			rs = pst.executeQuery();
			rs.next();
			
			if (Integer.parseInt(rs.getString(1)) == 1) {
				return true;
			} else {
				return false;
			}
			
		} catch (Exception e) { e.printStackTrace(); return true; }
	}
	
	public int add_menu(int menu_id, String menu_name, int brand_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			
			if (this.check_menu(menu_name, brand_id)) return 2;
			
			PreparedStatement pst = con.prepareStatement("INSERT INTO menu(menu_id, menu_name, brand_id) VALUES (?, ?, ?)");
			pst.setString(1, Integer.toString(menu_id));
			pst.setString(2,  menu_name);
			pst.setString(3, Integer.toString(brand_id));
			pst.executeUpdate();

			return 1;
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }		
	}
	
	public ArrayList<String> get_brand_burgers_name(int brand_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT menu_name FROM menu WHERE brand_id = ?");
			pst.setString(1, Integer.toString(brand_id));
			
			rs = pst.executeQuery();
			
			ArrayList<String> menus = new ArrayList<String>();
			while(rs.next()) {
				menus.add(rs.getString(1));
			}
						
			rs.close();
			
			return menus;
			
			
		} catch (Exception e) { e.printStackTrace(); return null; }
	}
	
	
	
}