<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
    	
    	#pRecordList{
    		margin-top: 20px;
    		
    	}
    	
    	#teacehrPoint{
    		background-color: beige;
    		color : black;
    		font-weight: bold;
    		text-decoration: underline;
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
	      <div class="container px-4 py-5" id="featured-3">
	        <h2 class="pb-2 border-bottom">보유 포인트</h2>
	        <h4 class="pb-2">${tPoint}하빗</h4>
	
	       <div style="padding: 40px;"></div>
	
			<!-- exchange teacher point to user point -->
	       <div class="pb-2 border-bottom col-md-4">학생 포인트로 전환하기</div>
		      <div "col-md-3">
		        <form name="toPoint" action="exToPoint.do">
		          <div class="col-md-6">
		            <input type="text" name="exPoint">
		            <button class="btn btn-primary" type="submit" onclick="toPoint();">전환</button>
		          </div>
		        </form>
		      </div>
	      
	      <!-- exchange teacher point to cash -->
	       <div class="pb-2 border-bottom col-md-4">현금으로 환전하기</div>
	       <div "col-md-3">
				 <form name="toCash" action="exToCash.do">
			       <div class="col-md-6">
			           <input type="text" name="exPoint">	
			           <button class="btn btn-primary" type="submit" onclick="toChash();">환전</button>
			         </div>
				 </form>
	
	       <div style="padding: 40px;"></div>
				 
				 
				 <!-- exchange record list -->
				 <div class="pb-2 border-bottom col-md-8">
				 환전/전환 이력
				 
					 <table class="table  table-hover" id="pRecordList">
					 	<thead>
							<tr>
						      <th scope="col">이력 번호</th>
						      <th scope="col">타입</th>
						      <th scope="col">환전/전환 일자</th>
						      <th scope="col">사용 포인트</th>
						    </tr>
						</thead>
						<tfoot>
							<td colspan="6">
								${pageStr }
							</td>
						</tfoot>
						<tbody>
						 	<c:if test="${empty lists }">
						 		<tr>
						 			<td>환전/전환 이력이 없습니다.</td>
						 		</tr>
						 	
						 	</c:if>
						 	<c:forEach var="dto" items="${lists }">
										<tr>
											<td>${dto.pay_list_idx }</td>
											<td>${dto.pay_value}</td>
											<td>${dto.pay_date }</td>
											<td>${dto.pay_point }</td>
										</tr>
							</c:forEach>
						</tbody>	
					 </table>
				 </div>
			</div><!-- main -->
	</div>
	</main>		 
</body>

 

</html>