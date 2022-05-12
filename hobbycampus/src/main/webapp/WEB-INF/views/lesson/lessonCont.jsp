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
	<h1>강의 상세 페이지</h1>
	<table>
	<c:if test="${empty lists }">
		<tr>
			<td colspan="2" align="center">
			등록된 정보가 없습니다.
			</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${lists}">
		<tr>
			<th>제목</th>
			<td>${dto.lesson_subj }</td>
		</tr>
		<tr>
			<th>이미지 파일</th>
			<td>${dto.online_img }</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${dto.lesson_price }</td>
		</tr>
		<tr>
			<th>썸네일</th>
			<td>${dto.lesson_thumbnail }</td>
		</tr>
		<tr>
			<th>간단설명</th>
			<td>${dto.lesson_short_cont }</td>
		</tr>
		<tr>
			<th>키트유무</th>
			<td>${dto.lesson_kit }</td>
		</tr>
		<tr>
			<th>상세설명</th>
			<td>${dto.online_cont }</td>
		</tr>
		<tr>
			<th>찜수</th>
			<td>${like}</td>
		</tr>
	</c:forEach>
		<tr>
			<th colspan="2">구분선--------------------------------------------------------------------------------</th>
		</tr>
	<c:forEach var="rv" items="${review }">
		<tr>
			<th>별점</th>
			<td>${rv.star_point }</td>
		</tr>
		<tr>
			<th>리뷰 내용</th>
			<td>${rv.review_cont }</td>
		</tr>
		<tr>
			<th>리뷰 날짜</th>
			<td>${rv.review_date }</td>
		</tr>
	</c:forEach>
		
	</table>

</body>
</html>