<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
 <!--BootStarp-->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
 <!-- JQuery -->
 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    

  <!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


  <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    #lessonContent{
      height: 100%;
    }
    #sidebarMenu{
      position: sticky;
      top: 78px;
      max-height: 100vh;
      overflow: auto;
      padding-left: 4px;
      padding-right: 4px
    }
  </style>
	<script>
	var mapAddr = '제주특별자치도 제주시 첨단로 242';
	</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	

<!--img-->
  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>

        <div class="container">
          <div class="carousel-caption text-start">
            <h1>${dto.lesson_thumbnail }</h1>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>

        <div class="container">
          <div class="carousel-caption">
            <h1>Another example headline.</h1>
            <p>Some representative placeholder content for the second slide of the carousel.</p>
            <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>

        <div class="container">
          <div class="carousel-caption text-end">
            <h1>One more for good measure.</h1>
            <p>Some representative placeholder content for the third slide of this carousel.</p>
            <p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
 

 
	
	<!-- offline -->
	<c:if test="${lessonType=='오프라인' }">
		<!--content-->
			<div class="container-fluid">
			  <div class="row">
			   <c:forEach var="dto" items="${lists}">
			    <div class="col-md-1"></div>
			    <main class="col-md-8">
			   
			      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			       
			        <h2>강의 설명</h2>
			     </div>
			     	<!-- content description -->
				      	<div id="offlineCont">
				        	${dto.offline_cont }
				     	</div>
				     	<c:if test="${empty lists }">
						<table>
							<tr>
								<td colspan="2" align="center">
								죄송합니다. 삭제된 강의입니다.
								</td>
							</tr>
						</table>
						</c:if>
					<!-- map -->
			     		<div id="map" style="width:50%;height:200px;"></div>
					<!-- review -->
						<c:if test="${empty review }">
							<table>
								<tr>
									<td colspan="2" align="center">
									아직 등록된 리뷰가 없습니다.
									</td>
								</tr>
							</table>
						</c:if>
						<c:forEach var="rv" items="${review }">
							<table>
								<tr>
									<th>별점</th>
									<td>${rv.star_point }</td> 
								</tr>
								<tr>
									<th>리뷰 내용</th>
									<td>${rv.review_cont }</td> 
								</tr>
								<tr>
									<th>리뷰 날짜</th>
									<td>${rv.review_date }</td>
								</tr>
							</table>
						</c:forEach>
			    </main>
		<!--side bar-->	
		    <nav id="sidebarMenu" class="col-md-4 col-lg-2 d-md-block bg-light sidebar collapse">
		      <div class="remote">
		      	<div id="type" class="text-muted text-end " style="letter-spacing: -2px;"> ${lessonType}</div>
		        <div id="subj" class="text-end  fs-4" >${dto.lesson_subj }</div>
		        <div id="cont" class="text-end  fs-5">${dto.lesson_short_cont }</div>
		        <div id="scheduleDate">
		        	<select class="form-select" id="scheduleDateList" name="scheduleDate"  required>
				      	<option>::날짜선택::</option>
				      	<c:forEach var="sd" items="${scheduleDate }">
				      		<option value="${sd.lesson_start}" >${sd.lesson_start}</option>
				      	</c:forEach>
				      </select>
		        
		        </div>
		        <div id="lessonTime">
		        	
		        
		        </div>
		        <div id="price" class="text-end  fs-5">${dto.lesson_price } 하빗</div>
		        <div id="kit" class="text-end text-muted">*${dto.lesson_kit=='true'?'키트 포함':'' }</div>
		        <div class="text-center">
		          <button type="button" class="btn btn-warning" style="width:90%">수강 신청</button>
			     
			          <button type="button" class="btn btn-outline-danger"  id="like" style="width:45%" >
			            <i id="heartFill" class="bi bi-heart"></i>
			            <!-- <i class="bi bi-suit-heart-fill"></i> -->
			             찜(${like })    
			          </button>
			        
			          <button  data-bs-toggle="modal" data-bs-target="#sendMail" type="button" class="btn btn-outline-primary" id="mail" style="width:45%">
			           <i class="bi bi-envelope-plus"></i>
			            메일         
			          </button>
			        
		        </div>
		      </div>
		    </nav>
		   </c:forEach>
		</div>
		</div>
	</c:if>
	<!-- online -->
	<c:if test="${lessonType=='온라인' }">
	
	</c:if>
	
	<!-- live -->
	<c:if test="${lessonType=='라이브' }">
	
	</c:if>
	
	
	
	
	<!-- <c:forEach var="rv" items="${review }"> --> 
	<!-- <tr> -->
	<!-- 	<th>별점</th> <td>${rv.star_point }</td> -->
	<!--</tr><tr><th>리뷰 내용</th><td>${rv.review_cont }</td>  -->		
	<!-- </tr><tr><th>리뷰 날짜</th><td>${rv.review_date }</td></tr></c:forEach></table> -->	
			
		
	<!-- Modal -->
		<div class="modal fade" id="sendMail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">강사님에게 메일 보내기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div> 
		      <form name="emailForm" action="sendEmail.do">
			      <div class="modal-body">
			      	<input type="hidden" name="lesson_idx" value="${lesson_idx}">
			      	  <input type="hidden" name="teacherEmail" value="${tEmail}">
		              <input type="text" class="form-control" name="userMail" placeholder="답변 받으실 주소" required>
		              <input type="text" class="form-control" name="mailSubject" placeholder="메일 제목" required>
		              <textarea class="form-control" rows="4" cols="40" name="mailContent" style="resize: none;" placeholder="문의 내용"></textarea>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="submit" class="btn btn-primary">보내기</button>
			      </div>
		      </form>
		    </div>
		  </div>
		</div>	

</body>
<script>
	$(document).ready(function(){
		if(${likeCheck } ){
			
		}else{
			
		}
	});

	
	 $('#scheduleDate').change(function () {
		 
		$.ajax({
			url :"lessonTime.do",
			type : "get",
			data : {'lessonDate': $('#scheduleDateList').val()},
			dataType : "json",
			success : function(data) {
				$('#lessonTime').empty();
				var addOption = '';
				var $scTime = data.scheduleTime;
				
				for(var i=0; i<$scTime.length; i++){
					addOption+='<option value="'+$scTime[i].lesson_schedule_idx+'">'+$scTime[i].lesson_time+'</option>';
				}
				$('#lessonTime').append('<select class="form-select" id="lessonTimeList"  required>'+addOption+'</select>');
				
			}
		});	
	});

	
	
</script>

<jsp:include page="/WEB-INF/views/map.jsp"></jsp:include>
</html>