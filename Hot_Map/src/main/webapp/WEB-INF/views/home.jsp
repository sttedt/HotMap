<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<head>
	<title>Home</title>
	
	<style>
		.card_size{
			width:200px;
			float :left;
			text-align: center;
		}	
	</style>
</head>
<body> 
	<jsp:include page="topbar.jsp"></jsp:include>
	<div style=" margin-top:100px; height:300px; display: inline-block;" >
		<div class="card card_size"  style="margin-left:100px;">
			<div class="card-header">
				피존투
			</div>	
			<img src="https://img.insight.co.kr/static/2019/09/24/700/e4me5y2knfqmfe8irs8g.jpg" style='width:100%' alt="" />	
			<div class="card-body">
				히히
			</div>
		</div>
		<div class="card card_size">
			<div class="card-header">
				TEST Header2
			</div>	
			<img src="resources/img/cc.jpg" alt="" />	
			<div class="card-body">
				TEST Body2
			</div>	
		</div>
		<div class="card card_size">
			<div class="card-header">
				TEST Header3
			</div>	
			<img src="resources/img/cc.jpg" alt="" />	
			<div class="card-body">
				TEST Body3
			</div>	
		</div>
		<div class="card card_size">
			<div class="card-header">
				TEST Header4
			</div>	
			<img src="resources/img/cc.jpg" alt="" />	
			<div class="card-body">
				TEST Body4
			</div>	
		</div>
	</div>
	
	<br/>
	<div style=" margin-top:100px; height:300px; display: inline-block;" >
		<div class="card card_size"  style="margin-left:100px;">
			<div class="card-header">
				TEST Header
			</div>	
			<img src="resources/img/cc.jpg" alt="" />	
			<div class="card-body">
				TEST Body
			</div>	
		</div>
		
		<div class="card card_size">
			<div class="card-header">
				TEST Header2
			</div>	
			<img src="resources/img/cc.jpg" alt="" />	
			<div class="card-body">
				TEST Body2
			</div>	
		</div>
		
		<div class="card card_size" >
			<div class="card-header">
				TEST Header3
			</div>	
			<img src="resources/img/cc.jpg" alt="" />	
			<div class="card-body">
				TEST Body3
			</div>	
		</div>
		
		<div class="card card_size">
			<div class="card-header">
				TEST Header4
			</div>	
			<img src="resources/img/cc.jpg" alt="" />	
			<div class="card-body">
				TEST Body4
			</div>	
		</div>
	</div>
</body>
<script type="text/javascript" src='resources/js/jquery-3.3.1.min.js'></script>
<script>
	$('img').on('click',function(){
		location.href='http://www.naver.com'
	})
</script>

