<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>하비캠퍼스 오류 400 페이지</title>
	<!-- Title Icon -->
    <link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!--BootStarp-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
	<!-- Error Modal -->
	<div class="modal modal-signin position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow">
				<!-- Modal Header -->
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<h2 class="fw-bold mb-0" style="color:blue;"><i class="bi bi-exclamation-triangle-fill"></i> 400단 에러 페이지</h2>
				</div>
				<!-- Modal Content -->
				<div class="modal-body p-5 pt-0">
					<div class="form-floating mb-3 text-center">
						<img src="/hobbycampus/img/errorFour.gif" style="width: 450px;">
					</div>
					<hr class="my-4">
					<div class="form-floating mb-3 text-center">
						<p class="fs-4"><b>요청하신 페이지를 찾을 수 없습니다.</b></p>
					</div>
					<div class="form-floating mb-3 text-center">
						<p>불편을 드려서 죄송합니다.</p>
						<p><span id="second" style="color:red">5초</span> 뒤에 자동으로 메인 페이지로 이동합니다.</p>
					</div>
      			</div>
			</div>
		</div>
	</div>
</body>
<!-- Error JavaScript -->
<script type="text/javascript" src="/hobbycampus/js/error.js"></script>
</html>