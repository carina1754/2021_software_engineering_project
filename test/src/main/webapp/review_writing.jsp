<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ page import="brand.*" %>
<%@ page import="menu.*" %>

<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy/MM/dd");
	String strdate = simpleDate.format(date);
	
	BrandDAO brand_dao = new BrandDAO();
	MenuDAO menu_dao = new MenuDAO();
	
	ArrayList<String> brands = brand_dao.get_brands_name();
	int num_brands = brands.size();

	String user_id = request.getParameter("user");
	String user_state = request.getParameter("state");
	
	boolean admin = false;
	if(user_id == "root"){
		admin = true;
	}

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
		<script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
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
        
        <script type="text/javascript">
        
        $( document ).ready(function(){
        	
        	var brand = {
        		<%
        			for (int i = 0; i < num_brands; i++){
        				
        				out.print("\"" + brand_dao.get_brand_id(brands.get(i)) + "\":\"" + brands.get(i) + "\"");
        				if (i < brands.size() - 1) out.println(",");
        			}
        		
        		%>	
        			
        	};
        	
        	
       		<%
       			for (int i = 0; i < num_brands; i++){
       				out.println("var menu_" + brand_dao.get_brand_id(brands.get(i)) + " = {");
       				
       				ArrayList<String> menus = new ArrayList<String>(); 
       				menus = menu_dao.get_brand_burgers_name(i + 1);
       				
       				for (int j = 0; j < menus.size(); j++){
       					out.println("\"" + menu_dao.get_menu_id(menus.get(j)) + "\" : \"" + menus.get(j) + "\"");
       					if (j < brands.size() - 1) out.println(",");
       				}
       				out.println("};");
       				
       			}
       		
       		%>
        	
        	function retOption(mapArr, select) {
        		var html = '';
        		var keys = Object.keys(mapArr);
        		for (var i in keys) {
        			html += "<option value=" + "'" + keys[i] + "'>" + mapArr[keys[i]] + "</option>";
        		}
        		
        		 $("select[id='" + select +"']").html(html);
        	}
        	
        	$("select[id='brand']").on("change", function(){
            	var option = $("#brand option:selected").val();
                var subSelName = '';
                
                <%
                	for (int i = 0; i < num_brands; i++){
                		out.println("if(option == \"" + (i + 1) + "\") {");
                		out.println("\tsubSelName = \"menu_" + (i + 1) + "\";");
                		out.print("} else ");
                	}
                	out.println("{");
                	out.println("$(\"#sel2\").hide();");
                	out.println("return;");
                	out.println("}");
                %>

                $("#sel2").show();
                retOption(eval(subSelName), "sel2");
            })
           retOption(brand, "sel1");
        	
        });
        
        
        </script>
        
        <script>
        
        $( document ).ready( function() {
			$( 'select#sel2' ).change( function() {
				$( ".review_burger_name" ).text($( ' select#sel2 option:selected ' ).text()); 				
			} );
		} );
        
        </script>
        
        
        <form action="review_add_action.jsp?user_id=<%= user_id %>" method="post">
        
        	<select name="brand" id="brand">
        		<%
        			for (int i = 0; i < brands.size(); i++){
        				%>
        				<option value=<% out.print(i+1); %>> <% out.print(brands.get(i)); %> </option>        				
        				<%
        			}
        		%>
        	</select>
        	
        	<select name="burger" id="sel2" style="display:none"></select>
	
	        <div class="row" align="center">
	            <div class="col-md-4">
	                <h3 class="text-left" id="burger_name"><span class="review_burger_name"></span></h3>
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
							            
							            document.getElementById('inputValue').value = (this.value/20).toFixed(1) +" 점"
							            
							        }
							    });
							</script>
					      <div class="form-group">					      
						      <input id='inputValue' type='text' name='review_star' value='2.5 점' readonly>
						      
						      <input type="range" id="range" class="custom-range">
					      </div>
	 
	                </div>
	                
	                <div style="float:right;"><h4>작성일자: <% out.print(strdate); %></h4></div>
	                <div style="float:right;"><h4>           </h4></div>
	                <div style="float:right;"><h4>작성자:	<% out.print(user_id + '\t'); %></h4></div>
	                
	                <textarea name='review_info' data-min-height="150" class="form-control col-sm-5" rows="10" style="border: none">리뷰를 작성해주세요</textarea>                
	            </div>
	            
	            <p style="height:50px"></p>
	
	            <div align="right">                
	                <button type="button" class="btn btn-default" id="cancel" onclick='history.back(); return false;'>취소</button>
	                <input type="submit" class="btn btn-default" id="complete" value="완료"/>
	            </div>
	        </div>
        </form>
           

            <p style="height:100px"></p>
            
            <div class="container">
                <a href="#"><h3>About</h3></a>
                <textarea class="form-control col-sm-5" rows="5" style="border: none" readonly>About 4조</textarea>
                
            </div>
            


            <p style="height:50px"></p>

        
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="js/bootstrap.js"></script>
    </body>
</html>