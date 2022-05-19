<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>카테고리 리스트 관리</title>
	<!-- Title Icon -->
    <link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!--BootStarp-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- CSS -->
    <link rel="stylesheet" href="/hobbycampus/css/main.css">
        <style>
    	.main-area{
    		width: 80%;
    		margin: 0px auto;
    		min-height: 70vh;
    	}
    	.rounded-circle{
    		border: 1px solid black;
    		width: 100px;
    	}
    </style>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	
	<!-- MAIN -->
	<main class="main-area">
		<!-- Select Button List -->
		<article class="select-list m-5">
			<div class="d-grid gap-2 d-md-block col-md-12 text-center">
				<button class="btn btn-lg btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#inputCate"><i class="bi bi-bookmark-plus-fill"></i> 카테고리 생성</button>
			</div>
		</article>
		
		<!-- Category_1 List -->
		<div class="row m-2">
			<div class="col-sm-3">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title text-center">큰 카테고리</h5>
						<div class="text-center">					
							<img class="rounded-circle text-center m-1" src="/hobbycampus/img/none.png">
						</div>
						<div class="text-center mt-2">						
							<button type="button" class="btn btn btn-outline-secondary">
								<i class="bi bi-search"></i>상세보기
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title text-center">큰 카테고리</h5>
						<div class="text-center">					
							<img class="rounded-circle text-center m-1" src="/hobbycampus/img/none.png">
						</div>
						<div class="text-center mt-2">						
							<button type="button" class="btn btn btn-outline-secondary">
								<i class="bi bi-search"></i>상세보기
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title text-center">큰 카테고리</h5>
						<div class="text-center">					
							<img class="rounded-circle text-center m-1" src="/hobbycampus/img/none.png">
						</div>
						<div class="text-center mt-2">						
							<button type="button" class="btn btn btn-outline-secondary">
								<i class="bi bi-search"></i>상세보기
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title text-center">큰 카테고리</h5>
						<div class="text-center">					
							<img class="rounded-circle text-center m-1" src="/hobbycampus/img/none.png">
						</div>
						<div class="text-center mt-2">						
							<button type="button" class="btn btn btn-outline-secondary">
								<i class="bi bi-search"></i>상세보기
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row m-2">
			<div class="col-sm-3">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title text-center">큰 카테고리</h5>
						<div class="text-center">					
							<img class="rounded-circle text-center m-1" src="/hobbycampus/img/none.png">
						</div>
						<div class="text-center mt-2">						
							<button type="button" class="btn btn btn-outline-secondary">
								<i class="bi bi-search"></i>상세보기
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title text-center">큰 카테고리</h5>
						<div class="text-center">					
							<img class="rounded-circle text-center m-1" src="/hobbycampus/img/none.png">
						</div>
						<div class="text-center mt-2">						
							<button type="button" class="btn btn btn-outline-secondary">
								<i class="bi bi-search"></i>상세보기
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title text-center">큰 카테고리</h5>
						<div class="text-center">					
							<img class="rounded-circle text-center m-1" src="/hobbycampus/img/none.png">
						</div>
						<div class="text-center mt-2">						
							<button type="button" class="btn btn btn-outline-secondary">
								<i class="bi bi-search"></i>상세보기
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title text-center">큰 카테고리</h5>
						<div class="text-center">					
							<img class="rounded-circle text-center m-1" src="/hobbycampus/img/none.png">
						</div>
						<div class="text-center mt-2">						
							<button type="button" class="btn btn btn-outline-secondary">
								<i class="bi bi-search"></i>상세보기
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Input Category Modal -->
		<article class="resume-info-modal">
			<div class="modal fade" id="inputCate" tabindex="-1" aria-labelledby="inputCate" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable" role="document">
					<div class="modal-content rounded-5 shadow">
						<!-- Model Header -->
						<div class="modal-header p-5 pb-4 border-bottom-0">
							<h3 class="modal-title" id="modal_title">큰 카테고리 생성</h3>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<!-- Model Body -->
						<div class="modal-body p-5 pt-0">
							<form name="Cate_Form_1" action="uploadCate1.do" method="post" enctype="multipart/form-data">
								<!-- Input Category Name -->
								<div class="form-floating mb-3">
									<input type="text" class="form-control rounded-4" name="cate1_name" id="cate1_name" maxlength="7" placeholder="큰 카테고리 이름 입력" required>
									<label for="floatingInput">큰 카테고리 이름</label>
								</div>
								<!-- Upload Category Image -->
								<div class="form-floating mb-3">
									<input type="file" name="cate1_img" id="cate1_img">
								</div>
								<hr class="my-4">
								<!-- Submit Button -->						
								<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit" onclick="return checkFile()">수정하기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</article>

		<!-- Input Category Modal -->
		<article class="resume-info-modal">
			<div class="modal fade" id="" tabindex="-1" aria-labelledby="inputCate" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable" role="document">
					<div class="modal-content rounded-5 shadow">
						<!-- Model Header -->
						<div class="modal-header p-5 pb-4 border-bottom-0">
							<h3 class="modal-title" id="modal_title" data-idx="" data-email="">OOO님 이력서</h3>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<!-- Model Body -->
						<div class="modal-body p-5 pt-0">
							<form name="interviewForm">
								<!-- Resume Image -->
								<div class="form-floating mb-3 text-center">
									<img src="" class="rounded-circle" id="modal_img">
								</div>
								<hr class="my-4">
								<!-- Resume Introduce -->
								<div class="form-floating mb-3">
									<h5><b>자기소개</b></h5>
									<div id="modal_intro">
										자기소개 내용
									</div>
								</div>
								<hr class="my-4">
								<!-- Resume Lesson Plan -->
								<div class="form-floating mb-3">
									<h5><b>카테고리</b></h5>
									<div>
										<span id="modal_cate1_name"><img src="" class="rounded-circle" id="modal_cate1_img" style="width:30px; border: 1px solid black;">카테고리 1</span>
										<span class="fs-5"><i class="bi bi-caret-right-fill"></i></span>
										<span id="modal_cate2_name"><img src="" class="rounded-circle" id="modal_cate2_img" style="width:30px; border: 1px solid black;">카테고리 2</span>
									</div>
								</div>
								<hr class="my-4">
								<!-- Resume Lesson Plan -->
								<div class="form-floating mb-3">
									<h5><b>수업계획</b></h5>
									<div id="modal_plan">
										수업 계획
									</div>
								</div>
								<hr class="my-4">
								<!-- Interview Date -->
								<div class="form-floating mb-3">
									<h5><b>면접희망날짜</b></h5>
									<div id="model_interview_date">
										면접희망날짜
									</div>
								</div>
								<hr class="my-4">
								<!-- Interview Sate Buttons -->
								<div class="form-floating mb-3">
									<h5><b>면접여부</b></h5>
									<div class="btn-group btn-group-lg" role="group" id="modal_interview_state">
										<input type="radio" class="btn-check col-md-4" name="interview_state" id="interview_state_1" autocomplete="off" value="대기">
										<label class="btn btn-outline-secondary" for="interview_state_1">대기</label>
										<input type="radio" class="btn-check col-md-4" name="interview_state" id="interview_state_2" autocomplete="off" value="예약">
										<label class="btn btn-outline-warning" for="interview_state_2">예약</label>
										<input type="radio" class="btn-check col-md-4" name="interview_state" id="interview_state_3" autocomplete="off" value="완료">
										<label class="btn btn-outline-success" for="interview_state_3">완료</label>
									</div>
								</div>
								<hr class="my-4">
								<!-- Interview Result Buttons -->
								<div class="form-floating mb-3">
									<h5><b>면접결과</b></h5>
									<div class="btn-group btn-group-lg" role="group" id="modal_interview_result">
										<input type="radio" class="btn-check col-md-4" name="interview_result" id="interview_result_1" autocomplete="off" value="대기">
										<label class="btn btn-outline-secondary" for="interview_result_1">대기</label>
										<input type="radio" class="btn-check col-md-4" name="interview_result" id="interview_result_2" autocomplete="off" value="불합격">
										<label class="btn btn-outline-danger" for="interview_result_2">불합격</label>
										<input type="radio" class="btn-check col-md-4" name="interview_result" id="interview_result_3" autocomplete="off" value="합격">
										<label class="btn btn-outline-success" for="interview_result_3">합격</label>
									</div>
								</div>
								<hr class="my-4">
								<!-- Submit Button -->						
								<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" id="modal_submit" type="button" onclick="return updateState()">수정하기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</article>

	</main>
	
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function checkFile(){
		var filename = $('#cate1_img').val();
		filename = filename.substring(filename.length-3, filename.length);
		alert(filename);
		if(filename!='jpg' && filename!='png'){
			alert('jpg,png 이미지 파일만 업로드 가능합니다.');
			return false;
		}
	}
</script>
</html>