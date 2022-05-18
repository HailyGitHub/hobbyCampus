<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항</title>
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
<c:set var="adminSession" value="${a_idx}"></c:set>
<c:if test="${empty adminSession}">
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
</c:if>
<c:if test="${!empty adminSession}">
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	<input type="hidden" id="admin" value="${adminSession}">
</c:if>	



	<!-- Main -->
	<main class="main-area">
	<h1 style="text-align: center; padding-top: 100px;">공지사항</h1>
		<!-- Select Button List -->
		<article class="select-list m-5">
			<div class="d-grid gap-2 d-md-block col-md-12 text-center">
				<button class="btn btn-lg" type="button" id="btn_1"><i class="bi bi-journal-text"></i>학생 공지</button>
				<button class="btn btn-lg position-relative" type="button" id="btn_2">
					<!-- Badge Button -->
					<i class="bi bi-journal-plus"></i> 강사 공지
					<c:if test="${applyCnt != 0}">
						<span class="badge bg-danger rounded-pill">${applyCnt}</span>					
					</c:if>
				</button>
				<button class="btn btn-lg" type="button" id="btn_3"><i class="bi bi-journal-check"></i> 전체 공지</button>
			</div>
		</article>
	
	<article class="list-table">
		<div class="col-md-12">
			<table class="table m-4 table-hover" style="text-align: center;">
				<thead>
					<tr>
						<th scope="col" class="col-md-1">no.</th>
						<th scope="col" class="col-md-4">제목</th>
						<th scope="col" class="col-md-2">작성자</th>
						<th scope="col" class="col-md-1">작성일</th>
					</tr>
				</thead>
				<tfoot>
		<tr>
			<td colspan="3" align="center">${pageStr}</td>
			<td><a href="#"> </a></td>
		</tr>
		
	</tfoot>
				<tbody>
					<c:if test="${empty lists}">
						<tr>
							<td colspan="7" class="text-center">등록된 정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${lists}">
						<tr data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="getInfo(${dto.notice_idx})">
							<td>
							${dto.notice_idx}</td>
							<td>${dto.notice_subj}</td>
							<td>${dto.a_idx}</td>
							<td>${dto.notice_date}</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		<!-- Button trigger modal -->
		<c:if test="${!empty adminSession}">
			<div style="margin-top : 28px; margin-bottom:50px;  width: 100%; text-align: right;">
				<button class="btn btn-outline-primary btn-lg" type="button" data-bs-toggle="modal" 
				data-bs-target="#exampleModal" onclick="createNotice()"> 공지등록</button>
			</div>
		</c:if>
		</div>
	</article>
	</main>
	
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modal_title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <div class="modal-body p-5 pt-0">
        <form class="">
        <input type="hidden" id="notice_idx">
          <div class="form-floating mb-3" name="i_subject">
           <input type="Text" class="form-control rounded-4" id="notice_subj" placeholder="modal_title">
           <label for="notice_subj">Subject</label>
           <p id="t_notice_subj"></p>
          </div>
          <div class="form mb-3" name="i_option" >
	          <select class="form-select form-select-lg mb-3 fs-9" aria-label=".form-select-lg example" id="noticeOpt">
				  <option selected >공개 대상을 선택하세요.</option>
				  <option value="전체">전체</option>
				  <option value="강사">강사</option>
				  <option value="노출">노출</option>
			  </select>
		  </div>
          <div class="form-floating mb-3" name="i_content" >
        	<h5 class="modal-title" id="t_modal_rate"></h5> <!-- title -->
			<pre class="form-floating mb-3" id ="t_notice_cont"></pre> <!-- content (response) -->
            <textarea class="form-control" placeholder="Leave a comment here" style="height: 100px;" id="notice_cont"></textarea>
			<label for="notice_cont">Content</label>
			
          </div>	
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
	        <button type="button" id="modal_udt_btn" class="btn btn-primary" onclick="return updateNotice()">Update</button>
	        <button type="button" id="modal_udt_ok_btn" class="btn btn-primary" onclick="return updateOk()">Update_OK</button>
	        <button type="button" id="modal_crt_btn" class="btn btn-primary" onclick="return createNotice()">Create</button>
	        <button type="button" id="modal_crt_ok_btn" class="btn btn-primary" onclick="return createOk()">Create_OK</button>
      </div>
    </div>
  </div>
</div>




<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
</body>

<script>


	/* List Button CSS */
	var $uri = $(location).attr('pathname'); //Get pathname
	
	if($uri=='/hobbycampus/noticeList.do'){
		$('#btn_1').addClass('btn-primary');
		$('#btn_2').addClass('btn-outline-primary');
		$('#btn_3').addClass('btn-outline-primary');
	}else if($uri=='/hobbycampus/noticeListTeacher.do'){
		$('#btn_1').addClass('btn-outline-primary');
		$('#btn_2').addClass('btn-primary');
		$('#btn_3').addClass('btn-outline-primary');
	}else if($uri=='/hobbycampus/noticeListAll.do'){
		$('#btn_1').addClass('btn-outline-primary');
		$('#btn_2').addClass('btn-outline-primary');
		$('#btn_3').addClass('btn-primary');
	}
	
	/* Click Button to move page */
	$('#btn_1').click(function(){
		$(location).attr('href', 'noticeList.do');
	});
	$('#btn_2').click(function(){
		$(location).attr('href', 'noticeListTeacher.do');
	});
	$('#btn_3').click(function(){
		$(location).attr('href', 'noticeListAll.do');
	});
	
	function btnOff(){

		$('#modal_crt_ok_btn').css('display', 'none');
		$('#modal_crt_btn').css('display', 'none');
		$('#modal_udt_btn').css('display', 'none');
		$('#modal_udt_ok_btn').css('display', 'none');
	}
	
	function getInfo(idx){
		
		$('#modal_title').text('공지사항');
		$('#notice_subj').css('display', 'none');
		$('#noticeOpt').css('display', 'none');
		$('#notice_cont').css('display', 'none');
		$('label').css('display', 'none');
		
		$('#t_notice_subj').css('display', 'block');
		$('#t_notice_cont').css('display', 'block');
		
		btnOff();
		if ($('#admin').val() != null){
			$('#modal_udt_btn').css('display', 'block');
		}
		$('#notice_subj').empty();

$.ajax({
	type: 'GET',
	url: 'noticeInfo.do',
	data: {'notice_idx': idx },
	dataType: 'json',
	success: function(result){
		console.log(result);
		console.log(result.dto.notice_idx); //couponMakeForm().dto.coupon_idx;	 
		$('#t_notice_subj').text(result.dto.notice_subj);
		$('#t_notice_cont').text(result.dto.notice_cont);
		$('#notice_idx').val(result.dto.notice_idx);
		$('#notice_subj').val(result.dto.notice_subj);
		$('#notice_cont').val(result.dto.notice_cont);
		$("#noticeOpt").val(result.dto.notice_viewer).prop("selected", true);
	}
});//ajax		

	
	}
	
	function Form(){
		$('#notice_subj').css('display', 'block');
		$('#noticeOpt').css('display', 'block');
		$('#notice_cont').css('display', 'block');

		$('#t_notice_subj').css('display', 'none');
		$('#t_notice_cont').css('display', 'none');
	}
	
	function createNotice(){

		btnOff();
		Form();
		$('#modal_title').text('공지사항 등록');
		$('#modal_crt_ok_btn').css('display', 'block');
		$('#notice_subj').val('');
		$('#noticeOpt').val('');
		$('#notice_cont').val('');

		

		
	}
	
	function createOk(){
		if(!confirm('게시하시겠습니까?')) return false;
		
		console.log($('#admin').val());
		console.log($('#notice_subj').val());
		console.log($('#noticeOpt').val());
		console.log($('#notice_cont').val());
		var a_idx = $('#admin_idx').val();
		var subj = $('#notice_subj').val();
		var viewer = $('#noticeOpt').val();
		var cont = $('#notice_cont').val();
		$.ajax({
			type: 'GET',
			url: 'noticeMake.do',
			data: {'a_idx' : a_idx ,
				'notice_subj': subj ,
				'notice_viewer' : viewer,
				'notice_cont' : cont },
			dataType: 'json',
			success: function(result){
				alert(result.msg);
			}
		});//ajax	
		location.reload();
	}
	
	function updateNotice(){
		Form();
		btnOff();
		$('#modal_title').text('공지사항 수정');
		$('#modal_udt_ok_btn').css('display', 'block');
		
		
	}
	
	function updateOk(){
		if(!confirm('수정하시겠습니까?')) return false;
		
		console.log($('#admin').val());
		console.log($('#notice_subj').val());
		console.log($('#noticeOpt').val());
		console.log($('#notice_cont').val());
		var notice_idx = $('#notice_idx').val();
		var a_idx = $('#admin_idx').val();
		var subj = $('#notice_subj').val();
		var viewer = $('#noticeOpt').val();
		var cont = $('#notice_cont').val();
		$.ajax({
			type: 'GET',
			url: 'noticeUpdate.do',
			data: {'a_idx' : a_idx ,
				'notice_idx' : notice_idx,
				'notice_subj': subj ,
				'notice_viewer' : viewer,
				'notice_cont' : cont },
			dataType: 'json',
			success: function(result){
				alert(result.msg);
			}
		});//ajax	
		location.reload();
		
	}
	
</script>
</html>