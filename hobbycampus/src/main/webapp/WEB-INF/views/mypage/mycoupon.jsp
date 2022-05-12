<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
<!--BootStarp-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<!--CSS-->
<link rel="stylesheet" href="/hobbycampus/css/main.css">
<link rel="stylesheet" href="/hobbycampus/css/pointShop.css">
<script src="/hobbycampus/js/lib/ajax.js"></script>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

	<div class="container">
		<div id="wrap">
			<h3><span class="hb_yellow">쿠폰 내역 <i class="bi bi-ticket-perforated"></i></h3>
			
			<div id="contents_buttons">
				<input type="button" class="btn btn-outline-warning" value="사용 가능"
					onclick="location.href='/hobbycampus/mycoupon.do'"> 
				<input type="button" class="btn btn-outline-warning" value="사용 완료"
					onclick="location.href='/hobbycampus/mycoupon.do?stat=N'">
			</div>
			<table class="table table-hover">
				<thead class="table-light">
					<tr>
						<th>등록일</th>
						<th>쿠폰명</th>
						<th>만료일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${couponList}" var="coupon">
						<tr>
							<td><c:out value="${coupon.couponStart}" /></td>
							<td><c:out value="${coupon.couponTitle}" /></td>
							<td><c:out value="${coupon.couponEnd}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
</body>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</html>