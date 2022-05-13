<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>강의 등록</h1>
<form action="lesson.do" method="post" name="lessonForm">
	<fieldset>
	<legend>강의 등록</legend>
		<table>
			<tr>
				<th>강의 제목</th>
				<td><input type="text" name="lesson_subj"></td>
			</tr>
			<tr>
				<th>종류</th>
				<td><input type="radio" name="lesson_type" value="온라인">온라인</td>
				<td><input type="radio" name="lesson_type" value="오프라인">오프라인</td>
				<td><input type="radio" name="lesson_type" value="라이브">라이브</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="lesson_price"></td>
			</tr>
			<tr>
				<th>썸네일</th>
				<td><input type="text" name="lesson_thumbnail"></td>
			</tr>
			<tr>
				<th>간단 설명</th>
				<td><input type="text" name="lesson_short_cont"></td>
			</tr>
			<tr>
				<th>키트 유무</th>
				<td><input type="radio" name="lesson_kit" value="유">키트 있음</td>
				<td><input type="radio" name="lesson_kit" value="무">키트 없음</td>
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