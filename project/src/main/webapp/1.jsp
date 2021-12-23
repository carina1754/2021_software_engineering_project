<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*, java.text.*" %>

<%!

public class getRecentReview{
	
	public String review_id;
	public String menu_id;
	public String user_id;
	public String review_date;
	public String review_star;
	public String review_info;
	public int review_like = 0;
	public int review_hate = 0;
	
	public getRecentReview(String review_id, String menu_id, String user_id, String review_date, String review_star, String review_info, int review_like, int review_hate)
	{
		this.review_id = review_id;
		this.menu_id = menu_id;
		this.user_id = user_id;
		this.review_date = review_date;
		this.review_star = review_star;
		this.review_info = review_info;
		this.review_like = review_like;
		this.review_hate = review_hate;
	}
}
%>
<%

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String jdbcDriver = "jdbc:mariadb://localhost:3306/hamburger_db";
String dbUser = "root";
String dbPass = "root";
ArrayList<getRecentReview> getRecentReviews = new ArrayList<getRecentReview>();

try{
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	String sql = "select * from Review";
	
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while(rs.next()){
		getRecentReviews.add(new getRecentReview(rs.getString("review_id"),rs.getString("menu_id"),rs.getString("user_id"),rs.getString("review_date"),rs.getString("review_star"),rs.getString("review_info"),rs.getInt("review_like"),rs.getInt("review_hate")));
	}
	
	for(int i = 0; i<getRecentReviews.size();i++){
		out.println(getRecentReviews.get(i).review_id);
		out.println(getRecentReviews.get(i).menu_id);
		out.println(getRecentReviews.get(i).user_id);
		out.println(getRecentReviews.get(getRecentReviews.size()-1).review_id);
		out.println(getRecentReviews.size());
	}
	
}catch(Exception e) {
	e.printStackTrace();
}finally {
	try {
		conn.close();
		
	}catch (SQLException e) {
		e.printStackTrace();
	}
}
%>
<!DOCTYPE html>
<html>
<body>
	<form id="get_review" action="main1.jsp" method="post">
		<input name = "hot_menu" value = "<%=getRecentReviews.get(getRecentReviews.size()-1).menu_id%>">
		<input name = "hot_re_info" value = "<%=getRecentReviews.get(getRecentReviews.size()-1).review_info%>">
		<input name = "size" value = "<%=getRecentReviews.size()%>">
		
		<% for(int i = 0; i<getRecentReviews.size();i++){
			%>
			<input name ="rec_user_id"+"<%=i%>" value = "<%=getRecentReviews.get(i).user_id%>">
			<input name ="rec_menu_id"+"<%=i%>" value = "<%=getRecentReviews.get(i).menu_id%>">
			<input name ="rec_review_info"+"<%=i%>" value = "<%=getRecentReviews.get(i).review_info%>">
			<input name ="rec_review_star"+"<%=i%>" value = "<%=getRecentReviews.get(i).review_star%>">
		<%
		}	
		%>

		
	</form>
	<script type="text/javascript"> 
		this.document.getElementById("get_review").submit(); 
	</script> 
</body>
</html>
