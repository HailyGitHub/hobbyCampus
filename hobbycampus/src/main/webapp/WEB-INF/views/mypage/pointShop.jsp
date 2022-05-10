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
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#point_content{
	padding: 30px;
	margin: 10px auto;
}

</style>
</head>
<body>
	<div id="wrap">
	
		<form>
			<h2>포인트 충전</h2>
			<p>
				내 포인트: ${userVO.uPoint} <span>하빗</span>
			</p>
			<p>포인트 충전</p>
			<hr>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="r_price"
					id="flexRadioDefault1"> 
					<label class="form-check-label"
					for="flexRadioDefault1"> 5,000원 (5,000하빗) 
					</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="r_price"
					id="flexRadioDefault2"> 
					<label class="form-check-label"
					for="flexRadioDefault2"> 10,000원 (10,000하빗) 
					</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="r_price"
					id="flexRadioDefault3"> 
					<label class="form-check-label"
					for="flexRadioDefault3"> 30,000원 (30,000하빗) 
					</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="r_price"
					id="flexRadioDefault4"> 
					<label class="form-check-label"
					for="flexRadioDefault4"> 50,000원 (50,000하빗) 
					</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="r_price"
					id="flexRadioDefault5"> 
					<label class="form-check-label"
					for="flexRadioDefault5"> 100,000원 (100,000하빗) 
					</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="r_price"
					id="flexRadioDefault6"> 
					<label class="form-check-label"
					for="flexRadioDefault6"> 200,000원 (200,000하빗) 
					</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="r_price"
					id="flexRadioDefault7"> 
					<label class="form-check-label"
					for="flexRadioDefault7"> 300,000원 (300,000하빗) 
					</label>
			</div>

			<hr>
			<div>
				<p>결제수단</p>
				<input type="radio" name="r_pay">신용카드 <input type="radio"
					name="r_pay">무통장 입금

			</div>
			<div>
				<input type="submit" value="포인트 충전">
			</div>

		</form>
	</div>

</body>
</html>