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
	<table>
		<c:if test="${empty lists }">
			<tr>
				<td>등록된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${lists }">
			<tr>
				<th>강의 이력 번호</th>
				<td>${dto.lesson_record_idx }</td>
			</tr>
			<tr>
				<th>강의명</th>
				<td>${dto.lesson_subj }</td>
			</tr>
			<tr>
				<th>학생명</th>
				<td><${dto.u_name }</td>
			</tr>
			<tr>
				<th>수업일자</th>
				<td>${dto.lesson_time }</td>
			</tr>
			<tr>
				<th>수업 진행 상태</th>
				<td>${dto.lesson_record_state }</td>
			</tr>
			<tr>
				<th>수업 정산 상태</th>
				<td>${dto.lesson_exchange_state }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>