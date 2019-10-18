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
			<h3 style="text-align: center;">아이디찾기</h3>
		</div>

		<form method="post">

			<p>
				<label>Email</label> <input class="form-control" type="text"
					id="email" name="email" required>
			</p>

			<p class="w3-center">
				<button type="submit" id=findBtn
					class="btn btn-dark" style="width: 512px; height: 47px;">찾기</button>
				
				<button type="button" onclick="history.go(-1);"
					class="btn btn-dark" style="width: 512px; height: 47px; margin-top: 10px;">취소</button>
			</p>

		</form>
	</div>

</body>



