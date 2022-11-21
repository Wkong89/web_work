<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    session.removeAttribute("id");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/logout.jsp</title>
</head>
<body>
   <script>
      alert("로그아웃 되었습니다. 초기화면으로 이동합니다.");
      location.href="${pageContext.request.contextPath}/index.jsp";
   </script>
</body>
</html>