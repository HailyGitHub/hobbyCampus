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
    <style type="text/css">
    	.mainArea {
    		min-height: 1000px;
    	}
    </style>
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
			<div>보유 하빗      ${tPoint}하빗</div>
			 <hr>
			 <form name="toPoint" action="exToPoint.do">
			 <input type="hidden" value="1" name="t_idx">
			 	<ul>
			 		<li><input type="text" name="exPoint">
			 		<input type="submit" value="포인트로 전환" onclick="toPoint();"></li>
			 	</ul>
			 </form>
			 
			 <form name="toCash" action="exToCash.do">
			 <input type="hidden" value="1" name="t_idx">
			 	<ul>
			 		<li><input type="text" name="exPoint">	
			 		<input type="submit" value="현금입금 신청" onclick="toChash();"></li>
			 	</ul>
			 </form>
			 <hr>
			</body>
		
		</div>
	</div>
	</main>
		

 

</html>