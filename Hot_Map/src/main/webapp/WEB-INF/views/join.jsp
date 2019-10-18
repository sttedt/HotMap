<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

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
			<input type="password"      id="pw_confirm"  placeholder="비밀번호 확인" class="form-control"><br>
			<div align="right">	
				<span id="pw_confirmMsg"></span>	
			</div>
			<div class="form-group input-group">	
				<input type="email"    name ="email"   id="email"  placeholder="이메일"   class="form-control">
				<label>&nbsp;</label>
				<input type="button" id='btn_email' class="btn btn-primary" value="메일인증">
			</div>
			<div class="form-group input-group" style='display:none;' id='emailAuthArea' >	
				<input type="text"    name ="emailAuth"   id="txt_emailAuth"  placeholder="인증번호입력"   class="form-control">
				<label>&nbsp;</label>
				<input type="button" id='btn_emailAuth' class="btn btn-primary" value="인증하기">
			</div>
			<div align="right">	
				<span id="emailMsg"></span>	
			</div>

			<div  class="form-group input-group">
				<input type="text"   name ="phone"  id="phone" placeholder="폰번호" class="form-control">
				<label>&nbsp;</label> 
				<input type="button" id="btn_phone"  class="btn btn-dark" value="인증번호받기">
			</div>
			<div class="form-group input-group" style="display: none;" id="checkOn">	
				<input type="text" class="form-control" id="phoneCheckEnd" name="phoneCheckEnd" placeholder="인증번호입력">
				<label>&nbsp;</label> 	
				<input type="button" class="btn btn-dark" id="phoneCheckEndButton" name = "phoneCheckEndButton" value="인증하기">
			</div>
			<div align="right">	
				<span id="phoneMsg"></span>	
			</div>
			
			<input type="submit" class="btn btn-dark" id="btn_join" value="회원가입">
		</form>
	</div>
<script>
	var isEmailAuth = false
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
 		 	$('#pw_confirm').keyup(function(){
 		 		confirm_pw();
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
 		});
		$('#btn_email').on('click',function(){
			var email = $('#email').val()
			SuccessMsg($('#emailMsg'),"메일 전송 중입니다..")
			$(this).prop('disabled',true)
			$.ajax({
				url : 'createAuth',
				type : 'post',
				data : {'email' : email},
				success : function(){
					SuccessMsg($('#emailMsg'),"인증 코드를 입력하세요.")
					$('#btn_email').removeAttr('disabled')
					alert('인증 코드가 전송되었습니다.')
					$('#emailAuthArea').show()
				}
			})
			
		})
		$('#btn_emailAuth').on('click', function(){
			var email = $('#email').val()
			var code = $('#txt_emailAuth').val()
			$.ajax({
				url : 'emailAuth',
				type : 'post',
				data : {email : email},
				success : function(result){
					if(result === code) {
						isEmailAuth = true
						alert('이메일 인증 완료!')
						$('#btn_email').prop('disabled',true)
						$('#btn_emailAuth').prop('disabled',true)
						$("#email").attr('readonly', true)
						$('#txt_emailAuth').attr('readonly', true)
					}else {
						alert('인증 코드를 확인하십시오.')
					}
				}
			})
		})
		function ErrorMsg(obj, msg) {
			obj.attr("class", "red");
			obj.html(msg);
		}
		
		function SuccessMsg(obj, msg) {
			obj.attr("class", "success");
			obj.html(msg);
		}
		
 		function a() {
 			if(checkId() && checkPw() &&
 					checkName(event) && checkEmail() && isEmailAuth) {
 				alert("내용 확인")
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
 		function confirm_pw(){
 			var Msg = $('#pw_confirmMsg');
 			var pw = $('#pw').val();
 			var confirm = $('#pw_confirm').val();
 			if(pw == ""){
 				ErrorMsg(Msg, "필수입니다");
 				Msg.css("color", "red");
 				return false;
  			}
 			else if(pw.length < 8){
 				ErrorMsg(Msg, "비밀번호는 8자리 이상입니다");
 				Msg.css("color", "red");
 				return false;
 			}
 			else if(pw !== confirm){
 				ErrorMsg(Msg, "비밀번호가 일치하지 않습니다.");
 				Msg.css("color", "red");
 				return false;
 			}
 			else {
 				SuccessMsg(Msg, "사용가능한 비밀번호 입니다");
 				Msg.css("color", "green");
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
			if(!isEmailAuth) {
				ErrorMasg(Msg,"메일 인증을 완료하십시오")
				$("#emailMsg").css("color", "red");
				return false;
			}
			return true;
		}

		$('#btn_phone').click(function(){	
			var phone = $('#phone').val();
			$('#checkOn').attr('style', 'display:show');
			$.ajax({
 					url : 'msgsend',
 					type : 'post',
 					data : {'phone' : phone},
					success : function(d){
						console.log(d)
						alert("문자메세지를 확인해주세요")
 					}
 				})
		})
		
		$('#phoneCheckEndButton').click(function(){	
			var phone = $('#phone').val();
			var phoneCheckEnd = $('#phoneCheckEnd').val();
			$.ajax({
 					url : 'msgCheck',
 					type : 'post',
 					data : {
 						'phone' : phone,
 						'phoneCheckEnd' : phoneCheckEnd
 						},
					success : function(data){
						if(data == 1 ){
 							alert("인증되었습니다.")
 							$('#phone').attr('readonly',true);
 							$('#phoneCheckEnd').attr('readonly',true);
 							$('#btn_phone').attr('style','display:none');
 							return true;
 						}else{
 							alert("인증번호가 틀렸습니다.")
 							return false;
 						}
 					}
 				})
		})
	
		</script>
</body>
