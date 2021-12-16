<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Bootstrap</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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

        <div align="right">
            <button type="button" class="btn btn-secondary" id="login" onclick="location.href='login.jsp'">로그인</button>
            <button type="button" class="btn btn-secondary" id="regist" onclick="location.href='regist.jsp'">회원가입</button>
            <button type="button" class="btn" id="mypage" onclick="location.href='mypage.jsp'">마이페이지</button>
        </div>

        <p style="height:100px"></p>

        <div class="row" align="center">
            <div class="col-md-4">
                <h3 class="text-left">불고기 버거</h3>
                <a href="/tmp1.jsp" class="thumbnail">
                <img src="./1.png">
              </a>
              <p class="text-left">불고기 버거 설명</p>
            </div>
        </div>
        
        <p style="height:100px"></p>

        <div class="container-fluid">
            
            <div class="container">
                <div style="float:left;"><h4>평점</h4></div>
                <div style="float:right;"><h4>작성일자:</h4></div>
                <textarea class="form-control col-sm-5" rows="5" style="border: none">리뷰리뷰</textarea>
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