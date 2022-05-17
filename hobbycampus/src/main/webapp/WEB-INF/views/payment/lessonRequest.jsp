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
	<!--BootStarp-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/hobbycampus/css/lessonreq.css">
<link rel="stylesheet" href="/hobbycampus/css/pointShop.css">
<style>
dt{
 font-weight:bold;
 color: darkgray;
}
dd{
	font-weight:bold;
	color:darkslategray;
}

</style>
</head>
<body>
<div class="container"> 
	<div id="wrap">
		<h2><span class="hb_yellow"><i class="bi bi-bookmark-star"></i>수강 신청</span></h2><br>
		<span id="left_content">
			<h3><span class="title"><i class="bi bi-award"></i> 수강 정보</span></h3>
			<hr>
			<dt><i class="bi bi-bookmark-star"></i> 강의명</dt>
			<dd>${lessonVO.lessonSubj}</dd>
			<dt><i class="bi bi-bookmark-star"></i> 강사명</dt>
			<dd>${lessonVO.tName}</dd>
			<dt><i class="bi bi-bookmark-star"></i> 종류</dt>
			<dd>${lessonVO.lessonType}</dd>
			<dt><i class="bi bi-bookmark-star"></i> 키트 유무</dt>
			<dd>${lessonVO.lessonKit}</dd>
		</span>
		
		
		<c:if test="${lessonVO.lessonKit == '있음'}">
		<div id="addr_content" class="mb-3">
		<h3><span class="title" ><i class="bi bi-box2-heart"></i> 배송 정보</span></h3>
		<hr>
			<dt>수령인</dt>
			<dd><input type="text" class="form-control" id="exampleFormControlInput1" placeholder="수령인을 입력해주세요."
				<c:if test="${postVO.postReceiver != ''}">
					value = ${postVO.postReceiver}
				</c:if>
				>
			</dd>
			<dt>전화번호</dt>
			<dd><input type="text" class="form-control" id="exampleFormControlInput2" placeholder="전화번호를 입력해주세요."
				<c:if test="${postVO.postTel != ''}">
					value = ${postVO.postTel}
				</c:if>
				>
			</dd>
			<dt>수령지</dt>
			<dd><input type="text" class="form-control" id="exampleFormControlInput3" placeholder="수령지를 입력해주세요."
				<c:if test="${postVO.postAddr != ''}">
					value = ${postVO.postAddr}
				</c:if>
				>
			</dd>
			<dt>요청사항</dt>
			<dd><input type="text" class="form-control" id="exampleFormControlInput4" placeholder="내용을 입력해주세요."
				<c:if test="${postVO.postEtc != ''}">
					value = ${postVO.postEtc}
				</c:if>
				>
			</dd>	
		</div>
		</c:if>
		
		<div id="right_content">
			<h2><span class="hb_yellow"><i class="bi bi-gem"></i> 결제 정보 </span></h2>
			<hr>
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
		</div>
		</div>
</body>
</html>