<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<h1>강사 신청</h1>
	<form name="insertResume" action="resume.do" method="post">
		<table border="">
			<tr>
				<td rowspan="3">사진</td>
			</tr>
			<tr>
				<td><input type="text" name="resume_name" placeholder="이름"></td>
				<td><input type="text" name="interview_date" placeholder="면접희망일"></td>
			</tr>
			<tr>
				<td colspan="3"><textarea rows="4" cols="40" name="resume_intro" placeholder="자기소개" style="resize: none;"></textarea></td>
			</tr>
			<tr>
				<td colspan="3"><textarea rows="6" cols="50" name="resume_plan" placeholder="수업계획" style="resize: none;"></textarea> </td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
	
	</form>
</body>
</body>
</html>