<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>


function userNameCheck(){
	var username=document.userUp.u_name.value;
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

function userDel(){
	if(confirm("정말로 탈퇴하시겠습니까?")){
		location.href="userDel.do";
	} 

}

</script>
</head>
<body>
<form name="userUp" action="userUp.do" method="POST" enctype="multipart/form-data">


	프로필 사진 : 	<label><img src="${dto.u_img }"><br>
		<input type="hidden" name="u_img" value="${dto.u_img }">
		<input type="file" name="upload" style="display:none"><br><br></label>
		
	닉네임 : <input type="text" name="u_name" value="${u_name}">
		<input type="button" value="사용가능 여부" onclick="userNameCheck()"><br>
		<div id="msg"> &nbsp;</div>
		
	폰번호 : 	<input type="tel" name="u_tel" value="${dto.u_tel}"><br>
	비밀번호 : <input type="password" name="u_pwd"><br>
		<input type="submit" value="정보 수정"><br>
	
</form>
<hr>

회원 탈퇴
<input type="button" value="회원탈퇴" onclick="userDel()">
</body>
</html>