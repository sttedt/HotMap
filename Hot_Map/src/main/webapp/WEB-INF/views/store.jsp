<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<head>
<meta charset="UTF-8">
<title>Store</title>
<style>
.row {
	margin-left: 0;
}
</style>
<style>
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

ul {
	padding: 16px 0;
}

ul li {
	display: inline-block;
	margin: 0 5px;
	font-size: 14px;
	letter-spacing: -.5px;
}

form {
	padding-top: 16px;
}

ul li.tag-item {
	padding: 4px 8px;
	background-color: #708aff;
	color: #FFF;
}

.tag-item:hover {
	background-color: #8d91fc;
	color: #FFF;
}

.del-btn {
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 8px;
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
			이름 :<br /> 
			<input type="text" name="name" class="form-control"	required /> <br /> 
			메뉴 : 
			<input type="text" name="menu"	class="form-control" /> <br /> 
			가격 : 
			<input type="text"	name="price" class="form-control" /> <br /> 
			주소 : 
			<input	type="text" name="address" class="form-control" /> <br /> 
			전화번호 : 
			<input type='tel' name="phone" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"	placeholder='000-0000-0000' class="form-control" /> <br />

			<div class='row' style="margin-left:0;">
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
			<ul id="hash3" style="padding: 0;">해시 태그 :	</ul>
			<input type="text" name="hash" id="hash" class="form-control" value="">
			<div id="tag2" style="display: none"></div>

			사진첨부 : <br>
			<button type='button' id='add_img'> 이미지 추가 </button>
			<div id="file_area"></div>
			<div id="image_area"></div>
			<!-- <input type="file" name="img1" class="form-control"/>
			<input type="file" name="img2" class="form-control"/>
			<input type="file" name="img3" class="form-control"/><br> -->
			작성자 : <input type="text" name="mem_id" value="${sessionScope.SID}"	class="form-control" readonly="readonly" /> <br />
			<input type="submit" value="글쓰기" class="btn btn-primary" />
		</form>
	</div>
</body>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
	$('input[name=address]').on('click', function() {
		new daum.Postcode({
			oncomplete : function(data) {
				$('input[name=address]').val(data.jibunAddress)
			}
		}).open();
	})
	$(document)
			.ready(
					function() {

						var tag = {};
						var counter = 0;

						// 태그를 추가한다.
						function addTag(value) {
							tag[counter] = value; // 태그를 Object 안에 추가
							counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
						}

						// 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
						function marginTag() {
							return Object.values(tag).filter(function(word) {
								return word !== "";
							});
						}

						$("#hash")
								.on(
										"keypress",
										function(e) {
											var self = $(this);

											// input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
											if (e.key === "Enter"
													|| e.keyCode == 32) {

												var tagValue = self.val(); // 값 가져오기

												// 값이 없으면 동작 ㄴㄴ
												if (tagValue !== "") {

													// 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
													var result = Object
															.values(tag)
															.filter(
																	function(
																			word) {
																		return word === tagValue;
																	})

													// 태그 중복 검사
													if (result.length == 0) {
														$("#hash3")
																.append(
																		"<li class='tag-item'>"
																				+ tagValue
																				+ "<span class='del-btn' idx='"+counter+"'>x</span></li>");
														$("#tag2")
																.append(
																		"<input type='hidden' class='tag-item' name='tag_end' value='"+tagValue+"'>");
														addTag(tagValue);
														self.val("");
													} else {
														alert("태그값이 중복됩니다.");
													}
												}
												e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
											}
										});

						// 삭제 버튼 
						// 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
						$(document).on("click", ".del-btn", function(e) {
							var index = $(this).attr("idx");
							tag[index] = "";
							$(this).parent().remove();
						});
					})
</script>




















