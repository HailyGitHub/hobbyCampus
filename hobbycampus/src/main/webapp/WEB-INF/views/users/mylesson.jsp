<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>내 수강 내역</h2>
<div id="wrap">
	<div class="button_set">
		<input type="button" name="list_bt" value="전체 목록" onclick="">
		<input type="button" name="lesson_bt" value="수강중"onclick="">
		<input type="button" name="reser_bt" value="예약" onclick="">
		<input type="button" name="end_bt" value="수강완료" onclick="">
		<input type="button" name="cencel_bt" value="수강취소" onclick="">
	</div>
	<hr>
	
	<!--아래로 로그인된 회원의 레슨상태(수강중/예약/수강완료/취소)에 따라 출력되는 부분  -->
	<div class="lesson_list_section">
			<div class="goods_group">
				<ul class="goods_group_list">
		<li id="_rowLi20220510123126NSP20220510NP3974485505" class="goods_pay_item payorder">
			<div class="lesson_item">
					<!-- 링크: 강의 상세 정보 페이지로 -->
					<a href="#">
					<!--강의 섬네일 표시 영역  -->
						<img src="C:\\hobbyImg\\lesson\\강사이메일주소\\...png" width="60" height="60">
				
				<div class="goods_info">

						<p class="name">
							강의명
						</p>
						<ul class="info">
							<li><span class="blind">상품금액</span>7,900원</li>
							<li class="date"><span class="blind">강의 구매날짜</span> $구매일$</li>
						</ul>
					</a>
					<span class="state _statusName ">결제완료</span>
					</a>
				</div>
	</div>
</div>

</body>
</html>