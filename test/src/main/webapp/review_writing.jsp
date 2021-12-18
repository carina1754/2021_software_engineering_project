<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>

<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy/MM/dd");
	String strdate = simpleDate.format(date);


%>


<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>review_writing</title>
        <link href=".ratingBar.css">
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
                <div style="float:left;">
                	<h4>평점:</h4>
                	                        
						<script>
						    document.addEventListener("DOMContentLoaded", function() {//slider의 실시간 데이터를 가져와서 숫자를 표시해주는 함수
						        document.getElementById('range').onchange = function () {
						            document.getElementById('rangeValue').innerText = this.value/20 +" 점"
						        }
						    });
						</script>
				      <div class="form-group">					      
					      <p id='rangeValue'>2.5 점</p>
					      <input type="range" id="range" class="custom-range">
				      </div>
 
                </div>
                
                <div style="float:right;"><h4>작성일자: <% out.print(strdate); %></h4></div>
                <div style="float:right;"><h4>           </h4></div>
                <div style="float:right;"><h4>작성자:	<% out.print("           "); %>		</h4></div>
                
                <textarea data-min-height="150" class="form-control col-sm-5" rows="5" style="border: none">리뷰를 작성해주세요</textarea>                
            </div>
            
            <p style="height:50px"></p>

            <div align="right">                
                <button type="button" class="btn btn-default" id="cancel" onclick='history.back(); return false;'>취소</button>
                <button type="button" class="btn btn-default" id="complete" onclick="location.href='login.jsp'">완료</button>
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