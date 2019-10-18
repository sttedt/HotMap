<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800" rel="stylesheet">
<link rel="stylesheet" href="resources/css/animate.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="resources/fonts/flaticons/font/flaticon.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/fontawesome.min.css">

<!-- Theme Style -->
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" >
	<header class="site-navbar js-sticky-header site-navbar-target" role="banner" style="height: 130px;  background-color: #000000; z-index: 9999;">
		<nav class="navbar navbar-expand-md" style="background-color: #ffffff; ">
			<div class="container">
				<a class="navbar-brand" style="color: white; font-size: 40px;" href="home">HOT MAP</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"	
					data-target="#navbarsExample05" aria-controls="navbarsExample05"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			
				<div class="collapse navbar-collapse" id="navbarsExample05" style="margin-left: 190px">
					<ul class="navbar-nav ml-auto pl-lg-5 pl-0">
						<li class="nav-item">
							<a class="nav-link active" href="index.html">Home</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="recipes.html">Recipes</a>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="services.html" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">주류</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="search?search=소주">소주</a> 
								<a class="dropdown-item" href="search?search=맥주">맥주</a> 
								<a class="dropdown-item" href="search?search=칵테일">칵테일</a> 
								<a class="dropdown-item" href="search?search=와인">와인</a> 
								<a class="dropdown-item" href="search?search=샴페인">샴페인</a> 
								<a class="dropdown-item" href="search?search=사케">사케</a>
								<a class="dropdown-item" href="search?search=막걸리">막걸리</a>
							</div>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="services.html" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">요리</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="search?search=한식">한식</a> 
								<a class="dropdown-item" href="search?search=중식">중식</a> 
								<a class="dropdown-item" href="search?search=일식">일식</a> 
								<a class="dropdown-item" href="search?search=양식">양식</a>
							</div>
						</li>
						<li class="nav-item"><a class="nav-link" href="news.html">News</a>
						</li>
					</ul>

					<form action ="search?search=${search}">
						<div style="float: right; margin-top: 8px">
							<input type="text" class="nav-item" id="search" name="search" style="max-width: 200px; display: inline-block;" placeholder="want를 검색하세요"> 
							<button type="submit" class="btn btn-white btn-outline-white " style="height: 33px; margin-top: -3px">
								<span class="fas fa-search-plus">
								</span>
							</button>
						</div>
					</form>
				</div>
			</div>
				<div style="float: right; margin-top:-60px; margin-right: 120;">						
					<form>
						<ul class="list-inline">
							<c:if test="${sessionScope.SID eq null}">
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="login" id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false" style="text-decoration: none; "><span class="fa fa-lock " ></span>
									</a>
									<div class="dropdown-menu" aria-labelledby="dropdown04">
										<a class="dropdown-item" href="login">LOGIN</a> 
										<a class="dropdown-item" href="join">JOIN</a> 
										<a class="dropdown-item" href="board">Q & A</a> 
									</div>
								</li>		
							</c:if>
	
							<c:if test="${sessionScope.SID ne null}">
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="profile" id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false" style="text-decoration: none; ">${sessionScope.SID} 님</a>
								<div class="dropdown-menu" aria-labelledby="dropdown04">
									<a class="dropdown-item" href="profile_check">MY PAGE</a> 
									<a class="dropdown-item" href="logout">LOG OUT</a> 
									<a class="dropdown-item" href="store">STORE</a> 
									<a class="dropdown-item" href="board">Q & A</a> 
								</div>
							</li>		
							</c:if>
						</ul>
					</form>
				</div>	
		</nav>
	</header>
</body>
<script src='resources/js/jquery-3.3.1.min.js'></script>
<script src="resources/js/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/jquery.waypoints.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/jquery.sticky.js"></script>
<script src="resources/js/magnific-popup-options.js"></script>
<script src="resources/js/main.js"></script>
<script>
var siteSticky = function() {
	$(".js-sticky-header").sticky({topSpacing:0});
};
siteSticky();

var siteScroll = function() {

  	$(window).scroll(function() {

  		var st = $(this).scrollTop();

  		if (st > 100) {
  			$('.js-sticky-header').addClass('shrink');
  		} else {
  			$('.js-sticky-header').removeClass('shrink');
  		}
  	}) 
  };
  siteScroll();
  
</script>


