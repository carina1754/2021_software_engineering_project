package user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	
	private Connection con;
	private ResultSet rs;
	
	// -2: id 없음 / -1: 서버 오류 / 0: 비밀번호 틀림 / 1: 성공
	public int login(String id, String pw) {
		try { 
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
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
			String dbID = "root";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			System.out.println("asdasd");
			PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE user_id = ?");
			pst.setString(1, id);
			System.out.println(id);
			rs = pst.executeQuery();
			if(rs.next()) {
				return false;
			}else {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	// -1 : 서버 오류 / 0: 이미 존재 하는 id / 1: 성공
	public int join(User userDAO) throws ClassNotFoundException {
		
		if(!ID_Check(userDAO.getuserid())) return 0;
		try {
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("INSERT INTO user(user_id,user_pw,user_email,user_phone) VALUES (?,?,?,?)"); 
			pst.setString(1, userDAO.getuserid()); 
			pst.setString(2, userDAO.getuserpw()); 
			pst.setString(3, userDAO.getuseremail());
			pst.setString(4, userDAO.getuserphone());
			return pst.executeUpdate(); 
			} catch (Exception e) {
				e.printStackTrace(); 
		return -1; 
		}
	}
	
	public User getUser(String id) {
		try { 
			String dbURL = "jdbc:mysql://222.113.57.39:3306/hamburger_db?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPwd = "123123";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbID,dbPwd);
			PreparedStatement pst = con.prepareStatement("SELECT * FROM user user_id = ?"); 
			pst.setString(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				User userDAO = new User();
				userDAO.setuserid(rs.getString(1));
				userDAO.setuserpw(rs.getString(2));
				userDAO.setuseremail(rs.getString(3));
				userDAO.setuserphone(rs.getString(4));
				return userDAO;
			}
			} catch (Exception e) {
				e.printStackTrace(); 
		}
		return null; 
	}
	
}