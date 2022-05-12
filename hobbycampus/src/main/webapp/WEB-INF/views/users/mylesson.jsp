<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/hobbycampus/js/myLesson.js"></script>
</head>
<body>
<h2>내 수강 내역</h2>
<div id="wrap">
	<div class="button_set">
		<input type="button" name="list_bt" value="전체 목록" onclick="$myLesson.goWithFilter(this)">
		<input type="button" name="lesson_bt" value="수강중"onclick="$myLesson.goWithFilter(this)">
		<input type="button" name="reser_bt" value="예약" onclick="$myLesson.goWithFilter(this)">
		<input type="button" name="end_bt" value="수강완료" onclick="$myLesson.goWithFilter(this)">
		<input type="button" name="cencel_bt" value="수강취소" onclick="$myLesson.goWithFilter(this)">
	</div>
	<hr>
	
	<!--아래로 로그인된 회원의 레슨상태(수강중/예약/수강완료/취소)에 따라 출력되는 부분  -->
	<c:choose>
		<c:when test="${empty lessonRecordList}">
			해당 수강 내역이 없습니다.
		</c:when>
		<c:otherwise>
			<div class="lesson_list_section">
				<div class="lesson_group">
					<ul class="lesson_group_list">
						<c:forEach items="${lessonRecordList}" var="lessonRecord">
						    <li>
						       <div class="lesson_item">
									<span class="lesson_record_state ">${lessonRecord.lessonRecordState}</span>
									<br>
									<!-- 링크: 수강한 강의 상세 정보 페이지로 lessonCont.do-->
									<a href="#">
										<!--강의 섬네일 표시 영역  -->
										<img src="C:\\hobbyImg\\lesson\\강사이메일주소\\...png" width="60" height="60">
										<div class="lesson_info">
											<p class="lesson_subj">
												${lessonRecord.lessonSubj}
											</p>
											<ul>
												<li><span>강사명</span></li>
												<li>${lessonRecord.tName}</li>
												<li><span>강의 구매날짜</span>${lessonRecord.lessonBuyDate}</li>
											</ul>
										</div>
									</a>					
								</div>
						    </li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>