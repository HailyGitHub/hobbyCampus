<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<form action="lessonBasicForm.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>썸네일</td>
					<td><input type="file" name="thumbnail"></td>
				</tr>
				<tr>
				<tr>
					<th>강의 제목</th>
					<td><input type="text" name="lesson_subj"></td>
				</tr>
				<tr>
					<th>종류</th>
					<td><input type="radio" name="lesson_type"  value="온라인">온라인</td>
					<td><input type="radio" name="lesson_type"  value="오프라인">오프라인</td>
					<td><input type="radio" name="lesson_type"  value="라이브">라이브</td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="lesson_price"></td>
				</tr>
				<tr>
					<th>간단 설명</th>
					<td><input type="text" name="lesson_short_cont"></td>
				</tr>
				<tr>
					<th>키트 유무</th>
					<td><input type="radio" name="lesson_kit" value="true">키트 있음</td>
					<td><input type="radio" name="lesson_kit" value="false">키트 없음</td>
				</tr>
				<tr>
					<td><input type="submit" 전송></td>
				</tr>
			</table>
		</form>
		</div>
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>