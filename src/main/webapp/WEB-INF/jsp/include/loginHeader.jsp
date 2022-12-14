<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
		<header class="header">
			<div class="d-flex">
				<div class="text-weight-bolder col-4 d-flex justify-content-center">
					<h2 class="mt-3">Inventory Manager</h2>
				</div>
				<nav class="col-6">
					<div class="mt-3 d-flex justify-content-around">
						<a href="/object/mylist/view" class="nav-link main-link nav">내 물건</a>
						<a href="/object/otherobject/view" class="nav-link main-link nav">다른 물건 둘러보기</a>
						<a href="/object/favorite/view" class="nav-link main-link nav">즐겨찾기</a>
						<a href="/object/registration/view" class="nav-link main-link nav">등록 하기</a>
					</div>
				</nav>
				<div class="col-2">
					<div class="mt-4 d-flex justify-content-center">
						<c:if test="${not empty userId }">
					 		<div class="mr-3">${userName }님<a href="/user/signout">로그아웃</a> </div>
					 	</c:if>
					 	<c:if test="${empty userId }">
							<div class="mr-3"><a href="/user/signin/view">로그인</a></div>
						</c:if>
					</div>
				</div>
			</div>
		<hr>
		</header>
		