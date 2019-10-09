<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<head>
	<meta charset="UTF-8">
	<title>test</title>
</head>

<body>
	<form method='post' enctype='multipart/form-data'>
		<input type='text' name='test1' value='test1'>
		<input type='text' name='test2' value='test2'>
		<input type='text' name='test3' value='test3'>
		<input type='file' name='file'>
		<input type='submit' value='test'>
	</form>
	<img src ='http://dndnp4.dothome.co.kr/image/prT1moeJcIcajRObfjZrPz7rnVed3r.png'>
</body>
<script src='resources/js/jquery-3.3.1.min.js'></script>
<script>
	$('input[type=file]').on('change',function(){
		console.log($(this).val())
	})
</script>