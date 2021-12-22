<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*, java.text.*" %>
<%@ page import="review.*" %>
<%@ page import="brand.*" %>
<%@ page import="menu.*" %>
<%@ page import="user.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="feeling.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

<%

		PrintWriter script = response.getWriter();
		request.setCharacterEncoding("utf-8");
		
		String review_id = request.getParameter("review_id");
		String user_id = request.getParameter("user_id");
		int feeling_state = Integer.parseInt(request.getParameter("feeling_state"));
		
		Feeling feeling = new Feeling();
		Feeling cmp_feeling = new Feeling();
		FeelingDAO feelingDAO = new FeelingDAO();
		
		ReviewDAO reviewDAO = new ReviewDAO();
	
		
		cmp_feeling = feelingDAO.getFeeling(user_id,review_id);
		
		int review_result = 0;
		int feeling_result = 0;
		
		int fc = feelingDAO.getFeelingCount(user_id);
		int hc = feelingDAO.getHateCount(user_id);
		
		System.out.println(fc);
		System.out.println(hc);
		
		
		if(cmp_feeling.getFeeling_id()==0){
			
			feeling.setFeeling_state(feeling_state);
			feeling.setUser_id(user_id);
			feeling.setReview_id(review_id);
			
			feeling_result = feelingDAO.insertFeeling(feeling);
			
			if(feeling_state == 1){
				review_result = reviewDAO.review_like_inc(review_id);
			}
			else
				review_result = reviewDAO.review_hate_inc(review_id);
			
		}
		else{
			int prev_feeling = cmp_feeling.getFeeling_state();
			
			cmp_feeling.setFeeling_state(feeling_state);
			feeling_result = feelingDAO.updateFeeling(cmp_feeling);
			
			if(prev_feeling == 1 && feeling_state == 2){
				review_result = reviewDAO.review_like_dec(review_id);
				review_result = reviewDAO.review_hate_inc(review_id);
			}
			else if (prev_feeling == 2 && feeling_state == 1){
				review_result = reviewDAO.review_hate_dec(review_id);
				review_result = reviewDAO.review_like_inc(review_id);
			}
			else
				review_result = -1;
		
		}
		
		if(feeling_result == -1 || review_result == -1){
			script.println("<script>");
			script.println("alert('수정 실패')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		else{
			script.println("<script>");
			script.println("alert('수정 성공')");
			script.println("history.back()");
			script.println("</script>");
		}
			
%>






</body>
</html>