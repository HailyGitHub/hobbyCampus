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
<h1>강의 등록</h1>
<form action="onlineLessonForm.do" method="post" name="onlineLessonForm" enctype="multipart/form-data">
	<fieldset>
	<legend>강의 등록</legend>
		<table>
			<input type="hidden" name="l_idx" value="${l_idx}">
			<tr>
				<th>온라인 강의 제목</th>
				<td><input type="text" name="online_subj"></td>
				
			</tr>
			<tr>
				<th>이미지 파일</th>
				<td><input type="file" name="onlineImg"  ></td>
				
				
			</tr>
			<tr>
				<th>강의 동영상</th>
				<td><input type="file"  name="onlineFile" ></td>
			</tr>
			<tr>
				<th>상세 설명</th>
				<td><textarea name="online_cont"></textarea></td>
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
</form>
</body>
</html>