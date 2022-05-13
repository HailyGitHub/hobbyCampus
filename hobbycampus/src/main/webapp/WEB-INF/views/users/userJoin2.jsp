<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>

function emailSend(){
	var useremail=document.emailCheck.u_email.value;
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

</script>
</head>


<body>
<form name="emailCheck"> 
	<h1> 이메일로 회원가입</h1>

	<div>	email <input type="email" name="u_email" placeholder="user@email.com">	
	</div><div>	<input type="button" value="이메일 인증하기" onclick="emailSend()">
	<span id="msg">&nbsp;</span>
	</div>
	</form>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>