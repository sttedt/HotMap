<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<head>
	<meta charset="UTF-8">
	<title>Q & A</title>
</head>
<body>
<!-- 상단바 -->
<jsp:include page="topbar2.jsp"></jsp:include>

	<div class="container">
		<form method = "post">
			<div>
				<h3 style="text-align: center;">
					Q&A 수정
				</h3>
				<hr>
			</div>	
			<br /> 
			<input type="hidden" name="Brd_NO" class="form-control" value="${upd.Brd_NO}"/>
			<br />
			제목 :<br /> 
			<input type="text" name="title" class="form-control" value="${upd.title}"/>
			<br />
			내용 : <textarea rows="6" name="content" class="form-control">${upd.content}</textarea>
			<br /> 
			작성자 :<input type="text" name="mem_id" value="${sessionScope.SID}" class="form-control" readonly="readonly"/>
			<br />
			<input type="submit" value="수정하기" class="btn btn-dark"/>
		</form>
	</div>
</body>
