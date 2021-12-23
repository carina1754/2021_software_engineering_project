<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="brand.*" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

<%

		String user_id = request.getParameter("name");
		String user_state = request.getParameter("state");
		BrandDAO brand = new BrandDAO();
		String brand_name = request.getParameter("brand_name");		
		int result = brand.delete_brand(brand_name);
		PrintWriter script = response.getWriter();
		
		if(result == -1){
			script.println("<script>");
			script.println("alert('삭제에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == 1) {
			script.println("<script>");
			script.println("alert('성공적으로 삭제했습니다.')");
			script.println("location.href = './Brand_Manage.jsp?name=" + user_id + "&state=" + user_state + "'");
			script.println("</script>");
		}
		






%>






</body>
</html>