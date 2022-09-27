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
		
		<section class="d-flex objectDetail mx-4">
		
			
			<div class="col-7 d-flex image_div ">
				<div class="">
					<img class="image" src="${object.object.imagepath }">
				</div>
			</div>
			
			<div class="col-5  align-self-center ">
				<p class="name"> ${object.object.name }</p>
				<p class="price"><fmt:formatNumber value="${object.object.price}" pattern="#,###,###,###,###₩"/></p>
				<p> 분류 : ${object.object.classification }</p>
				<c:if test="${not empty object.object.serialNumber }">
					<p> 모델 번호 : ${object.object.serialNumber } </p>
				</c:if>
				<c:if test="${not empty object.object.etc }">
					<p> 설명 : ${object.object.etc }</p>
				</c:if>
				<p><a href="/object/specificPersonObject/view?userId=${object.user.id }">${object.user.name }</a></p>
				<P class="createdAt"> 등록 날짜 : <fmt:formatDate value="${object.object.createdAt }" pattern="yyyy년 M월 dd일"/></P>
				<div>즐겨찾기</div>
				<c:choose>
					<c:when test="${object.objectFavoriteregistration == 1 }">
						<button class="btn deleteFavorite" data-object-id="${object.object.id }">삭제</button>
					</c:when>
					<c:otherwise>
						<button class="btn insertFavorite" data-object-id="${object.object.id }">추가</button>
					</c:otherwise>
				</c:choose>
				<br><br>
				<c:if test="${object.object.userId == userId }">
					<a href="/object/amend/view?objectid=${object.object.id }"><button class="btn btn-cuccess">수정</button></a>
					<button class="btn btn-danger"  data-object-id="${objectDetail.object.id }">삭제</button>
				</c:if>
				
			</div>
	
			
		</section>
			
	
	</div>
	
	<script>
		
	$(document).ready(function() {
		
		$(".insertFavorite").on("click", function() {
			var objectId = $(this).data("object-id");
			if (confirm("정말로 추가 하시겠습니까?")) {
				$.ajax({
					url:"/object/favoriteinsert",
					type:"post",
					data:{"objectId":objectId},
					success:function(data) {
	            		if(data.result == "success") {
	            			location.reload();
	            		} else {
	            			alert("추가 실패");
	            		}
	            	},
	            	error() {
	            		alert("추가 에러");
	            	}
				});
			}
		});
		
		$(".deleteFavorite").on("click", function() {
			var objectId = $(this).data("object-id");
			if (confirm("정말로 삭제 하시겠습니까?")) {
				$.ajax({
					url:"/object/favoritedelete",
					type:"post",
					data:{"objectId":objectId},
					success:function(data) {
	            		if(data.result == "success") {
	            			location.reload();
	            		} else {
	            			alert("추가 실패");
	            		}
	            	},
	            	error() {
	            		alert("추가 에러");
	            	}
				});
			}
		});
		 
		$(".btn-danger").on("click", function() {
			var objectId = $(this).data("object-id");
			if (confirm("정말로 삭제 하시겠습니까?")) {
		            $.ajax({
		            	url:"/object/delete",
		            	type:"post",
		            	data:{"objectId":objectId},
		            	success:function(data) {
		            		if(data.result == "success") {
		            			location.reload();
		            		} else {
		            			alert("삭제 실패");
		            		}
		            	},
		            	error() {
		            		alert("삭제 에러");
		            	}
		            });
		    	}
		});
		
	});
	
	</script>
	
</body>
</html>