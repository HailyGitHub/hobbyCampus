<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내 강의 조회 페이지</title>
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
    	.card img{
    		width: 200px;
    	}
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
	<!-- MAIN -->
	<main class="main-area">
		<!-- Title -->
		<article class="title">
			<div class="row text-center m-5">
				<h2><i class="bi bi-arrow-down-circle-fill"></i> 내 강의 목록 </h2>
			</div>
		</article>
		
		<!-- My Lesson List -->
		<article class="lesson-list text-center">
			<!-- If No data -->
			<c:if test="${empty lists}">
				<div class="card mb-3">
					<div>
						<img src="/hobbycampus/img/loading.gif" class="card-img-top center-block">				
					</div>
					<div class="card-body">
						<h5 class="card-title">등록된 강의 정보가 없습니다.</h5>
						<p class="card-text">새로운 강의를 등록해서 학생들에게 자신의 지식을 전달해 보세요.</p>
					</div>
				</div>
			</c:if>
			<!-- IF have data then For Each List -->
			<c:forEach var="dto" items="${lists}">
				<div class="card mb-3">
					<div class="row">
					<div class="col-md-4" >
						<img src="/hobbycampus/img/none.png" data-img="${dto.lesson_thumbnail}" class="card-img-top center-block">				
					</div>
					<div class="col-md-6">
						<h5 class="card-title m-4">${dto.lesson_subj}</h5>
						<p class="card-text">${dto.lesson_short_cont}</p>
					</div>
					<div class="col-md-2 align-self-center">
						<button type="button" class="btn btn-outline-success m-2">강의 정보 수정</button>
						<button type="button" class="btn btn-outline-warning m-2" data-bs-toggle="modal" data-bs-target="#scheduleModal" onclick="showSchedule(${dto.lesson_idx})">스케줄 관리</button>
					</div>
					</div>
				</div>
			</c:forEach>
			<div class="m-5">
					<c:choose>
						<c:when test="${empty lists}">
							<nav aria-label="Page navigation empty data">
							<ul class="pagination justify-content-center">
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
							</ul>
							</nav>
						</c:when>
						<c:when test="${!empty lists}">
							${pageStr}									
						</c:when>
					</c:choose>
				</div>
		</article>
	</main>
	
	<!-- Schedule Modal -->
	<div class="modal fade" id="scheduleModal" tabindex="-1" aria-labelledby="scheduleLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content rounded-5 shadow">
				<!-- Model Header -->
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<div class="row" id="title-row">
						<h3><i class="bi bi-calendar-check"></i> 스케줄 관리</h3>
					</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<!-- Model Body -->
				<div class="modal-body p-5 pt-0">
					<!-- Schedule Input Form -->
					<div class="form-floating mb-3">
						<h5><b><i class="bi bi-card-list" id="s_title" data-idx=""></i> 스케줄 등록</b></h5>
					</div>
					<div class="form-floating mb-3">
						<div class="input-group mb-3">
							<input type="date" class="form-control" id="m_start" required>
						</div>
					</div>
					<div class="form-floating mb-3">
						<div class="input-group mb-3">
							<select class="form-select" id="m_hour" required>
								<!-- Data From JQuery -->
							</select>
							<span class="input-group-text">:</span>
							<select class="form-select" id="m_min" required>
								<!-- Data From JQuery -->
							</select>
						</div>
					</div>
					<div class="form-floating mb-3">
						<div class="input-group mb-3">
							<span class="input-group-text">등록 인원</span>
							<input type="number" class="form-control fs-4" min="1" id="m_count" required>
						</div>
					</div>
					<div class="form-floating mb-3 text-center">
						<button type="button" class="btn btn-danger" onclick="return schduleSubmit()">스케줄 등록</button>
					</div>
					
					<hr class="my-4">
					
					<!-- Schedule List -->
					<div class="form-floating mb-3">
						<div class="row">
							<h5 class="col-md-6"><b><i class="bi bi-list-check"></i> 스케줄 목록</b></h5>								
						</div>
						<table class="table m-2">
							<thead>
								<tr>
									<th scope="col" class="col-md-1">#</th>
									<th scope="col" class="col-md-4">날짜</th>
									<th scope="col" class="col-md-3">시간</th>
									<th scope="col" class="col-md-2">인원</th>
									<th scope="col" class="col-md-2">취소</th>
								</tr>
							</thead>
							<tbody class="cateTwo-tbody" id="modal-tbody">
								<!-- Data FROM JQuery -->
							</tbody>
						</table>
					</div>
					<div id="cateTwo-form-area"></div>
					<hr class="my-4">
					<!-- Close Button -->						
					<div class="text-center">
						<button type="button" class="btn btn-primary btn-lg" data-bs-dismiss="modal" aria-label="Close">확인</button>								
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</main>
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<!-- Schedule List JS -->
<script type="text/javascript" src="/hobbycampus/js/scheduleButton.js"></script>
<!-- JavaScript -->
<script type="text/javascript" src="/hobbycampus/js/dynamicNumber.js"></script>
</html>