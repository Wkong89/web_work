<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1. 회원한명의 정보를 삭제하기
	
	//GET 방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어와 숫자로 바꿔준다.
	int num=Integer.parseInt(request.getParameter("num"));
	//MemberDao 객체를 이용하여 삭제하기
	MemberDao.getInstance().delete(num);
	//2. 응답하기
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete.jsp</title>
</head>
<body>
		<div>
			<p>
				<strong><%=num %></strong> 님의 회원정보 삭제완료
				<a href="list.jsp">확인</a>
			</p>
		</div>
</body>
</html>