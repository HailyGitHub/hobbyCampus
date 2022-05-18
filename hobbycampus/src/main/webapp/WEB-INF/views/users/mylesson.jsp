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
					type="button" name="lesson_bt" value="수업"
					class="btn btn-outline-warning"
					onclick="$myLesson.goWithFilter(this)"> <input
					type="button" name="reser_bt" value="예약"
					class="btn btn-outline-warning"
					onclick="$myLesson.goWithFilter(this)"> <input
					type="button" name="end_bt" value="완료"
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
			해당 수강 내역이 없습니다.
		</c:when>
				<c:otherwise>
				<div class="divLine">
						<c:forEach items="${lessonRecordList}" var="lessonRecord">
							<div class="lesson_item">
								<span class="lesson_record_state "><i class="bi bi-list-stars"></i> ${lessonRecord.lessonRecordState}</span>
								<br>
								<!-- Link: lessonCont.do-->
								<a href="#"> <!--lesson thumbnail  --> <img
									src="/hobbycampus/hobbyImg/lesson/강사인덱스/레슨인덱스/" width="60"
									height="60">
									<div class="lesson_info">
										<p class="lesson_subj">${lessonRecord.lessonSubj}</p>
											<span class="lessonT"><i class="bi bi-mortarboard-fill"></i> 강사명</span>
											<p class="lessonRecoT">${lessonRecord.tName}</p>
											<span class="lessonT"><i class="bi bi-calendar-check"></i> 시작일</span>
											<p class="lessonStart">$시작일</p>
											<span class="lesson_paydate">강의 구매날짜: ${lessonRecord.lessonBuyDate}</span>
										<span class="spanHR">─────────────────────────────────</span>
									</div>		
								</a>
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