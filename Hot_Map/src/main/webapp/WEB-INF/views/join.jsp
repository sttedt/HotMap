<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<head>
	<title>회원가입</title>
</head>


<body>
	<!-- 상단바 -->
	<jsp:include page="topbar.jsp"></jsp:include>

	<hr>
	<div class="container" style="max-width: 540px">
		<form method="post">
			<input type="text"     name ="id"      id="mem_id"  placeholder="아이디"  class="form-control"><br>
			<div align="right">	
				<span id="idMsg"></span>	
			</div>
			<input type="text"     name ="name"    id="mem_name"  placeholder="이름"    class="form-control"><br>
			<div align="right">	
				<span id="nameMsg"></span>	
			</div>
			<input type="password" name ="pw"      id="mem_pw"  placeholder="비밀번호" class="form-control"><br>
			<div align="right">	
				<span id="pwMsg"></span>	
			</div>
			<input type="email"    name ="email"   id="mem_email"  placeholder="이메일"   class="form-control"><br>
			<div align="right">	
				<span id="emailMsg"></span>	
			</div>
			<div class="form-group input-group">
				<input type="text" id="mem_postcode" path="mem_postcode" class="form-control" placeholder="우편번호" readonly="true"/>
				<label>&nbsp;</label> 
				<input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-primary btn-sm" value="우편번호검색" />
			</div>
			<div class="form-group input-group">
				<input type="text" path="mem_address1" id="mem_address1" class="form-control" placeholder="주소" readonly="true"/>
			</div>

			<div class="form-group input-group" style="margin-bottom: 5px">
				<input type="text" path="mem_address2" id="mem_address2" style="width: 300px; border: 1px; border-bottom: 1px solid #4ABECA;" placeholder="상세주소" />
			</div>
			<div align="right">
				<span id="addressMsg" ></span>	
			</div>
			<input type="number"   name ="phone"   id="mem_phone" placeholder="폰번호"   class="form-control"><br>
			<div align="right">	
				<span id="phoneMsg"></span>	
			</div>	
			<input type="submit" class="btn btn-primary" id="btn_join" value="회원가입">
		</form>
	</div>
	
	
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<script>
		$(function(){
			$('#btn_join').click(function() {
				if(a()) {
					$('#btn_join').attr('type', 'submit');
				}
				else {
					return false;
				}
			});
			
			$('#mem_id').keyup(function(){
				checkId();
			});
		 	$('#mem_pw').keyup(function(){
		 		checkPw();
		 	});
			$("#mem_name").keyup(function(){
				checkName(event);
			});
		 	$('#mem_age').keyup(function(){
		 		checkAge();
		 	});	
			$('#mem_email').keyup(function(){
				checkEmail();
			});
		});
		
		
		function a() {
			if(checkId() && checkPw() &&
					checkName(event) && checkEmail() && checkAddress() ) {
				return true;
			} else {
				return false;
			}
		}
			
		function checkId() {
			var Msg = $('#idMsg');
			var id = $('#mem_id').val();
			
			if(id == ""){
				ErrorMsg(Msg, "필수입니다");
				return false;
			}
			else if(id.length>1 && id.length<6){
				ErrorMsg(Msg, "아이디는 6자리 이상입니다");
				return false;
			}
			else if(id.length > 5){
				if(id.length>12) {
					ErrorMsg(Msg, "아이디는 12자리를 넘을수 없습니다.");
					return false
				}
				$.get('ajax_id_check.do?mem_id=' + id, function(data) {
					if (data.ret == 'n') {
						SuccessMsg(Msg, "사용가능합니다");
						return true;
					} else if(data.ret == 'y') {
						ErrorMsg(Msg, "사용중인 아이디입니다.");
						return false;
					}
					//console.log(data);
				}, 'json');
			}
			return true;
		}
			
		function checkPw(){
			var Msg = $('#pwMsg');
			var pw = $('#mem_pw').val();
			if(pw == ""){
				ErrorMsg(Msg, "필수입니다");
				return false;
			}
			else if(pw.length < 8){
				ErrorMsg(Msg, "비밀번호는 8자리 이상입니다");
				return false;
			}
			else {
				SuccessMsg(Msg, "사용가능한 비밀번호 입니다");
				return true;
			}
			return true;
		}
	
		function checkName(event) {
			regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
			//v = $(this).val();
			
			var Msg = $('#nameMsg');
			var name = $('#mem_name').val();
			
			if(name == "") {
				ErrorMsg(Msg, "필수입니다.");
				return false;
			}
			if( regexp.test(name) ) {
				ErrorMsg(Msg, "한글만 입력가능합니다.");
				$('#mem_name').val("");
				//$(this).val(name.replace(regexp,''));
				return false;
			}
			else if(name != ""){
				SuccessMsg(Msg, "OK!");
				return true;
			}
			return true;
		}
			 
		function checkEmail(){
			var Msg = $('#emailMsg');
			var email = $('#mem_email').val();
			if(email  == "") {
				ErrorMsg(Msg, "필수입니다");
				return false;
			}
			else {
				SuccessMsg(Msg, "OK!");
				return true;
			}
			return true;
		}
		
		function checkAddress() {
			var Msg = $('#addressMsg');
			var postcode = $('#mem_postcode').val();
			var address1 = $('#mem_address1').val();
			var address2 = $('#mem_address2').val();
			if( (postcode == "") && (address1 == "") && (address2=="") ) {
				ErrorMsg(Msg, "주소를 입력하세요");
				return false;
			}
			else {
				SuccessMsg(Msg, "OK!");
				return true;
			}
			return true;
		}
		
		function ErrorMsg(obj, msg) {
			obj.attr("class", "red");
			obj.html(msg);
		}
		
		function SuccessMsg(obj, msg) {
			obj.attr("class", "success");
			obj.html(msg);
		}
		
		
		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if(data.userSelectedType === 'R'){
						//법정동명이 있을 경우 추가한다.
						if(data.bname !== ''){
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if(data.buildingName !== ''){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('mem_postcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('mem_address1').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('mem_address2').focus();
				}
			}).open();
		}
	</script>
</body>
