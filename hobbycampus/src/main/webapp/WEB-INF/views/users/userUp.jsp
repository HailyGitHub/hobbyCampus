<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function userDel(){
	if(confirm("정말로 탈퇴하시겠습니까?")){
		location.href="userDel.do";
	} 

}

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
</script>
</head>
<body>
<form name="userUp" action="userUp.do">

		<img src="${u_img }">
		<input type="text" name="u_name" value="${u_name}">
		<input type="button" value="사용가능 여부" onclick="userNameCheck()">
		<input type="tel" name="u_tel" value="${u_tel}">
		<input type="password" name="">
		<input type="submit" value="정보 수정">
	
</form>

회원 탈퇴
<input type="button" value="회원탈퇴" onclick="userDel()">
</body>
</html>