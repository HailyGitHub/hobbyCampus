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
		<aside class="sidebar col-md-3">
			<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
				<a href="#" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
					<span class="fs-5 fw-semibold">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
							<path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
					<path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
					</svg>
					카테고리 목록
					</span>
				</a>
				<ul class="list-unstyled ps-0" id="cate-sidebar">
					<!-- Data From JQuery -->
				</ul>
			</div>
		</aside>
		
		<!-- Section Area -->
		<section class="col-md-9">
			<!-- Title Area -->
			<article>
				<div class="row text-center m-4" id="aside" data-type="${type}${type==null? '라이브' : ''}">
					<h2><i class="bi bi-file-ruled"></i> ${type} 수업 목록</h2>
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
									<img src="/hobbycampus/hobbyImg/lesson/${dto.lesson_thumbnail}/thumbnail.jpg" class="card-img-top" style="width:130px;">						
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
				<!--  
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
				-->
			</article>
		</section>
	</main>
	
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<!-- JavaScript -->
<script type="text/javascript" src="/hobbycampus/js/dynamicNumber.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// Clean Category One List
	$('#cate-sidebar').empty();
	
	$.ajax({
		type: 'GET',
		url: 'sideBarCateOne.do',
		dataType: 'json',
		success: function(one){
			var $cateOne = one.cateOne;
			
			for(var i=0; i<$cateOne.length; i++){
				$('#cate-sidebar').append('<li class="mb-1">'
						+ '<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#co_'+$cateOne[i].cate1_idx+'" aria-expanded="false" onclick="showCateTwo('+$cateOne[i].cate1_idx+')">'
						+ $cateOne[i].cate1_name
						+ '</button>'
						+ '<div class="collapse" id="co_'+$cateOne[i].cate1_idx+'">'
						+ '<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small" id="ul_'+$cateOne[i].cate1_idx+'" data-test="test">'
						+ '</ul></div></li>'
						);
			}
		}
	});
	
});

function showCateTwo(idx){
	
	$.ajax({
		type: 'GET',
		url: 'sideBarCateTwo.do',
		data: {'cate1_idx':idx},
		dataType: 'json',
		success: function(two){
			var $cateTwo = two.cateTwo;
			var $lessonType = $('#aside').attr('data-type');
			
			$('#ul_'+idx).empty();
			for(var i=0; i<$cateTwo.length; i++){
				$('#ul_'+idx).append('<li><a href="lessonList.do?lesson_type='+$lessonType+'&cate2_idx='+$cateTwo[i].cate2_idx+'" class="link-dark rounded">'+$cateTwo[i].cate2_name+'</a></li>');				
			}
		}
	});
}
</script>
</html>