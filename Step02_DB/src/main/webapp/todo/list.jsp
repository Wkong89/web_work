<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//TodoDao 객체를 이용하여 할일 목록을 얻어오기
	TodoDao dao=TodoDao.getInstance();
	List<TodoDto> list=dao.getList();
	// 위의 두줄 한번에 적으면
	// List<TodoDto> list = TodoDao.getInstance().getList();
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
   .icon-link{
      font-size: 24px;
   }
   
   .icon-link svg{
      /* transform 을 적용할때 0.4초 동안 변화 되도록 적용해라 */
      transition: transform 0.4s ease-out;
   }
   
   .icon-link svg:hover{
      /* 원본 크기의 1.2 배로 확대 해라 */
      transform: scale(1.2);
   }
</style>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark" style="background-color:purple">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">
				<img src="https://getbootstrap.com/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
				OnePoint Lesson
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    
		    <!-- 화면이 좁으면 숨겨지는 요소들은 아래의 div 안에 넣어두면 된다 -->
		    <div class="collapse navbar-collapse" id="navbarNav">
		   		<ul class="navbar-nav">
		   			<li class="nav-item">
		   				<a class="nav-link " href="${pageContext.request.contextPath }/member/list.jsp">
		   				
		   				회원 목록
		   				</a>
		   			</li>
		   			<li class="nav-item">
		   				<a class="nav-link active" href="${pageContext.request.contextPath }/todo/list.jsp">
		   				
		   				할일 목록
		   				</a>
		   			</li>
		   		</ul>
		   	</div>
		</div>
	</nav>
	<div class="container">
		<a href="insertform.jsp">
			<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-clipboard2-plus" viewBox="0 0 16 16">
			  <path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5h3Z"/>
			  <path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5v-12Z"/>
			  <path d="M8.5 6.5a.5.5 0 0 0-1 0V8H6a.5.5 0 0 0 0 1h1.5v1.5a.5.5 0 0 0 1 0V9H10a.5.5 0 0 0 0-1H8.5V6.5Z"/>
			</svg>
		
		</a>
		<h1>해야 할 일 목록</h1>
		<table class="table table-striped">
			<thead>
				<tr class="table-dark">
					<th>번호</th>
					<th>내용</th>
					<th>등록일</th>		
					<th>수정</th>
					<th>삭제</th>		
				</tr>
			</thead>
			<tbody>
			<%for(TodoDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>	
					<td><%=tmp.getContent() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td>
					<a href="updateform.jsp?num=<%=tmp.getNum() %>">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
	                       <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
	                       <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
	                    </svg>
	                    <span class="visually-hidden">날짜수정</span>
					</a>
					</td>
					<td>
						<a href="delete.jsp?num=<%=tmp.getNum() %>">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
		                       <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
		                       <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
		                    </svg>
		                    <span class="visually-hidden">할일삭제</span>
						</a>
					</td>
					
				</tr>
			<%} %>
			</tbody>
		</table>
	</div>
 	<%-- /include/footer.jsp 페이지를 포함 시켜 해당부분은 footer.jsp 페이지가 응답하도록 한다. --%>
	<jsp:include page="/include/footer.jsp">
			<jsp:param value="todo" name="thisPage"/>
	</jsp:include>
</body>
</html>