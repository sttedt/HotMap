<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<head>
	<meta charset="UTF-8">
	<title>회원정보</title>
</head>
<body>
<!-- 상단바 -->
<jsp:include page="topbar2.jsp"></jsp:include>

	<div class="container">
		<form method = "post">
			<div>
				<h3 style="text-align: center;">
					회원정보 수정
				</h3>
				<hr>
			</div>	
			<br /> 
			<input type="hidden" name="mem_id" class="form-control" value="${profileup.mem_id}"/>
			<br />
			아이디 :<input type="text" name="id" value="${sessionScope.SID}" class="form-control" readonly="readonly"/>
			<br />
			비밀번호 :<br /> 
			<input type="password" name="pw" class="form-control" />
			<br />
			비밀번호 확인 :<br /> 
			<input type="password" name="pw_check" class="form-control" />
			<br />
			이름 :<br /> 
			<input type="text" name="Name" class="form-control" value="${profileup.Name}"/>
			<br />
			
			<input type="submit" value="수정하기" class="btn btn-dark"/>
		</form>
	</div>
</body>
