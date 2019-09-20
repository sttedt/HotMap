<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<head>
	<title>Q&A 목록</title>
</head>
<body>
<!-- 상단바 -->
<jsp:include page="topbar.jsp"></jsp:include>
	<div class="container">
		<div>
			<h3 style="text-align: center;">
				Q&A 목록
			</h3>
		</div>	
		
		<table class="table">
			<thead>
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${b_list}" var="map">
					<tr>
						<td>${map.Brd_NO}</td>
						<td><a class="title" href="boardr?Brd_NO=${map.Brd_NO}" name="title" >${map.title}</a></td>
						<td>${map.mem_id}</td>
						<td>${map.date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<a href="boardw" class="btn btn-primary" >글쓰기</a>
		</div>
	</div>
</body>
