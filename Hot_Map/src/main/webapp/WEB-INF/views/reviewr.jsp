<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>
	<!-- 상단바 -->
	
	<hr>
	<div class="container" style="margin-top: 15px; z-index: -9999;" >
		<div>
			<h3 style="text-align: left;">리뷰 (0) </h3>
			<br>
		</div>

		<table class="table" id='target' style="z-index: -9999;">
		
			<tbody>
				<c:forEach items="${r_list}" var="map">
					<tr>
<%-- 						<td>${map.Re_NO}</td> --%>
						<td rowspan="2">${map.mem_id}</td>
						<td style="font-size: 12px;">${map.Date}</td>
						
					</tr>
					<tr>
<!-- 					<td></td> -->
						<td>${map.Content}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
		</div>
	</div>
	
</body>
<script src='resources/js/jquery-3.3.1.min.js'></script>
<script src='resources/js/bootstrap.min.js'></script>
<script src='https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js'></script>
<script src='https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js'></script>
<script>
// 	$('#target').DataTable({
// 		order : [ [ 0, 'desc' ] ],
// 		ordering : true,
// 		serverSide : false
// 	})

// 	$(document).ready(function() {
// 		$('#target').DataTable()
// 	})
</script>
