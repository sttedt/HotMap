<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>HotMap</title>
	<style>
	#div_left {
		width: 70%;
		height: 300px;
		float: left;
		text-align: center;
		margin-left: 130px;
	}
	
	#div_right {
		width: 15%;
		height: 568px;
		float: left;
		margin-left: 50px;
		text-align: center;
	}
	</style>
</head>

<body style="background-color: #F2F2F2; ">
	<jsp:include page="topbar.jsp"></jsp:include>
	<jsp:include page="topbar2.jsp"></jsp:include>
	
	<div style="text-align: center; margin-bottom: 100px; " >
		<h2>신상 핫플레이스</h2>
	</div>

	<div class="card-deck mb-3 " id="div_left" >
		<c:forEach items="${s_list}" var="map">
			<a href="storer?St_NO=${map.St_NO}" style="margin-left: 10px;">
				<div class="card mb-4" style=" z-index: -9999;">
						<img class="card-img-top" src="http://dndnp4.dothome.co.kr/image/${map.img}" onerror="this.src='http://dndnp4.dothome.co.kr/imgNotFound.png'"
							style= "height: 280px; width: 350px;"/>
						<p class="card-header" style= "width: 350px; text-align: center; background:white;">
							<span style="color:black; text-decoration: none;">${map.name}</span><br/>
							<span style="color:black; text-decoration: none;">${map.menu}</span><br/>
<%-- 							<span style="color:black; text-decoration: none;">${map.menu}</span> --%>
						</p>
				</div>		
			</a>
		</c:forEach>
	</div>

	<div id="div_right">
		 <h2>이번주 핫플랭킹</h2>
		<div class="table" style="font-size: 16pt">
			<c:forEach items="${rank}" var="map" >
				<span style="color:black; text-decoration: none;">${map.name}</span>
				<span style="color:black; text-decoration: none;">${map.starAvg}</span><br/>
			</c:forEach>
		</div>
	</div>


</body>


