<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.text.*" %>
<%@ page import="brand.*" %>

<%
	BrandDAO brand_dao = new BrandDAO();
	ArrayList<BrandRank> brandsRank = brand_dao.getBrandsRank();

%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Brand_Manage</title>
        
        <!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
		
		<!-- Optional theme -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
		
		<!-- Latest compiled and minified JavaScript -->
		<script type="text/javascript" src="/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
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
            
            <span style="font-size:3em">
            	브랜드 순위
            </span>
            
            <div align="right">
            	<button type="button" class="btn btn-primary btn-lg" id="save" onclick="">저장</button>
            </div>
            
            <table class="table table-hover">
  				<thead>
    				<tr>
      					<th scope="col">No.</th>
	      				<th scope="col">Brand Name</th>      					
      					<th scope="col">Rate</th>
      					<th scope="col">리뷰 개수</th>
      					<th scope="col"></th>
    				</tr>
  				</thead>
  				<tbody>
  					
  					<%
  						int i = 0;
  						for (i = 1; i <= brandsRank.size(); i++){
  							
  							%>
  								<tr class="table-active">
      								<th scope="row"><% out.print(i); %></th>
			      					<td>
					     				<input type="text" class="form-control" placeholder="Brand Name" aria-describedby="basic-addon1" value=<% out.print(brandsRank.get(i-1).getBrand_name()); %>>
			      					</td>      					
			      					<td><% out.print(String.format("%.2f", brandsRank.get(i-1).getReview_star())); %></td>
			      					<td><% out.print(brandsRank.get(i-1).getReview_count()); %></td>
			      					<td>
			      						<button type="button" class="btn btn-secondary" onclick="location.href='brand_delete_action.jsp?brand_name=<%out.print(brandsRank.get(i-1).getBrand_name());%>'">삭제</button>
			      					</td>
			    				</tr>  							
  							<% 							
  						}
  					
  					%>
  				
					<form action="brand_add_action.jsp?brand_id=<%= i %>" method="post">
	    				<tr class="table-active">
	      					<th scope="row"><% out.print(i); %></th>
	      					<td>
			     				<input type="text" class="form-control" placeholder="Brand Name" aria-describedby="basic-addon1" name="brand_name">
	      					</td>      					
	      					<td></td>
	      					<td></td>
	      					<td>
	      						<input type="submit" class="btn btn-secondary" value="추가"/>
	      					</td>
	    				</tr>
    				</form>
    				
  				</tbody>
			</table>
            
      
            
            
            <!-- end to describe each pages -->

            

            
            <div class="container">
                <a href="#"><h3>About</h3></a>
                <textarea class="form-control col-sm-5" rows="5">About 4조</textarea>
                
            </div>

            <p style="height:50px"></p>

        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/docsearch.js@2/dist/cdn/docsearch.min.js"></script>
    </body>
</html>