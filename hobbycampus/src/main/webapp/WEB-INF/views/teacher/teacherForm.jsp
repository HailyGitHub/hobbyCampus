<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function nameCheck() {
		window.open('nameCheck.do','nameCheck','width=400 height=300');
	}
</script>
</head>
<body>
	<form name="selectTeacher" action="teacherInfo.do" method="post" >
		<input type="hidden" name="t_idx" value="1">
		<table border="">
			<tr>
				<td rowspan="3"><input type="file" name=""></td>
			</tr>
			<tr>
				<td>
					<input type="text" name="t_name" value=${dto.t_name} readonly="readonly">
					<input type="button" value="닉네임 중복" onclick="nameCheck();"> 
				</td>
			</tr>	
			<tr>	
				<td>
					<input type="text" name="t_account_owner" value=${dto.t_account_owner}>
					<input type="text" name="t_account_number" value=${dto.t_account_number}>
					<input type="text" name="t_account_bank" value=${dto.t_account_bank}>
				</td>
			</tr>	
			<tr>
				<td colspan="4">
					<textarea rows="4" cols="120" style="resize: none;" name="t_profile">${dto.t_profile}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="button" value="원래대로" onclick="location.href='teacherInfo.do?t_idx=1'">
					<input type="submit" value="수정하기"> 
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>