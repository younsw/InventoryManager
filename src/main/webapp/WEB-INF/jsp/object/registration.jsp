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
			<div class="col-4  ">
				<h2 class="text-center">사진 미리보기</h2>
				<img class="form-control" id="View" src="" />
			</div>
			<div class="col-5 align-self-center ">
				<div class="text-center">
					<h3>등록</h3>	
					<input type="text" id="nameInput" class="form-control" placeholder="이름"><br>
					<input type="text" id="classification" class="form-control" placeholder="분류"><br>
					<input type="text" id="price" class="form-control" placeholder="가격(원)"><br>
					<input type="text" id="serialNumber" class="form-control" placeholder="일렬번호(선택)"><br>
					<input type="text" id="etc" class="form-control" placeholder="기타(선택)"><br>
					<select name="sharing" id="sharing" class="form-control">
					    <option value="비공개">비공개</option>
					    <option value="공개">공개</option>
					</select>
					<br>
					<div class="d-flex justify-content-between">
						<div class="btn my-1">
		  					<a href="#" id="imageIcon"> <i class="bi bi-image"></i> </a> 
							<input type="file" id="imagePath" class="d-none">
						</div>
						<button class="btn btn-success form-control" id="objectRegistration">등록</button><br>
					</div>
				</div>
			</div>
		</section>
			
	
	</div>
	
	<script>
		
		$(document).ready(function() {
			
			


			
			$(function() {
			    $("#imagePath").on('change', function(){
			    readURL(this);
				});
			});
			
			function readURL(input) {
			    if (input.files && input.files[0]) {
			        var reader = new FileReader();
			        reader.onload = function (e) {
			        $('#View').attr('src', e.target.result);
			        }
			        reader.readAsDataURL(input.files[0]);
			    }
			}
			
			$("#imageIcon").on("click", function(e) {
				// fileInput을 클릭한 효과를 만들어야 한다.
				e.preventDefault();
				$("#imagePath").click();
			});
			
			
			$("#objectRegistration").on("click", function() {
				var name = $("#nameInput").val();
				var classification = $("#classification").val();
				var price = $("#price").val();
				var serialNumber = $("#serialNumber").val();
				var etc = $("#etc").val();
				var sharing = document.getElementById("sharing");
				
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
				
				var formData = new FormData();
				formData.append("name", name);
				formData.append("classification", classification);
				formData.append("price", price);
				formData.append("serialNumber", serialNumber);
				formData.append("etc", etc);
				formData.append("sharing", sharing.options[sharing.selectedIndex].value);
				formData.append("imagePath", $("#imagePath")[0].files[0]);
				
				alert(sharing.options[sharing.selectedIndex].value);
				
				$.ajax({
					type:"post",
					url:"/object/registration",
					data:formData,
					enctype:"multipart/form-data", // 파일 업로드 필수 옵션
					processData:false, 				// 파일 업로드 필수 옵션
					contentType:false,			
					success:function(data){
						if(data.result == "success") {
							location.href="/object/mylist/view";
						} else {
							alert("등록 실패");
						}
					},
					error() {
						alert("등록 에러")
					}
				});
				
				
			});
			
		});
	
	</script>
	

</body>
</html>