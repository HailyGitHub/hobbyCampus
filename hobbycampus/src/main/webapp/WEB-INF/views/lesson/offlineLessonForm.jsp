<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   	 var mapAddr = '서울특별시 강남구 테헤란로 415';                                                                                              
</script>
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
		<form action="offlineLessonForm.do" method="post" name="offlineLessonForm" enctype="multipart/form-data">
			<fieldset>
			<legend>강의 등록</legend>
				<table>
				<input type="hidden" name="l_idx" value="${l_idx}">
				<input type="hidden" name="save" value="${save}">
					<tr>
						<th>오프라인 강의시간</th>
						<td><input type="text" name="offline_runtime"></td>
					</tr>
					<tr>
						<th>이미지 파일</th>
						<td><input type="file" name="offlineFolder"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" id="offline_addr" name="offline_addr" placeholder="주소"></td>
						<td><input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"></td>
					</tr>
					<tr>
						<th>상세 설명</th>
						<td><textarea name="offline_cont"></textarea></td>
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
				<div id="map" style="width:300px;height:300px;margin-top:10px;"></div>
			</fieldset>
		</form>
		</div>
	</div>
</main>		
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>

<jsp:include page="/WEB-INF/views/map.jsp"></jsp:include>
</html>