<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>


</style>
<body>
	<!-- 상단바 -->
	
	<hr>
	<div class="container" style="margin-top: 15px; z-index: -9999;" >
	
		<div>
			<h3 style="text-align: left;">리뷰 (${reviewCount}) </h3>
			<br>
		</div>

		<table class="table" id='target' style="z-index: -9999;">
		
			<tbody>
				<c:forEach items="${r_list}" var="map" varStatus="status">
					<tr style="font-size: 12px;" >
						<td rowspan="3">${map.mem_id}</td>
						<td>
							<script>
								var starpoint = parseInt('${map.star}')
								for(var i = 0; i < starpoint; i++){
									document.write("<span class='starR on'></span>")
								}
								for(var i = 0; i < 5 - starpoint; i++){
									document.write("<span class='starR'></span>")
								}
								
							</script>
						</td>
						<td>작성시간 : ${map.Date}</td>
						
					</tr>
					<tr>
						<td>${map.Content}</td>
						<td></td>
					</tr>
					<tr>
						<td id='img${status.count}'>
							<script>
								var imgString = '${map.img}'
								var img = imgString.split(",")
								for(var i = 0; i < img.length; i++){
									var url = 'http://dndnp4.dothome.co.kr/image/' + img[i]
									if(img[i]) $("#img${status.count}").append("<div style='background:url(" + url +");background-size:100px;height:100px;width:100px;display:inline-block;margin-right:5px;' onclick='imgClick(\""+ img[i]+"\")'></div>")
								}
							</script>
						</td>
						<td style='vertical-align:bottom' align='right'>
							<script>
								var sessionID = '${sessionScope.SID}'
								var writer = '${map.mem_id}'
								var St_NO = '${detail.St_NO}'
								var Re_NO = '${map.Re_NO}'

								if(sessionID === writer) {
									var u_href = "/map/reviewu?St_NO=" + St_NO + "&Re_NO=" +Re_NO
									var d_href = "/map/reviewd?St_NO=" + St_NO + "&Re_NO=" +Re_NO
									document.write("<a href="+ u_href + ">수정</a>")
									document.write("<a href="+ d_href + ">삭제</a>")
								}
							</script>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
		</div>
	</div>
	
</body>

<script>

</script>
