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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<!--CSS-->
<link rel="stylesheet" href="/hobbycampus/css/main.css">
<link rel="stylesheet" href="/hobbycampus/css/pointShop.css">
<script src="/hobbycampus/js/lib/ajax.js"></script>
</head>
<body>
	<div class="container">
		<div id="wrap">
			<h3>
				<span class="hb_yellow">내 수강 내역</span>
			</h3>
			<br>
			<div>
				<input type="button" name="list_bt" value="전체 목록"
					class="btn btn-outline-warning"
					onclick="$myLesson.goWithFilter(this)"> <input
					type="button" name="lesson_bt" value="수강중"
					class="btn btn-outline-warning"
					onclick="$myLesson.goWithFilter(this)"> <input
					type="button" name="reser_bt" value="예약"
					class="btn btn-outline-warning"
					onclick="$myLesson.goWithFilter(this)"> <input
					type="button" name="end_bt" value="수강완료"
					class="btn btn-outline-warning"
					onclick="$myLesson.goWithFilter(this)"> <input
					type="button" name="cencel_bt" value="수강취소"
					class="btn btn-outline-warning"
					onclick="$myLesson.goWithFilter(this)">
			</div>
			<br>
			<!--아래로 로그인된 회원의 레슨상태(수강중/예약/수강완료/취소)에 따라 출력되는 부분  -->
			<c:choose>
				<c:when test="${empty lessonRecordList}">
			해당 수강 내역이 없습니다.
		</c:when>
				<c:otherwise>
					<div class="lesson_list_section">
						<c:forEach items="${lessonRecordList}" var="lessonRecord">
							<div class="lesson_item">
								<span class="lesson_record_state ">${lessonRecord.lessonRecordState}</span>
								<br>
								<!-- 링크: 수강한 강의 상세 정보 페이지로 lessonCont.do-->
								<a href="#"> <!--강의 섬네일 표시 영역  --> <img
									src="C:\\hobbyImg\\lesson\\강사이메일주소\\...png" width="60"
									height="60">
									<div class="lesson_info">
										<p class="lesson_subj">${lessonRecord.lessonSubj}</p>
										<ul>
											<li><span>강사명</span></li>
											<li>${lessonRecord.tName}</li>
											<li><span>강의 구매날짜</span>${lessonRecord.lessonBuyDate}</li>
										</ul>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>