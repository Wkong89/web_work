<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//로그인 아이디가 있는지 확인하고
	String id=(String)session.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/study.jsp</title>
</head>
<body>
	<h1>공푸 페이지 입니다.</h1>
	<p><%=id %>님 열심히 공부해요!!</p>
</body>
</html>