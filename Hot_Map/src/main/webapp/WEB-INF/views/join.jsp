<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<head>
	<title>회원가입</title>
</head>


<body>
	<!-- 상단바 -->
	<jsp:include page="topbar2.jsp"></jsp:include>

	<hr>
	<div class="container" style="max-width: 540px">
	<div>
			<h3 style="text-align: center; ">회원가입</h3>
		</div>
		<form method="post">
			<input type="text"     name ="id"      id="id"  placeholder="아이디"  class="form-control"><br>
			<div align="right">	
				<span id="idMsg"></span>	
			</div>
			<input type="text"     name ="name"    id="name"  placeholder="이름"    class="form-control"><br>
			<div align="right">	
				<span id="nameMsg"></span>	
			</div>
			<input type="password" name ="pw"      id="pw"  placeholder="비밀번호" class="form-control"><br>
			<div align="right">	
				<span id="pwMsg"></span>	
			</div>
			<div class="form-group input-group">	
				<input type="email"    name ="email"   id="email"  placeholder="이메일"   class="form-control">
				<label>&nbsp;</label>
				<input type="button" class="btn btn-primary" value="메일인증">
			</div>
			<div align="right">	
				<span id="emailMsg"></span>	
			</div>
			
			
			
			
			<div  class="form-group input-group">
				<input type="number"   name ="phone"   id="phone" placeholder="폰번호" class="form-control">
				<label>&nbsp;</label> 
				<input type="button" id="btn_phone" class="btn btn-dark" value="인증번호받기">
			</div>
			<div class="form-group input-group" style="display: none;" id="checkOn">	
				<input type="text" class="form-control" id="###" placeholder="인증번호입력">
				<label>&nbsp;</label> 	
				<input type="button" class="btn btn-dark" name = "phoneCheck1" value="인증하기">
			</div>
			<div align="right">	
				<span id="phoneMsg"></span>	
			</div>
			
			
			
			
			
				
			<input type="submit" class="btn btn-dark" id="btn_join" value="회원가입">
		</form>
	</div>
	
<<<<<<< HEAD
	
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
=======
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
>>>>>>> branch 'master' of https://github.com/sttedt/HotMap.git
	
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
			
 			$('#id').keyup(function(){
 				checkId();
 			});
 		 	$('#pw').keyup(function(){
 		 		checkPw();
 		 	});
 			$("#name").keyup(function(){
 				checkName(event);
 			});
 		 	$('#age').keyup(function(){
 		 		checkAge();
 		 	});	
 			$('#email').keyup(function(){
 				checkEmail();
 			});
 			$('#btn_phone').click(function(){
 				phoneCheck();
 			});
 		});
		
		
 		function a() {
 			if(checkId() && checkPw() &&
 					checkName(event) && checkEmail() ) {
 				return true;
 			} else {
 				return false;
 			}
 		}
			
 		function checkId() {
 			var Msg = $('#idMsg');
 			var id = $('#id').val();
			
 			if(id == ""){
 				ErrorMsg(Msg, "필수입니다");
				$("#idMsg").css("color", "red");
 				return false;
 			}
 			else if(id.length>1 && id.length<6){
 				ErrorMsg(Msg, "아이디는 6자리 이상입니다");
 				$("#idMsg").css("color", "red");
 				return false;
 			}
			else if(id.length > 5){
 				if(id.length>12) {
 					ErrorMsg(Msg, "아이디는 12자리를 넘을수 없습니다.");
 					$("#idMsg").css("color", "red");
					return false
 				}
				$.ajax({
 					url : 'ajax_id_check?id=' + id,
 					type : 'get',
					success : function(data){
						
 						if(data == 1 ){
 							ErrorMsg(Msg, "중복된 아이디 입니다.");
 							$("#idMsg").css("color", "red");
 							return false;
 						}else{
 							SuccessMsg(Msg, "사용가능한 아이디 입니다.");
 							$("#idMsg").css("color", "green");
 							return true;
 						}
 					}
 				})

 			}
 			return true;
 		}
			
 		function checkPw(){
 			var Msg = $('#pwMsg');
 			var pw = $('#pw').val();
 			if(pw == ""){
 				ErrorMsg(Msg, "필수입니다");
 				$("#pwMsg").css("color", "red");
 				return false;
  			}
 			else if(pw.length < 8){
 				ErrorMsg(Msg, "비밀번호는 8자리 이상입니다");
 				$("#pwMsg").css("color", "red");
 				return false;
 			}
 			else {
 				SuccessMsg(Msg, "사용가능한 비밀번호 입니다");
 				$("#pwMsg").css("color", "green");
 				return true;
 			}
 			return true;
 		}
	
 		function checkName(event) {
 			regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
  			//v = $(this).val();
			
 			var Msg = $('#nameMsg');
 			var name = $('#name').val();
			
 			if(name == "") {
 				ErrorMsg(Msg, "필수입니다.");
 				$("#nameMsg").css("color", "red");
			return false;
 			}
 			if( regexp.test(name) ) {
 				ErrorMsg(Msg, "한글만 입력가능합니다.");
 				$("#nameMsg").css("color", "red");
				$('#name').val("");
				//$(this).val(name.replace(regexp,''));
 				return false;
 			}
 			else if(name != ""){
 				SuccessMsg(Msg, "OK!");
				$("#nameMsg").css("color", "green");
				return true;
			}
			return true;
		}
		
		function checkEmail(){
			var Msg = $('#emailMsg');
			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			var email = $('#email').val();
			if(email == ""){
				ErrorMsg(Msg, "필수입니다");
			$("#emailMsg").css("color", "red");
				return false;
			}
			if(exptext.test(email)  == false)
				 {
					ErrorMsg(Msg, "형식이 맞지 않습니다.");
					$("#emailMsg").css("color", "red");
					return false;
				}
			else {
				SuccessMsg(Msg, "OK!");
				$("#emailMsg").css("color", "green");
				return true;
			}
			return true;
		}
		function phoneCheck(){
			$('#checkOn').attr('style', 'display:show');
			alert("인증번호가 전송되었습니다.")
			
			$.ajax({
 					url : 'msgsend?phone=' + phone,
 					type : 'get',
 					data : {'phone' : 'phone'},
					success : function(data){
						alert("전송됬다!")
//  						if(data == 1 ){
//  							alert("인증 완료되었습니다.");
//  							$('#checkOn').attr('style', 'display:none');
//  							return true;
//  						}else{
//  							alert("인증번호가 틀렸습니다.");
//  							return false;
//  						}
 					}
 				})
		}
		</script>
</body>
