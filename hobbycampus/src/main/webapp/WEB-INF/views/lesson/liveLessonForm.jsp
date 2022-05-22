<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <style>
       	#lessonAdd{
   			background-color: beige;
    		color : black;
    		font-weight: bold;
    		text-decoration: underline;
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
		<!-- Title -->
		<article class="title">
			<div class="row text-center m-5">
				<h2><i class="bi bi-arrow-down-circle-fill "></i> 강의 상세 정보 등록 </h2>
			</div>
		</article>		
		
		<form action="liveLessonForm.do" method="post" name="liveLessonForm" enctype="multipart/form-data">
			<input type="hidden" name="l_idx" value="${l_idx}">
			<input type="hidden" name="save" value="${save}">
			<div class="row g-3">
			
			<div class="col-10">
            	<label for="liveFolder" class="form-label">이미지 등록</label>
				<input type="file" class="form-file" name="liveFolder">
            </div>
            
            <div class="col-md-10">
              <label for="live_runtime" class="form-label">강의 시간</label>
              <select class="form-select" name="live_runtime" >
                <option value="1">1시간</option>
                <option value="2">2시간</option>
              </select>
            </div>
            
            <div class="col-md-10">
              <label for="live_tool" class="form-label">사용 어플</label>
              <select class="form-select" name="live_tool" >
                <option value="줌">줌</option>
                <option value="스카이프">스카이프</option>
                <option value="디스코드" >디스코드</option>
              </select>
              <div class="invalid-feedback">
                카테고리를 설정해주세요.
              </div>
            </div>
            
            
			<div class="col-10">
              <label for="live_cont" class="form-label">강의 상세 설명</label>
              <div class="col-10">
              <textarea name="live_cont" class="form-textarea" style="resize: none" cols="155" rows="5" ></textarea>
              </div >
              <div class="invalid-feedback">
                강의 상세 설명을 입력해주세요
              </div>
            </div>
            <button class="col-md-10 btn btn-primary btn-lg" type="submit">상세 내용 등록</button>
            </div>
		</form>
		</div>
		</div>
	</main>
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>