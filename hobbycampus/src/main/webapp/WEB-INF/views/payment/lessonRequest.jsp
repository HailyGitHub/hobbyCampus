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
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

#main{
	width: 90%;
	margin: 10px auto;
	padding: 20px;

}
#left_content{
	width:400px;
	padding:20px;
	margin-bottom:20px;
	float:left;
	border: 1px solid #bcbcbc;

}
#right_content{
	width:400px;
	padding:20px;
	margin-bottom:20px;
	float:right;
	border: 1px solid #bcbcbc;

}
#addr_content{
	width:400px;
	padding:20px;
	margin-bottom:20px;
	float:left;

	border: 1px solid #bcbcbc;

}


</style>
</head>
<body>
	<div id="wrap">
		<h2>수강 신청하기</h2>
		<span id="left_content">
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
		</span>
		
		
		<div id="right_content">
			<h2>결제 정보</h2>
			<dt>수강료<dt>
			<dd>${lessonVO.lessonPrice}</dd>
			<dt>보유 포인트</dt>
			<dd>$로그인된 회원의 보유 포인트$</dd>
			<select id="temp"  onchange="$myLesson.applyCoupon(this)">
				<option value="" price=0>보유한 쿠폰</option>
				<c:forEach items="${couponList}" var="coupon">
				    <option value="${coupon.couponIdx}" price="${coupon.couponRate}">${coupon.couponTitle}</option>
				</c:forEach>
			</select>
			<dt>결제 포인트</dt>
			<dd>${lessonVO.lessonPrice}</dd>
			<dd id="price_dd">--쿠폰 할인 표시 부분--</dd>
			<dd id="total_price_hr">
			총 결제 포인트: ${lessonVO.lessonPrice}</dd>
			<br>
			<input type="button" value="결제하기" onclick= >
		</div>
		<div id="addr_content">
		<h3>배송 정보</h3>
			<dt>수령인</dt>
			<dd><input type="text" name="post_receiver" placeholder="수령인을 입력해주세요."></dd>
			<dt>전화번호</dt>
			<dd><input type="text" name="post_tel" placeholder="전화번호를 입력해주세요."></dd>
			<dt>수령지</dt>
			<dd><input type="text" name="post_addr" placeholder="수령지를 입력해주세요."></dd>
			<dt>요청사항</dt>
			<dd><input type="text" name="post_etc" placeholder="내용을 입력해주세요."></dd>	
		</div>
		
	</div>
	<script>
	
	</script>
</body>
</html>