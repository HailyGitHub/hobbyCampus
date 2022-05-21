<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>레슨 신청 목록 페이지</title>
	<!-- Title Icon -->
	<link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<!--CSS-->
    <link rel="stylesheet" href="/hobbycampus/css/main.css">
    <style>
    	.main-area{
			min-height: 70vh;
    	}
    	#lessonRequest{
    		background-color: beige;
    		color : black;
    		font-weight: bold;
    		text-decoration: underline;
    	}
    </style>
</head>
<body>
<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<!-- SIDEBar -->
	<main class="row main-area">
		<div class="col-md-2">
			<jsp:include page="/WEB-INF/views/myPageSide.jsp"></jsp:include>		
		</div>
		<!-- main -->
		<div class="col-md-10">
		<!-- Title -->
		<article class="title">
			<div class="row text-center m-5">
				<h2><i class="bi bi-arrow-down-circle-fill"></i> 내 강의 신청목록</h2>
			</div>
		</article>
		
		<!-- Request Lesson List Table -->
		<article class="table-list">
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">강의 제목</th>
						<th scope="col">학생 닉네임</th>
						<th scope="col">신청 날짜</th>
						<th scope="col">처리 버튼</th>
					</tr>
				</thead>
				<tbody>
					<!-- IF no data -->
					<c:if test="${empty lists}">
						<tr>
							<td colspan="4 text-center">
							신청 들어온 강의가 없습니다.
							</td>
						</tr>
					</c:if>
					<!-- IF have data -->
					<c:forEach var="dto" items="${lists}">
						<tr>
							<td>${dto.lesson_subj}</td>
							<td>${dto.u_name}</td>
							<td>${dto.lesson_buy_date}</td>
							<td>
								<button type="button" class="btn btn-outline-success" 
										onclick="return lessonAccept(${dto.lesson_record_idx })" >수락</button>
								<button type="button" class="btn btn-outline-danger"  
										onclick="return lessonCancel(${dto.lesson_record_idx })" >취소</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</article>
	</div>
	</main>
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<script>
	function lessonAccept(idx){
		if(!confirm('수락 하시겠습니까?')) return false;
		
		// Ajax
		$.ajax({
			type: 'GET',
			url: 'lessonReqAccept.do',
			data: {'lesson_record_idx':idx},
			dataType: 'json',
			success: function(data){
				alert(data.msg);
				window.location.reload();
			}
			
		});
		
	}
	
	function lessonCancel(idx){
		if(!confirm('취소 하시겠습니까?')) return false;
		
		// Ajax
		$.ajax({
			type: 'GET',
			url: 'lessonReqCancel.do',
			data: {'lesson_record_idx':idx},
			dataType: 'json',
			success: function(data){
				alert(data.msg);
				window.location.reload();
			}
			
		});
	}
	
</script>
</html>