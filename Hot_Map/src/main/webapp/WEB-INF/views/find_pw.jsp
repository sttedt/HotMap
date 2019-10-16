<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">


<head>
<title>비밀번호찾기</title>
</head>

<body>
	<!-- 상단바 -->
	<jsp:include page="topbar2.jsp"></jsp:include>
	<hr>
	<div class="container" style="margin-top: 150px; max-width: 540px;">
		<div>
			<h3 style="text-align: center;">비밀번호 찾기</h3>
			<h6>이메일 인증을 통해서 비밀번호를 변경하세요</h6>
		</div>
		<br>
		<div>
			<form method="post">
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
<div>
			<a href="pwup?email=${find_pw.email}" class="btn btn-primary" >비밀번호 재설정</a>
		</div>
			<p class="w3-center">
<!-- 				<button type="button" onclick="history.go(-1);" -->
<!-- 					class="btn btn-dark" style="width: 512px; height: 47px; margin-top: 10px;">다음</button> -->
			</p>
		</form>

		</div>
	</div>
</body>

<script>

$('#btn_email').on('click',function(){
	var email = $('#email').val()
	$(this).prop('disabled',true)
	$.ajax({
		url : 'createAuth',
		type : 'post',
		data : {'email' : email},
		success : function(){
			$('#btn_email').removeAttr('disabled')
			alert('인증 코드가 전송되었습니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해 주세요.')
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
</script>


