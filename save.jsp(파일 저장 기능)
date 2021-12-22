<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@page import="java.io.*"%>

<%

  request.setCharacterEncoding("UTF-8");


String dest = "C:/Users/user/Desktop/test.txt";

String user_id = request.getParameter("user_name");
String review_date = request.getParameter("review_date");
String review_count = request.getParameter("review_count");
String review_like = request.getParameter("review_like");
String review_dislike = request.getParameter("review_dislike");

String message = "";
String script = "";

message = "성공적으로 저장 되었습니다.";

StringWriter str = new StringWriter();
PrintWriter pw = new PrintWriter(str);

pw.println("[유저 아이디]: " + user_id);
pw.println("[작성 날짜] : " + review_date);
pw.println("[리뷰 개수]" + review_count);
pw.println("[좋아요 개수]" + review_like);
pw.println("[싫어요 개수]" + review_dislike);

pw.println("---------------------------------------\n");



StringReader strReader = new StringReader(str.toString());
FileWriter file = new FileWriter(dest,true);
System.out.println(strReader);
System.out.println(strReader);
file.append(str.toString());

file.close();

%>
<html>

<head>

	<script type="text/javascript">

	</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

</head>

<body>

	<%=str%>

</body>

</html>






