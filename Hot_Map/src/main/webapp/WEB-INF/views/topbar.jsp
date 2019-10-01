<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<body>
	<jsp:include page="topbar2.jsp"></jsp:include>
	<!-- END header -->

	<section class="home-slider owl-carousel">
		<div class="slider-item"
			style="background-image: url('resources/img/hero_1.jpg');">

			<div class="container">
				<div
					class="row slider-text align-items-center justify-content-center">
					<div class="col-md-8 text-center col-sm-12 element-animate">
						<h1>hotmap</h1>
						<p class="mb-5">서면의 핫플</p>

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

	</section>

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
<script type="text/javascript" src='resources/js/jquery-3.3.1.min.js'></script>

<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/jquery.waypoints.min.js"></script>

<script src="resources/js/jquery.magnific-popup.min.js"></script>



<script src="resources/js/magnific-popup-options.js"></script>


<script src="resources/js/main.js"></script>

