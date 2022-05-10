<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<!-- main -->
	<div class="accordion" id="accordionPanelsStayOpenExample">
    <!--student mypage-->
    <div class="accordion-item">
      <h2 class="accordion-header" id="panelsStayOpen-headingOne">
        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
          <div>
            <span class="fs-4">학생</span>
            <span>닉네임|u_point</span>
          </div>
        </button>
      </h2>
      <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
        <div class="accordion-body">
          <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
              <a href="#" class="nav-link bg-warning">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"/></svg>
                학생 기능1
              </a>
            </li>
            <li>
              <a href="#" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                학생 기능2
              </a>
            </li>
            <li>
              <a href="#" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"/></svg>
                학생 기능3
              </a>
            </li>
            <li>
              <a href="#" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
                학생 기능4
              </a>
            </li>
            <li>
              <a href="#" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
                강사 신청
              </a>
            </li>
          </ul>  
        </div>
      </div>
    </div>
    <!--teacher mypage-->
    <div class="accordion-item">
      <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
          <div>
            <span class="fs-4">강사</span>
            <span>닉네임|t_point</span>
          </div>
        </button>
      </h2>
      <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
        <div class="accordion-body">
          <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
              <a href="#" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"/></svg>
                강사기능1
              </a>
            </li>
            <li>
              <a href="#" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                강사기능2
              </a>
            </li>
            <li>
              <a href="#" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"/></svg>
                강사기능3
              </a>
            </li>
            <li>
              <a href="#" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
                강사기능4
              </a>
            </li>
            <li>
              <a href="#" class="nav-link link-dark">
                <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
                강사기능5
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>