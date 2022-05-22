<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<form action="onlineLessonForm.do" method="post" name="onlineLessonForm" enctype="multipart/form-data">
			<div class="row g-3">
				<input type="hidden" name="l_idx" value="${l_idx}">
				<input type="hidden" name="save" value="${save}">
				
		    <div class="col-10">
              <label for="online_subj" class="form-label">온라인 강의 제목</label>
              <input type="text" class="form-control" name="online_subj" required="required">
              <div class="invalid-feedback">
                온라인 강의 제목을 입력해주세요
              </div>
            </div>
			<div class="col-10">
            	<label for="onlineImg" class="form-label">이미지 등록</label>
				<input type="file" class="form-file" name="onlineImg">
              </div>	
			<div class="col-10">
            	<label for="onlineFile" class="form-label">강의 동영상</label>
				<input type="file" class="form-file" name="onlineFile">
            </div>	
			<div class="col-10">
              <label for="online_cont" class="form-label">강의 상세 설명</label>
              <div class="col-10">
              <textarea name="online_cont" class="form-textarea" style="resize: none" cols="155" rows="5" ></textarea>
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