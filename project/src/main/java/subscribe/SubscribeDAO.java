package subscribe;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SubscribeDAO {

	private Connection con;
	private ResultSet rs;
	private Connection con1;
	private ResultSet rs1;
	
	public ArrayList<UserSubscribe> getSubscribe(String user_id){
		
		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			
			con1 = DriverManager.getConnection(dbURL,dbID,dbPwd);
			String sql1 ="SELECT user_subscribe,count(user_main)as subscribe_count\r\n"
					+ "from ` subscribe` \r\n"
					+ "where user_subscribe in (\r\n"
					+ "   select user_subscribe \r\n"
					+ "    FROM ` subscribe`\r\n"
					+ "   where user_main = ?)\r\n"
					+ "GROUP BY user_subscribe";
		         
			PreparedStatement pst1 = con1.prepareStatement(sql1);
			pst1.setString(1, user_id);
			rs1 = pst1.executeQuery();
			
	        ArrayList<UserSubscribe> Usersubscribe = new ArrayList<UserSubscribe>();
	        ArrayList<Integer> list = new ArrayList<Integer>();
	        while(rs1.next()) {
	        	list.add(rs1.getInt("subscribe_count"));
	        	System.out.println(rs1.getInt("subscribe_count"));
	        }
			rs1.close();
			String dbURL1 = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID1 = "swe4";
			String dbPwd1 = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			
			con = DriverManager.getConnection(dbURL1,dbID1,dbPwd1);
			String sql ="SELECT S.subscribe_id as subscribe_id, S.user_subscribe as subscribe_name,COUNT(R.review_star) as review_star,AVG(R.review_star) as review_avg "
					+"from  ` subscribe` AS S inner JOIN review AS R "
					+"where S.user_subscribe in ( "
					   +"select user_subscribe " 
					    +"FROM ` subscribe` "
					   +"where user_main = ?) "
					+"and R.user_id = S.user_subscribe "
					+"GROUP BY S.user_subscribe";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			int i = 0;
	        while(rs.next()){
				
				UserSubscribe UserSubscribe = new UserSubscribe();
				System.out.println(rs.getString("subscribe_id"));
				UserSubscribe.set_subscribe_id(rs.getString("subscribe_id"));
				UserSubscribe.setsubscribe_name(rs.getString("subscribe_name"));
				UserSubscribe.setsubscribe_star(rs.getInt("review_star"));
				UserSubscribe.set_user_review_average(rs.getFloat("review_avg"));
				UserSubscribe.setsubscribe_count(list.get(i));
				i++;
				Usersubscribe.add(UserSubscribe);
			}
			int idx=0;
			while(idx < Usersubscribe.size()) {
				System.out.println(idx+" 踰덉� 寃곌낵 : " + Usersubscribe.get(idx).getjsonFormat());
				idx ++;
			}
			rs.close();
			return Usersubscribe;
		} catch (Exception e) { e.printStackTrace(); return null; }	
	}
	public int DeletationSubscribe(String subscribe_id) {
		try{
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("delete FROM ` subscribe` where subscribe_id = ?");
			pst.setString(1, subscribe_id);
			rs = pst.executeQuery();
			rs.close();
			return 1;
		} catch (Exception e) { e.printStackTrace(); return 0; }	
	}
	
	public int get_user_subscribe_count(String user_id) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT COUNT(user_main) FROM ` subscribe` WHERE user_subscribe = ?");
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			rs.next();
			
			
			return Integer.parseInt(rs.getString(1));
			
			
		} catch (Exception e) { e.printStackTrace(); return -1; }
			
	}
	
	
	
}