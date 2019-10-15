<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</style>
<head>
	<title>store</title>
</head>
<body>
<!-- 상단바 -->
<jsp:include page="topbar2.jsp"></jsp:include>

	<div class="container" >
	<div id="demo" class="carousel slide" data-ride="carousel" style="z-index: -9999">

  <!-- Indicators -->
  <ul class="carousel-indicators" >
		<script>
		var cnt = parseInt('${slide_page_cnt}');
		
		for(var i = 0 ; i < cnt; i++){
			if(i == 0) document.write("<li data-target='#demo' data-slide-to='" + i + "' class='active'></li>")
			else document.write("<li data-target='#demo' data-slide-to='" + i + "'></li>")
		}
		</script>

  </ul>
  
  <!-- The slideshow -->
  <div class="container carousel-inner no-padding" >
	<script>
		var cnt = parseInt('${slide_page_cnt}');
		var img_cnt = parseInt('${slide_img_cnt}');
		var imglist = '${imglist}'
		imglist = imglist.replace('[', '').replace(']', '');
		imglist = imglist.split(', ');


		for(var i = 0; i<cnt ;i++){
			if(i == 0 ) document.write("<div class='carousel-item active'>")
			else document.write("<div class='carousel-item'>")

			for(var j = img_cnt * i ; j <= img_cnt * (i + 1) - 1; j++ ){
				console.log(i, j)
				if(imglist[j]) {
					document.write("<div class='col-xs-3 col-sm-3 col-md-3'>")
					document.write("<img src='http://dndnp4.dothome.co.kr/image/" + imglist[j] +"'>")
					document.write("</div>")
				}
			}
			document.write("</div>")
		}
	</script>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
<!--슬라이드  -->
		<div>
			<br>
			<span style="text-align: left; color: #000000; font-size: 24px;" >
				${detail.name}
			</span>
			<div style="text-align: right;">
				<a href="review?St_NO=${detail.St_NO}" class="btn btn-dark">리뷰쓰기</a>
			</div>
			<br>
		</div>	
		
		<table class="table">
			<tbody>
		
				<tr>	
					<th>주소</th>
					<td>${detail.address}</td>
				</tr>
				<tr>	
					<th>가게번호</th>
					<td>${detail.phone}</td>
				</tr>
				<tr>
					<th>음식종류</th>
					<td>${detail.menu}</td>
				</tr>
				<tr>
					<th>가격대</th>
					<td>${detail.price}</td>
				</tr>
				<tr>
					<th>평점</th>
					<td>${detail.star}</td>
				</tr>
				<tr>
					<th>태그</th>
					<td id="tag">
						<script>
						 	var taglist = '${detail.tag}';
							var tagOne = taglist.split(',');
						 	 for ( var i in tagOne ) {
						         document.write( '<a href="search?search=' + encodeURIComponent(tagOne[i]) + '" name="search">' + tagOne [i]+ ', ' + '</a>' );
						       }
						</script>
					</td>
				</tr>
				<tr>	
					<th>오픈시간</th>
					<td>${detail.opening_time}</td>
				</tr>
				<tr>	
					<th>마감시간</th>
					<td>${detail.closing_time}</td>
				</tr>
				<tr>	
					<th>조회수</th>
					<td>${detail.hit}</td>
				</tr>
			
				<tr>	
					<th>최근업데이트</th>
					<td>${detail.date}</td>
				</tr>
				
			</tbody>
		</table>
		<div  style="text-align: center;">
			<a href="home" class="btn btn-dark">목록</a>
		</div>
	</div>
	
	<jsp:include page="reviewr.jsp"></jsp:include>
</body>


