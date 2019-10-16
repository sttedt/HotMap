<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">


<head>
<title>아이디찾기</title>
</head>

<body>
	<!-- 상단바 -->
	<jsp:include page="topbar2.jsp"></jsp:include>
	<hr>
	<div class="container" style="margin-top: 150px; max-width: 540px;">
		<div>
			<h3 style="text-align: center;">비밀번호 찾기</h3>
			<h6> 비밀번호를 찾고자 하는 아이디를 입력해주세요</h6>
		</div>

		<form method="post">

			<p>
				<label>아이디</label> <input class="form-control" type="text"
					id="id" name="id" required>
			</p>

			<p class="w3-center">
				<button type="submit" id=findBtn
					class="btn btn-dark" style="width: 512px; height: 47px;">찾기</button>
				
				<button type="button" onclick="history.go(-1);"
					class="btn btn-dark" style="width: 512px; height: 47px; margin-top: 10px;">취소</button>
				
			</p>

		</form>
			<div>
			<h6>아이디가 기억나지 않는다면?</h6>
			<a class="dropdown-item" href="find_id_form" style="text-align: center;">아이디찾기</a>
		</div>
	</div>

</body>



