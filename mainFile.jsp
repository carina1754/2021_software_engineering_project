<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="review.*" %>
<%@ page import="menu.*" %>
<%@ page import="brand.*" %>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.util.*" %>



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
   
            String query = "select * from review order by review_id";
   
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
           
        <a href="#"><h1>종합 버거 리뷰</h1></a>

        <p style="height:20px"></p>

        <div align="right">
            <button type="button" class="btn btn-secondary" id="login" onclick="location.href='login.jsp'">로그인</button>
            <button type="button" class="btn btn-secondary" id="regist" onclick="location.href='regist.jsp'">회원가입</button>
            <button type="button" class="btn btn-secondary" id="mypage" onclick="location.href='mypage.jsp'">마이페이지</button>
        </div>

        <p style="height:100px"></p>

            <div class="row" align="left">
                <div class="col-md-4">
                  
                    <img src="./1.png">
                    <div class="caption">
                    버거 설명 <br>
                    
                  
                        
                    </div>
                  </a>
                </div>
                <div align = "right">
      <button type="button"  class="btn btn-secondary" onclick="location.href='update.jsp'"> 관리자 메뉴_해당 메뉴 수정 </button>
      
      
</div>
        <p style="height:50px"></p>
        
        
                <%
        
           int menu_id = Integer.parseInt(request.getParameter("menu_id"));
           MenuDAO mn_dao = new MenuDAO();
           ArrayList<String> burgers = mn_dao.get_brand_burgers_name(menu_id);           

        
        %>    
        
        
        

        <div class="container-fluid">
            
            <!--종합 순위 -->
            
                 <a><h1>버거의 인기 리뷰</a></h1>
                
                   
                 <div class="row" align="center">
        
           <%
              int num = 2;
              if(burgers.size() < 4) num = burgers.size();
              for (int i = 0; i < num; i++){
              %>
                 
               <img src="./1.png" style="vertical-align:top;" width="200" height="200">
                 <% out.print(burgers.get(i)); %> <br>
                 맛 설명~~~ <br>
              
              
              <%
              
              }
        
        
        
           %>
       
        
        </div>
                    
                    
                    
                    <div class="caption">
                    
                        
                    </div>
                  
                  
                </div>
                
     <div class = "text-left">
                       <ul class = "pagination">
                       <li><a href="#">1</a></li>
                       <li><a href="#">2</a></li>
                       <li><a href="#">3</a></li>
                       <li><a href="#">4</a></li>
                       </ul>
                       </div>
                       </div>
              
            
                  <div class = "row">
                <div align="right">
              
                <button type="button" class="btn text-seconary" onclick="location.href='totalrank.jsp'"> 전체 순위 보기 </button>
        </div>
        </div>
        
            <div class="container">
        <a><h1>최근 리뷰</h1></a>
        <table class ="table table-striped">
                      <thead>
                      <tr>
                        <th>작성자</th>
                        <th>작성 날짜</th>
                        <th>리뷰 내용</th>
                        <th>평점</th>
                       </tr>
                       
                    </thead>
                       <tbody>
                       
                      <tr>
                        <td><%=rs.getString("user_id") %></td>
                        <td><%=rs.getString("review_date") %></td>
                        <td><%=rs.getString("review_info") %></td>
                        <td><%=rs.getString("review_star") %></td>
                        
                        
                      </tr>
                      
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
                    </tbody>
                    
                    </table>
                    
                    <hr/>
                    
                  
                    
                    <div class = "text-center">
                       <ul class = "pagination">
                       <li><a href="#">1</a></li>
                       <li><a href="#">2</a></li>
                       <li><a href="#">3</a></li>
                       <li><a href="#">4</a></li>
                       </ul>
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