<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<head>
	<title>핫플</title>
</head>
<body>
<!-- 상단바 -->
<jsp:include page="topbar2.jsp"></jsp:include>
	<div class="container">
		<div>
			<br>
			<h3 style="text-align: left;">
				${detail.name}
			</h3>
			<br>
		</div>	
		
		<table class="table">
			<tbody>
				<tr>
					<th>번호</th>
					<td>${detail.St_NO}</td>
				</tr>
				<tr>
					<th>음식사진</th>
					<td><img class="card-img-top" src="http://dndnp4.dothome.co.kr/image/${detail.Img1}"style= "height: 280px; width: 350px;"/></td>
				</tr>
				<tr>
					<th>매장사진</th>
					<td><img class="card-img-top" src="http://dndnp4.dothome.co.kr/image/${detail.Img2}"style= "height: 280px; width: 350px;"/></td>
				</tr>
				<tr>
					<th>기타사진</th>
					<td><img class="card-img-top" src="http://dndnp4.dothome.co.kr/image/${detail.Img3}"style= "height: 280px; width: 350px;"/></td>
				</tr>
				
				<tr>
					<th>메뉴</th>
					<td>${detail.menu}</td>
				</tr>
				<tr>
					<th>태그</th>
					<td>#소주 #맥주 #중식 #일식 #튀김 </td>
				</tr>
				<tr>	
					<th>주소</th>
					<td>${detail.address}</td>
				</tr>
				<tr>	
					<th>날짜</th>
					<td>${detail.date}</td>
				</tr>
				<tr>	
					<th>전화번호</th>
					<td>${detail.phone}</td>
				</tr>
				<tr>	
					<th>오픈시간</th>
					<td>${detail.opening_time}</td>
				</tr>
				<tr>	
					<th>마감시간</th>
					<td>${detail.closing_time}</td>
				</tr>
				<tr>	
					<th>올린사람</th>
					<td>${detail.mem_id}</td>
				</tr>
				
			</tbody>
		</table>
		<div>
			<a href="home" class="btn btn-dark" >목록</a>
<%-- 			<a href="upd?Brd_NO=${detail.Brd_NO}" class="btn btn-dark" >수정</a> --%>
<%-- 			<a href="boardd?Brd_NO=${detail.Brd_NO}" class="btn btn-dark" >삭제</a> --%>
		</div>
	</div>
</body>
