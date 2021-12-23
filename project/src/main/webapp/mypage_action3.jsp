<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<%@ page import="java.io.PrintWriter" %> 

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
			User user = new User();
			UserDAO userData = new UserDAO();//레지스터 객체 생성
			int result = userData.edit(user,request.getParameter("user"));//회원가입 결과 출력 변수
			PrintWriter script = response.getWriter();
			if(result == 1){//삭제 성공시
				script.println("<script>");
				script.println("location.href = 'mypage2.jsp?name="+request.getParameter("user")+"&state="+request.getParameter("state")+"'");
				script.println("</script>");
			}
			%>
</body>
</html>