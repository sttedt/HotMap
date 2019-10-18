<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
	<meta charset="UTF-8">
	<title>비밀번호 재설정</title>
</head>
<body>
<!-- 상단바 -->
<jsp:include page="topbar2.jsp"></jsp:include>

	<div class="container">
		<form method = "post">
			<div>
				<h3 style="text-align: center;">
					비밀번호 재설정
				</h3>
				<hr>
			</div>	
			<br /> 
			<input type="hidden" name="email" class="form-control" value="${pwup.email}"/>
			<br />
<%-- 			아이디 :<input type="text" name="id" value="${sessionScope.SID}" class="form-control" readonly="readonly"/> --%>
<!-- 			<br /> -->
			비밀번호 :<br /> 
			<input type="password" name="pw" id ='pw' class="form-control" value='' />
			<div align="left">	
				<span id="pwMsg"></span>	
			</div>
			비밀번호 확인 :<br /> 
			<input type="password" name="pw_check" id='pw_check' class="form-control" />
			<div align="left">	
				<span id="pwChkMsg"></span>	
			</div>
			<br />
<!-- 			이름 :<br />  -->
<%-- 			<input type="text" name="Name" class="form-control" value="${profileup.Name}"/> --%>
<!-- 			<br /> -->
			<button id='btn_submit' class="btn btn-dark" type='button'>수정하기</button>
			
		</form>
	</div>
</body>

<script>
var isPwcheck = false
function setMsg(obj, msg, color) {
	obj.css('color', color)
	obj.html(msg);
}

$('#pw').on('keyup',function(){
	var pw = $('#pw').val()
	var msg = $("#pwMsg")
	if(pw === "") {
		setMsg(msg, "비밀번호를 입력해주세요.", "red")
		isPwcheck = false
	}else if(pw.length < 8) {
		setMsg(msg, "비밀번호는 8자리 이상 입력해주세요.", "red")
		isPwcheck = false
	}else {
		setMsg(msg, "사용가능한 비밀번호 입니다.", "green")
		isPwcheck = true
	}
})
$('#pw_check').on('keyup',function(){
	var pw = $('#pw').val()
	var pw_check = $('#pw_check').val()
	var msg = $("#pwChkMsg")
	
	if(pw !== pw_check) {
		setMsg(msg,'비밀번호가 일치하지 않습니다.','red')
		isPwcheck = false
	}else {
		setMsg(msg,'비밀번호가 일치합니다.','green')
		isPwcheck = true
	}
})
$('#btn_submit').on('click',function(){
	if(isPwcheck) $('form').submit()
	else return false
})
</script>