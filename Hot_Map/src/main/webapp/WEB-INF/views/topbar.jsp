<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<link href="https://fonts.googleapis.com/css?family=Arvo|Kaushan+Script|Lobster|Yeon+Sung&display=swap&subset=latin-ext" rel="stylesheet">
<body>
	<header role="banner">
		<nav class="navbar navbar-expand-md navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="home" >HOP MAP</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarsExample05" aria-controls="navbarsExample05"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarsExample05">
					<ul class="navbar-nav ml-auto pl-lg-5 pl-0">
						<li class="nav-item"><a class="nav-link active"
							href="index.html">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="recipes.html">Recipes</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="services.html"
							id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">주류</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="services.html">소주</a> <a
									class="dropdown-item" href="services.html">맥주</a> <a
									class="dropdown-item" href="services.html">칵테일</a> <a
									class="dropdown-item" href="services.html">와인</a> <a
									class="dropdown-item" href="services.html">샴페인</a> <a
									class="dropdown-item" href="services.html">사케</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="services.html"
							id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">요리</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="services.html">한식</a> <a
									class="dropdown-item" href="services.html">중식</a> <a
									class="dropdown-item" href="services.html">일식</a> <a
									class="dropdown-item" href="services.html">양식</a>
							</div></li>
						<li class="nav-item"><a class="nav-link" href="news.html">News</a>
						</li>
					</ul>
					<div style="margin-left: 93px">
						<form>
							<ul class="list-inline">
								<c:if test="${sessionScope.SID eq null}">
									<li class="list-inline-item"><a class="list-inline-item"
										href="login"
										style="color: #fff; text-decoration: none; margin-top: 15px;">
											LOGIN </a> &nbsp;</li>
									<li class="list-inline-item"><a class="list-inline-item"
										href="join" style="color: #fff; text-decoration: none;">
											JOIN </a>&nbsp;</li>
									<li class="list-inline-item"><a class="list-inline-item"
										href="board" style="color: #fff; text-decoration: none;">
											Q & A</a> &nbsp;</li>
								</c:if>

								<c:if test="${sessionScope.SID ne null}">
									<li class="list-inline-item"><a class="list-inline-item"
										style="color: #fff; text-decoration: none; margin-top: 15px;">
											${sessionScope.SID} 님</a> &nbsp;</li>
									<li class="list-inline-item"><a class="list-inline-item"
										href="logout" style="color: #fff; text-decoration: none;">
											LOGOUT</a> &nbsp;</li>
									<li class="list-inline-item"><a class="list-inline-item"
										href="profile" style="color: #fff; text-decoration: none;">
											MY PAGE </a> &nbsp;</li>
									<li class="list-inline-item"><a class="list-inline-item"
										href="store" style="color: #fff; text-decoration: none;">
											STORE</a> &nbsp;</li>
									<c:if test="${sessionScope.SLEV eq 'ADMIN'}">
										<li class="list-inline-item"><a class="list-inline-item"
											href="admin" style="color: #fff; text-decoration: none;">
												ADMIN </a>&nbsp;</li>
									</c:if>
									<li class="list-inline-item"><a class="list-inline-item"
										href="board" style="color: #fff; text-decoration: none;">
											Q & A</a> &nbsp;</li>
								</c:if>
							</ul>
						</form>

						<div style="">
							<input type="text" class="nav-item"
								style="max-width: 200px; display: inline-block;"
								placeholder="want를 검색하세요"> <input type="submit"
								class="btn btn-white btn-outline-white" value="search">
						</div>
					</div>
				</div>
			</div>
		</nav>
	</header>
		<div style="background-image: url('resources/img/123123.jpg'); background-repeat:no-repeat; height: 760px" >
		
			<div class="container">
				<div class="row slider-text align-items-center justify-content-center">
					<div class="col-md-8 text-center col-sm-12 element-animate">
 						<h1 style="margin-top: 300; color: #fff; font-family: 'Kaushan Script', cursive;">HOP MAP</h1>
						<p class="mb-5" style="color: #fff;">서면의 핫플</p>
					</div>
				</div>
			</div>
		</div>
		<!--       <div class="slider-item" style="background-image: url('resources/img/hero_2.jpg');"> -->
		<!--         <div class="container"> -->
		<!--           <div class="row slider-text align-items-center justify-content-center"> -->
		<!--             <div class="col-md-8 text-center col-sm-12 element-animate"> -->
		<!--               <h1>Delecious Food</h1> -->
		<!--               <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi unde impedit, necessitatibus, soluta sit quam minima expedita atque corrupti reiciendis.</p> -->
		<!--               <p><a href="#" class="btn btn-white btn-outline-white">Get Started</a></p> -->
		<!--             </div> -->
		<!--           </div> -->
		<!--         </div> -->

		<!--       </div> -->
	<!-- Navigation -->
	<!-- <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top" > -->
	<!-- 	<div> -->
	<!-- 		<a href="home" style="text-decoration:none; font-size:70px; display: inline-block;" >HotMap</a><br> -->
	<!-- 		<input type="text" class="form-control" style="max-width: 200px; display: inline-block;" placeholder="search">  -->
	<!-- 		<input type="button" class="btn btn-light" style="margin-top:-5px" value="검색"> -->
	<!-- 	</div> -->
	<!-- 	<div class="collapse navbar-collapse" id="navbarResponsive"> -->
	<!-- 		<form> -->
	<!-- 			<ul class="list-inline"> -->
	<%-- 				<c:if test="${sessionScope.SID eq null}"> --%>
	<!-- 					<li class="list-inline-item"> -->
	<!-- 						<a class="list-inline-item" href="login" style="color:#fff; text-decoration: none; margin-top:15px;"> LOGIN </a> &nbsp; -->
	<!-- 					</li>  -->
	<!-- 					<li class="list-inline-item"> -->
	<!-- 						<a class="list-inline-item" href="join"  style="color:#fff; text-decoration: none;"> JOIN </a>&nbsp; -->
	<!-- 					</li> -->
	<!-- 					<li class="list-inline-item"> -->
	<!-- 						<a class="list-inline-item" href="board"  style="color:#fff; text-decoration: none;"> Q & A</a> &nbsp; -->
	<!-- 					</li> -->
	<%-- 				</c:if> --%>

	<%-- 				<c:if test="${sessionScope.SID ne null}"> --%>
	<!-- 					<li class="list-inline-item"> -->
	<%-- 						<a class="list-inline-item" style="color:#fff; text-decoration: none; margin-top:15px;"> ${sessionScope.SID} 님</a> &nbsp; --%>
	<!-- 					</li> -->
	<!-- 					<li class="list-inline-item"> -->
	<!-- 						<a class="list-inline-item" href="logout"  style="color:#fff; text-decoration: none; "> LOGOUT</a> &nbsp;  -->
	<!-- 					</li> -->
	<!-- 					<li class="list-inline-item"> -->
	<!-- 						<a class="list-inline-item" href="profile" style="color:#fff; text-decoration: none;"> MY PAGE </a> &nbsp;  -->
	<!-- 					</li> -->
	<!-- 					<li class="list-inline-item"> -->
	<!-- 						<a class="list-inline-item" href="store" style="color:#fff; text-decoration: none;"> STORE</a> &nbsp;  -->
	<!-- 					</li> -->
	<%-- 					<c:if test="${sessionScope.SLEV eq 'ADMIN'}"> --%>
	<!-- 						<li class="list-inline-item"> -->
	<!-- 							<a class="list-inline-item" href="admin"   style="color:#fff; text-decoration: none;"> ADMIN </a>&nbsp; -->
	<!-- 						</li> -->
	<%-- 					</c:if>  --%>
	<!-- 					<li class="list-inline-item"> -->
	<!-- 						<a class="list-inline-item" href="board"   style="color:#fff; text-decoration: none;"> Q & A</a> &nbsp; -->
	<!-- 					</li> -->
	<%-- 				</c:if> --%>
	<!-- 			</ul> -->
	<!-- 		</form> -->
	<!-- 	</div> -->

	<!-- </nav> -->


</body>
<script src='resources/js/jquery-3.3.1.min.js'></script>
<script src="resources/js/jquery.waypoints.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>

<script src="resources/js/jquery.waypoints.min.js"></script>

<script src="resources/js/jquery.magnific-popup.min.js"></script>



<script src="resources/js/magnific-popup-options.js"></script>
<script src="resources/js/main.js"></script>
<script src="resources/js/main.js"></script>

