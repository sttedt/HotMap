<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<head>
	<title>로그인</title>
</head>

<body>
	<!-- 상단바 -->
	<jsp:include page="topbar2.jsp"></jsp:include>
	<hr>
	<div class="container" style="margin-top: 150px; max-width: 540px;">
	<div>
			<h3 style="text-align: center; ">로그인</h3>
		</div>
	
		<form method="post">
			<div class="form-group">
				<input type="text" class="form-control" name="id" id="id" aria-describedby="emailHelp" placeholder="id">

			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="pw" id="pw" placeholder="Password" onkeypress="caps_lock(event)"/>
				<p id="capslock" style="position:relative; border:2px solid #003b83; width:300px; bottom:0px; display:none"> 
   				 &nbsp;<b>CapsLock</b> 키가 눌려 있어용&nbsp;
				</p>
			</div>
		<button type="submit" class="btn btn-dark" style="width: 512px; height: 47px;">로그인</button>
		</form>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	

</body>

<script>

	function caps_lock(e) {
	    var keyCode = 0;
	    var shiftKey = false;
	    keyCode = e.keyCode;
	    shiftKey = e.shiftKey;
	    if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
	            || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
	        show_caps_lock();
	        setTimeout("hide_caps_lock()", 3500);
	    } else {
	        hide_caps_lock();
	    }
	}
	
	function show_caps_lock() {
	 $("#capslock").show();
	}
	
	function hide_caps_lock() {
	 $("#capslock").hide();
	}
	



</script>

	/* var html = `<div class="container" style="max-width: 540px;">
		<form method="post">
	<div class="form-group">
		<input type="text" class="form-control" name="id" id="id" aria-describedby="emailHelp" placeholder="id">
	</div>
	<div class="form-group">
		<input type="password" class="form-control" name="pw" id="pw" placeholder="Password">
	</div>
<button type="submit" class="btn btn-primary">로그인</button>
</form>
</div>` */
