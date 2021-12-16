<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#register_wrapper{
	margin-left: 5%;
	margin-right: 5%;
	margin-top: 5%;
	margin-bottom: 5%;
}
</style>
<link href="style.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
</head>
<body>

<form method="post" action="registerAction.jsp">
<div id="register_wrapper">
  <fieldset>
    <legend>회원가입</legend>
    <div class="form-group">
      <label for="InputID">아이디</label>
      <input type="text" class="form-control" name="id" placeholder="ID">
    </div>
    <div class="form-group">
      <label for="InputPassword1">비밀번호</label>
      <input type="password" class="form-control" name="pw1" placeholder="Password">
    </div>
    <div class="form-group">
      <label for="InputPassword2">비밀번호 재입력</label>
      <input type="password" class="form-control" name="pw2" placeholder="Re-Password">
    </div>
        <div class="form-group">
        <label for="InputName">이름</label>
      <input type="text" class="form-control" name="name" placeholder="홍길동">
    </div>
    <div class="form-group">
      <label for="InputCall">전화번호</label>
      <input type="text" class="form-control" name="call" placeholder="010-0000-0000">
    </div>
        <div class="form-group">
      <label for="InputEmail">이메일 주소</label>
      <input type="email" class="form-control" name="email" placeholder="email@example.com">
    </div>
    <script>
    document.addEventListener("DOMContentLoaded", function() {//slider의 실시간 데이터를 가져와서 숫자를 표시해주는 함수
        document.getElementById('range').onchange = function () {
            document.getElementById('rangeValue').innerText = this.value/20 +" 세"
        }
    });
</script>
       <div class="form-group">
      <label for="InputAge">현재 나이</label>
       <p id='rangeValue'>2.5 세</p>
      <input type="range" id="range" class="custom-range" name="age">
          </div>
      <div class="form-group">
    <select class="custom-select" name="loc">
      <option selected="">자신의 지역을 고르세요</option>
      <option value="1">서울</option>
      <option value="2">강원</option>
      <option value="3">그외</option>
    </select>
  </div>
    </fieldset>
    <button type="submit" class="btn btn-primary btn-lg btn-block">회원가입</button>
    </div>
</form>
</body>
</html>