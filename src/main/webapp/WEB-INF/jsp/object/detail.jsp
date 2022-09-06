<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventory Manager</title>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  	
  	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
  	
</head>
<body>

	<div id="wrap">

		<c:import url="/WEB-INF/jsp/include/loginHeader.jsp" />
		
		<section class="">
		
			
			<div class="col-7 center align-self-center">
				<img class="form-control" src="${object.imagepath }">
			</div>
			
			<div class="col-4 center text-center">
				<p class="name"> ${object.name }</p>
				<p> 분류 : ${object.classification }</p>
				<P class="createdAt"> 등록 날짜 : <fmt:formatDate value="${object.createdAt }" pattern="yyyy년 M월 dd일"/></P>
				<p class="price"><fmt:formatNumber value="${object.price}" pattern="#,###,###,###,###₩"/></p>
				<c:if test="${not empty object.serialNumber }">
					<p> 시리얼 번호 : ${object.serialNumber } </p>
				</c:if>
				<c:if test="${not empty object.etc }">
					<p> 설명 : ${object.etc }</p>
				</c:if>
				<button class="btn btn-cuccess">즐겨찾기</button><br><br>
				<button class="btn btn-cuccess">수정</button>
			</div>
	
			
		</section>
			
	
	</div>
</body>
</html>