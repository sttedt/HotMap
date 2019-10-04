<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<head>
<title>Home</title>
<style>
.imgs {
	max-width: 100%;
	height: 230px;
}

#div_left {
	width: 60%;
	hight: 300px;
	float: left;
	background-color: pink;
	text-align: center;
}

#div_right {
	width: 20%;
	height: 568px;
	float: left;
	margin-top: 50px;
	margin-left: 30px;
	background-color: purple;
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>
	<jsp:include page="topbar2.jsp"></jsp:include>
	<div style="text-align: center; margin-top: 10px;">
		<h2>신상 맛집</h2>
	</div>


	<div style="margin-top: 50px; margin-left: 150px" id="div_left">

			<c:forEach items="${s_list}" var="map">
				
				<a href="storer?St_NO=${map.St_NO}">${map.name}</a>
				<a>가격: ${map.price}</a>
<%-- 				<div>가격: ${map.price}</div> --%>
				
				
			</c:forEach>
	</div>


	<div id="div_right">

		<div class="table"></div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

</body>


