<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		전송 파라미터를 추출하면 숫자 형태를 띄고있어도 문자열(String)로 읽는다.
		읽어온 것을 숫자(정수) 로 바꾸고 싶으면 
		Integer 클래스의 static 메소드 .parseInt()를 활용하면 된다.
		
		?num=x&amount=x
	*/

	int num= Integer.parseInt(request.getParameter("num"));
	int amount= Integer.parseInt(request.getParameter("amount"));
	// GET 방식 파라미터로 전달된 값을 가지고 무언가 구입하는 로직을 처리하고 응답.
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/buy.jsp</title>
</head>
<body>
	<p>
		<!-- 클라이언트에게 출력은 되지만 클라이언트(웹브라우져)가 무시하는 주석 -->
		<strong><%=num %></strong> 번 상품 <strong><%=amount %></strong>개를 주문했습니다.
		<%--
			jsp 페이지에서의 주석..
			
		 	context path 는 나중에 제거되거나 변경 될 예정이기떄문에 
		 	java code 영역이나 
		 	jsp 페이지에 실제로 코딩이 되어있으면 안된다. 
		 	
		 	그래서 메소드 혹은 아래의 EL (표현언어) 을 활용하여 
		 	context path 를 출력해야한다.
		 --%>
		<a href="${pageContext.request.contextPath }/index.html">인덱스로 돌아가기</a>
	</p>
</body>
</html>