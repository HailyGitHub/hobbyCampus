<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/hobbycampus/js/myLessonRequest.js"></script>
<script type="text/javascript">
	$myLessonRequest.lessonPrice=${lessonVO.lessonPrice}
	$myLessonRequest.totalPrice=${lessonVO.lessonPrice}
	$myLessonRequest.paymentPrice=${lessonVO.lessonPrice}
	$myLessonRequest.uPoint=${userVO.uPoint}
	$myLessonRequest.postSaved="${postSaved}"
	$myLessonRequest.lessonScheduleIdx=${lessonScheduleIdx}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/hobbycampus/css/lessonreq.css">
<link rel="stylesheet" href="/hobbycampus/css/pointShop.css">
<style>
dt{
 font-weight:bold;
 color: darkgray;
}
</style>
</head>
<body>
<div class="container"> 
	<div id="wrap">
		<h2><span class="hb_yellow">수강 신청</span></h2>
		<span id="left_content">
			<h3>수강 정보</h3>
			<hr>
			<dt id="se">강의명</dt>
			<dd>${lessonVO.lessonSubj}</dd>
			<dt>강사명</dt>
			<dd>${lessonVO.tName}</dd>
			<dt>종류</dt>
			<dd>${lessonVO.lessonType}</dd>
			<dt>키트 유무</dt>
			<dd>${lessonVO.lessonKit}</dd>
		</span>
		
		<div id="right_content">
			<h2><span class="hb_yellow">결제 정보</span></h2>
			<dt>수강료<dt>
			<dd>${lessonVO.lessonPrice}</dd>
			<dt>보유 포인트</dt>
			<dd>${userVO.uPoint}</dd>
			<select onchange="$myLessonRequest.applyCoupon(this)">
				<option value="" price=0>보유한 쿠폰</option>
				<c:forEach items="${couponList}" var="coupon">
				    <option value="${coupon.couponIdx}" price="${coupon.couponRate}">${coupon.couponTitle}</option>
				</c:forEach>
			</select>
			<dt>결제 포인트</dt>
			<dd id="price_dd">0</dd>
			<dd id="total_price_hr">
			총 결제 포인트: ${lessonVO.lessonPrice}</dd>
			<br>
			<button type="button" class="bt_enter" onclick=$myLessonRequest.payment()>결제하기</button>
		</div>
		<c:if test="${lessonVO.lessonKit == '있음'}">
		<div id="addr_content">
		<h3>배송 정보</h3>
			<dt>수령인</dt>
			<dd><input type="text" id="post_receiver" placeholder="수령인을 입력해주세요."
				<c:if test="${postVO.postReceiver != ''}">
					value = ${postVO.postReceiver}
				</c:if>
				>
			</dd>
			<dt>전화번호</dt>
			<dd><input type="text" id="post_tel" placeholder="전화번호를 입력해주세요."
				<c:if test="${postVO.postTel != ''}">
					value = ${postVO.postTel}
				</c:if>
				>
			</dd>
			<dt>수령지</dt>
			<dd><input type="text" id="post_addr" placeholder="수령지를 입력해주세요."
				<c:if test="${postVO.postAddr != ''}">
					value = ${postVO.postAddr}
				</c:if>
				>
			</dd>
			<dt>요청사항</dt>
			<dd><input type="text" id="post_etc" placeholder="내용을 입력해주세요."
				<c:if test="${postVO.postEtc != ''}">
					value = ${postVO.postEtc}
				</c:if>
				>
			</dd>	
		</div>
		</c:if>
	</div>
	</div>
</body>
</html>