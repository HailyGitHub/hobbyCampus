<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<c:if test="${empty lesson_record_state }">				
		아직 수강한 강의가 없습니다.			
	</c:if>
	
	<div class="lesson_list_section">
			<div class="lesson_group">
				<ul class="lesson_group_list">
			<div class="lesson_item">
					<span class="lesson_record_state ">$레슨 상태$</span>
					<br>
					<!-- 링크: 수강한 강의 상세 정보 페이지로 lessonCont.do-->
					<a href="#">
					<!--강의 섬네일 표시 영역  -->
						<img src="C:\\hobbyImg\\lesson\\강사이메일주소\\...png" width="60" height="60">
				
				<div class="lesson_info">
						<p class="lesson_subj">
							$강의명$
						</p>
						<ul>
							<li><span>강사명</span></li>
							<li><span>강의 구매날짜</span> $구매일$</li>
						</ul>
					</a>					
				</div>
			</div>
		</div>
	</div>
</body>
</html>