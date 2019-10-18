<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
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
	<meta charset="UTF-8">
	<title>리뷰</title>
</head>
<body>
<!-- 상단바 -->
<jsp:include page="topbar2.jsp"></jsp:include>

	<div class="container">
		<form action="review" method = "post" enctype='multipart/form-data'>
			<div>
				<h3 style="text-align: center; color: #ffc107">
					${detail.name}
				</h3>
				<h3 style="text-align: center;">
					에 대한 솔직한 리뷰를 써주세요 
				</h3>
				<hr>
			</div>	
<!-- 			제목 :<br />  -->
<!-- 			<input type="text" name="title" class="form-control"/> -->
			작성자 :<input type="text" name="mem_id" value="${sessionScope.SID}" class="form-control" readonly="readonly"/>
			<br />
			<input type="hidden" name="St_NO" value="${detail.St_NO}">
			내용 : <textarea rows="6" name="content" class="form-control" placeholder="주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"></textarea>
			<br /> 
			별점 : 
			<div class="starRev">
				<span class="starR on" id='star1'></span>
				<span class="starR" id='star2'></span>
				<span class="starR" id='star3'></span>
				<span class="starR" id='star4'></span>
				<span class="starR" id='star5'></span>
				
			</div>
			<input type='hidden' name='star' value=''>
			<br />
			사진첨부 : <br>
			<button type='button' id='add_img'> 이미지 추가 </button>
			<div id="file_area"></div>
			<div id="image_area"></div>
			<br /> 
			<input type="submit" value="글쓰기" class="btn btn-primary"/>
		</form>
	</div>
</body>
<script>
$('#star1').on('click',function(){
	$('input[name=star]').val(1)
	$(this).parent().children('span').removeClass('on');
	$(this).addClass('on').prevAll('span').addClass('on');
})
$('#star2').on('click',function(){
	$('input[name=star]').val(2)
	$(this).parent().children('span').removeClass('on');
	$(this).addClass('on').prevAll('span').addClass('on');
})
$('#star3').on('click',function(){
	$('input[name=star]').val(3)
	$(this).parent().children('span').removeClass('on');
	$(this).addClass('on').prevAll('span').addClass('on');
})
$('#star4').on('click',function(){
	$('input[name=star]').val(4)
	$(this).parent().children('span').removeClass('on');
	$(this).addClass('on').prevAll('span').addClass('on');
})
$('#star5').on('click',function(){
	$('input[name=star]').val(5)
	$(this).parent().children('span').removeClass('on');
	$(this).addClass('on').prevAll('span').addClass('on');
})



function fileRemove(e) {
	$(e).parent().remove()
	image_preview()
}
function image_preview() {
	$('#image_area').empty()
	$.each($('input[type=file]'), function(idx, item) {
		readURL(item)
	})
}
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			var html = "<div style='background:url("
					+ e.target.result
					+ ");background-size:100px;height:100px;width:100px;display:inline-block;'></div>"
			$('#image_area').append(html)
		}
		reader.readAsDataURL(input.files[0]);
	}
}
$('#add_img').on('click',function() {
	var file_html = "<p class='row' style='margin-bottom:0; margin-left:0'><input type='file' name='file'><a class='btn btn-primary' onclick='fileRemove(this)'>삭제</a></p>"
	$('#file_area').append(file_html)
})
$(document).on('change', 'input[type=file]', function() {
	image_preview()
})
</script>