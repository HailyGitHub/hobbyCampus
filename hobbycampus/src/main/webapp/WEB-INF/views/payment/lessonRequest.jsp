<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/hobbycampus/js/myLesson.js"></script>
<script type="text/javascript">
	$myLesson.lessonPrice=${lessonVO.lessonPrice}
</script>
</head>
<body>
	<div class="main">
		<h2>수강 신청하기</h2>
		<div id="left_content">
			<h3>수강 정보</h3>
			<hr>
			<dt>강의명</dt>
			<dd>${lessonVO.lessonSubj}</dd>
			<dt>강사명</dt>
			<dd>${lessonVO.tName}</dd>
			<dt>종류</dt>
			<dd>${lessonVO.lessonType}</dd>
			<dt>키트 유무</dt>
			<dd>${lessonVO.lessonKit}</dd>
		</div>

		<div id="right_content">
			<h2>결제 정보</h2>
			<dt>수강료<dt>
			<dd>${lessonVO.lessonPrice}</dd>
			<dt>보유 포인트</dt>
			<dd>--로그인된 회원의 보유 포인트--</dd>
			<select id="temp"  onchange="$myLesson.applyCoupon(this)">
				<option value="" price=0>보유한 쿠폰</option>
				<c:forEach items="${couponList}" var="coupon">
				    <option value="${coupon.couponIdx}" price="${coupon.couponRate}">${coupon.couponTitle}</option>
				</c:forEach>
			</select>
			<dt>결제 포인트</dt>
			<dd>${lessonVO.lessonPrice}</dd>
			<dd id="price_dd">--쿠폰 할인 표시 부분--</dd>
			<hr id="total_price_hr">
			총 결제 포인트-- 총 결제포인트 표시 부분--
			<br>
			<input type="button" value="결제하기">
		</div>
	</div>

</body>
</html>