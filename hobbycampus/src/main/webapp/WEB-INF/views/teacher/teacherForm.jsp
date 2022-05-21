<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Title Icon -->
    <link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!--BootStarp-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!--CSS-->
    <link rel="stylesheet" href="/hobbycampus/css/main.css">
	   <style>
    	.classWithPad { 
    		margin-left : 50px;
    		margin-right : 50px;
    		margin-bottom:80px;
    		padding:100px; 
    	}
    	#teacherImg{
    	 width : 200px;
    	 
    	}
    	#teacherInfo{
    		background-color: beige;
    		color : black;
    		font-weight: bold;
    		text-decoration: underline;
    	} 
    	 
    	
    </style>
    <script>
	function nameCheck() {
		window.open('nameCheck.do','nameCheck','width=400 height=300');
	}
	
	function allCheck(){
	
	   var filename=document.userUp.upload.value;
	   filename=filename.substring(filename.length-3,filename.length);
	   
	   if(filename!='jpg'){
	      window.alert('jpg 이미지만 업로드 가능합니다.');
	      return false;
	   }else{
		return true;
	   }
	}
</script>
</head>
<body>
<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<!-- SIDEBar -->
	<main class="mainArea">
	<div class="row">
		<div class="col-md-2">
			<jsp:include page="/WEB-INF/views/myPageSide.jsp"></jsp:include>		
		</div>
		<!-- main -->
		<div class="col-md-10">
		<div id="container" class="classWithPad">
			<div class="py-5 text-center">
		    <h2>내 정보</h2>
		  	</div>
			 <form class="row g-3" onsubmit="return allCheck();" name="updateTeacher" action="teacherInfo.do" method="post" enctype="multipart/form-data">
			    
			    <div class="col-md-1"></div>
			    <div class="col-md-3">
			    <img id="teacherImg" src="/hobbycampus/hobbyImg/teacherImg/${dto.t_img} ">
			    </div>
			    <div class="col-md-3">
			      프로필사진
			      <hr class="m-1">
			      <input type="file" name="tImg" value="사진 변경" class="form-control" >
			    </div>
			    
			    <div class="col-md-2 my-3">
			      닉네임
			      <hr class="m-1">
			      <input type="text" name="t_name" class="form-control " id="name" value=${dto.t_name} readonly required="required">
			    </div>
			    
			    <div class="col-md-1">
			    <label></label>
			    <hr class="m-1">
			    	<button class="btn btn-primary" type="button"  onclick="nameCheck();">중복</button>
			    </div>
			    <div class="col-md-2"></div>
			    
			    
			    
			    <div class="col-md-1"></div>
			    <div class="col-md-3">
			      은행명
			      <hr class="m-1">
			      <input type="text" name="t_account_bank" class="form-control" id="aBank" value=${dto.t_account_bank} required="required" >
			    </div>
			    <div class="col-md-3">
			      계좌주
			      <hr class="m-1">
			      <input type="text" name="t_account_owner" class="form-control" id="aOwner" value=${dto.t_account_owner} required="required">
			    </div>
			    <div class="col-md-3">
			      계좌번호
			      <hr class="m-1">
			      <input type="text" name="t_account_number" class="form-control" id="aNnumber" value=${dto.t_account_number} required="required">
			    </div>
			    <div class="col-md-2"></div>
			
			    <div class="col-md-1"></div>
			    <div class="col-md-9">
			      자기소개
			      <hr class="m-1">
			      <textarea class="form-control" rows="4" id="t_profile" cols="40" wrap="hard" name="t_profile" style="resize: none;" required="required">
			    	${dto.t_profile}
				</textarea>
			    </div>
			    <div class="col-md-2"></div>
			    
			    <div class="col-md-4"></div>
			    <div class="col-md-4">
			    	<button class="btn btn-secondary" type="reset" onclick="location.href='teacherInfo.do'">되돌리기</button>
			    	<button class="btn btn-primary" type="submit">수정하기</button>
			    </div>
			    <div class="col-md-4"></div>
			  </form>
			</div>
			</div>	
		</div>
		</main>
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>