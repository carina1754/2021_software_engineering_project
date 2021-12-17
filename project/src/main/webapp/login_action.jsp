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
				UserDAO userData = new UserDAO();//레지스터 객체 생성
				int result = userData.login(request.getParameter("id"),request.getParameter("pw"));//회원가입 결과 출력 변수
				PrintWriter script = response.getWriter();
				if(result == -2){//로그인 아이디 미스매치
					script.println("<script>");
					script.println("alert('아이디가 존재하지 않습니다')");
					script.println("history.back()");
					script.println("</script>");
				}
				else if(result == 1){//로그인 성공
					script.println("<script>");
					script.println("location.href = ''mypage.jsp?name="+request.getParameter("id")+"''");
					script.println("</script>");
				}
				else if(result == -1){//서버 오류
					script.println("<script>");
					script.println("alert('아이디가 중복입니다')");
					script.println("history.back()");
					script.println("</script>");
				}
				else if(result == 0){//로그인 비밀번호 미스매치
					script.println("<script>");
					script.println("alert('비밀번호가 틀렸습니다')");
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