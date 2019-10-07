<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<head>
	<title>My page</title>
</head>
<body>
<!-- 상단바 -->
<jsp:include page="topbar2.jsp"></jsp:include>
	<div class="container">
		<div>
			<h3 style="text-align: left;">
				회원정보
			</h3>
		</div>	
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>${pro.mem_id}</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${pro.Pw}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${pro.Name}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${pro.Email}</td>
				</tr>
				<tr>	
					<th>주소</th>
					<td>${pro.Address}</td>
				</tr>
				<tr>	
					<th>주소</th>
					<td>${pro.Address1}</td>
				</tr>
				<tr>	
					<th>주소</th>
					<td>${pro.Address2}</td>
				</tr>
				<tr>	
					<th>전화번호</th>
					<td>${pro.Phone}</td>
				</tr>
			</tbody>
		</table>
		<div>
			<a href="profileup?mem_id=${pro.mem_id}" class="btn btn-primary" >수정</a>
		</div>
	</div>
</body>
