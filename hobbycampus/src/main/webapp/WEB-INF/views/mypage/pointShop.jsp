<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!-- jquery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<link rel="stylesheet" href="/hobbycampus/css/pointShop.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container"> 
	<div id="wrap">		
			<h3><span class="hb_yellow">포인트 충전 <img src="img/honeycomb.png" class="imgsize"></span></h3>
			<br>
			<p>
			<h5 class="hb_price">내 포인트</h5> 
			<h4><span class="hb_yellow">${userVO.uPoint} 하빗</span></h4>
			</p>
			<hr>
			<p class="title">포인트 충전</p>
			<hr>
			<div id="point_content">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="r_price" id="flexRadioDefault1"> 
						<label class="form-check-label" for="flexRadioDefault1"> 
						<span class="hb_price">5,000원</span> <span class="hb_yellow">(+5,000하빗)</span> 
						</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="r_price" id="flexRadioDefault2"> 
					<label class="form-check-label" for="flexRadioDefault2"> 
					<span class="hb_price">10,000원</span> <span class="hb_yellow">(+10,000하빗)</span> 
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="r_price" id="flexRadioDefault3"> 
					<label class="form-check-label" for="flexRadioDefault3"> 
					<span class="hb_price">30,000원</span> <span class="hb_yellow">(+30,000하빗)</span> 
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="r_price" id="flexRadioDefault4"> 
					<label class="form-check-label" for="flexRadioDefault4"> 
					<span class="hb_price">50,000원</span> <span class="hb_yellow">(+50,000하빗)</span> 
					</label>
				</div>
				<div>
				<hr id="middle_hr">
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="r_price" id="flexRadioDefault5"> 
					<label class="form-check-label"for="flexRadioDefault5"> 
					<span class="hb_price">100,000원</span> <span class="hb_yellow">(+100,000하빗)</span> </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="r_price" id="flexRadioDefault6"> 
						<label class="form-check-label" for="flexRadioDefault6"> 
						<span class="hb_price">200,000원</span> <span class="hb_yellow">(+200,000하빗)</span>
						</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="r_price" id="flexRadioDefault7"> 
					<label class="form-check-label" for="flexRadioDefault7"> 
					<span class="hb_price">300,000원</span> <span class="hb_yellow">(+300,000하빗) </span>
					</label>
				</div>
			</div>
			<hr>
			<div>
				<h5>결제수단</h5>		
					<input class="form-check-input" type="radio" name="r_pay" id="flexRadioDefault8"> 
					<label class="form-check-label" for="flexRadioDefault8"> 
					신용카드 
			</div>
			<br>
			<div id="bu_div">
			<button type="button" class="bt_enter" onclick="">포인트 충전</button>
			</div>
	</div>
</body>
</html>