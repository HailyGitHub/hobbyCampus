<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- Title Icon -->
    <link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!--BootStarp-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!--CSS-->
    <link rel="stylesheet" href="/hobbycampus/css/main.css">
</head>
<body>
<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<!-- MAIN -->
	<h1>강사 신청</h1>
	<form name="insertResume" action="resume.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="u_idx "value="1">
		<table border="">
			<tr>
				<td rowspan="3"><input type="file" name="resumeImg" value="이력서 사진"></td>
			</tr>
			<tr>
				<td><input type="text" name="resume_name" placeholder="이름"></td>
			 <td><input type="date" name="interview_date_param" placeholder="면접희망일"></td>
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
		<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>