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

function userNameCheck(){
	var username=document.usersJoin.u_name.value;
	var param='name='+username;
	sendRequest('userNameCheck.do',param,nameCheckResult,'POST');
}

function nameCheckResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;	
			document.getElementById('msg').innerHTML=data;
		}
	}
}

function checkPwd(){
	var pwd1=document.usersJoin.u_pwd.value;
	var pwd2=document.usersJoin.u_pwdCheck.value;
	
	if(pwd1.length>=6 && pwd1==pwd2) {
		document.getElementById('pwdCheck').style.color="orange";
		document.getElementById('pwdCheck').innerHTML="동일한 암호입니다.";
		return true;
	} else {
		document.getElementById('pwdCheck').style.color="red";
		document.getElementById('pwdCheck').innerHTML="비밀번호를 확인해주세요";
		return false;
	}
}

function allCheck(){

	
	//fileCheck
	var filename=document.usersJoin.upload.value;
	
	filename=filename.substring(filename.length-3,filename.length);
	
	if(filename!='jpg'&&filename!='png'&&filename!=""&&filename!=null){
		window.alert('jpg 혹은 png 이미지만 업로드 가능합니다.');
		return false;
	}
	
	return true;
}

function openPage(){

	if('${u_email}'==null||'${u_email}.equals("")'){
		window.alert('잘못된 접근입니다. 페이지를 종료합니다.');
		window.self.close();
	} 
}
</script>
</head>

<body>
	<h1> 이메일로 회원가입</h1>
	
	<form name="usersJoin" action="userEmailJoin.do" method="POST" enctype="multipart/form-data">
	<input type="hidden" name="u_email" value="${u_email}">

	 <div>	프로필 사진 <input type="file" name="upload">
	 <img src="img/user.png" height="100" weight="100"></div> 
	<div>	닉네임 <input type="text" name="u_name" placeholder="닉네임을 입력해 주세요" onkeyup="userNameCheck()" id="u_name" required>
				<span id="msg">&nbsp; 	</span>
	
	</div><div>	비밀번호 <input type="password" name="u_pwd"  maxlength="12"  onkeyup="checkPwd()" pattern="[a-zA-Z0-9]{6,12}" required> 
					비밀번호는 6 ~12 글자의 숫자, 영문 가능합니다.
	</div><div>	비밀번호 확인 <input type="password" name="u_pwdCheck"  onkeyup="checkPwd()"  maxlength="12" pattern="[a-zA-Z0-9]{6,12}" required>
	</div><div id="pwdCheck"> 동일한 암호를 입력하세요
	</div><div>	폰번호 <input type="text" name="u_tel" maxlength="11" pattern="^01(0|1|6|7|8|9){1}[0-9]{7,8}" required><!--  pattern="[0-9]{10,11}" -->
	</div><div>	성별 <input type="radio" name="u_gender" value="남자" checked> 남자
		<input type="radio" name="u_gender" value="여자"> 여자
	</div><div>
	이용약관, 개인정보 수집 및 이용, 개인정보 제공 내용을 확인하였고 동의합니다. 
	</div><div>	<input type="submit" value="회원가입" >
	</div>
	</form>
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>