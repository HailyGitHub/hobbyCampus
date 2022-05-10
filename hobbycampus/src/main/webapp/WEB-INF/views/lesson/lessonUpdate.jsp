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

<h1>강의 수정</h1>
<form action="lessonUpdate.do" method="post" name="lessonUpdateForm">
	<c:forEach var="dto" items="${lists}">
	<fieldset>
	<legend>강의 수정</legend>
		<table>
			<tr>
				<th>강의 제목</th>
				<td><input type="text" name="lesson_subj" value="${dto.lesson_subj}"></td>
			</tr>
			<tr>
				<th>종류</th>
				<c:set var="type" value="${dto.lesson_type}" />
				<td><input type="radio" name="lesson_type" value="온라인" 
					<c:if test="${type=='온라인'}">checked</c:if> >온라인</td>
				<td><input type="radio" name="lesson_type" value="오프라인"
					<c:if test="${type=='오프라인'}">checked</c:if> >오프라인</td>
				<td><input type="radio" name="lesson_type" value="라이브"
					<c:if test="${type=='라이브'}">checked</c:if> >라이브</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="lesson_price" value="${dto.lesson_price}"></td>
			</tr>
			<tr>
				<th>썸네일</th>
				<td><input type="text" name="lesson_thumbnail" value="${dto.lesson_thumbnail}"></td>
			</tr>
			<tr>
				<th>간단 설명</th>
				<td><input type="text" name="lesson_short_cont" value="${dto.lesson_short_cont}"></td>
			</tr>
			<tr>
				<th>키트 유무</th>
				<c:set var="kit" value="${dto.lesson_kit}" />
				<td><input type="radio" name="lesson_kit" value="유"
					<c:if test="${kit=='유'}">checked</c:if> >키트 있음</td>
				<td><input type="radio" name="lesson_kit" value="무"
					<c:if test="${kit=='무'}">checked</c:if>>키트 없음</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="확인">
				</td>
				<td>
					<input type="reset" value="다시 작성">
				</td>
			</tr>
		</table>
	</fieldset>
	</c:forEach>
</form>
</body>
</html>