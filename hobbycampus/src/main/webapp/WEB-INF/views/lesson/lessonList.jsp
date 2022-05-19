<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>클래스 목록 페이지</title>
	<!-- Title Icon -->
	<link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<!--CSS-->
    <link rel="stylesheet" href="/hobbycampus/css/main.css">
    <link rel="stylesheet" href="/hobbycampus/css/sideBar.css">
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<!-- MAIN -->
	<main class="row">
		<!-- Aside Side Bar -->
		<jsp:include page="/WEB-INF/views/lesson/lessonSideBar.jsp"></jsp:include>
		
		<!-- Section Area -->
		<section class="col-md-9">
			<!-- Title Area -->
			<article>
				<div class="row text-center m-4">
					<h2><i class="bi bi-file-ruled"></i> OOO 수업 목록</h2>
				</div>
			</article>
			<!-- Lesson List -->
			<article>
				<!-- IF no data -->
				<c:if test="${empty lists}">
					<div class="card mb-3 text-center">
						<div>
							<img src="/hobbycampus/img/loading.gif" class="card-img-top center-block">				
						</div>
						<div class="card-body">
							<h5 class="card-title">등록된 강의 정보가 없습니다.</h5>
						</div>
					</div>
				</c:if>
				
				<!-- IF have data -->
				<div class="row row-cols-1 row-cols-md-4 g-4">
					<c:forEach var="dto" items="${lists}">
						<div class="col">
							<div class="card h-100 text-center">
								<div class="text-center m-2">
									<img src="/hobbycampus/hobbyImg/lesson/t_idx/l_idx/1.png" class="card-img-top" style="width:130px;">						
								</div>
								<div class="card-body">
									<h5 class="card-title">${dto.lesson_subj}</h5>
									 <p class="card-text">${dto.lesson_short_cont}</p>
								</div>
								<div class="text-center mb-2">
									<a href="lessonCont.do?lesson_idx=${dto.lesson_idx}" class="btn btn-outline-secondary">수업 페이지</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- Pagination -->
				<c:if test="${!empty lists}">
					<div class="row m-3">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</nav>
					</div>
				</c:if>
			</article>
		</section>
	</main>
	
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<!-- JavaScript -->
<script type="text/javascript" src="/hobbycampus/js/dynamicNumber.js"></script>
<script type="text/javascript" src="/hobbycampus/js/sideBar.js"></script>
</html>