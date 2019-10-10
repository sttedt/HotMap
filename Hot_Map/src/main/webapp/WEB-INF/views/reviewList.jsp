<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<head>
<title>Q&A 목록</title>
</head>
<body>
	<!-- 상단바 -->
	<jsp:include page="topbar2.jsp"></jsp:include>
	
	<hr>
	<div class="container" style="margin-top: 15px; z-index: -9999;" >
		<div>
			<h3 style="text-align: center;">리뷰</h3>
		</div>

		<table class="table" id='target' style="z-index: -9999;">
			<thead>
				<tr>
					<th>글번호</th>
					<th>글내용</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${r_list}" var="map">
					<tr>
						<td>${map.St_NO}</td>
						<td>${map.CONTENT}</td>
						<td>${map.MEM_ID}</td>
						<td>${map.DATE}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
		</div>
	</div>
	
</body>
<script src='resources/js/jquery-3.3.1.min.js'></script>
<script src='resources/js/bootstrap.min.js'></script>
<script src='https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js'></script>
<script src='https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js'></script>
<script>
	$('#target').DataTable({
		order : [ [ 0, 'desc' ] ],
		ordering : true,
		serverSide : false
	})

	$(document).ready(function() {
		$('#target').DataTable()
	})
</script>
