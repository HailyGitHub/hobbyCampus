<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
 <!-- CSS -->
	<link rel="stylesheet" href="/hobbycampus/css/pointShop.css">
<style>
#loading{
	width:300px;
}
.wrap{
	text-align:center;
}
</style>
</head>
<body>
	<br>
	<div class="wrap">
		<img src="img/loading.gif" id="loading">
		<p class="hb_price">수강신청이 <span class="hb_yellow">완료</span>되었습니다.</p>
		<hr id="com_hr">
		<button type="button" class="bt_enter" onclick="location.href='mylessonList.do?lessonScheduleIdx=1'">확인</button>	
	</div>
</body>
</html>