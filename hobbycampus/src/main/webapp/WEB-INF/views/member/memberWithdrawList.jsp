<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>탈퇴 계정 관리 페이지</title>
	<!-- Title Icon -->
    <link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!--BootStarp-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
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
				<button class="btn btn-outline-primary btn-lg" type="button" id="btn_1"><i class="bi bi-mortarboard-fill"></i> 학생계정</button>
				<button class="btn btn-outline-primary btn-lg" type="button" id="btn_2"><i class="bi bi-easel-fill"></i> 강사계정</button>
				<button class="btn btn-primary btn-lg" type="button" id="btn_3"><i class="bi bi-person-dash-fill"></i> 탈퇴계정</button>
			</div>
		</article>
		
		<!-- List Table -->
		<article class="list-table">
			<div class="col-md-12">
				<table class="table m-4">
					<thead>
						<tr>
							<th scope="col" class="col-md-1">#</th>
							<th scope="col" class="col-md-1">프로필</th>
							<th scope="col" class="col-md-3">이메일</th>
							<th scope="col" class="col-md-2">닉네임</th>
							<th scope="col" class="col-md-2">포인트</th>
							<th scope="col" class="col-md-2">탈퇴날짜</th>
							<th scope="col" class="col-md-1">활성여부</th>
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
							<tr>
								<th scope="row">${dto.u_idx}</th>
								<td><img src="/hobbycampus/hobbyImg/userImg/${dto.u_img}" class="rounded-circle" data-img="${dto.u_img}"></td>
								<td>${dto.u_email}</td>
								<td>${dto.u_name}</td>
								<td>${dto.u_point}</td>
								<td>${dto.u_join_date}</td>
								<td>
									<div class="form-check form-switch">
										<input class="form-check-input" type="checkbox" role="switch" id="${dto.u_idx}" disabled>
										<label class="form-check-label" for="${dto.u_idx}">${dto.u_state}</label>
									</div>
								</td>
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
	</main>
	
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<!-- Switch State Module -->
<script type="text/javascript" src="/hobbycampus/js/member.js"></script>
</html>