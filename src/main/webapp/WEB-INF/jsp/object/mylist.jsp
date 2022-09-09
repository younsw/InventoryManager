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
  	
  	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
  	
</head>
<body>

	<div id="wrap">

		<c:import url="/WEB-INF/jsp/include/loginHeader.jsp" />
		
		<section class="d-flex justify-content-center">
			<div class="col-8">
			
				<div>
					<h3>내 물건</h3>
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
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="object" items="${objectList }">
							<tr>
								<td>${object.id }</td>
								<td><a href="/object/detail/view?objectid=${object.id }" id="objectDetail">${object.name }</a></td>
								<td>${object.classification }</td>
								<td><fmt:formatNumber value="${object.price}" pattern="#,###,###,###,###₩"/></td>
								<td><fmt:formatDate value="${object.createdAt }" pattern="yyyy년 MM월 dd일"/></td>
								<td><button class="btn btn-success" data-object-id="${object.id }">추가</button></td>
								<td><button class="btn btn-danger"  data-object-id="${object.id }">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			
		</section>
			
	
	</div>
	
	<script>
		
		$(document).ready(function() {
			
			$(".btn-success").on("click", function() {
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