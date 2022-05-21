<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <style>
    	.classWithPad { 
    		margin-left : 50px;
    		margin-right : 50px;
    		margin-bottom:80px;
    		padding:100px; 
    	}
    </style>
    <script>
    </script>
</head>
<body>
<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<!-- MAIN -->
<div id="container" class="classWithPad">
	<div class="py-5 text-center">
    	<h2>강사 신청서</h2>
  	</div>
  	  <hr class="my-2">
	<form class="row g-3 " name="insertResume" action="resume.do" method="post" enctype="multipart/form-data" >
   
    <div class="col-md-1"></div>
    <div class="col-md-3">
      <label for="validationDefault01" class="form-label">성함(실명)</label>
      <input type="text" name="resume_name" class="form-control" id="validationDefault01"  required>
    </div>
    <div class="col-md-3">
      <label for="validationDefault02" class="form-label">면접 희망일</label>
      <input  type="date" name="interview_date_param" class="form-control" id="validationDefault02" required>
    </div>

    <div class="col-md-3">
      <label for="validationDefault01" class="form-label">사진 *jpg만 가능합니다.</label>
      <input type="file" name="resumeImg" value="이력서 사진" class="form-control" id="validationDefault01" required>
    </div>
    <div class="col-md-2"></div>
    
    <div class="col-md-1"></div>
    <div class="col-md-9">
      <label for="resume_intro" class="form-label">자기소개</label>
      <textarea class="form-control" rows="4" id="intro" cols="40" name="resume_intro" style="resize: none;"></textarea>
    </div>
    <div class="col-md-2"></div>


    <div class="col-md-1"></div>
    <div class="col-md-3">
      <label for="cate2" class="form-label">수업 카테고리(대분류)</label>
      
      <!-- cate1 List-->
      <select class="form-select" id="cate1" name="cate1_idx"  required>
      	<option>::대분류::</option>
      	<c:forEach var="cate1" items="${cate1List}">
      		<option value="${cate1.cate1_idx}" >${cate1.cate1_name}</option>
      	</c:forEach>
      </select>
    </div> 
      <!-- cate2 -->
    <div class="col-md-3">  
    <label for="cate2" class="form-label">(소분류)</label>
    	<div  id="cate2">
      	<!-- From JQuery -->
      	</div>
    </div>  
      
      
  
    <div class="col-md-2"></div>
    <div class="col-md-3"></div>
    <div class="col-md-1"></div>
    <div class="col-md-9">
      <label for="resume_plan" class="form-label">수업계획</label>
      <textarea class="form-control" rows="4" id="intro" cols="40" name="resume_plan" style="resize: none;"></textarea>
    </div>
    <div class="col-md-2"></div>
		

  <div class="col-md-1"></div>
    <div class="col-10">
      <div class="form-check">
        <input class="form-check-input" type="checkbox" value="" id="invalidCheck1" required>
        <label class="form-check-label" for="invalidCheck1">
            <a href="#">개인정보 활용 동의서</a>에 동의합니다.
        </label>
      </div>
      <div class="form-check">
        <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
        <label class="form-check-label" for="invalidCheck2">
          	면접 혹은 합격여부 관련 안내사항은 메일 주소로 발송됨을 확인하였습니다.
        </label>
      </div>
    </div>
    <div class="col-md-5"></div>
    <div class="col-md-2">
      <button class="btn btn-primary" type="submit">이력서 제출</button>
    </div>
    <div class="col-md-5"></div>
  </form>
</div>  
		<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<script>

	 $('#cate1').change(function () {
		 
		$.ajax({
			url :"cate2.do",
			type : "get",
			data : {'cate1_idx': $('#cate1').val()},
			dataType : "json",
			success : function(data) {
				$('#cate2').empty();
				var $dto = data.cate2List;
				var addOption = '';
				for(var i=0; i<$dto.length; i++){
					addOption+='<option value="'+$dto[i].cate2_idx+'">'+$dto[i].cate2_name+'</option>';
				}
				
				$('#cate2').append('<select class="form-select" id="cate2List" name="cate2_idx"  required>'+addOption+'</select>');
					
				
			}
		});	
	});

	
	
</script>
</html>