<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*, java.text.*" %>
<%@ page import="review.*" %>
<%@ page import="subscribe.*" %>
<%
String user_id = request.getParameter("name");
String user_state = request.getParameter("state");
ReviewDAO reviewDAO = new ReviewDAO();
ArrayList<Review> reviews = reviewDAO.getUserReviews(user_id);

SubscribeDAO subscribeDAO = new SubscribeDAO();
ArrayList<UserSubscribe> subscribes = subscribeDAO.getSubscribe(user_id);

%>
<!DOCTYPE html>
<html>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>마이페이지</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
    <div id="wrapper">
		<div id="content-wrapper" class="d-flex flex-column">
		    <!-- Main Content -->
			<div id="content">
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<span style="font-size:32px;" >햄버거 리뷰 조회</span>
					<ul class="navbar-nav ml-auto">
						<li class="nav-item dropdown no-arrow">
							<a href="main.jsp">로그아웃</a>
						</li>
						<li class="nav-item dropdown no-arrow">
							<a href="mypage.jsp?name=<%=user_id%>">마이페이지</a>
						</li>
					</ul>					
				</nav>
                <div class="main">
	                <img src="img/undraw_profile.svg" align="left">
                    <span style="margin-top:20px;font-size:24px;" ><%=user_id%></span>
                    <br>
                    <br>
                    <br>
	               	<span style="margin-top:20px;font-size:18px;" >리뷰 개수 : <%=Integer.toString(reviewDAO.get_user_review_count(user_id)) %></span>
	               	<br>
	               	<span style="margin-top:20px;font-size:18px;" >평균 평점 : <%=Float.toString(reviewDAO.get_user_review_average(user_id)) %></span>
	             	<br>
	             	<span style="margin-top:20px;font-size:18px;" >구독자 : <%=Integer.toString(subscribeDAO.get_user_subscribe_count(user_id)) %>명</span>
	             	<br>
                	<button style="margin-top:25px;"> 개인정보 관리</button>
                </div>
                <button> 관리자 메뉴</button>
                <div class="tables">
                <table class="table">
				  <thead class="thead-light">
				    <tr>
				      <th >버거 메뉴</th>
				      <th >리뷰 내용</th>
				      <th >평점</th>
				      <th></th>
				    </tr>
				  </thead>
				  <tbody>
				    <%for (int i=0; i<reviews.size();i++) {
				    %>
                      <tr>
                        <td><%=reviews.get(i).get_menu_id() %></td>
                        <td><%=reviews.get(i).get_review_info() %></td>
                        <td><%=reviews.get(i).get_review_star() %></td>
                        <td><input type="button" value="삭제 하기" onclick="location.href='mypage_action.jsp?name=<%=reviews.get(i).get_review_id()%>&user=<%=user_id%>&state=<%=user_state%>'"></td>
                        </tr>
                     <%} %>
				  </tbody>
				</table>
				</div>
				<div class="tables">
                <table class="table">
				  <thead class="thead-light">
				    <tr>
				      <th>유저명</th>
				      <th>구독자 수</th>
				      <th>리뷰 개수</th>
				      <th>평균 평점</th>
				      <th></th>
				    </tr>
				  </thead>
				  <tbody>
  				    <%for (int i=0; i<subscribes.size();i++) {
				    %>
                      <tr>
                        <td><%=subscribes.get(i).getsubscribe_name() %></td>
                        <td><%=subscribes.get(i).getsubscribe_count() %></td>
                        <td><%=subscribes.get(i).getsubscribe_star() %></td>
                        <td><%=subscribes.get(i).getuser_review_average() %></td>
                        <td><input type="button" value="구독 취소" onclick="location.href='mypage_sub_action.jsp?name=<%=subscribes.get(i).get_subscribe_id()%>&user=<%=user_id%>&state=<%=user_state%>'"></td>
                        </tr>
                     <%} %>
				  </tbody>
			  </table>
                </div>
			</div>
			</div>
		</div>
</body>
</html>
<style>
li{
  margin-right:15px;
}
img{
  width: 200px;
  height: 200px;
}
.main{
	width:20%;
	height:250px;
	margin:auto;
}

body{
text-align: center;
}

.table{
width:80%;
margin:auto;
}

.tables{
 height:230.5px; 
 overflow:auto;
margin-top:50px;
}
</style>
