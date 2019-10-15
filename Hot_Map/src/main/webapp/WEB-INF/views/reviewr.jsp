<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
					<tr>
						<td rowspan="3">${map.mem_id}</td>
						<td style="font-size: 12px;">${map.Date}</td>
						
					</tr>
					<tr>
						<td>${map.Content}</td>
					</tr>
					<tr>
						<td id='img${status.count}'>
							<script>
								var imgString = '${map.img}'
								var img = imgString.split(",")
								for(var i = 0; i < img.length; i++){
									var url = 'http://dndnp4.dothome.co.kr/image/' + img[i]
									if(img[i]) $("#img${status.count}").append("<div style='background:url(" + url +");background-size:100px;height:100px;width:100px;display:inline-block;margin-right:5px;'></div>")
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
