<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Title Icon -->
<link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<!-- jquery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script src="/hobbycampus/js/pointShop.js"></script>
<!-- css -->
<link rel="stylesheet" href="/hobbycampus/css/main.css">
<link rel="stylesheet" href="/hobbycampus/css/pointShop.css">

<script type="text/javascript">
	$pointShop.uIdx = ${userVO.uIdx}
	$pointShop.uEmail = "${userVO.uEmail}"
	$pointShop.uName = "${userVO.uName}"
	$pointShop.uTel = "${userVO.uTel}"
	$pointShop.lessonScheduleIdx = ${lessonScheduleIdx}
</script>


</head>
<body>
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<!-- SIDEBar -->
	<main class="mainArea">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="/WEB-INF/views/myPageSide.jsp"></jsp:include>
			</div>
			<!-- main -->
			<div class="col-md-10">
				<!-- body -->
				<div class="container">
					<div id="wrap">
						<h2>
							<span class="hb_yellow">포인트 충전 <img
								src="img/honeycomb.png" class="imgsize"></span>
						</h2>
						<br>
						<p>
						<h5 class="hb_price">내 포인트</h5>
						<h4>
							<span class="hb_yellow"><i class="bi bi-currency-exchange"></i> ${userVO.uPoint}
								하빗</span>
						</h4>
						</p>
						<hr>
						<p class="title">포인트 충전</p>
						<hr>
						<div id="point_content">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="r_price"
									id="flexRadioDefault1" value=5000> <label
									class="form-check-label" for="flexRadioDefault1"> <span
									class="hb_price">5,000원</span> <span class="hb_yellow">(+5,000하빗)</span>
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="r_price"
									id="flexRadioDefault2" value=10000> <label
									class="form-check-label" for="flexRadioDefault2"> <span
									class="hb_price">10,000원</span> <span class="hb_yellow">(+10,000하빗)</span>
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="r_price"
									id="flexRadioDefault3" value=30000> <label
									class="form-check-label" for="flexRadioDefault3"> <span
									class="hb_price">30,000원</span> <span class="hb_yellow">(+30,000하빗)</span>
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="r_price"
									id="flexRadioDefault4" value=50000> <label
									class="form-check-label" for="flexRadioDefault4"> <span
									class="hb_price">50,000원</span> <span class="hb_yellow">(+50,000하빗)</span>
								</label>
							</div>
							<div>
								<hr id="middle_hr">
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="r_price"
									id="flexRadioDefault5" value=100000> <label
									class="form-check-label" for="flexRadioDefault5"> <span
									class="hb_price">100,000원</span> <span class="hb_yellow">(+100,000하빗)</span>
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="r_price"
									id="flexRadioDefault6" value=200000> <label
									class="form-check-label" for="flexRadioDefault6"> <span
									class="hb_price">200,000원</span> <span class="hb_yellow">(+200,000하빗)</span>
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="r_price"
									id="flexRadioDefault7" value=300000> <label
									class="form-check-label" for="flexRadioDefault7"> <span
									class="hb_price">300,000원</span> <span class="hb_yellow">(+300,000하빗)
								</span>
								</label>
							</div>
						</div>
						<hr>
						<div>
							<h5>결제수단</h5>
							<input class="form-check-input" type="radio" name="r_pay"
								id="flexRadioDefault8" checked> <label
								class="form-check-label" for="flexRadioDefault8"> 신용카드 
						</div>
						<br>
						<div id="bu_div">
							<button type="button" class="bt_enter" onclick="requestPay()">포인트
								충전</button>
						</div>
					</div>
				</div>
			</div>
</body>
<script>
	
	function requestPay() {
		if (!document.querySelector('input[name="r_price"]:checked')) {
			alert("금액을 선택해주세요.");
			return;
		}

		var IMP = window.IMP; 
		IMP.init("imp02490270"); // 예: imp00000000
		// IMP.request_pay(param, callback) call  payment Window
		IMP.request_pay({ // param
			pg : "html5_inicis",
			pay_method : "card",
			merchant_uid : $pointShop.uuid(),
			name : "포인트 충전",
			amount : Number(document
					.querySelector('input[name="r_price"]:checked').value),
			buyer_email : $pointShop.uEmail,
			buyer_name : $pointShop.uName,
			buyer_tel : $pointShop.uTel
		}, function(rsp) { // callback
			if (rsp.success) { // 
				// jQuery-> HTTP req
				jQuery.ajax({	
					url : "http://localhost:9090/hobbycampus/payComplete.do", // ex: https://www.myservice.com/payments/complete
					method : "POST",
					headers : {
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						imp_uid : rsp.imp_uid,
						merchant_uid : rsp.merchant_uid,
						paid_amount : rsp.paid_amount,
						uIdx: ${userVO.uIdx}
					})
				}).done(function(data) {
					location.href = "http://localhost:9090/hobbycampus/payComplete.do";
					return;
				})
			} else {
				alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			}
		});
	}
</script>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>