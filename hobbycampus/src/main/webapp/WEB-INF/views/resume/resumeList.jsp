<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전체 이력서 관리 페이지</title>
	<!-- Title Icon -->
    <link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!--BootStarp-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- AJax Module -->
    <script type="text/javascript" src="/hobbycampus/js/httpRequest.js"></script>
    <!-- CSS -->
    <link rel="stylesheet" href="/hobbycampus/css/main.css">
    <style>
    	.main-area{
    		width: 80%;
    		margin: 0px auto;
    		min-height: 70vh;
    	}
    	table img{
    		width: 30px;
    		border: 1px solid black;
    	}
    	#resumeInfoModal img{
    		width: 200px;
    		border: 1px solid black;
    	}
    </style>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	
	<!-- Main -->
	<main class="main-area">
		<!-- Select Button List -->
		<article class="select-list m-5">
			<div class="d-grid gap-2 d-md-block col-md-12 text-center">
				<button class="btn btn-lg" type="button" id="btn_1"><i class="bi bi-journal-text"></i> 전체목록</button>
				<button class="btn btn-lg position-relative" type="button" id="btn_2">
					<!-- Badge Button -->
					<i class="bi bi-journal-plus"></i> 신청목록
					<c:if test="${applyCnt != 0}">
						<span class="badge bg-danger rounded-pill">${applyCnt}</span>					
					</c:if>
				</button>
				<button class="btn btn-lg" type="button" id="btn_3"><i class="bi bi-journal-check"></i> 마감목록</button>
			</div>
		</article>
		
		<!-- List Table -->
		<article class="list-table">
			<div class="col-md-12">
				<table class="table m-4 table-hover">
					<thead>
						<tr>
							<th scope="col" class="col-md-1">#</th>
							<th scope="col" class="col-md-1">프로필</th>
							<th scope="col" class="col-md-3">이메일</th>
							<th scope="col" class="col-md-2">이름</th>
							<th scope="col" class="col-md-2">성별</th>
							<th scope="col" class="col-md-2">면접</th>
							<th scope="col" class="col-md-1">결과</th>
						</tr>
					</thead>
					<tbody>
						<!-- IF lists is null -->
						<c:if test="${empty lists}">
							<tr>
								<td colspan="7" class="text-center">등록된 정보가 없습니다.</td>
							</tr>
						</c:if>
						
						<!-- IF lists is not null  -->
						<c:forEach var="dto" items="${lists}">
							<tr class="${dto.interview_result=='대기'? '':'table-secondary'}" data-bs-toggle="modal" data-bs-target="#resumeInfoModal" onclick="getResume(${dto.resume_idx}, '${dto.u_email}')">
								<th scope="row">${dto.resume_idx}</th>
								<td><img src="/hobbycampus/img/${dto.resume_img}" class="rounded-circle"></td>
								<td>${dto.u_email}</td>
								<td>${dto.resume_name}</td>
								<td>${dto.u_gender}</td>
								<td><span class="badge ${dto.interview_state=='대기'? 'bg-secondary':''} ${dto.interview_state=='예약'? 'bg-warning text-dark':''} ${dto.interview_state=='완료'? 'bg-success':''}">${dto.interview_state}</span></td>
								<td><span class="badge ${dto.interview_result=='대기'? 'bg-secondary':''} ${dto.interview_result=='불합격'? 'bg-danger':''} ${dto.interview_result=='합격'? 'bg-success':''}">${dto.interview_result}</span></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<!-- Bootstrap Pagination -->
						<tr>
							<td colspan="7">
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
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</article>
		
		<!-- Resume Info Modal -->
		<article class="resume-info-modal">
			<div class="modal fade" id="resumeInfoModal" tabindex="-1" aria-labelledby="ResumeModalLabel" aria-hidden="true">
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
<script>
	
	/* List Button CSS */
	var $uri = $(location).attr('pathname'); //Get pathname
	
	if($uri=='/hobbycampus/resumeList.do'){
		$('#btn_1').addClass('btn-primary');
		$('#btn_2').addClass('btn-outline-primary');
		$('#btn_3').addClass('btn-outline-primary');
	}else if($uri=='/hobbycampus/resumeApplyList.do'){
		$('#btn_1').addClass('btn-outline-primary');
		$('#btn_2').addClass('btn-primary');
		$('#btn_3').addClass('btn-outline-primary');
	}else if($uri=='/hobbycampus/resumeResultList.do'){
		$('#btn_1').addClass('btn-outline-primary');
		$('#btn_2').addClass('btn-outline-primary');
		$('#btn_3').addClass('btn-primary');
	}
	
	/* Click Button to move page */
	$('#btn_1').click(function(){
		$(location).attr('href', 'resumeList.do');
	});
	$('#btn_2').click(function(){
		$(location).attr('href', 'resumeApplyList.do');
	});
	$('#btn_3').click(function(){
		$(location).attr('href', 'resumeResultList.do');
	});

	
	/* Input Info to Modal */
	var resultText = '';
	function getResume(idx, email){
		
		$.ajax({
			type: 'GET',
			url: 'resumeInfo.do',
			data: {'resume_idx': idx},
			dataType: 'json',
			success: function(result){
				resultText = result; // To Trim???
				var dto = resultText.result;
				var ImgSrc = '/hobbycampus/img/';
				
				$('#modal_title').attr('data-idx', dto.resume_idx);
				$('#modal_title').attr('data-email', email);
				$('#modal_title').text(dto.resume_name + '님 이력서');
				$('#modal_img').attr('src', ImgSrc + dto.resume_img);
				$('#modal_intro').text(dto.resume_intro);
				$('#modal_cate1_name').text(dto.cate1_name);
				$('#modal_cate2_name').text(dto.cate2_name);
				$('#modal_cate1_img').attr('src', ImgSrc + dto.cate1_img);
				$('#modal_cate2_img').attr('src', ImgSrc + dto.cate2_img);
				$('#modal_plan').text(dto.resume_plan);
				$('#model_interview_date').text(dto.interview_date_param);
				$("input:radio[name='interview_state']").removeAttr("checked");
				$("input:radio[name='interview_state']").each(function() {
					if($(this).val() == dto.interview_state)
						$(this).attr('checked', true);
					});
				$("input:radio[name='interview_result']").removeAttr("checked");
				$("input:radio[name='interview_result']").each(function() {
					if($(this).val() == dto.interview_result)
						$(this).attr('checked', true);
					});
			}//success : function
		});//ajax
	}//getResume()
	
	
	/* Change Resume State */
	function updateState(){

		if(!confirm('정보를 수정하시겠습니까?')) return false; //Check Again
		
		var r_idx = $('#modal_title').attr('data-idx');
		var u_email = $('#modal_title').attr('data-email');
		var i_state = $('input:radio[name="interview_state"]:checked').val();
		var i_result = $('input:radio[name="interview_result"]:checked').val();
		
		$.ajax({
			type: 'GET',
			url: 'resumeChangeState.do',
			data: {'resume_idx':r_idx,'u_email':u_email, 'interview_state':i_state, 'interview_result':i_result},
			dataType: 'text',
			success: function(msg){
				alert(decodeURI(msg) + '하였습니다.');
				location.reload();
			}
		});//Ajax
	}//updateState
</script>
</html>