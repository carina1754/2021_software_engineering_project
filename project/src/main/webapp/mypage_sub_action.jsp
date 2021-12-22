<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="subscribe.*" %>
<%@ page import="java.io.PrintWriter" %> 

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
				SubscribeDAO userData = new SubscribeDAO();
				int result = userData.DeletationSubscribe(request.getParameter("name"));
				
				PrintWriter script = response.getWriter();
				if(result == 1){//삭제 성공시
					script.println("<script>");
					script.println("location.href = 'mypage.jsp?name="+request.getParameter("user")+"&state="+request.getParameter("state")+"'");
					script.println("</script>");
				}
			%>
</body>
</html>