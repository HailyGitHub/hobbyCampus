<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>  
#my_sidebar{
	width:200px; float: left;

}

#content{
	overflow:hidden;
}

body { background: #fff; }
.blueone {
  border-collapse: collapse;
}  
.blueone th {
  padding: 10px;
  color: #168;
  border-bottom: 3px solid orange;
  text-align: left;
}
.blueone td {
  color: #669;
  padding: 10px;
  border-bottom: 1px solid #ddd;
}
.blueone tr:hover td {
  color: #004;
}

h1{
	color:orange;
}
hr[role="tournament5"]::before {
    position: absolute;
    background-color: #efefef;
    border: 1px solid;
    border-color: #AC8353;
    padding: 10px;
    transform: rotate(45deg);
    left: 50%;
    margin: -10px 0px 0px -22px;
    content: "";
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!--BootStarp-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!--CSS-->
    <link rel="stylesheet" href="/hobbycampus/css/main.css">
    <script src="/hobbycampus/js/lib/ajax.js"></script>
</head>
<body>
<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<div id="my_sidebar">
	<h2>학생이름 공간</h2>
	<hr role="tournament5">
	<ul>
	 <li><a href="#">내 정보</a></li>
	 <li><a href="#">내 포인트</a></li>
	 <li><a href="#">포인트 충전</a></li>
	 <li><a href="#">내 수강 내역</a></li>
	 <li><a href="#">내 리뷰</a></li>
	 <li><a href="#">찜 목록</a></li>
	 <li><a href="#">내 쿠폰</a></li>
	</ul>
</div>
<div id="contents">
<h1>쿠폰 내역</h1>
	<div id="contents_buttons">
	<input type="button" value="사용 가능" onclick="location.href='/hobbycampus/mycoupon.do'">
	<input type="button" value="사용 완료" onclick="location.href='/hobbycampus/mycoupon.do?stat=N'">
	</div> 
<table class="blueone">
	<thead>
		<tr>
			<th>등록일</th>
			<th>쿠폰명</th>
			<th>만료일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${couponList}" var="coupon">
		    <tr>
		        <td><c:out value="${coupon.couponStart}"/></td>
		        <td><c:out value="${coupon.couponTitle}"/></td>
		        <td><c:out value="${coupon.couponEnd}"/></td>  
		    </tr>
		</c:forEach>
	</tbody>
</table>
</div>
</body>
<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
</html>