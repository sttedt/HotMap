<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<head>
	<title>게시글</title>
</head>
<body>
<!-- 상단바 -->
<jsp:include page="topbar.jsp"></jsp:include>
	<div class="container">
		<div>
			<h3 style="text-align: left;">
				게시글
			</h3>
		</div>	
		
		<table class="table">
			<tbody>
				<tr>
					<th>글번호</th>
					<td>${detail.Brd_NO}</td>
				</tr>
				<tr>
					<th>글제목</th>
					<td>${detail.title}</td>
				</tr>
				<tr>
					<th>글내용</th>
					<td>${detail.content}</td>
				</tr>
				<tr>	
					<th>작성자</th>
					<td>${detail.mem_id}</td>
				</tr>
				<tr>	
					<th>날짜</th>
					<td>${detail.date}</td>
				</tr>
			</tbody>
		</table>
		<div>
			<a href="board" class="btn btn-primary" >목록</a>
			<a href="upd?Brd_NO=${detail.Brd_NO}" class="btn btn-primary" >수정</a>
			<a href="board" class="btn btn-primary" >삭제</a>
		</div>
	</div>
</body>
