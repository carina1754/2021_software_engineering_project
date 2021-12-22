<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*, java.text.*" %>
<%@ page import="review.*" %>
<%@ page import="brand.*" %>
<%@ page import="menu.*" %>
<%@ page import="user.*" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

</head>
<body>

<%
		String review_id = request.getParameter("review_id");

		ReviewDAO reviewDAO = new ReviewDAO();

		int result = reviewDAO.del_review(review_id);
		
		PrintWriter script = response.getWriter();
		
		
		if(result == 1){//삭제 성공시
			script.println("<script>");
			script.println("alert('리뷰를 삭제했습니다.')");
			script.println("location.href = 'mypage.jsp'");
			script.println("</script>");
		}

		else{
			script.println("<script>");
			script.println("alert('삭제 실패')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		
%>






</body>
</html>