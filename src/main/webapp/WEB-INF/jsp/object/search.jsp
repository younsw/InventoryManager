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
		
		<section>
			<div >
				<form action="/object/search/view?search" class="search d-flex justify-content-center ">
					<div class=" col-5 input-group">
						<input class=" form-control" name="search" type="text">
						<button class="btn btn-secondary">검색</button>
					</div>
				</form>
			</div>
			
			<div class="d-flex justify-content-center">
				<div class="col-8">
				
					<div>
						<h3>검색 결과</h3>
					</div>
						
					<table class="table col-12">
						<thead>
							<tr>
								<th>.No</th>
								<th>이름</th>
								<th>분류</th>
								<th>가격(₩)</th>
								<th>등록 날짜</th>
								<th>즐겨찾기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="otherObject" items="${searchObject }" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td><a href="/object/detail/view?objectid=${otherObject.object.id }" id="objectDetail">${otherObject.object.name }</a></td>
									<td>${otherObject.object.classification }</td>
									<td><fmt:formatNumber value="${otherObject.object.price}" pattern="#,###,###,###,###₩"/></td>
									<td><fmt:formatDate value="${otherObject.object.createdAt }" pattern="yyyy년 MM월 dd일"/></td>
									<c:choose>
										<c:when test="${otherObject.objectFavoriteregistration == 1 }">
											<td><button class="btn deleteFavorite" data-object-id="${otherObject.object.id }">삭제</button></td>
										</c:when>
										<c:otherwise>
											<td><button class="btn insertFavorite" data-object-id="${otherObject.object.id }">추가</button></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
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
		 
		
	});
	
	</script>
	
</body>
</html>