<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		<section class="d-flex justify-content-center">
			
			<div class="col-7 d-flex image_div ">
				<div>
					<h2 class="text-center">사진</h2>
					<img class="image" src="${object.object.imagepath }">
				</div>
			</div>
			
			<div class="col-5 align-self-center ">
				<div class="text-center">
					<h3>수정</h3>	
					<input type="text" id="nameInput" class="form-control" value="${object.object.name }" placeholder="이름"><br>
					<input type="text" id="classification" class="form-control" value="${object.object.classification }" placeholder="분류"><br>
					<input type="number" id="price" class="form-control" value="${object.object.price }" placeholder="가격"><br>
					<input type="text" id="serialNumber" class="form-control" value="${object.object.serialNumber }" placeholder="일렬 번호"><br>
					<input type="text" id="etc" class="form-control" value="${object.object.etc }" placeholder="기타"><br>
					
					<select name="sharing" id="sharing" class="form-control">
					    <option value="비공개">비공개</option>
					    <option value="공개">공개</option>
					</select>
					<br>
					<div class="d-flex justify-content-between">
						<button class="btn btn-success form-control" data-object-id="${object.object.id }">수정</button><br>
					</div>
				</div>
			</div>
		</section>
			
	
	</div>
	
	<script>
		
		$(document).ready(function() {
			
			
			$(".btn-success").on("click", function() {
				var name = $("#nameInput").val();
				var classification = $("#classification").val();
				var price = $("#price").val();
				var serialNumber = $("#serialNumber").val();
				var etc = $("#etc").val();
				var sharingOption = document.getElementById("sharing")
				var sharing = sharingOption.options[sharingOption.selectedIndex].value;
				var objectId = $(this).data("object-id");
				
				if(name == "") {
					alert("이름을 입력 하세요");
					return;
				}
				if(classification == "") {
					alert("분류를 입력 하세요");
					return;
				}
				if(price == "") {
					alert("가격을 입력 하세요");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/object/amend",
					data:{"name":name, "classification":classification, "serialNumber":serialNumber, "price":price, "sharing":sharing, "etc":etc, "objectId":objectId},		// 파일 업로드 필수 옵션
					success:function(data){
						if(data.result == "success") {
							location.href="/object/mylist/view";
						} else {
							alert("수정 실패");
						}
					},
					error() {
						alert("수정 에러")
					}
				});
				
				
			});
			
		});
	
	</script>
	

</body>
</html>