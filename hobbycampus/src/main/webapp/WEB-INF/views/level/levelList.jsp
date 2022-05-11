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
			<th>레벨</th>
			<th>칭호</th>
			<th>아이콘</th>
			<th>혜택</th>
			<th>조건</th>
		</tr>
	</thead>

		
	<tbody>
	<c:if test="${empty lists}">
	<tr>
		<td colspan="5" align="center">
		레벨 시트 조회 불가능
		</td>
	</tr>
	</c:if>
	<c:forEach var="dto" items="${lists}">
		<tr>
			<td>${dto.lev_idx}</td>
			<!-- create url -->
			<c:url var="url" value="levelList.do">
				<c:param name="idx">${dto.lev_idx}</c:param>
			</c:url>
			
			<!-- insert url -->
			<td>
				<a href="${url}">
				${dto.lev_name} 
				</a>
			</td>
			<td>${dto.lev_img}</td>
			<td> 환전 수수료 ${dto.lev_rate} % 감소</td>
			<td>누적 매출 ${dto.lev_sales} 원</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	
	
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>