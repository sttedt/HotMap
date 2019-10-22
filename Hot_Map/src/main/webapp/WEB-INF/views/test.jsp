<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<style>
.col-md-3{
  display: inline-block;
  margin-left:-4px;
}
.col-md-3 img{
  width:100%;
  height:auto;
}
body .carousel-indicators li{
  background-color:red;
}
body .carousel-control-prev-icon,
body .carousel-control-next-icon{
  background-color:red;
}
body .no-padding{
  padding-left: 0;
  padding-right: 0;
}
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

</style>
<head>
	<meta charset="UTF-8">style background image
	<title>test</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<body>
<img src="http://placeimg.com/640/480/any">
	<p></p>
	<form method='post' enctype='multipart/form-data'>
		<input type='text' name='test1' value='test1'><br>
		<input type='text' name='test1' value='test2'><br>
		<input type='text' name='test1' value='test3'><br>
		<div id="file_area">
		</div>
		<div id="image_area">
		</div>
		<input type='text' name='test1' value='test4'>
		<input type='text' name='removeImg'>
		
		<input type='submit' value='test'>
	</form>
	<img id="image_section" src="#" alt="your image">
	<div id='target'></div>
	<div id='target3'>ttttttttttttttt</div>
	<!-- <div style='background:url(http://dndnp4.dothome.co.kr/image/prT1moeJcIcajRObfjZrPz7rnVed3r.png);height:100px;width:100px;text-align:right;padding-right:10px'><a href='#'>X</a></div> -->
	<button type='button' id='btn'>테스트스트스트스트스트</button>
	<!-- <img src ='http://dndnp4.dothome.co.kr/image/prT1moeJcIcajRObfjZrPz7rnVed3r.png'> -->
	
	<div class="starRev">
  <span class="starR on" id='star1'>1</span>
  <span class="starR" id='star2'>2</span>
  <span class="starR" id='star3'>3</span>
  <span class="starR" id='star4'>4</span>
  <span class="starR" id='star5'>5</span>
	<input type='hidden' name='star' value=''>
</div>

</body>
<script src='resources/js/jquery-3.3.1.min.js'></script>
<script>
for(var i = 1 ;i < 6; i++){
	var st = '#star' + i
	$(st).on('click',function(){
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		console.log($(this).text())
	})
}
	

		$('#star1').on('click',function(){
			$('input[name=star]').val(1)
		})
		$('#star2').on('click',function(){
			$('input[name=star]').val(2)
		})
		$('#star3').on('click',function(){
			$('input[name=star]').val(3)
		})
		$('#star4').on('click',function(){
			$('input[name=star]').val(4)
		})
		$('#star5').on('click',function(){
			$('input[name=star]').val(5)
		})
		

	
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
	$('.starRev span').click(function(){
		
  
  return false;
});
</script>