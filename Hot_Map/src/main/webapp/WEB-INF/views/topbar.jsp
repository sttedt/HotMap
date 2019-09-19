<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top" >
	<div>
		<a href="home" style="text-decoration:none; font-size:70px; display: inline-block;" >HotMap</a><br>
		<input type="text" class="form-control" style="max-width: 200px; display: inline-block;" placeholder="search"> 
		<input type="button" class="btn btn-light" style="margin-top:-5px" value="검색">
	</div>
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<form>
			<ul class="list-inline">
				<c:if test="${sessionScope.SID eq null}">
					<li class="list-inline-item">
						<a class="list-inline-item" href="login" style="color:#fff; text-decoration: none; margin-top:15px;"> LOGIN </a> &nbsp;
					</li> 
					<li class="list-inline-item">
						<a class="list-inline-item" href="join"  style="color:#fff; text-decoration: none;"> JOIN </a>&nbsp;
					</li>
					<li class="list-inline-item">
						<a class="list-inline-item" href="board"  style="color:#fff; text-decoration: none;"> Q & A</a> &nbsp;
					</li>
				</c:if>
				
				<c:if test="${sessionScope.SID ne null}">
					<li class="list-inline-item">
						<a class="list-inline-item" style="color:#fff; text-decoration: none; margin-top:15px;"> ${sessionScope.SID} 님</a> &nbsp;
					</li>
					<li class="list-inline-item">
						<a class="list-inline-item" href="logout"  style="color:#fff; text-decoration: none; "> LOGOUT</a> &nbsp; 
					</li>
					<li class="list-inline-item">
						<a class="list-inline-item" href="profile" style="color:#fff; text-decoration: none;"> MY PAGE </a> &nbsp; 
					</li>
					<c:if test="${sessionScope.SLEV eq 'ADMIN'}">
						<li class="list-inline-item">
							<a class="list-inline-item" href="admin"   style="color:#fff; text-decoration: none;"> ADMIN </a>&nbsp;
						</li>
					</c:if> 
					<li class="list-inline-item">
						<a class="list-inline-item" href="board"   style="color:#fff; text-decoration: none;"> Q & A</a> &nbsp;
					</li>
				</c:if>
			</ul>
		</form>
	</div>
</nav>
