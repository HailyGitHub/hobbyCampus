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
<form action="liveLessonForm.do" method="post" name="onlineLessonForm" enctype="multipart/form-data">
	<fieldset>
	<legend>강의 등록</legend>
		<table>
			<tr>
				<th>라이브 강의시간</th>
				<td><input type="text" name="live_runtime"></td>
			</tr>
			<tr>
				<th>사용 어플</th>
				<td><input type="text" name="live_tool"></td>
			</tr>
			<tr>
				<th>이미지 파일</th>
				<td><input type="file" value="이미지 업로드" name="liveFolder"></td>
			</tr>
			<tr>
				<th>상세 설명</th>
				<td><textarea name="live_cont"></textarea></td>
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