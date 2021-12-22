<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="menu.*" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

<%
		MenuDAO menu = new MenuDAO();
		String button_name = request.getParameter("menu_id");
		int menu_id = Integer.parseInt(button_name);
		
		String user_id = request.getParameter("user");
		String user_state = request.getParameter("state");
		
		
		int result = menu.delete_menu(menu_id);
		PrintWriter script = response.getWriter();
		
		if(result == -1){
			script.println("<script>");
			script.println("alert('삭제에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == 1) {
			script.println("<script>");
			script.println("alert('성공적으로 삭제했습니다.')");
			script.println("location.href = './Brand_Burger_Manage.jsp?user=" + user_id + "&state=" + user_state + "'");
			script.println("</script>");
		}
		






%>






</body>
</html>