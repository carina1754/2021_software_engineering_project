<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
String searchStr = request.getParameter("searchStr");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String jdbcDriver = "jdbc:mariadb://222.113.57.39:3306/hamburger_db";
String dbUser = "swe4";
String dbPass = "123123";
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
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Bootstrap</title>
	<!-- <link rel="stylesheet" href="css/bootstrap.css">  -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</head>

<body class="container">
	<a href="#"><h1>종합 버거 리뷰</h1></a>
	<p style="height:20px"></p>

	<!--로그인, 회원가입, 마이페이지 -->
	<div align="right">
		<button type="button" class="btn btn-secondary" id="login" onclick="location.href='login.jsp'">로그인</button>
		<button type="button" class="btn btn-secondary" id="regist" onclick="location.href='regist.jsp'">회원가입</button>
		<button type="button" class="btn" id="mypage" onclick="location.href='mypage.jsp'">마이페이지</button>
	</div>
	
	<p style="height:100px"></p>
	
	<div class="row" align="center">
		<div class="col-md-4">
			
				<img src="./1.png">
				
				<h5 class="text-left"><%=getRecentReviews.get(getRecentReviews.size()-1).menu_id %></h5>
				<p class="text-left"></p>
        </div>
    </div>

        
        <p style="height:100px"></p>

        <div class="container-fluid">
            
            <div class="container">
                <div style="float:left;"><h4>평점</h4></div>
                <div style="float:right;"><h4>작성일자:</h4></div>
                <textarea class="form-control col-sm-5" rows="5" style="border: none"><%=getRecentReviews.get(getRecentReviews.size()-1).review_info %></textarea>
            </div>
            
            <p style="height:50px"></p>
            
            <div class="row" align="center"></div>
                <div style="float:left;">
                    <img style="width: 250px;height:250px"src="./1.png">
                </div>
                <div style="float:left; margin-left:20px;">
                    <h4>ID</h4>
                    <h4>리뷰 개수 : </h4>
                    <h4>평균 평점 : </h4>
                    <h4>받은 북마크 : </h4>
                </div>
            </div>


            <p style="height:50px"></p>


            <!-- end to describe each pages -->
            <div class="container">

                <textarea class="form-control col-sm-5" rows="5" style="border: none">정보정보정보</textarea>
                
            </div>
            
            <p style="height:50px"></p>

            <div align="right">
                <button type="button" class="btn btn-default" id="like" onclick="location.href='login.jsp'">좋아요</button>
                <button type="button" class="btn btn-default" id="hate" onclick="location.href='regist.jsp'">싫어요</button>
            </div>
            <p style="height:5px"></p>
            <div align="right">
                <button type="button" class="btn btn-primary" id="ad_del" onclick="location.href='login.jsp'">삭제하기</button>
                <button type="button" class="btn btn-secondary" id="user_del" onclick="location.href='regist.jsp'">삭제하기</button>
            </div>

            <p style="height:100px"></p>
            
            <div class="container">
                <a href="#"><h3>About</h3></a>
                <textarea class="form-control col-sm-5" rows="5" style="border: none">About 4조</textarea>
                
            </div>
            


            <p style="height:50px"></p>

        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="js/bootstrap.js"></script>
        
    </body>
</html>
