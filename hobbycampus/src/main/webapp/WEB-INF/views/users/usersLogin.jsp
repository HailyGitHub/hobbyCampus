<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<h1>로그인</h1>

       <form name="usersLogin" action="userLogin.do" method="POST">
	      	<div>
	      		<input type="email" name="u_email" placeholder="email"
	      			value="${cookie.savemail.value}">
	      	</div>
	      	<div>
	      		<input type="password" name="u_pwd" placeholder="password">
	      	</div>
	     <div>
	      <input type="checkbox" name="savemail" value="on" 
	      	${empty cookie.savemail.value?'':'checked'}>ID 기억하기
	      	<input type="submit" class="btn btn-warning" value="로그인">
</div>
	  </form>   
	   
	      <div> 또는 </div>
	      <div class="d-grid gap-2">
	            	<input type="button" class="btn btn-warning" value="카카오톡으로 로그인" onclick="#">
	      </div>

 
     
      
       <div class="col" align="center">
       <div> 아직 회원이 아니신가요? </div>
             	<input type="button" class="btn btn-warning" value="이메일로 회원가입" onclick="#">
       </div>
       <div> 또는 </div><div>
      	<input type="button" class="btn btn-warning" value="카카오톡으로 회원가입" onclick="#">
      </div>

   
      
      	<div align="right">
      			아이디 혹은 비밀번호가 기억나지 않으세요?
      			<a href="#"> 아이디 찾기</a> | <a href="#">비밀번호 찾기 </a>
      		</div>



	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>