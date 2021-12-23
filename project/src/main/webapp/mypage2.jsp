<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*, java.text.*" %>
<%@ page import="review.*" %>
<%@ page import="subscribe.*" %>
<%@ page import="user.*" %>
<%
String user_id = request.getParameter("name");
String user_state = request.getParameter("state");
ReviewDAO reviewDAO = new ReviewDAO();
ArrayList<Review> reviews = reviewDAO.getUserReviews(user_id);

UserDAO userDAO = new UserDAO();
User user = userDAO.getUser(user_id);
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
               <a href="mainpage_1.jsp?user=<%=user_id%>&state=<%=user_state%>" >
               <span style="font-size:32px;" class="sidebar-brand-text mx-3" >종합 버거 리뷰</span>
               </a>
               <ul class="navbar-nav ml-auto">
                  <li class="nav-item dropdown no-arrow">
                     <a style="width: 100px;height: 40px;" href="mainpage_1.jsp" class="btn btn-primary btn-icon-split">
                     <span class="text">로그아웃</span>
                     </a>
                  </li>
                  <li class="nav-item dropdown no-arrow">
                     <a style="width: 120px;height: 40px;" href="mypage.jsp?name=<%=user_id%>&state=<%=user_state%>" class="btn btn-primary btn-icon-split">
                     <span class="text">마이페이지</span>
                     </a>
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
                </div>
                <form method="post" action="./mypage_action3.jsp?name=<%=user_id%>&state=<%=user_state%>">
                <textarea rows="2" name="text" ><%=user.getInfo() %></textarea>
                 <br>
                <button style="width: 100px;height: 40px;" type="submit" class="btn btn-info btn-icon-split" > 
                   <span class="text">수정하기
                 </span>
                   </button>
                   </form>
            <form method="post" action="./mypage_action2.jsp?name=<%=user_id%>&state=<%=user_state%>">
            <div class="login_id"style="margin-top:20px;font-size:18px;">
                <h4>ID</h4>
                <span><%=user.getuserid()%></span>
            </div>
            <div class="login_pw"style="margin-top:20px;font-size:18px;">
                <h4>비밀번호</h4>
                <input type="password" name="pw" placeholder="********">
            </div>
            <div class="login_id"style="margin-top:20px;font-size:18px;">
                <h4>비밀번호 확인</h4>
                <input type="password" name="pw2" placeholder="********">
            </div>
            <div class="login_pw"style="margin-top:20px;font-size:18px;">
                <h4>E-Mail</h4>
                <input type="email" name="email" placeholder="<%=user.getuseremail()%>">
            </div>
            <div class="login_pw"style="margin-top:20px;font-size:18px;">
                <h4>전화번호</h4>
                <input type="text" name="phone" placeholder="<%=user.getuserphone()%>">
            </div>
            <div class="submit" style="margin-top:20px;font-size:18px;">
                <input type="submit" value="변경하기">
            </div>
            </form>
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