<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<head>
	<meta charset="UTF-8">
	<title>리뷰</title>
</head>
<body>
<!-- 상단바 -->
<jsp:include page="topbar2.jsp"></jsp:include>

	<div class="container">
		<form action="review" method = "post">
			<div>
				<h3 style="text-align: center; color: #ffc107">
					${detail.name}
				</h3>
				<h3 style="text-align: center;">
					에 대한 솔직한 리뷰를 써주세요 
				</h3>
				<hr>
			</div>	
<!-- 			제목 :<br />  -->
<!-- 			<input type="text" name="title" class="form-control"/> -->
			작성자 :<input type="text" name="mem_id" value="${sessionScope.SID}" class="form-control" readonly="readonly"/>
			<br />
			<input type="hidden" name="St_NO" value="${detail.St_NO}">
			내용 : <textarea rows="6" name="content" class="form-control" placeholder="주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"></textarea>
			<br /> 
			별점 :<br /> 
			<input type="text" name="star" class="form-control"/>
			<br /> 
			<input type="submit" value="글쓰기" class="btn btn-primary"/>
		</form>
	</div>
</body>
