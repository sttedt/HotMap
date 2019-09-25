<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<head>
	<meta charset="UTF-8">
	<title>Store</title>
</head>
<body>
<!-- 상단바 -->
<jsp:include page="topbar.jsp"></jsp:include>

	<div class="container">
		<form action="store" method = "post">
			<div>
				<h3 style="text-align: center;">
					Q&A 글쓰기
				</h3>
				<hr>
			</div>	
			이름 :<br /> 
			<input type="text" name="name" class="form-control"/>
			<br />
			메뉴 : <input type="text" name="menu" class="form-control"/>
			<br /> 
			가격 : <input type="text" name="price" class="form-control"/>
			<br />
			주소 : <input type="text" name="address" class="form-control"/>
			<br />
			전화번호 : <input type="text" name="phone" class="form-control"/>
			<br />
			영업 시간 :<input type="text" name="open" class="form-control"/>
			<br />
			매장 사진 : <input type="text" name="img1" class="form-control"/>
			<br />
			<input type="text" name="img2" class="form-control"/>	
			<br />
			<input type="text" name="img3" class="form-control"/>
			<br />
			
			작성자 :<input type="text" name="mem_id" value="${sessionScope.SID}" class="form-control" readonly="readonly"/>
			<br />
			<input type="submit" value="글쓰기" class="btn btn-primary"/>
		</form>
	</div>
</body>
