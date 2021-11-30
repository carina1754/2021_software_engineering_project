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

	<!--검색창 -->
	<nav class="navbar navbar-light bg-light" align="center">
		<form method="post" action="review.jsp" class="form-inline">
			<input class="form-control mr-sm-2 input-lg" style="width:93%" type="search" placeholder="Search" aria-label="Search" name="searchStr" required="">
			<button class="btn btn-outline-success my-2 my-sm-0 input-lg" type="submit">Search</button>
		</form>
	</nav>
	
	
	<p style="height:50px"></p>

	<!--종합 순위, 브랜드별 순위, 리뷰 쓰기 -->
	<div class="container-fluid">
	
		<div class="row" align="center">
			<div class="col-md-4">
				<div class="caption">
					<a href="#"><h3>종합 순위</h3></a>
				</div>
			</div>
    
			<div class="col-md-4">
				<div class="caption">
					<a href="#"><h3>브랜드별 순위</h3></a>
				</div>
			</div>
    
			<div class="col-md-4">
				<div class="caption">
					<a href="#"><h3>리뷰 쓰기</h3></a>
				</div>
			</div>
		</div>
	</div>	
  
	<p style="height:50px"></p>


	<!--화제의 버거-->
	<div class = "row"  align="center">
		<div class="col-xs-5 col-md-7" style="float: none; margin: 0 auto;">
			<h3 class ="text-left">화제의 버거</h3>
			<a class="thumbnail">
			<img src="./1.png">
				<div class="caption">
					<h5 class="text-left"><%=getRecentReviews.get(getRecentReviews.size()-1).menu_id %></h5>
					<p class="text-left"><%=getRecentReviews.get(getRecentReviews.size()-1).review_info %></p>
				</div>
			</a>
		</div>
	</div>

	
	<!--인기 리뷰 -->
	<div class="container">
		<div class="span8">
			<h3 class="text-left">인기 리뷰</h3>
			<div class="well">
				<div id="myCarousel1" class="carousel slide">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel1" data-slide-to="1"></li>
						<li data-target="#myCarousel1" data-slide-to="2"></li>
					</ol>
              
              <!-- Carousel items -->
              	<div class="carousel-inner">
					<div class="item active">
						<div class="row-fluid">
							<div class="row" align="center">
							<%for(int i=0; i<4; i++){
								%>
								<div class="col-md-3">
									<a class="thumbnail">
									<img src="./1.png">
									<div class="caption">
										<h4><%= getRecentReviews.get(0).menu_id %></h4>
										<p><%= getRecentReviews.get(0).review_info %></p>
									</div>
									</a>
								</div>
								<%				
							}
							%>
							</div>
						</div><!--/row-fluid-->
					</div><!--/item-->
					
					
					<div class="item">
						<div class="row-fluid">
							<div class="row" align="center">
							<%for(int i=0; i<4; i++){
								%>
								<div class="col-md-3">
									<a class="thumbnail">
									<img src="./1.png">
									<div class="caption">
										<h4><%= getRecentReviews.get(1).menu_id %></h4>
										<p><%= getRecentReviews.get(1).review_info %></p>
									</div>
									</a>
								</div>
								<%				
							}
							%>
							</div>
						</div><!--/row-fluid-->
 					</div><!--/item-->
 					<div class="item">
						<div class="row-fluid">
							<div class="row" align="center">
							<%for(int i=0; i<4; i++){
								%>
								<div class="col-md-3">
									<a class="thumbnail">
									<img src="./1.png">
									<div class="caption">
										<h4><%= getRecentReviews.get(2).menu_id %></h4>
										<p><%= getRecentReviews.get(2).review_info %></p>
									</div>
									</a>
								</div>
								<%				
							}
							%>
							</div>
						</div><!--/row-fluid-->
 					</div><!--/item-->
 				</div><!--/carousel-inner-->
 
 				<a class="left carousel-control" href="#myCarousel1" data-slide="prev">‹</a>
 				<a class="right carousel-control" href="#myCarousel1" data-slide="next">›</a>
 			</div><!--/myCarousel-->
 		</div><!--/well-->
 	</div>
	</div>
 
	<p style="height:50px"></p>



	<!--최근 리뷰 -->
	<h3 class ="text-left">최근 리뷰</h3>
	<table class= 'table'>
	
		<thread>
		<tr>
			<th>작성자</th>
			<th>메뉴</th>
			<th>리뷰 내용</th>
			<th>평점</th>
		</tr>
		</thread>
		<tbody>
		<%
		for(int i = 0; i<getRecentReviews.size();i++){
			%>
			<tr>
				<td><%=getRecentReviews.get(i).user_id%></td>
				<td><%=getRecentReviews.get(i).menu_id%></td>
				<td><%=getRecentReviews.get(i).review_info%></td>
				<td><%=getRecentReviews.get(i).review_star%></td>
			</tr>
			<%	
		}
		%>
		</tbody>
	</table>

	<p style="height:50px"></p>


            
	<div class="container">
		<a href="#"><h3>About</h3></a>
		<textarea class="form-control col-sm-5" rows="5">About 4조</textarea>
	</div>

	<p style="height:50px"></p>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
