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


        <nav class="navbar navbar-light bg-light" align="center">
            <form class="form-inline">
              <input class="form-control mr-sm-2 input-lg" style="width:93%" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success my-2 my-sm-0 input-lg" type="submit">Search</button>
            </form>
        </nav>

        <p style="height:50px"></p>

        <div class="container-fluid">
            
            <!--종합 순위 -->
            <div class="row" align="center">
                <div class="col-md-4">
                  <a href="/tmp1.jsp" class="thumbnail">
                    <img src="./1.png">
                    <div class="caption">
                        <h3>종합 순위</h3>
                    </div>
                  </a>
                </div>
    
                <div class="col-md-4">
                    <a href="/tmp2.jsp" class="thumbnail">
                      <img src="./1.png">
                      <div class="caption">
                          <h3>브랜드별 순위</h3>
                      </div>
                    </a>
                  </div>
    
                  <div class="col-md-4">
                    <a href="/tmp3.jsp" class="thumbnail">
                      <img src="./1.png">
                      <div class="caption">
                          <h3>리뷰 쓰기</h3>
                      </div>
                    </a>
                  </div>
            </div>
            
            
            <!-- here to describe each pages -->
            
            
            
            
            
            
            <!-- end to describe each pages -->

            

            
            <div class="container">
                <a href="#"><h3>About</h3></a>
                <textarea class="form-control col-sm-5" rows="5">About 4조</textarea>
                
            </div>

            <p style="height:50px"></p>

        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="js/bootstrap.js"></script>
    </body>
</html>