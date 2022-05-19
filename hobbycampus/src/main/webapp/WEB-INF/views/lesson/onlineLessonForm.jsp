<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Title Icon -->
<link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!--CSS-->
   <link rel="stylesheet" href="/hobbycampus/css/main.css">
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
		<h1>강의 등록</h1>
		<form action="onlineLessonForm.do" method="post" name="onlineLessonForm" enctype="multipart/form-data">
			<fieldset>
			<legend>강의 등록</legend>
				<table>
					<input type="hidden" name="l_idx" value="${l_idx}">
					<input type="hidden" name="save" value="${save}">
					<tr>
						<th>온라인 강의 제목</th>
						<td><input type="text" name="online_subj"></td>
						
					</tr>
					<tr>
						<th>이미지 파일</th>
						<td><input type="file" name="onlineImg"  ></td>
					</tr>
					<tr>
						<th>강의 동영상</th>
						<td><input type="file"  name="onlineFile" ></td>
					</tr>
					<tr>
						<th>상세 설명</th>
						<td><textarea name="online_cont"></textarea></td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="확인">
						</td>
						<td>
							<input type="reset" value="다시 작성">
						</td>
					</tr>
				</table>	
			</fieldset>
		</form>
		</div>
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>