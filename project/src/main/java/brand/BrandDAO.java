package brand;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import review.Review;

public class BrandDAO {
	
	private Connection con;
	private ResultSet rs;
	
	// -2: id 없음 / -1: 서버 오류 / 0: 비밀번호 틀림 / 1: 성공
	
	
	public ArrayList<BrandRank> getBrandsRank(){
	
		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			String sql ="select T.brand_name, avg(T.review_star) as review_star, count(*) as review_count"
					+ " from (select B.brand_id, B.brand_name, M.menu_id, M.menu_name, R.review_star from menu M left join brand B on B.brand_id = M.brand_id left join review R on M.menu_id = R.menu_id order by brand_id) as T"
					+ " group by T.brand_name"
					+ " order by review_star desc;";
			
			PreparedStatement pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			
	        ArrayList<BrandRank> BrandRanks = new ArrayList<BrandRank>();

			while(rs.next()){
				
				BrandRank BrandRankDAO = new BrandRank();
				
				BrandRankDAO.setBrand_name(rs.getString("brand_name"));
				BrandRankDAO.setReview_star(rs.getFloat("review_star"));
				BrandRankDAO.setReview_count(rs.getInt("review_count"));
				
				BrandRanks.add(BrandRankDAO);
				
			}
			rs.close();
			return BrandRanks;
		} catch (Exception e) { e.printStackTrace(); return null; }	
	}
	
	
	
	
	
	
	
	
}