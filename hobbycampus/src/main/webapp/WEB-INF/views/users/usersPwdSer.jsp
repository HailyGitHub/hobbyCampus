<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function userPwdSer(){
	String useremail=document.userPwdSer.u_email.value;
		var param='email='+useremail;
		sendRequest('userEmailCheck.do',param,emailSendResult,'POST');	
}

function emailSendResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data=XHR.responseText;
				document.all.msg.innerHTML=data;
			}
		}
	}
	
}

</script>
</head>
<body>

<form name="userPwdSer" action="userPwdSer.do">
<input type="email" name="u_email">
<input type="button" value="메일 인증하기" onclick="userPwdSer()">


</form>
</body>
</html>