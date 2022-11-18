<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //수정할 회원의 번호를 읽어와서 
   int num=Integer.parseInt(request.getParameter("num"));
   //해당 할일의 정보를 DB 에서 불러온다음
   TodoDto dto=TodoDao.getInstance().getData(num);
   //수정할수 있는 폼을 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
 	<nav class="navbar navbar-expand-md navbar-dark" style="background-color:purple;">
      <div class="container">
         <a class="navbar-brand" href="${pageContext.request.contextPath }/">
            <img src="https://getbootstrap.com/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
            OnePoint Lesson
         </a>
         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
          </button>
          <!-- 화면이 좁으면 숨겨지는 요소들은 아래의 div 안에 넣어두면 된다. -->
          <div class="collapse navbar-collapse" id="navbarNav"></div>
      </div>
   </nav>
    <div class="container">
	<nav class="mt-2">
	     <ol class="breadcrumb">
	        <li class="breadcrumb-item">
	           <a href="${pageContext.request.contextPath }/index.jsp">Home</a>
	        </li>
	        <li class="breadcrumb-item">
	           <a href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a>
	        </li>
	        <li class="breadcrumb-item active">할일 수정 페이지</li>
	     </ol>
	</nav>
    <h1>할 일 수정 폼</h1>
    <form action="todo/update.jsp" method="post">
         <div class="mb-2">
            <label class="form-label" for="num">번호</label>
            <input class="form-control" type="text" name="num" id="num" value="<%=dto.getNum() %>" readonly/>
         </div>
         <div class="mb-2">
            <label class="form-label" for="content">내용</label>
            <input class="form-control" type="text" name="content" id="content" value="<%=dto.getContent()%>"/>
         </div>
         <div class="mb-2">
            <label class="form-label" for="regdate">등록일</label>
            <input class="form-control" type="text" name="regdate" id="regdate" value="<%=dto.getRegdate() %>" readonly/>
         </div>
         <button class="btn btn-primary btn-sm" type="submit">수정확인</button>
         <button class="btn btn-danger btn-sm" type="reset">취소</button>
      </form>
   </div>
</body>
</html>













