<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<head>
	<title>회원가입</title>
</head>


<body>
	<div class="container">
		<h1 style="text-align: center">
			<a href="home" style="text-color:url(resources/img/cc.jpg); text-decoration:none">HotMap <span></span></a>
		</h1>
	</div>
	<hr>
	<div class="container" style="max-width: 540px">
		<form method="post">
			<input type="text"     name ="id"      placeholder="아이디"  class="form-control"><br>
			<input type="text"     name ="name"    placeholder="이름"    class="form-control"><br>
			<input type="password" name ="pw"      placeholder="비밀번호" class="form-control"><br>
			<input type="email"    name ="email"   placeholder="이메일"   class="form-control"><br>
			<input type="text"     name ="address" placeholder="주소"    class="form-control"><br>
			<input type="number"   name ="phone"   placeholder="폰번호"   class="form-control"><br>	
			<input type="submit" class="btn btn-primary" value="회원가입">
		</form>
	</div>
</body>
