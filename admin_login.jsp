<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="review.*" %>
<%@ page import="menu.*" %>
<%@ page import="brand.*" %>
<%@ page import="user.*" %>
<%@ page import="feeling.*" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import ="menu.*" %>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import = "java.sql.SQLException" %>
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
            <button type="button" class="btn" id="login" onclick="location.href='login.jsp'">로그아웃</button>
                <button type="button" class="btn btn-secondary" id="mypage" onclick="location.href='mypage.jsp'">마이페이지</button>
               
</div>
                 <div align="left">
            <button type="button" class="btn btn-info" id="menu_admin" onclick="location.href='menu_admin.jsp'">메뉴 관리</button>
                <button type="button" class="btn btn-info" id="user_admin" onclick="location.href='user_admin.jsp'">유저 관리</button>
                    <button type="button" class="btn btn-info" id="shop_admin" onclick="location.href='shop_admin.jsp'">업체 관리</button>
                    
                  
        </div>
       
        <div class="container">
                <h3 class="text" style = "font-size:15px">유저 목록</h3>
                
                 <%
            	ReviewDAO rv = new ReviewDAO();
            	BrandDAO br = new BrandDAO();
				MenuDAO mn = new MenuDAO();
				UserDAO us = new UserDAO();
				FeelingDAO fl = new FeelingDAO();
            	int num_menu = mn.get_menu_count();
             %>
                <table class="table table-hover">
                    <thead>
                      <tr>
                        <th scope="col">No.</th>
                        <th scope="col">유저 이름</th>
                        <th scope="col">작성 날짜</th>
                        <th scope="col">리뷰 개수</th>
                        <th scope="col">리뷰 평균 평점</th>
                        <th scope="col">싫어요 개수</th>
                        <th scope="col">싫어요/좋아요 %</th>
                        <th scope="col">이용/정지</th>
                        <th scope="col">기타</th>
                        
                      </tr>
                    </thead>
                    
                    
                      <tr>
                        <%
      // 1. JDBC 드라이버 로딩
      Class.forName("org.mariadb.jdbc.Driver");
  
      Connection conn = null; // DBMS와 Java연결객체
      Statement stmt = null; // SQL구문을 실행
      ResultSet rs = null; // SQL구문의 실행결과를 저장
  
      try
      {
            String jdbcDriver = "jdbc:mysql://222.113.57.39:3306/hamburger_db";
            String dbUser = "swe4";
            String dbPass = "123123";
   
            String query = "select * from review";
            
   
            // 2. 데이터베이스 커넥션 생성
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
   
            // 3. Statement 생성
            stmt = conn.createStatement();
   
            // 4. 쿼리 실행
            rs = stmt.executeQuery(query);
            
   
            // 5. 쿼리 실행 결과 출력
            while(rs.next())
            {
%>
                       </thead>
                       <tbody>
                      
                       
                      <tr>
                       
                        
                        <td><%  %></td>
                            
                         
                      </tr>
                      <tbody>
                    <%
  					ArrayList<Integer> ranking = mn.burger_rank();
  					int i = 0;
  					for (i = 1; i <= num_menu; i++) {
  						
  						%> 
  						<tr class="table-active">
	      					<th scope="row"><% out.println(i); %></th>
	      						<td><%=rs.getString("user_id") %></td>
	      						<td><%=rs.getString("review_date") %></td>
	      					
	      					<td><% out.println(rv.get_review_count(ranking.get(i-1))); %></td>
	      					<td><% out.println(rv.get_review_average(ranking.get(i-1))); %></td>
	      					<td><% out.println(rv.get_review_dislike(ranking.get(i-1))); %></td>
	      					<td><% out.println(rv.get_review_percent(ranking.get(i))); %></td>
	      					<td><select id="use" name="use" size="1">

			<option value="활성">활성</option>
			<option value="이용 정지">이용 정지</option>
		
		</select> </td>
	      					<td>
	      						<button name="<% out.print(ranking.get(i-1)); %>" type="button" class="btn btn-secondary" onclick="location.href='delete.jsp?menu_id=<%out.print(ranking.get(i-1));%>'">회원 강퇴</button>
	      					</td>
    					</tr>
  						<%
  					}
  				%>
  				
  			
    				
                      
                  <%
            }
      }catch(SQLException ex){
            out.println(ex.getMessage());
            ex.printStackTrace();
      }finally{
            // 6. 사용한 Statement 종료
            if(rs != null) try { rs.close(); } catch(SQLException ex) {}
            if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
   
            // 7. 커넥션 종료
            if(conn != null) try { conn.close(); } catch(SQLException ex) {}
      }
%>
                        
                   
                
                      </tr>
               
                      <tr>
          
                      </tr>
                    </tbody>
                  </table>
        

            </div>
        
      
        
<div align="center">
            <button type="submit" class="btn btn-secondary" id="save" onclick="location.href='save.jsp'">저장하기</button>
                <button type="button" class="btn btn-secondary" id="cancel" onclick="location.href='cancel.jsp'">취소</button>
                    </div>
                    
        <p style="height:100px"></p>
        
                <nav class="navbar navbar-light bg-light" align="center">
            <form class="form-inline">
                          </form>
        </nav>

        <p style="height:50px"></p>

        <div class="container-fluid">
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

        
        

 
        
    
        
            
