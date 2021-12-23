package user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class UserDAO {
	
	private Connection con;
	private ResultSet rs;
	
	
	public int login(String id, String pw) {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT user_pw FROM user WHERE user_id = ?"); 
			pst.setString(1, id); 
			rs = pst.executeQuery();
			if (rs.next()) { 
				return rs.getString(1).equals(pw) ? 1 : 0; 
				} else {
					return -2; 
					} 
			} catch (Exception e) { e.printStackTrace(); return -1; }
	}
	
	public boolean ID_Check(String id) throws ClassNotFoundException {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE user_id = ?");
			pst.setString(1, id);
			System.out.println(id);
			rs = pst.executeQuery();
			if(rs.next()) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	
	public int join(User userDAO) throws ClassNotFoundException {
		
		if(ID_Check(userDAO.getuserid())) return 0;
		else {
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("INSERT INTO user(user_id,user_pw,user_email,user_phone,user_state) VALUES (?,?,?,?,?)"); 
			pst.setString(1, userDAO.getuserid()); 
			pst.setString(2, userDAO.getuserpw()); 
			pst.setString(3, userDAO.getuseremail());
			pst.setString(4, userDAO.getuserphone());
			pst.setString(5, userDAO.getuserstate());
			return pst.executeUpdate(); 
			} catch (Exception e) {
				e.printStackTrace(); 
		return -1; 
		}
	}}
	public String get_User_state(String id) {
		try { 
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT user_state FROM user WHERE user_id = ?"); 
			pst.setString(1, id);
			rs = pst.executeQuery();
			rs.next();
			return rs.getString(1);
		}
		catch (Exception e) { e.printStackTrace(); return "-1"; }
	}
	
	public User getUser(String id) {
		try { 
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT * FROM user where user_id = ?"); 
			pst.setString(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				User userDAO = new User();
				userDAO.setuserid(rs.getString(1));
				userDAO.setuserpw(rs.getString(2));
				userDAO.setuseremail(rs.getString(3));
				userDAO.setuserphone(rs.getString(4));
				userDAO.setInfo(rs.getString(6));
				return userDAO;
			}
			} catch (Exception e) {
				e.printStackTrace(); 
		}
		return null; 
	}
	
	public ArrayList<User> user_list() {
		
		try { 
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT * FROM user"); 
			
			rs = pst.executeQuery();
			
			ArrayList<User> u_list = new ArrayList<User>();
			while(rs.next()) {
				User user = new User();
				user.setuserid(rs.getString(1));
				user.setuserstate(rs.getString(7));
				u_list.add(user);
			}
			return u_list;
			
		} catch (Exception e) { e.printStackTrace(); return null; }
		
				
	}
	
	public int edit(User userDAO,String user_id) throws ClassNotFoundException {
		
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "swe4";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("update user set user_pw = ?,user_email = ?,user_phone = ? where user_id = ?"); 
			pst.setString(1, userDAO.getuserpw()); 
			pst.setString(2, userDAO.getuseremail());
			pst.setString(3, userDAO.getuserphone());
			pst.setString(4, user_id);
			return pst.executeUpdate(); 
			} catch (Exception e) {
				e.printStackTrace(); 
		return -1; 
		
			}
	}
	
}