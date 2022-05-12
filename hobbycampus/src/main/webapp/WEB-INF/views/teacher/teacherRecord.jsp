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
		<div class="col-md-10">
			<table id="recordTable" class="table table-hover">
					<thead>
						<tr>
					      <th scope="col">이력번호</th>
					      <th scope="col">강의명</th>
					      <th scope="col">학생명</th>
					      <th scope="col">수업일자</th>
					      <th scope="col">진행상태</th>
					      <th scope="col"  >정산상태</th>
					    </tr>
					</thead>
					<tfoot>
						<td colspan="6">
							${pageStr }
						</td>
					</tfoot>
					<tbody>
						<c:if test="${empty lists }">
							<tr>
								<td>등록된 게시글이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="dto" items="${lists }">
							<tr class="${dto.lesson_exchange_state=='미정산'?'table-warning':''}">
								<td>${dto.lesson_record_idx }</td>
								<td>${dto.lesson_subj }</td>
								<td>${dto.u_name }</td>
								<td>${dto.lesson_time }</td>
								<td>${dto.lesson_record_state }</td>
								<td>${dto.lesson_exchange_state }</td>
							</tr>
						</c:forEach>
					</tbody>
			</table>
		</div>
		</div>
		<div class="col-md-1">
	</div>
	</main>	
	
</body>
</html>