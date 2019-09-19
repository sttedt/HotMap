<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<head>
	<title>Q&A 목록</title>
</head>
<body>
	Q&A 목록
	<hr />
	<a href="boardw">글쓰기</a>
	<table>
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
					<th>${map.Brd_NO}</th>
					<th>${map.title}</th>
					<th>${map.mem_id}</th>
					<th>${map.date}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
