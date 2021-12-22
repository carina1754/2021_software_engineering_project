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

		int result = reviewDAO.review_hate(review_id);
		
		PrintWriter script = response.getWriter();
		
		script.println("<script>");
		script.println("history.back()");
		script.println("</script>");
		
%>






</body>
</html>