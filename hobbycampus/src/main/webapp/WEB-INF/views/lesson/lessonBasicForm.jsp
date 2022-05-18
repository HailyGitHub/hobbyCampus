<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="lessonBasicForm.do" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>썸네일</td>
			<td><input type="file" name="thumbnail"></td>
		</tr>
		<tr>
		<tr>
			<th>강의 제목</th>
			<td><input type="text" name="lesson_subj"></td>
		</tr>
		<tr>
			<th>종류</th>
			<td><input type="radio" name="lesson_type"  value="온라인">온라인</td>
			<td><input type="radio" name="lesson_type"  value="오프라인">오프라인</td>
			<td><input type="radio" name="lesson_type"  value="라이브">라이브</td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="text" name="lesson_price"></td>
		</tr>
		<tr>
			<th>간단 설명</th>
			<td><input type="text" name="lesson_short_cont"></td>
		</tr>
		<tr>
			<th>키트 유무</th>
			<td><input type="radio" name="lesson_kit" value="true">키트 있음</td>
			<td><input type="radio" name="lesson_kit" value="false">키트 없음</td>
		</tr>
		<tr>
			<td><input type="submit" 전송></td>
		</tr>
	</table>
</form>
</body>
</html>