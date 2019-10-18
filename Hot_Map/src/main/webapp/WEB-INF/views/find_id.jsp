<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


<head>
<title>아이디찾기</title>
</head>

<body>
	<!-- 상단바 -->
	<jsp:include page="topbar2.jsp"></jsp:include>
	<hr>
	<div class="container" style="margin-top: 150px; max-width: 540px;">
		<div>
			<h3 style="text-align: center;">아이디찾기 검색결과</h3>
		</div>
		<br>
		<div>
			<h4>아이디 : ${ id }</h4>
			<p class="w3-center">
				<button type="button" id=loginBtn
					class="btn btn-dark" style="width: 512px; height: 47px;">로그인</button>
				<button type="button" onclick="history.go(-1);"
					class="btn btn-dark" style="width: 512px; height: 47px; margin-top: 10px;">취소</button>
			</p>
		</div>
		<a class="dropdown-item" href="find_pw_form" style="text-align: center;">비밀번호 변경</a>
	</div>
</body>

<script>
	$(function() {
		$("#loginBtn").click(function() {
			location.href = '../map/login';
		})
	})
</script>


