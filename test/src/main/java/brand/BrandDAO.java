package brand;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BrandDAO {
	
	private Connection con;
	private ResultSet rs;
	
	public String get_brand_name(int brand_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT brand_name FROM brand WHERE brand_id = ?");
			pst.setString(1, Integer.toString(brand_id));
			rs = pst.executeQuery();
			rs.next();
			
			String brand_name = rs.getString(1);
			rs.close();
			
			return brand_name;
			
			
		} catch (Exception e) { e.printStackTrace(); return ""; }
	}
	
	public ArrayList<String> get_brands_name() {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT brand_name FROM brand");
			
			rs = pst.executeQuery();
			
			ArrayList<String> brands = new ArrayList<String>();
			while(rs.next()) {
				brands.add(rs.getString(1));
			}
						
			rs.close();
			
			return brands;
			
			
		} catch (Exception e) { e.printStackTrace(); return null; }
	}
	
	public int get_brand_count() {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT COUNT(DISTINCT brand_id) FROM brand");			
			rs = pst.executeQuery();
			rs.next();
			
			int brand_count =Integer.parseInt(rs.getString(1)); 
			
			rs.close();
			
			return brand_count; 
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
	}
	
	public int get_brand_id(String brand_name) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT brand_id FROM brand WHERE brand_name = ?");
			pst.setString(1, brand_name);
			rs = pst.executeQuery();
			rs.next();
			
			int brand_id =Integer.parseInt(rs.getString(1)); 
			
			rs.close();
			
			return brand_id; 
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
	}
	
	
	public ArrayList<BrandRank> getBrandsRank(){
		
		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			String sql ="select T.brand_id, T.brand_name, avg(T.review_star) as review_star, count(T.review_star) as review_count"
					+ " from (select B.brand_id, B.brand_name, M.menu_id, M.menu_name, R.review_star from brand B left join menu M on B.brand_id = M.brand_id left join review R on M.menu_id = R.menu_id order by brand_id) as T"
					+ " group by T.brand_name"
					//+ " having review_star is not null"
					+ " order by review_star desc;";
			
			PreparedStatement pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			
	        ArrayList<BrandRank> BrandRanks = new ArrayList<BrandRank>();

			while(rs.next()){
				
				BrandRank BrandRankDAO = new BrandRank();
				
				BrandRankDAO.setBrand_id(rs.getString("brand_id"));
				BrandRankDAO.setBrand_name(rs.getString("brand_name"));
				BrandRankDAO.setReview_star(rs.getFloat("review_star"));
				BrandRankDAO.setReview_count(rs.getInt("review_count"));
				
				BrandRanks.add(BrandRankDAO);
				
			}
			rs.close();
			return BrandRanks;
		} catch (Exception e) { e.printStackTrace(); return null; }	
	}
	
	public int delete_brand(String brand_name) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			
//			PreparedStatement pst = con.prepareStatement("DELETE FROM review WHERE brand_name = ?");
//			pst.setString(1, brand_name);
//			pst.executeUpdate();
//			
//			pst = con.prepareStatement("DELETE FROM brand WHERE brand_name = ?");
//			pst.setString(1, brand_name);
//			pst.executeUpdate();
			
			PreparedStatement pst = con.prepareStatement("DELETE FROM brand WHERE brand_name= ?");
			pst.setString(1, brand_name);
			pst.executeUpdate();
						
			pst.close();

			return 1;
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
		
	}
	
	public boolean check_brand(String brand_name) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			
			PreparedStatement pst = con.prepareStatement("SELECT EXISTS (SELECT * FROM brand WHERE brand_name = ?);");
			pst.setString(1, brand_name);
			rs = pst.executeQuery();
			rs.next();
			
			if (Integer.parseInt(rs.getString(1)) == 1) {
				return true;
			} else {
				return false;
			}
			
		} catch (Exception e) { e.printStackTrace(); return true; }
	}
	
	public int add_brand(String brand_name, int brand_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			
			if (this.check_brand(brand_name)) return 2;
			
			PreparedStatement pst = con.prepareStatement("INSERT INTO brand(brand_id, brand_name) VALUES (?, ?)");
			pst.setString(1, Integer.toString(brand_id));
			pst.setString(2,  brand_name);			
			pst.executeUpdate();

			return 1;
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }		
	}
	
	
}