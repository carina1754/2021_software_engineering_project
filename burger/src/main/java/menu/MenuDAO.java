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

	
	
	public ArrayList<HotMenu> getHotMenu(){

		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			
			String sql ="select T.menu_id, T.menu_name, T.review_info, avg(T.review_star) as review_star, count(T.review_star) as review_count"
					+ " from (select B.brand_id, B.brand_name, M.menu_id, M.menu_name, R.review_star, R.review_info from menu M left join brand B on B.brand_id = M.brand_id left join review R on M.menu_id = R.menu_id order by brand_id) as T"
					+ " group by T.menu_name"
					+ " having review_star is not null"
					+ " order by review_count desc;";
			
			
			
			PreparedStatement pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			
	        ArrayList<HotMenu> hotMenu = new ArrayList<HotMenu>();

			while(rs.next()){
				
				HotMenu menuDAO = new HotMenu();
				
				menuDAO.setMenu_name(rs.getString("menu_name"));
				menuDAO.setMenu_id(rs.getString("menu_id"));
				menuDAO.setReview_info(rs.getString("review_info"));
				
	        	hotMenu.add(menuDAO);
				
			}
			rs.close();
			return hotMenu;
		} catch (Exception e) { e.printStackTrace(); return null; }	
	}
	
	public ArrayList<BrandMenu> getBrandMenu(String brand_id){

		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			
			String sql ="select T.brand_id, T.brand_name, T.menu_id, T.menu_name, T.review_info"
					+ " from (select B.brand_id, B.brand_name, M.menu_id, M.menu_name, R.review_star, R.review_info from menu M left join brand B on B.brand_id = M.brand_id left join review R on M.menu_id = R.menu_id WHERE R.review_info is not NULL order by brand_id ) as T"
					+ " where T.brand_id = ?";			
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, brand_id);
			
			rs = pst.executeQuery();
			
	        ArrayList<BrandMenu> BrandMenus = new ArrayList<BrandMenu>();

			while(rs.next()){
				
				BrandMenu brandMenuDAO = new BrandMenu();
				
				brandMenuDAO.setBrand_id(rs.getString("brand_id"));
				brandMenuDAO.setBrand_name(rs.getString("brand_name"));
				brandMenuDAO.setMenu_name(rs.getString("menu_name"));
				brandMenuDAO.setMenu_id(rs.getString("menu_id"));
				brandMenuDAO.setReview_info(rs.getString("review_info"));
				
				BrandMenus.add(brandMenuDAO);
				
			}
			rs.close();
			return BrandMenus;
		} catch (Exception e) { e.printStackTrace(); return null; }	
	}
	
	
	
}