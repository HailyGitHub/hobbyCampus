<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="tNameCheck" action="nameCheck.do" method="post">
		<fieldset>
			<legend>닉네임 중복 체크</legend>
			<ul>
				<li>닉네임 <input type="text" name="t_name">
						<input type="submit" value="중복확인">
				</li>
			</ul>
		</fieldset>
	</form>
</body>
</html>