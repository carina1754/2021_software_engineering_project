<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*, java.text.*" %>
<%@ page import="review.*" %>
<%@ page import="brand.*" %>
<%@ page import="menu.*" %>
<%@ page import="user.*" %>
<%

String review_id = request.getParameter("review_id");

System.out.println(review_id);

ReviewDAO reviewDAO = new ReviewDAO();
Review review = reviewDAO.getReview(review_id);
MenuDAO menuDAO = new MenuDAO();
String menu_name = menuDAO.get_menu_name(Integer.parseInt(review.get_menu_id()));

String state = request.getParameter("state"); 
String uname = request.getParameter("name");
int like = 1;
int hate = 2;

ArrayList<Review> userReview = reviewDAO.getUserReviews(review.get_user_id());

double avg = 0.0;
for (int i = 0; i<userReview.size();i++){
	avg += Double.parseDouble(userReview.get(i).get_review_star());
}

avg = avg / userReview.size();

UserDAO userDAO = new UserDAO();
User user = userDAO.getUser(review.get_user_id());




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
	<%if(uname == null && state == null){ %>
	<a href="mainpage_1.jsp"><h1>종합 버거 리뷰</h1></a>
	<p style="height:20px"></p>
	<%} 
	else{%>
	<a href="mainpage_1.jsp?name=<%=uname%>&state=<%=state%>"><h1>종합 버거 리뷰</h1></a>
	<p style="height:20px"></p>
	<% }%>

	<!--로그인, 회원가입, 마이페이지 -->
	<%if(uname == null && state == null){ %>
	<div align="right">
		<button type="button" class="btn btn-secondary" id="login" onclick="location.href='Login.jsp'">로그인</button>
		<button type="button" class="btn btn-secondary" id="regist" onclick="location.href='Register.jsp'">회원가입</button>
		<button type="button" class="btn" id="mypage" onclick="location.href='#'">마이페이지</button>
	</div>
	<%}
	else{%>
	<div align="right">
		<button type="button" class="btn btn-secondary" id="login" onclick="location.href='mainpage_1.jsp'">로그아웃</button>
		<button type="button" class="btn" id="mypage" onclick="location.href='mypage.jsp?name=<%=uname%>&state=<%=state%>'">마이페이지</button>
	</div>
	<%}%>
	<p style="height:100px"></p>

	<!--검색창 -->
	<nav class="navbar navbar-light bg-light" align="center">
		<form method="post" action="review.jsp" class="form-inline">
			<input class="form-control mr-sm-2 input-lg" style="width:93%" type="search" placeholder="Search" aria-label="Search" name="searchStr" required="">
			<button class="btn btn-outline-success my-2 my-sm-0 input-lg" type="submit">Search</button>
		</form>
	</nav>
	
	<p style="height:100px"></p>
	
	<div class="row" align="center">
		<div class="col-md-4">
				<a class="thumbnail">
					<img style="height:240px;width:240px;" src="./img/<%=review.get_menu_id()%>.jfif">
					<h5 class="text-left"><%=menu_name%></h5>
					<p class="text-left"></p>
				</a>
        </div>
    </div>

        
        <p style="height:100px"></p>

        <div class="container-fluid">
            
            <div class="container">
                <div style="float:left;"><h4>평점:<%=review.get_review_star()%></h4></div>
                <div style="float:right;"><h4>작성일자: <%=review.get_review_date()%></h4></div>
                <textarea class="form-control col-sm-5" rows="5" style="border: none"><%=review.get_review_info()%></textarea>
            </div>
            
            <p style="height:50px"></p>
            
            <div class="row" align="center"></div>
                <div style="float:left;">
                    <img style="height:240px;width:240px;" src="./img/<%=review.get_menu_id()%>.jfif">
                </div>
                <div style="float:left; margin-left:20px;">
                    <h4><%=review.get_user_id()%></h4>
                    <h4>리뷰 개수 : <%=userReview.size()%> </h4>
                    <h4>평균 평점 : <%=avg%></h4>
                    <h4>받은 북마크 : </h4>
                </div>
            </div>


            <p style="height:50px"></p>


            <!-- end to describe each pages -->
            <div class="container">

                <textarea class="form-control col-sm-5" rows="5" style="border: none"><%=user.getInfo() %></textarea>
                
            </div>
            
            <p style="height:50px"></p>

			<%if( uname != null && uname.compareTo(review.get_user_id())!=0){ %>
            <div align="right">
                <button type="button" class="btn btn-default" id="like" onclick="location.href='feeling_action.jsp?review_id=<%=review_id%>&name=<%=uname%>&feeling_state=<%=like%>&state=<%=state%>'">좋아요</button>
                <button type="button" class="btn btn-default" id="hate" onclick="location.href='feeling_action.jsp?review_id=<%=review_id%>&name=<%=uname%>&feeling_state=<%=hate%>&state=<%=state%>'">싫어요</button>
            </div>
            <% }%>
            <p style="height:5px"></p>
            
            <%if(uname != null && uname.compareTo(review.get_user_id())==0){%>
            <div align="right">
                <button type="button" class="btn btn-secondary" id="user_del" onclick="location.href='review_del_act.jsp?review_id=<%=review_id%>&name=<%=uname%>&state=<%=state%>'">삭제하기</button>
            </div>
            <%}
            else if(state.compareTo("2")==0){%>
            <div align="right">
                <button type="button" class="btn btn-primary" id="ad_del" onclick="location.href='review_del_act.jsp?review_id=<%=review_id%>&name=<%=uname%>&state=<%=state%>'">삭제하기</button>
            </div>
            <%}%>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="js/bootstrap.js"></script>
        
    </body>
</html>
