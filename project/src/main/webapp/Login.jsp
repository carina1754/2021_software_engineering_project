<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 페이지 </title>
</head>
<body>
    <div class="wrap">
        <div class="login">
        <form method="post" action="./login_action.jsp">
            <h2 style="text-align: center;">Log-in</h2>
            <div class="login_id">
                <h4>ID</h4>
                <input type="text" name="id" placeholder="Email">
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" name="pw" placeholder="Password">
            </div>
            <div class="login_etc">
            <div class="register">
                <a href="Register.jsp">회원가입  </a>
            </div>
                <div class="forgot_id">
                <a href="">아이디 찾기  </a>
            </div>
            	<div class="forgot_pw">
                <a href="">비밀번호 찾기</a>
            </div>
            </div>
            <div class="submit">
                <input type="submit" value="submit">
            </div>
            </form>
        </div>
    </div>
</body>
</html>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Noto Sans KR", sans-serif;
}
a {
  text-decoration: none;
  color: black;
}
li {
  list-style: none;
}
.wrap {
  width: 100%;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.1);
}
.login {
  width: 40%;
  height: 600px;
  background: white;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}
h2 {
  color: tomato;
  font-size: 2em;
}
.login_sns {
  padding: 20px;
  display: flex;
}
.login_sns li {
  padding: 0px 15px;
}
.login_sns a {
  width: 50px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 10px;
  border-radius: 50px;
  background: white;
  font-size: 20px;
  box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.4), -3px -3px 5px rgba(0, 0, 0, 0.1);
}
.login_id {
  margin-top: 20px;
  width: 100%;
}
.login_id input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}
.login_pw {
  margin-top: 20px;
  width: 100%;
}
.login_pw input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}
.login_etc {
  padding: 10px;
  width: 100%;
  font-size: 14px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-weight: bold;
}
.submit {
  margin-top: 50px;
  width: 100%;
  text-align: center;
}
.submit input {
  width: 100%;
  height: 50px;
  border: 0;
  outline: none;
  border-radius: 40px;
  background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
  color: white;
  font-size: 1.2em;
  letter-spacing: 2px;
}
</style>