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
  	
  	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
  	
</head>
<body>

	<div id="wrap">

		<c:import url="/WEB-INF/jsp/include/logoutHeader.jsp" />
		
		<section class="d-flex section aligin-item-center ">
			
			<div class="col-7 align-self-center baner">
				<img height="330" src="/static/image/stock.jpeg">
			</div>
			<div class="col-5 signup  align-self-center">
				<div class="text-center">
					<h3>로그인</h3>	
					<input type="text" id="loginIdInput" class="form-control" placeholder="아이디"><br>
					<input type="password" id="passwordInput" class="form-control" placeholder="비밀번호"><br>
					<button class="btn" id="signinInput">로그인</button><br>
					<a href="/user/signup/view">회원가입</a>
				</div>
			</div>
			
		</section>
		
		<footer>
		</footer>
	
	</div>
	
	<script>
		
		$(document).ready(function() {
			
			$("#signinInput").on("click", function() {
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요");
					return;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/signin",
					data:{"loginId":loginId, "password":password},
					success:function(data) {
						if(data.result == "success") {
							location.href="/object/mylist/view";
						} else {
							alert("로그인 실패");
						}
					},
					error() {
						alert("로그인 에러")
					}
					
				});
				
			});
			
		});
	
	</script>

</body>
</html>