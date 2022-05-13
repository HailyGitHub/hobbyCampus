<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <c:if test="${empty sessionScope.u_name}">
            <a href="userJoin.do">회원가입</a> 
            | <a href="userLogin.do">로그인</a>
      </c:if>
      <c:if test="${!empty sessionScope.u_name}">
      	${sessionScope.u_name} 님  | <a href="userLogout.do">로그아웃</a>
      </c:if> 
      
<div>
<a href="userUpForm.do">회원정보 수정</a>
</div>




<ul>
<li onclick="kakaoLogin();">
  <a href="javascript:void(0)">
      <span>카카오 로그인</span>
  </a>
</li>
<li onclick="kakaoLogout();">
  <a href="javascript:void(0)">
      <span>카카오 로그아웃</span>
  </a>
</li>
</ul>









<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
Kakao.init('1637f78a47023812ccdead026a977c07'); 
console.log(Kakao.isInitialized()); // sdk초기화여부판단

function kakaoLogin() {
Kakao.Auth.login({
	
  success: function (response) {
    Kakao.API.request({
      url: '/v2/user/me',
      success: function (response) {
    	  console.log(response)
      },
      fail: function (error) {
        console.log(error)
      },
    })
  },
  fail: function (error) {
    console.log(error)
  },
})
}


function kakaoLogout() {
if (Kakao.Auth.getAccessToken()) {
  Kakao.API.request({
    url: '/v1/user/unlink',
    success: function (response) {
    	console.log(response)
    },
    fail: function (error) {
      console.log(error)
    },
  })
  Kakao.Auth.setAccessToken(undefined)
}
}  
</script>

</body>
</html>