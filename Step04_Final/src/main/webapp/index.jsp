<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// session scope 에 id 라는 키값으로 저장된 값이 있는지 읽어와본다. (없으면 Null)
	String id=(String)session.getAttribute("id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div calss="container">
		<%if(id!= null){ %>
			<p>
				<strong><%=id %></strong>님 로그인중
				<a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
			</p>
		<%}else { %>
			<a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a>
		<%} %>

		<h1>인덱스 페이지입니다.</h1>
		<ul>
			<li><a href="${pageContext.request.contextPath}/users/signupform.jsp">회원가입</a></li>
		</ul>
	</div>
</body>
</html>