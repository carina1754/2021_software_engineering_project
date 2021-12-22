<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="menu.*" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

</head>
<body>

<%
		MenuDAO menu = new MenuDAO();
		String button_name = request.getParameter("menu_id");
		int menu_id = Integer.parseInt(button_name);
		int result = menu.delete_menu(menu_id);
		PrintWriter script = response.getWriter();
		
		if(result == -1){
			script.println("<script>");
			script.println("alert('삭제에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			
		} else if (result == 1) {
			script.println("<script>");
			//script.println("alert('성공적으로 삭제했습니다.')");
			script.println("location.href = './admin_login.jsp'");
			script.println("</script>");
		}
		
%>






</body>
</html>