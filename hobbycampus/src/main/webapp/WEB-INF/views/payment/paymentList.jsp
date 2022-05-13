<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>하비 캠퍼스 메인 화면</title>
    <link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!--BootStarp-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--CSS-->
    <link rel="stylesheet" href="/hobbycampus/css/main.css">
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	
	<!-- MAIN -->

	<table>
	<thead>
		<tr>
			<th>결제번호</th>
			<th>결제자</th>
			<th>결재금액</th>
			<th>결제일자</th>
			<th>상태</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="4"align="center">${pageStr}</td>
			<td><a href="#"> </a></td>
		</tr>
		
	</tfoot>
	<tbody>
	<c:if test="${empty lists}">
	<tr>
		<td colspan="5" align="center">
		결제내역 없음 
		</td>
	</tr>
	</c:if>
	<c:forEach var="dto" items="${lists}">
		<tr>
			<td>${dto.pay_list_idx}</td>
			<!-- create url -->
			<c:url var="url" value="paymentList.do">
				<c:param name="idx">${dto.pay_list_idx}</c:param>
			</c:url>
			
			<!-- insert url -->
			<td>
				<a href="${url}">
				${dto.u_idx} 
				</a>
			</td>
			<td>${dto.pay_point}</td>
			<td> ${dto.pay_date}</td>
			<td>${dto.pay_value}</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	
	
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>