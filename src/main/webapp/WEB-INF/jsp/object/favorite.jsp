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
					<h3>즐겨 찾기</h3>
				</div>
					
				<c:if test="${not empty favorite }">
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
						<c:forEach var="favorite" items="${favorite }" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td><a href="/object/detail/view?objectid=${favorite.id }" id="objectDetail">${favorite.name }</a></td>
								<td>${favorite.classification }</td>
								<td><fmt:formatNumber value="${favorite.price}" pattern="#,###,###,###,###₩"/></td>
								<td><fmt:formatDate value="${favorite.createdAt }" pattern="yyyy년 MM월 dd일"/></td>
								<td><button class="btn btn-success" data-object-id="${favorite.id }">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</c:if>
			</div>
			
			
		</section>
			
	
	</div>
	
	
	

</body>
</html>