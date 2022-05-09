<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 로그인 페이지</title>
	<!-- Title Icon -->
	<link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!--BootStarp-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- httpRequest Module  -->
    <script type="text/javascript" src="/hobbycampus/js/httpRequest.js"></script>
    <style>
		body {
			height: 100%;
			display: flex;
			align-items: center;
			padding-top: 40px;
			padding-bottom: 40px;
			background-color: #FFE65A;
			text-align: center;
		}
		.form-signin {
			width: 100%;
			max-width: 400px;
			padding: 15px;
			margin: auto;
		}
		.form-signin .checkbox {
			font-weight: 400;
		}
		.form-signin .form-floating:focus-within {
			z-index: 2;
		}
		.form-signin input[type="email"] {
			margin-bottom: -1px;
			border-bottom-right-radius: 0;
			border-bottom-left-radius: 0;
		}
		.form-signin input[type="password"] {
			margin-bottom: 10px;
			border-top-left-radius: 0;
			border-top-right-radius: 0;
		}
		#signUp_btn{
			margin-top: 10px;
		}
		#img-list img{
			border-radius: 25px;
		}
    </style>
</head>
<body>
	<main class="form-signin">
	
		<!-- Login Form -->
		<form name="adminLogin" method="post" action="adminLogin.do">
			<img class="mb-4" src="/hobbycampus/img/admin.png" alt="양복업자" width="230">
			<h1 class="h3 mb-3 fw-normal"><b>관리자 로그인</b></h1>
		
			<div class="form-floating">
				<input type="email" class="form-control" id="floatingInput" name="a_email" placeholder="name@example.com">
				<label for="floatingInput">이메일</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword" name="a_pwd" placeholder="Password">
				<label for="floatingPassword">비밀번호</label>
			</div>
			<div class="loginMsg" id="loginMsg" style="color:red;">테스트</div>
			<button class="w-100 btn btn-lg btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#modalSignin" id="signUp_btn">회원가입</button>
			<button class="w-100 btn btn-lg btn-success" type="submit">로그인</button>
			<p class="mt-5 mb-3 text-muted">Copyright 2021. Hobby Campus Co., Ltd. all rights reserved.</p>
		</form>
		
		<!-- Sign-Up Modal -->
		<div class="modal fade" id="modalSignin" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content rounded-5 shadow">
					<div class="modal-header p-5 pb-4 border-bottom-0">
						<h2 class="fw-bold mb-0"><i class="bi bi-person-circle"></i> 관리자 회원가입</h2>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					
					<div class="modal-body p-5 pt-0">
						<form name="adminSignUp" action="adminSignUp.do">
							<div class="form-floating mb-3">
								<input type="email" class="form-control rounded-4" id="floatingEmail" name="a_email" placeholder="email" required>
								<label for="floatingEmail">이메일</label>
							</div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control rounded-4" id="floatingPassword" name="a_pwd" minlength="6" maxlength="12" placeholder="password" required>
								<label for="floatingPassword">비밀번호 6~12자리</label>
							</div>
							<div class="form-floating mb-3">
								<input type="text" class="form-control rounded-4" id="floatingname" name="a_name" minlength="3" maxlength="8" placeholder="nickname" required>
								<label for="floatingname">닉네임 3~8자</label>
							</div>
							<input type="hidden" name="a_img" id="a_img" value="" >
							
							<h3>프로필 선택</h3>
							<div class="img-list" id="img-list" style="margin: 10px 0px;">
								<img alt="" src="/hobbycampus/img/admin/admin_1.png" width="90" data-img="admin_01.png">
								<img alt="" src="/hobbycampus/img/admin/admin_2.png" width="90" data-img="admin_02.png">
								<img alt="" src="/hobbycampus/img/admin/admin_3.png" width="90" data-img="admin_03.png">
								<img alt="" src="/hobbycampus/img/admin/admin_4.png" width="90" data-img="admin_04.png">
							</div>
							
							<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit" style="margin: 25px 0px;">회원가입</button>
							<small class="text-muted">By clicking Sign up, you agree to the terms of use.</small>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
<script type="text/javascript">
	var imgList = document.getElementById('img-list');
	var img = imgList.children;
	
	/* Select Img */
	imgList.addEventListener('click', function(e){
		var myImg = e.target;
		var imgName = myImg.getAttribute('data-img');
		var a_img = document.getElementById('a_img');
		
		img[0].style.backgroundColor = "white";
		img[1].style.backgroundColor = "white";
		img[2].style.backgroundColor = "white";
		img[3].style.backgroundColor = "white";
		
		myImg.style.backgroundColor = "green";
		a_img.value = imgName;
	});
	
	
	function adminCheck(){
		var userId = document.adminLogin.a_email.value;
		var userPwd = document.adminLogin.a_pwd.value;
		var param = 'a_email=' + userId + '&' + 'a_pwd=' + userPwd;
	
		sendRequest('adminCheck.do', param, adminCheckResult, 'GET');
	}
	
	function adminCheckResult(){
		var msg = document.getElementById('loginMsg').firstChild;
		
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data = XHR.responseText;
				if(data==='false'){
					msg.nodeValue = '아이디 또는 비밀번호가 틀렸습니다.';
					return false;
				}
			}
		}
	}
	
</script>
</html>