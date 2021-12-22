<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="review.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		String user_id = request.getParameter("user_id");
		String menu_id = request.getParameter("burger");
		
		String review_star_str = request.getParameter("review_star");
		
		
		if (review_star_str != null) review_star_str = new String(review_star_str.getBytes("8859_1"), "UTF-8");
		
		review_star_str = review_star_str.replace("점","");
		review_star_str = review_star_str.replace(" ", "");

		
		float review_star = Float.parseFloat(review_star_str);
		String review_info = request.getParameter("review_info");
		if (review_info != null) review_info = new String(review_info.getBytes("8859_1"), "UTF-8");
		
		PrintWriter script = response.getWriter();		

		
		ReviewDAO review_dao = new ReviewDAO();
		int result = review_dao.add_review(user_id, Integer.parseInt(menu_id), review_star, review_info);
		
		if (result == 1){
			script.println("<script>");
			script.println("alert('리뷰 추가에 성공했습니다.')");
			script.println("location.href = './review_writing.jsp'");
			script.println("</script>");
		}else if (result == -1){
			script.println("<script>");
			script.println("alert('리뷰 추가에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}

%>




</body>
</html>