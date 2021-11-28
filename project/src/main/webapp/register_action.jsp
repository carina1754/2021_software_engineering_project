<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<%@ page import="java.io.PrintWriter" %> 

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
				User user = new User();
				user.setuserid(request.getParameter("id"));
				user.setuserpw (request.getParameter("pw"));
				user.setuseremail(request.getParameter("email"));
				user.setuserphone(request.getParameter("phone"));
				UserDAO userData = new UserDAO();//레지스터 객체 생성
				int result = userData.join(user);//회원가입 결과 출력 변수
				PrintWriter script = response.getWriter();
				if(result == -1){//회원가입 실패시
					script.println("<script>");
					script.println("alert('다시 입력해주세요')");
					script.println("history.back()");
					script.println("</script>");
				}
				if(result == 1){//회원가입 성공시
					script.println("<script>");
					script.println("location.href = 'Login.jsp'");
					script.println("</script>");
				}
				if(result == 0){//아이디가 중복일 시
					script.println("<script>");
					script.println("alert('아이디가 중복입니다')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {//회원가입 예외처리
					script.println("<script>");
					script.println("alert('다시 입력해주세요')");
					script.println("history.back()");
					script.println("</script>");
					}
				
			%>
</body>
</html>