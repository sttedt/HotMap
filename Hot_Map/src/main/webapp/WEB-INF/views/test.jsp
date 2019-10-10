<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<head>
	<meta charset="UTF-8">style background image
	<title>test</title>
</head>

<body>
	<form method='post' enctype='multipart/form-data'>
		<input type='text' name='test1' value='test1'><br>
		<input type='text' name='test1' value='test2'><br>
		<input type='text' name='test1' value='test3'><br>
		<input type='file' name='file'><br>
		<input type='text' name='test1' value='test4'>
		<input type='submit' value='test'>
	</form>
	<img id="image_section" src="#" alt="your image">
	<div id='target'></div>
	<!-- <div style='background:url(http://dndnp4.dothome.co.kr/image/prT1moeJcIcajRObfjZrPz7rnVed3r.png);height:100px;width:100px;text-align:right;padding-right:10px'><a href='#'>X</a></div> -->
	<button type='button' id='btn'>테스트스트스트스트스트</button>
	<!-- <img src ='http://dndnp4.dothome.co.kr/image/prT1moeJcIcajRObfjZrPz7rnVed3r.png'> -->
	
</body>
<script src='resources/js/jquery-3.3.1.min.js'></script>
<script>
	function divRemove(e){
		$(e).parent().remove()
	}
	function readURL(input) {
	 if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  
	  reader.onload = function (e) {
		var html = "<div style='background:url(" + e.target.result + ");background-size:100px;height:100px;width:100px;text-align:right;padding-right:10px;display:inline-block;'><a href='#' onclick='divRemove(this)'>X</a></div>"
		$('#target').append(html)
		/* $('#image_section').attr('src', e.target.result); */  
	  }
	  
	  reader.readAsDataURL(input.files[0]);
	  }
	}
	$('#btn').on('click',function(){
		var html = `<br><input type='file' name='file'>`
		$('form > input[type=file]:last').after(html)
	})
	$(document).on('change','input[type=file]',function(){
		console.log(this)
		readURL(this)
	})
</script>