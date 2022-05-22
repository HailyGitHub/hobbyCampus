<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<!-- Title -->
		<article class="title">
			<div class="row text-center m-5">
				<h2><i class="bi bi-arrow-down-circle-fill "></i> 강의 수정 </h2>
			</div>
		</article>
		
		<form class="needs-validation" action="lessonUpdate.do" method="post" enctype="multipart/form-data">
		
          <div class="row g-3">
          
            <div class="col-10">
              <label for="lesson_subj" class="form-label">강의 제목</label>
              <input type="text" class="form-control" name="lesson_subj" value="${dto.lesson_subj }" required="required">
              <div class="invalid-feedback">
                강의 제목을 입력해주세요
              </div>
            </div>
            
            <h4 class="mb-3">강의 타입</h4>

            <input type="hidden" name="lesson_type" value="${dto.lesson_type }" >
            
            <div class="col-10">
            	<label for="thumbnail" class="form-label">썸네일 등록</label>
				<input type="file" class="form-file" name="thumbnail">
            </div>
            <div class="col-10">
              <label for="lesson_price" class="form-label">가격</label>
              <input type="text" class="form-control" name="lesson_price" required="required" 
              		 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
              	     value="${dto.lesson_price }">
              <div class="invalid-feedback">
                가격을 입력해주세요
              </div>
            </div>

            <div class="col-10">
              <label for="lesson_short_cont" class="form-label">강의 소개</label>
              <input type="text" class="form-control" name="lesson_short_cont" value="${dto.lesson_short_cont}" placeholder="간단한 강의 설명" required="required">
            <div class="invalid-feedback">
                간단한 설명을 입력해주세요
              </div>
            </div>
			
			 <div class="my-3">
			 <label for="lesson_kit" class="form-label">키트 유무</label>
              <div class="form-check">
                <input type="radio" name="lesson_kit" value="있음" type="radio" class="form-check-input">
                <label class="form-check-label">유</label>
            </div>
              <div class="form-check">
                <input type="radio" name="lesson_kit" value="없음" type="radio" class="form-check-input">
                <label class="form-check-label">무</label>
            </div>
            </div>



            <div class="col-md-5">
              <label for="cate1_name" class="form-label">카테고리</label>
              <select class="form-select" id="cateOneList" name="cate1_idx" onchange="showCateTwo(idx)">           
              	<option>카테고리</option>
              </select>
              <div class="invalid-feedback">
                카테고리를 설정해주세요.
              </div>
            </div>

             <div class="col-md-5">
              <label for="cate2_name" class="form-label">세부 카테고리</label>
              <select class="form-select" id="cateTwoList" name="cate2_idx">
                <option value="">세부 카테고리</option>
                
              </select>
              <div class="invalid-feedback">
                세부 카테고리를 설정해주세요.
              </div>
            </div>
            <button class="col-md-10 btn btn-primary btn-lg" type="submit">강의 수정</button>
          </div>
         
        </form>
       </div>
       </div>
      </main>
        
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<script>
$(document).ready(function(){

	$.ajax({
		type: 'GET',
		url: 'sideBarCateOne.do',
		dataType: 'json',
		success: function(s1){
			var $s_one = s1.cateOne
			
			
			
			$('#cateOneList').empty();
			$('#cateOneList').append('<option>카테고리</option>')
			for(var i=0 ; i < s1.cateOne.length ; i++){
				$('#cateOneList').append('<option value="'+$s_one[i].cate1_idx+'">'+ $s_one[i].cate1_name +'</option>');
			}
		}
	});
}); //document



	$('#cateOneList').change(function(){
		var $oneVal = $('#cateOneList').val();
		
		
		$.ajax({
			type: 'GET',
			url: 'sideBarCateTwo.do',
			data: {'cate1_idx':$oneVal},
			dataType: 'json',
			success: function(s2){
				var $s_two = s2.cateTwo
				$('#cateTwoList').empty();
				$('#cateTwoList').append('<option>세부 카테고리</option>')
				
				for(var i=0; i<s2.cateTwo.length; i++){
					
					
					$('#cateTwoList').append('<option value="'+$s_two[i].cate2_idx+'">'+ $s_two[i].cate2_name +'</option>');				
				}
			}
		});
	});
</script>

</html>