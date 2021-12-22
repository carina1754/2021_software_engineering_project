<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*, java.text.*" %>
<%@ page import="review.*" %>
<%@ page import="brand.*" %>
<%@ page import="menu.*" %>
<%
ReviewDAO reviewDAO = new ReviewDAO();
ArrayList<Review> reviews = reviewDAO.getReviews();

BrandDAO brandDAO = new BrandDAO();
ArrayList<BrandRank> brandsRank = brandDAO.getBrandsRank();

MenuDAO menuDAO = new MenuDAO();

String rankedBrand_id_1 = brandsRank.get(0).getBrand_id();
String rankedBrand_id_2 = brandsRank.get(1).getBrand_id();
ArrayList<BrandMenu> brandMenu_1 = menuDAO.getBrandMenu(rankedBrand_id_1);
ArrayList<BrandMenu> brandMenu_2 = menuDAO.getBrandMenu(rankedBrand_id_2);

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
	<a href="mainpage_1"><h1>종합 버거 리뷰</h1></a>
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
	<!--브랜드 순위-->
            <div class="container">
                <h3 class="text-left">브랜드 순위</h3>
                <table class="table table-hover">
                    <thead>
                      <tr>
                        <th scope="col">No</th>
                        <th scope="col">Name</th>
                        <th scope="col">평점</th>
                        <th scope="col">리뷰 개수</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%for (int i=0; i<brandsRank.size()-1;i++) {%>
                      <tr>
                        <th scope="row" onclick="location.href='#'"><%=i+1%></th>
                        <td onclick="location.href='#'"><%=brandsRank.get(i).getBrand_name() %></td>
                        <td><%=String.format("%.2f",brandsRank.get(i).getReview_star())%></td>
                        <td><%=brandsRank.get(i).getReview_count()%></td>
                      </tr>
                     <%} %>
                    </tbody>
                  </table>
                <a href="#"><p class="text-right">전체 순위 보기</p></a>

            </div>
	<p style="height:50px"></p>

 <div class="container">
      <div class="span8">
         <h3 class="text-left"><%=brandMenu_1.get(0).getBrand_name()%></h3>
         <div class="well">
            <div id="myCarousel1" class="carousel slide">
               <ol class="carousel-indicators">
                  <li data-target="#myCarousel1" data-slide-to="0" class="activate"></li>
                  <li data-target="#myCarousel1" data-slide-to="1"></li>
               </ol>
              
              <!-- Carousel items -->
               <% if (brandMenu_1.size() != 0){
            	   if (brandMenu_1.size() <= 4){
            		   %>
            		   <div class="carousel-inner">
                       <div class="item active">
                          <div class="row-fluid">
                             <div class="row" align="center">
                             <%for(int i=0; i<brandMenu_1.size(); i++){
                                %>
                                <div class="col-md-3">
                                   <a class="thumbnail">
                                   <img src="./1.png">
                                   <div class="caption">
                                      <h4><%= brandMenu_1.get(i).getMenu_name() %></h4>
                                      <p><%= brandMenu_1.get(i).getReview_info() %></p>
                                   </div>
                                   </a>
                                </div>
                                <%            
                             }
                             %>
                             </div>
                          </div><!--/row-fluid-->
                       </div><!--/item-->
                       <%
                       }          	   
            	   	else if (brandMenu_1.size() > 4 && brandMenu_1.size() <= 8){
            	   	 %>
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
                                    <h4><%= brandMenu_1.get(i).getMenu_name() %></h4>
                                    <p><%= brandMenu_1.get(i).getReview_info() %></p>
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
                     <%for(int i=4; i<brandMenu_1.size(); i++){
                        %>
                        <div class="col-md-3">
                           <a class="thumbnail">
                           <img src="./1.png">
                           <div class="caption">
                              <h4><%= brandMenu_1.get(i).getMenu_name() %></h4>
                              <p><%= brandMenu_1.get(i).getReview_info() %></p>
                           </div>
                           </a>
                        </div>
                        <%            
                     }
            	   	}
            	   	else{
                     %>
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
                                    <h4><%= brandMenu_1.get(i).getMenu_name() %></h4>
                                    <p><%= brandMenu_1.get(i).getReview_info() %></p>
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
                     <%for(int i=4; i<8; i++){
                        %>
                        <div class="col-md-3">
                           <a class="thumbnail">
                           <img src="./1.png">
                           <div class="caption">
                              <h4><%= brandMenu_1.get(i).getMenu_name() %></h4>
                              <p><%= brandMenu_1.get(i).getReview_info() %></p>
                           </div>
                           </a>
                        </div>
                        <%            
                     }
            	   	}     
             	}
            	  %>
 

          </div><!--/myCarousel-->
       </div><!--/well-->
    </div>
   </div>
   </div>
 </div>


 <div class="container">
      <div class="span8">
         <h3 class="text-left"><%=brandMenu_2.get(0).getBrand_name()%></h3>
         <div class="well">
            <div id="myCarousel2" class="carousel slide">
               <ol class="carousel-indicators">
                  <li data-target="#myCarousel2" data-slide-to="0" class="activate"></li>
                  <li data-target="#myCarousel2" data-slide-to="1"></li>
               </ol>
              
              <!-- Carousel items -->
               <% if (brandMenu_2.size() != 0){
            	   if (brandMenu_2.size() <= 4){
            		   %>
            		   <div class="carousel-inner">
                       <div class="item active">
                          <div class="row-fluid">
                             <div class="row" align="center">
                             <%for(int i=0; i<brandMenu_2.size(); i++){
                                %>
                                <div class="col-md-3">
                                   <a class="thumbnail">
                                   <img src="./1.png">
                                   <div class="caption">
                                      <h4><%= brandMenu_2.get(i).getMenu_name() %></h4>
                                      <p><%= brandMenu_2.get(i).getReview_info() %></p>
                                   </div>
                                   </a>
                                </div>
                                <%            
                             }
                             %>
                             </div>
                          </div><!--/row-fluid-->
                       </div><!--/item-->
                       <%
                       }          	   
            	   	else if (brandMenu_2.size() > 4 && brandMenu_2.size() <= 8){
            	   	 %>
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
                                    <h4><%= brandMenu_2.get(i).getMenu_name() %></h4>
                                    <p><%= brandMenu_2.get(i).getReview_info() %></p>
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
                     <%for(int i=4; i<brandMenu_2.size(); i++){
                        %>
                        <div class="col-md-3">
                           <a class="thumbnail">
                           <img src="./1.png">
                           <div class="caption">
                              <h4><%= brandMenu_2.get(i).getMenu_name() %></h4>
                              <p><%= brandMenu_2.get(i).getReview_info() %></p>
                           </div>
                           </a>
                        </div>
                        <%            
                     }
            	   	}
            	   	else{
                     %>
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
                                    <h4><%= brandMenu_2.get(i).getMenu_name() %></h4>
                                    <p><%= brandMenu_2.get(i).getReview_info() %></p>
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
                     <%for(int i=4; i<8; i++){
                        %>
                        <div class="col-md-3">
                           <a class="thumbnail">
                           <img src="./1.png">
                           <div class="caption">
                              <h4><%= brandMenu_2.get(i).getMenu_name() %></h4>
                              <p><%= brandMenu_2.get(i).getReview_info() %></p>
                           </div>
                           </a>
                        </div>
                        <%            
                     }
            	   	}     
             	}
            	  %>
 

          </div><!--/myCarousel-->
       </div><!--/well-->
    </div>
   </div>
   </div>
 </div>


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
      for(int i = 0; i<reviews.size();i++){
         %>
         <tr>
            <td><%=reviews.get(i).get_user_id()%></td>
            <td><%=menuDAO.get_menu_name(Integer.parseInt(reviews.get(i).get_menu_id()))%></td>
            <td><%=reviews.get(i).get_review_info()%></td>
            <td><%=reviews.get(i).get_review_star()%></td>
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
