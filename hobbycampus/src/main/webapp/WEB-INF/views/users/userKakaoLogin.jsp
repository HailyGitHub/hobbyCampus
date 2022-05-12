<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <a href="javascript:KakaoLogin();">카카오 계정 로그인</a>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
	//window.kakao.init("1637f78a47023812ccdead026a977c07");
	
	function kaoLogin(){
		window.kakao.Auth.login({
			scope:'account_email,gender',
			success:function(authObj){
				console.log(authObj);
				 window.Kakao.API.request({
				        url: '/v2/user/me',
				    success: function(res){
						const kakao_account =res.kakao_account;
						console.log(kakao_account);
					}
				});
			}
		})
	}
	
</script>
 -->

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
	scope:'account_email,gender',
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


<script type="text/javascript">
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function(res) {
          alert(JSON.stringify(res))
        },
        fail: function(error) {
          alert(
            'login success, but failed to request user information: ' +
              JSON.stringify(error)
          )
        },
      })
    },
    fail: function(err) {
      alert('failed to login: ' + JSON.stringify(err))
    },
  })
</script>
	
	
</body>
</html>