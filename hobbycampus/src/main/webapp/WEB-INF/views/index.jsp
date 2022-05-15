<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>하비 캠퍼스 메인 화면</title>
	<!-- Title Icon -->
    <link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!--BootStarp-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!--CSS-->
    <link rel="stylesheet" href="/hobbycampus/css/main.css">
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<!-- MAIN -->
	<main>
		<!-- Slide Show -->
		<article class="mx-auto">
		  <div id="carouselExampleIndicators" class="carousel slide col-md-12" data-bs-ride="carousel">
		      <div class="carousel-indicators">
		        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		         <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
		      </div>
		      <div class="carousel-inner">
		        <div class="carousel-item active" >
		          <img src="img/banner_01.png" class="d-block w-100" alt="간판1" height="650em">
		        </div>
		        <div class="carousel-item">
		          <img src="img/banner_02.png" class="d-block w-100" alt="간판2" height="650em">
		        </div>
		        <div class="carousel-item">
		          <img src="img/banner_03.png" class="d-block w-100" alt="간판3" height="650em">
		        </div>
		        <div class="carousel-item">
		          <img src="img/banner_04.png" class="d-block w-100" alt="간판3" height="650em">
		        </div>
		      </div>
		      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		        <span class="visually-hidden">Previous</span>
		      </button>
		      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		        <span class="carousel-control-next-icon" aria-hidden="true"></span>
		        <span class="visually-hidden">Next</span>
		      </button>
		  </div>
		</article>
		
		<!-- Hobby Campus Introduce Video -->
		<article class="col-md-12" align="center">
			<table class="col-md-12">
				<tr>
					<td class="col-md-4">
						<div class="b_icon">
							<i class="bi bi-film"></i>
						</div>
						<h2>하비캠퍼스 소개 동영상</h2>
						<div>
							<p>내가 원하는 수업 카테고리</p>
							<p>내가 원하는 스타일을 수업 방식</p>
							<p>나만의 수업 방식을 찾아 수업을 진행해 보세요.</p>
						</div>
					</td>
					<td class="col-md-8">					
						<video src="video/intro.mp4" autoplay muted loop></video>
					</td>
				</tr>
			</table>
		</article>
		
		<!-- Teacher Introduce Video -->
		<article class="col-md-12" align="center">
			<table class="col-md-12">
				<tr>
					<td class="col-md-4">
						<div class="b_icon">
							<i class="bi bi-tags"></i>
						</div>
						<h2>하비캠퍼의 다양한 강사진</h2>
						<div>
							<p>원하는 수업의 카테고리와</p>
							<p>다양한 스타일을 수업 방식</p>
							<p>나만의 선생님을 찾을 수 있습니다.</p>
						</div>
					</td>
					<td class="col-md-8">					
						<video src="video/teacher.mp4" autoplay muted loop></video>
					</td>
				</tr>
			</table>
		</article>

		<!-- Category Introduce Video -->
		<article class="col-md-12" align="center">
			<table class="col-md-12">
				<tr>
					<td class="col-md-4">
						<div class="b_icon">
							<i class="bi bi-person-workspace"></i>
						</div>
						<h2>풍부하고 다양한 주제의 수업</h2>
						<div>
							<p>분야가 다양한 주제를 선정하여</p>
							<p>그 주제에 맞는 수업을 </p>
							<p>하비 캠퍼스에서 제공하고 있습니다.</p>
						</div>
					</td>
					<td class="col-md-8">					
						<video src="video/category.mp4" autoplay muted loop></video>
					</td>
				</tr>
			</table>
		</article>
		
		<!-- Dynamic Number -->
		<article class="col-md-12 justify-content-center" id="dynamic-box" align="center">
			<div class="row">
				<table class="bg-light justify-content-center m-1">
					<tr id="dynamic-icon">
						<th class="col-md-3 display-4 text-danger"><i class="bi bi-person-video3"></i></th>
						<th class="col-md-3 display-4 text-success"><i class="bi bi-people-fill"></i></th>
						<th class="col-md-3 display-4 text-primary"><i class="bi bi-pencil"></i></th>
						<th class="col-md-3 display-4 text-warning"><i class="bi bi-palette2"></i></th>
					</tr>
					<tr id="dynamic-number">
						<td class="display-1 text-danger" id="dynamic1" data-rate="100"><b></b></td>
						<td class="display-1 text-success" id="dynamic2" data-rate="300"><b></b></td>
						<td class="display-1 text-primary" id="dynamic3" data-rate="150"><b></b></td>
						<td class="display-1 text-warning" id="dynamic4" data-rate="25"><b></b></td>
					</tr>
					<tr id="dynamic-title">
						<td class="text-danger"><h3>강사</h3></td>
						<td class="text-success"><h3>학생</h3></td>
						<td class="text-primary"><h3>클래스</h3></td>
						<td class="text-warning"><h3>카테고리</h3></td>
					</tr>
				</table>
			</div>
		</article>
		
		<hr>		
		
		<!-- Teacher List -->
		<article>
			<h2 align="center" class="intro_tag">인기 강사</h2>
			<div class="row row-cols-1 row-cols-md-4 g-4">
			  <div class="col">
			    <div class="card">
			      <img src="img/none.png" class="card-img-top" alt="...">
			      <div class="card-body text-center">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      	<a href="#" class="btn btn-primary">수업보러 가기</a>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card">
			      <img src="img/none.png" class="card-img-top" alt="...">
			      <div class="card-body text-center">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      	<a href="#" class="btn btn-primary">수업보러 가기</a>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card">
			      <img src="img/none.png" class="card-img-top" alt="...">
			      <div class="card-body text-center">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
			      	<a href="#" class="btn btn-primary">수업보러 가기</a>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card">
			      <img src="img/none.png" class="card-img-top" alt="...">
			      <div class="card-body text-center">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      	<a href="#" class="btn btn-primary">수업보러 가기</a>
			      </div>
			    </div>
			  </div>
			</div>
		</article>
		
		<!-- Lesson List -->
		<article>
			<h2 align="center" class="intro_tag">인기 클래스</h2>
			<div class="row row-cols-1 row-cols-md-4 g-4">
			  <div class="col">
			    <div class="card">
			      <img src="img/none.png" class="card-img-top" alt="...">
			      <div class="card-body text-center">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      	<a href="#" class="btn btn-primary">수업보러 가기</a>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card">
			      <img src="img/none.png" class="card-img-top" alt="...">
			      <div class="card-body text-center">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      	<a href="#" class="btn btn-primary">수업보러 가기</a>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card">
			      <img src="img/none.png" class="card-img-top" alt="...">
			      <div class="card-body text-center">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
			      	<a href="#" class="btn btn-primary">수업보러 가기</a>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card">
			      <img src="img/none.png" class="card-img-top" alt="...">
			      <div class="card-body text-center">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      	<a href="#" class="btn btn-primary">수업보러 가기</a>
			      </div>
			    </div>
			  </div>
			</div>
		</article>
		
		<!-- Category Two List -->
		<article class="category_list">
			<h2 align="center" class="intro_tag">카테고리 목록</h2>
			<div class="wrap" align="center">
				<!-- GET Category Two -->
				<c:forEach var="cateTwoDTO" items="${cateTwoList}">
				 	<div class="hex">
						<p style="font-size:25px;">
						${cateTwoDTO.cate2_name}
						<img src="/hobbycampus/hobbyImg/category2/${cateTwoDTO.cate2_img}" style="width:35px;" class="rounded-circle">
						</p>
				    </div>
				</c:forEach>
			</div>
		</article>
		
		<hr>
		
		<!-- Sign-up Button -->
		<article>
			<div class="text-center">
				<img src="img/user.png" class="rounded" alt="..." width="150">
				<h3>지금 당장 가입하고 시작해 보세요!</h3>
				<p>다양한 분야의 클래스를 받아보고 <br>자기계발에 힘을 써보세요</p>
				<button type="button" class="btn btn-warning" id="end_line">지금 가입하기</button>
			</div>
		</article>

	</main>
	
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<!-- JavaScript -->
<script type="text/javascript" src="/hobbycampus/js/dynamicNumber.js"></script>
</html>