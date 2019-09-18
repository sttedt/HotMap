<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<head>
	<title>로그인</title>
</head>

<body>

	<div class="container" style="text-align: center";>
		<a href="home" style="text-decoration:none; font-size:70px; display: inline-block;" >HotMap</a>
		<input type="text" class="form-control" style="max-width: 300px; display: inline-block;" placeholder="search">
	</div>
	
	<hr>
	<div class="container" style="max-width: 540px;">
		<form method="post">
			<div class="form-group">
				<input type="text" class="form-control" id="id" aria-describedby="emailHelp" placeholder="id">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="pw" placeholder="Password">
			</div>
		<button type="submit" class="btn btn-primary">로그인</button>
		</form>
	</div>
</body>
