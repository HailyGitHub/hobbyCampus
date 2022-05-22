<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--CSS-->
<link rel="stylesheet" href="/hobbycampus/css/main.css">
<link rel="stylesheet" href="/hobbycampus/css/pointShop.css">
<style>
dt {
	font-weight: bold;
	color: darkgray;
}

dd {
	font-weight: bold;
	color: darkslategray;
}
</style>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	
	<!-- Information List -->
	<section>
		<!-- Title -->
		<div class="title-area m-5 fs-1 text-center">
			<span class="hb_yellow"><i class="bi bi-bookmark-star"></i>수강신청</span>
		</div>
		
		<!-- Info Area -->
		<div class="row row-cols-1 row-cols-md-2 g-4 m-5">
		  <div class="col">
		    <div class="card border border-warning">
		      <div class="card-body">
		        <h2 class="card-title">	
					<span class="title"><i class="bi bi-award"></i> 수강 정보</span>
				</h2>
				 <ul class="list-group list-group-flush">
				  <li class="list-group-item"></li>
				   <li class="list-group-item">
						<div class="fs-5 text-black-50 fw-bolder text-opacity-25">
							<i class="bi bi-bookmark-star"></i> 강의명
						</div>
					    ${lessonVO.lessonSubj}						
					</li>
				   <li class="list-group-item">
				   		<div class="fs-5 text-black-50 fw-bolder">
							<i class="bi bi-bookmark-star"></i> 강사명
						</div>
					    ${lessonVO.tName}
				  </li>
				   
				   <li class="list-group-item">
				   <div class="fs-5 text-black-50 fw-bolder">
							<i class="bi bi-bookmark-star"></i> 종류
						</div>
					    ${lessonVO.lessonType}
				   
				   </li>
				   <c:if test="${lessonVO.lessonType != '온라인'}">
				   <li class="list-group-item">
				   <div class="fs-5 text-black-50 fw-bolder">
							<i class="bi bi-bookmark-star"></i> 스케쥴
						</div>
						${lessonVO.lessonStart}
						${lessonVO.lessonTime}
						<!-- lessonTime -->
				   </li>
				   </c:if>
				   <li class="list-group-item">
				   <div class="fs-5 text-black-50  fw-bolder">
							<i class="bi bi-bookmark-star"></i> 키트유무
						</div>
					    ${lessonVO.lessonKit}
				   </li>
				 </ul>
		        <p class="card-text"> </p>
		      </div>
		    </div>
		  </div>
		  <div class="col">
		    <div class="card border border-warning">
		      <div class="card-body">
		        <h2 class="card-title">	
					<span class="hb_yellow"><i class="bi bi-award"></i> 결제 정보 </span>
				</h2>
				<ul class="list-group list-group-flush">
				   <li class="list-group-item">
						<div class="fs-5 text-secondary">
						수강료
						</div>
					    ${lessonVO.lessonPrice}						
					</li>
				   <li class="list-group-item">
				   		<div class="fs-5 text-secondary">
						보유 포인트
						</div>
					    ${userVO.uPoint}
				  </li>
				   
				   <li class="list-group-item">
				   <div class="fs-5 text-secondary">
					 보유한 쿠폰
						</div>
					    <select onchange="$myLessonRequest.applyCoupon(this)">
					<option value="" price=0>보유한 쿠폰</option>
					<c:forEach items="${couponList}" var="coupon">
						<option value="${coupon.couponIdx}" price="${coupon.couponRate}">${coupon.couponTitle}</option>
					</c:forEach>
				</select>
				   
				   </li>
				   <li class="list-group-item">
				   <div class="fs-5 text-secondary">
					할인 포인트
						</div>
					   <dd id="price_dd">0</dd>
				<dd id="total_price_hr">총 결제 포인트: ${lessonVO.lessonPrice}</dd>
				   </li>
				   
				 </ul>
				
		        <p class="card-text"><button type="button" class="bt_enter"
					onclick=$myLessonRequest.payment()>결제하기</button></p>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Post Information -->
		<c:if test="${lessonVO.lessonKit == '있음'}">
		<div class="row row-cols-1 row-cols-md-2 g-4 m-5">
		<div class="card border-warning">
  <div class="card-header fs-3 bg-warning opacity-75">
    <h4><i class="bi bi-box2-heart"></i> 배송 정보</h4>
  </div>
  <div class="card-body">
   
    
    <div>
    <ul class="list-group list-group-flush">
				   <li class="list-group-item">
						<div class="fs-6 fw-bolder text-secondary">
						수령인
						<input type="text" class="form-control"
							id="exampleFormControlInput1" placeholder="수령인을 입력해주세요."
							<c:if test="${postVO.postReceiver != ''}">
					value = ${postVO.postReceiver}
							</c:if>>
						</div>
					 	</li>	
					 	 <li class="list-group-item">
						<div class="fs-6 text-secondary">
						전화번호
						<input type="text" class="form-control"
							id="exampleFormControlInput2" placeholder="전화번호를 입력해주세요."
							<c:if test="${postVO.postTel != ''}">
					value = ${postVO.postTel}
							</c:if>>
						</div>
					 	</li>	
					 	 <li class="list-group-item">
						<div class="fs-6 text-secondary">
						수령지
						<input type="text" class="form-control"
							id="exampleFormControlInput3" placeholder="수령지를 입력해주세요."
							<c:if test="${postVO.postAddr != ''}">
					value = ${postVO.postAddr}
							</c:if>>
						</div>
					 	</li>
					 	 <li class="list-group-item">
						<div class="fs-6 text-secondary">
						요청사항
						<input type="text" class="form-control"
							id="exampleFormControlInput4" placeholder="내용을 입력해주세요."
							<c:if test="${postVO.postEtc != ''}">
					value = ${postVO.postEtc}
							</c:if>>
						</div>
					 	</li>						   
				 </ul>  
    </div>

  </div>		
		</div>	
</div>
</c:if>
	</section>
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>