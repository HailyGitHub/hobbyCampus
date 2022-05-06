<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>하비 캠퍼스 메인 화면</title>
    <link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!--BootStarp-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
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
		      </div>
		      <div class="carousel-inner">
		        <div class="carousel-item active" >
		          <img src="img/user.png" class="d-block w-100" alt="..." height="650em">
		        </div>
		        <div class="carousel-item">
		          <img src="img/teacher.png" class="d-block w-100" alt="..." height="650em">
		        </div>
		        <div class="carousel-item">
		          <img src="img/admin.png" class="d-block w-100" alt="..." height="650em">
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

		<!-- Catgory Introduce Video -->
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
		
		<!-- Category List -->
		<article class="category_list">
			<h2 align="center" class="intro_tag">카테고리 목록</h2>
			<div class="wrap" align="center">
			 	<div class="hex">
					<p>카테고리 1</p>
			    </div>
			 	<div class="hex">
					<p>카테고리 2</p>
			    </div>
				<div class="hex">
					<p>카테고리 3</p>
			    </div>
			 	<div class="hex">
					<p>카테고리 4</p>
			    </div>
			 	<div class="hex">
					<p>카테고리 5</p>
			    </div>
			 	<div class="hex">
					<p>카테고리 6</p>
			    </div>
			 	<div class="hex">
					<p>카테고리 7</p>
			    </div>
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
</html>