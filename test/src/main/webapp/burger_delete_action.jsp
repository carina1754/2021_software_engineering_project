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
		int menu_id = Integer.parseInt(request.getParameter("menu_id"));
		int result = menu.delete_menu(menu_id);
		PrintWriter script = response.getWriter();
		
		if(result == -1){
			script.println("<script>");
			script.println("alert('������ �����߽��ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == 1) {
			script.println("<script>");
			script.println("alert('���������� �����߽��ϴ�.')");
			script.println("location.href = './Brand_Burger_Manage.jsp");
			script.println("</script>");
		}
		






%>






</body>
</html>