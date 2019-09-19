<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<head>
	<meta charset="UTF-8">
	<title>Q & A</title>
</head>
<body>
<!-- 상단바 -->
<jsp:include page="topbar.jsp"></jsp:include>

	<div class="container">
		<form action="boardw" method = "post">
			<div>
				<h3 style="text-align: center;">
					Q&A 목록
				</h3>
				<hr>
			</div>	
			제목 :<br /> 
			<input type="text" name="title" class="form-control"/>
			<br />
			내용 : <textarea rows="6" name="content" class="form-control"></textarea>
			<br /> 
			작성자 :<input type="text" name="writer" value="${sessionScope.SID}" class="form-control" readonly="readonly"/>
			<br />
			<input type="submit" value="글쓰기" class="btn btn-primary"/>
		</form>
	</div>
</body>
