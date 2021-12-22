<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="menu.*" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		String user_id = request.getParameter("user");
		String user_state = request.getParameter("state");


		int menu_id = Integer.parseInt(request.getParameter("menu_id"));
		String menu_name = request.getParameter("menu_name");
		if (menu_name != null) menu_name = new String(menu_name.getBytes("8859_1"), "UTF-8");
		int brand_id = Integer.parseInt(request.getParameter("brand_id"));
		PrintWriter script = response.getWriter();
		
		
		MenuDAO mn = new MenuDAO();
		int result = mn.add_menu(menu_id, menu_name, brand_id);
		
		if (result == 1){
			script.println("<script>");
			script.println("alert('성공적으로 추가했습니다.')");
			script.println("location.href = './Brand_Burger_Manage.jsp?user=" + user_id + "&state=" + user_state + "'");
			script.println("</script>");
		}else if (result == -1){
			script.println("<script>");
			script.println("alert('메뉴 추가에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == 2) {
			script.println("<script>");
			script.println("alert('이미 존재하는 메뉴입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}


%>




</body>
</html>