<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<head>
<meta charset="UTF-8">
<title>Store</title>
<style>
.row {
	margin-left: 0;
}
</style>
</head>

<body>
	<!-- 상단바 -->
	<jsp:include page="topbar2.jsp"></jsp:include>

	<div class="container" style="width: 500px">
		<form action="store" method="post" enctype='multipart/form-data'>
			<div>
				<h3 style="text-align: center; margin-top: 20px;">매장 등록</h3>
				<hr>
			</div>
			이름 :<br /> <input type="text" name="name" class="form-control"
				required /> <br /> 
				메뉴 : <input type="text" name="menu"
				class="form-control" /> <br />
				가격 : <input type="text"
				name="price" class="form-control" /> <br />
				주소 : <input
				type="text" name="address" class="form-control" /> <br />
				전화번호 : <input
				type='tel' name="phone" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
				placeholder='000-0000-0000' class="form-control" /> <br />

			<div class='row'>
				<div class='form-group col-mb-6'>
					<label>오픈 시간</label> <input type="time" name="opening_time"
						placeholder='오픈시간' class="form-control col-mb-6" />
				</div>
				&nbsp;&nbsp;&nbsp;
				<div class='form-group col-mb-6'>
					<label>마감 시간</label> <input type="time" name="closing_time"
						placeholder='마감시간' class="form-control col-mb-6" />
				</div>
			</div>
			해시 태그 : <input type="text" name="hash" id="hash" class="form-control">
			매장 사진 : <input type="file" name="img1" class="form-control"/>
			<input type="file" name="img2" class="form-control"/>
			<input type="file" name="img3" class="form-control"/><br>
			작성자 :<input type="text" name="mem_id" value="${sessionScope.SID}"
				class="form-control" readonly="readonly" /> <br /> <input
				type="submit" value="글쓰기" class="btn btn-primary" />
		</form>
	</div>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$('input[name=address]').on('click',function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	$('input[name=address]').val(data.jibunAddress)
	        }
	    }).open();
	})
</script>
<script>
	$('#hash').kyeup(function(){
		checkHash(event);
	});
	function checkHash(){
		var hs = $('hash').val();
		
		
	}

</script>



















