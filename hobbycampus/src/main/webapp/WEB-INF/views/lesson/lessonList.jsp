<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>내 강의 조회</h1>
<table border="1" cellspacing="0" width="550">
	<thead>
		<tr>
			<th>강의 제목</th>
			<th>강의 썸네일</th>
			<th>간단설명</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty lists }">
		<tr>
			<td colspan="3" align="center">
			등록된 강의가 없습니다.
			</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${lists}">
		<tr>
			<td>${dto.lesson_subj}</td>
			<td>${dto.lesson_thumbnail}</td>
			<td>${dto.lesson_short_cont}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>