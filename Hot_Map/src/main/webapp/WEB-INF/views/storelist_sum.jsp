<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>HotMap</title>
	
</head>

<body style="background-color: #F2F2F2; ">
	<jsp:include page="topbar.jsp"></jsp:include>
	<jsp:include page="topbar2.jsp"></jsp:include>
	
	<div style="text-align: center; margin-bottom: 100px; " >
		<h2>서면 핫플레이스 전체목록</h2>
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
<%-- 							<span style="color:black; text-decoration: none;">${map.price}</span> --%>
						</p>
				</div>		
			</a>
		</c:forEach>
	</div>


</body>


