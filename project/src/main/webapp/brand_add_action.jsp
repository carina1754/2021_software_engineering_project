<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="brand.*" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

		String user_id = request.getParameter("name");
		String user_state = request.getParameter("state");
		String brand_name = request.getParameter("brand_name");
		if (brand_name != null) brand_name = new String(brand_name.getBytes("8859_1"), "UTF-8");
		int brand_id = Integer.parseInt(request.getParameter("brand_id"));
		PrintWriter script = response.getWriter();
		
		
		BrandDAO brand_dao = new BrandDAO();
		int result = brand_dao.add_brand(brand_name, brand_id);
		
		if (result == 1){
			script.println("<script>");
			script.println("location.href = './Brand_Manage.jsp?name=" + user_id + "&state=" + user_state + "'");
			script.println("</script>");
		}else if (result == -1){
			script.println("<script>");
			script.println("alert('브랜드 추가에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == 2) {
			script.println("<script>");
			script.println("alert('이미 존재하는 브랜드입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}


%>




</body>
</html>