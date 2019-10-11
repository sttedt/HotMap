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
		<div id="file_area">
		</div>
		<div id="image_area">
		</div>
		<input type='text' name='test1' value='test4'>
		<input type='submit' value='test'>
	</form>
	<img id="image_section" src="#" alt="your image">
	<div id='target'></div>
	<div id='target3'>ttttttttttttttt</div>
	<!-- <div style='background:url(http://dndnp4.dothome.co.kr/image/prT1moeJcIcajRObfjZrPz7rnVed3r.png);height:100px;width:100px;text-align:right;padding-right:10px'><a href='#'>X</a></div> -->
	<button type='button' id='btn'>테스트스트스트스트스트</button>
	<!-- <img src ='http://dndnp4.dothome.co.kr/image/prT1moeJcIcajRObfjZrPz7rnVed3r.png'> -->
	
</body>
<script src='resources/js/jquery-3.3.1.min.js'></script>
<script>
	function fileRemove(e){
		$(e).parent().remove()
		image_preview()
	}
	function image_preview(){
		$('#image_area').empty()
		$.each($('input[type=file]'),function(idx,item){
			readURL(item)	
		})
	}
	function readURL(input) {
	 if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  
	  reader.onload = function (e) {
		var html = "<div style='background:url(" + e.target.result + ");background-size:100px;height:100px;width:100px;display:inline-block;'></div>"
		$('#image_area').append(html)
		/* $('#image_section').attr('src', e.target.result); */  
	  }
	  reader.readAsDataURL(input.files[0]);
	  }
	}
	$('#btn').on('click',function(){
		/* var html = "<br><input type='file' name='file' id='"+img_num+"'>" */
		var file_html = "<p style='margin-bottom:0;'><input type='file' name='file'><a href='#' onclick='fileRemove(this)'>삭제</a></p>"
		/* $('form > input[type=file]:last').after(html) */
		$('#file_area').append(file_html)
	})
	$(document).on('change','input[type=file]',function(){
		image_preview()
	})
</script>