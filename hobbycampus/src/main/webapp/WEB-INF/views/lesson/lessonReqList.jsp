<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" cellspacing="0" width="550">
		<thead>
		<tr>
			<th>강의 제목</th>
			<th>학생 </th>
			<th>신청 날짜</th>
			<th>수락하기</th>
		</tr>
	</thead>
	<tbody></tbody>
		<c:if test="${empty lists }">
			<tr>
				<td colspan="3" align="center">
				신청 강의가 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${lists }">
			<tr align="center">
				
				<td>${dto.lesson_subj}</td>
				<td>${dto.u_name }</td>
				<td>${dto.lesson_buy_date }</td>
				<td>
					<input type="button" value="수락">
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>