<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/hobbycampus/js/myLesson.js"></script>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<!--CSS-->
<link rel="stylesheet" href="/hobbycampus/css/main.css">
<link rel="stylesheet" href="/hobbycampus/css/pointShop.css">
<script src="/hobbycampus/js/lib/ajax.js"></script>
<style>

a { text-decoration:none !important }
a:hover { text-decoration:none !important }

</style>
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
				<span class="hb_yellow">내 수강 내역 <i class="bi bi-bank2"></i></span>
			</h2>
			<br>
			<div>
				<input type="button" name="list_bt" value="전체 목록"
					class="btn btn-outline-warning"
					onclick="$myLesson.goWithFilter(this)"> <input
					type="button" name="lesson_bt" value="예약대기"
					class="btn btn-outline-warning"
					onclick="$myLesson.goWithFilter(this)"> <input
					type="button" name="reser_bt" value="예약완료"
					class="btn btn-outline-warning"
					onclick="$myLesson.goWithFilter(this)"> <input
					type="button" name="end_bt" value="수강완료"
					class="btn btn-outline-warning"
					onclick="$myLesson.goWithFilter(this)"> <input
					type="button" name="cencel_bt" value="취소"
					class="btn btn-outline-warning"
					onclick="$myLesson.goWithFilter(this)">
			</div>
			<br>
			<!--lesson_record_state of user  -->		
			<c:choose>
				<c:when test="${empty lessonRecordList}">
			<hr class="text-warning"><p align="center" class="text-warning">해당 수강 내역이 없습니다.</p>
				</c:when>
			<c:otherwise>
		<div>
		<c:forEach items="${lessonRecordList}" var="lessonRecord">
			<div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0 border border-warning">
	    <div class="col-md-4 ">
	      <img src="..." class="img-fluid rounded-start" alt="...">
	    </div>
    <div class="col-md-8 ">
    <div class="card-body ">
      	 <span class="lesson_record_state "><i class="bi bi-list-stars"></i> ${lessonRecord.lessonRecordState}</span>
        <h5 class="card-title fw-bolder">${lessonRecord.lessonSubj}</h5>
		<div class="lesson_record_state">${lessonRecord.lesson_type}
		<c:if test="${lessonRecord.lesson_type=='온라인'}"><i class="bi bi-camera-reels"></i></i>
			 <input type="button" value="강의보기" class="btn btn-outline-warning fs-6"> 
		</c:if>
		</div>
		<hr>
        <p class="card-text fw-bolder text-black-50 fs-6">강사명 <i class="bi bi-mortarboard-fill"></i></p>
        <p class="card-text fw-bolder fs-5">${lessonRecord.tName}</p>
        <a href="#" class="btn btn-warning">상세 보기</a>
        <p class="card-text"><small class="text-muted">강의 구매날짜: ${lessonRecord.lessonBuyDate}</small></p>
	</div>
 	</div>
	</div>
	</div>
   </c:forEach>
 </div>
</c:otherwise>
</c:choose>
</div>
</div>
</div>
</div>

</body>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>