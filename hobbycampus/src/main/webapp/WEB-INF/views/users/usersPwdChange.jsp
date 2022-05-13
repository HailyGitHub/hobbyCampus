<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function checkPwd(){
	var pwd1=document.usersJoin.u_pwd.value;
	var pwd2=document.usersJoin.u_pwdCheck.value;
	
	if(pwd1.length>=6 && pwd1==pwd2) {
		document.getElementById('pwdCheck').style.color="orange";
		document.getElementById('pwdCheck').innerHTML="동일한 암호입니다.";
		return true;
	} else {
		return false;
	}
}


</script>
</head>
<body>

<form name="usersPwdSer2" action="usersPwdSer2.do">
<input type="text" name="u_pwd">
<input type="text" name="u_pwdCheck" onkeyup="CheckPwd();">

<input type="submit" value="확인">
</form>
</body>
</html>