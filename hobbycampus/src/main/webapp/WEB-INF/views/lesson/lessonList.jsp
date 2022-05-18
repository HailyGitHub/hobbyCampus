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
<!--BootStarp-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- CSS -->
<link rel="stylesheet" href="/hobbycampus/css/main.css">
<style type="text/css">

.card{
	float: left;
}

</style>
</head>
<body>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<c:if test="${empty lists }">
		<tr>
			<td colspan="2" align="center">
			등록된 정보가 없습니다.
			</td>
		</tr>
	</c:if>
	
<div id="wrap">
<div id="container">
 <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;,float: left;">
    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-5 fw-semibold">카테고리</span>
    </a>
    <ul class="list-unstyled ps-0">
      <c:forEach var="cate1" items="${cate1}">	
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
          ${cate1.cate1_name}
        </button>
        <div class="collapse show" id="home-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
          	<c:forEach var="cate2" items="${cate2}">
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">${cate2.cate2_name }</a></li>
           	</c:forEach>
          </ul>
        </div>
      </li>
      </c:forEach>
    </ul>
  </div>
  <div id="allcard">
  <c:forEach var="dto" items="${lists}">
  <div class="card" style="width: 18rem;">
  <img src="/hobbycampus/hobbyImg/lesson/t_idx/l_idx/1.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">${dto.lesson_subj }</h5>
    <p class="card-text">${dto.lesson_short_cont }</p>
    <a href="lessonCont.do?lesson_idx=${dto.lesson_idx}" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
 </c:forEach>
</div>
</div>
</div>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include> 	
</body>
</html>