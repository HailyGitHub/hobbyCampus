<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
 <link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!--BootStarp-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!--CSS-->
    <link rel="stylesheet" href="/hobbycampus/css/main.css">
    <link rel="stylesheet" href="/hobbycampus/css/lessonCont.css">
  <style>
    
  </style>
	<script>
   	 var mapAddr = '${map}';                                                                                              
	</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>	
<!--img-->
  <article class="mx-auto" style="width: 83%;">
		  <div id="carouselExampleIndicators" class="carousel slide col-md-12" data-bs-ride="carousel">
		      <div class="carousel-indicators">
		        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		         <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
		      </div>
		     <div class="carousel-inner">
		        <div class="carousel-item active" >
		          <img src="/hobbycampus/hobbyImg/lesson/${thumbnail }/thumbnail.jpg" class="d-block w-100" alt="간판1" height="500em">
		        </div>
		        <c:forEach var="lessonImg" items="${imgLists }"> 
			      <div class="carousel-item">
			          <img src="/hobbycampus/hobbyImg/lesson/${thumbnail }/img/${lessonImg}" class="d-block w-100" height="500em">
			     </div>
			  </c:forEach>
		      </div>
		      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		        <span class="visually-hidden">Previous</span>
		      </button>
		      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		        <span class="carousel-control-next-icon" aria-hidden="true"></span>
		        <span class="visually-hidden">Next</span>
		      </button>
		  </div>
		</article>
		
      
      
	
 
	
		<!--content-->
			<div class="container-fluid">
			  <div class="row">
			   <c:forEach var="dto" items="${lists}">
			    <div class="col-md-1"></div>
			    <main class="col-md-8" id="lessonContents">
			   <div id="contDescription">
			      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			        <h4>강의 상세 설명</h4>
			     </div>
			     	<!-- content description -->
			     	
						<div id="lessonContentLists">
				        <pre>${dto.offline_cont}</pre>
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
				</div>		
				
					<!-- map -->
					<div id="contentMap">
					      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					        <h4>수강 위치</h4>
					     </div>
			     		<div id="map" style="width:100%;height:200px;"></div>
			     	</div>	
			   
					<!-- review -->
					<div id="contentReview" style="margin-bottom: 300px">	
						<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
						        <h4>리뷰</h4>
						     </div>
							<c:if test="${empty review }">
								<table id="reviewTable">
									<tr>
										<td colspan="2" align="center">
										아직 등록된 리뷰가 없습니다.
										</td>
									</tr>
								</table>
							</c:if>
							
								<table class="table  table-hover" id="reviewList" style="text-align: center">
								 	<thead>
										<tr>
									      <th scope="col">별점</th>
									      <th scope="col">리뷰 내용</th>
									      <th scope="col">리뷰 날짜</th>
									    </tr>
									</thead>
									<tbody>
									 	<c:if test="${empty lists }">
									 		<tr>
									 			<td>아직 등록된 리뷰가 없습니다.</td>
									 		</tr>
									 	
									 	</c:if>
									 	<c:forEach var="rv" items="${review }">
													<tr>
														<td>
															<c:forEach begin="1" end="${rv.star_point }">
																<label id="stars" text-align="left">★</label>
															</c:forEach>
														</td>
														<td>${rv.review_cont }</td>
														<td>${rv.review_date }</td>
													</tr>
										</c:forEach>
									</tbody>	
								 </table>
						</div>	
			    </main>
			    
		<!--side bar-->	
		    <nav id="sidebarMenu" class="col-md-4 col-lg-2 d-md-block bg-light sidebar collapse">
		      <div class="remote">
		      	<div id="type" class="text-muted text-end " style="letter-spacing: -2px;"> ${lessonType}</div>
		        <div id="subj" class="text-end fw-bold fs-4" >${dto.lesson_subj }</div>
		       
		        <div id="cont" class="text-end  fs-5">${dto.lesson_short_cont }</div>
		        
		       
			        <div id="scheduleDate" class="text-end">
			        <span class="fs-6 text-muted  text-end fw-light">강의 날짜</span>
			        	<select class="form-select" id="scheduleDateList" name="scheduleDate"  required>
					      	<option>::날짜선택::</option>
					      	<c:forEach var="sd" items="${scheduleDate }">
					      		<option value="${sd.lesson_start}" >${sd.lesson_start}</option>
					      	</c:forEach>
					      </select>
			        </div>
		       		<div class="text-end">
		       		<span class="fs-6 text-muted text-end fw-light ">강의 시간</span>
		       		</div>
			        <div id="lessonTime">
			        	<!-- from Jquery -->
			        </div>
			   
			    
		        <div id="price" class="text-end fw-bold fs-5"><span class="text-muted fs-6 fw-light">수강료</span> ${dto.lesson_price } 하빗</div>
		        <div id="kit" class="text-end text-muted fw-light fs-6">*${dto.lesson_kit=='true'?'키트 포함':'' }</div>
		        <div class="text-center">
		          <button type="button" class="btn btn-warning" style="width:95%" id="lessonEnrollBtn">수강 신청</button>
			     
			          <button type="button" class="btn btn-outline-danger"  id="likeBnt" style="width:45%" onClick="loginCheck();">
			          	<!-- From JQUERY --> 
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
	
	<!-- Modal -->
		<div class="modal fade" id="sendMail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">강사님에게 메일 보내기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div> 
		      <form name="emailForm" action="sendEmail.do">
			      <div class="modal-body" id="emailFormModal">
			      	<input type="hidden" name="lesson_idx" value="${lesson_idx}">
			      	  <input type="hidden" name="teacherEmail" value="${tEmail}">
		              <input type="text" class="form-control emailModalText" name="userMail" placeholder="답변 받으실 @이메일 주소" required>
		              <input type="text" class="form-control emailModalText" name="mailSubject" placeholder="문의 메일 제목" required>
		              <textarea class="form-control emailModalText" rows="4" cols="40" name="mailContent" style="resize: none;" placeholder="문의 내용"></textarea>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="submit" class="btn btn-primary" >보내기</button>
			      </div>
		      </form>
		    </div>
		  </div>
		</div>	

	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<script>
	$(document).ready(function(){
		if(${likeCheck} ){
			var icon = '<i id="heartFill" class="bi bi-suit-heart-fill"></i>';	 
			var likeCnt ='찜('+${like }+')';
			$('#likeBnt').append(icon+likeCnt);
	                
		}else{
			var icon = '<i id="heartFill" class="bi bi-heart"></i>';	 
			var likeCnt ='찜('+${like }+')' ;
			$('#likeBnt').append(icon+likeCnt);
		};
		
	});
	
	
	
	/**like button clicked > loginCheck*/
	function loginCheck() {
		if(${empty sessionScope.u_idx}){
			
			alert('로그인 후 사용 가능합니다.');
		}else{
			var btState = $("#heartFill").hasClass("bi-heart"); //true -> need to click
			$.ajax({
				url :"likeBtnCk.do",
				type : "get",
				data : {'lesson_idx': ${lesson_idx}, 'u_idx' : ${u_idx}, 'btState' : btState},
				dataType : "json",
				success : function(data) {
					var addOption = '';
					var $likeCnt = data.likeCnt;
					if(btState){//already not like, Add 1
						$('#likeBnt').empty();
						var $likeCnt = data.likeCnt;
						var icon = '<i id="heartFill" class="bi bi-suit-heart-fill"></i>';
						var likeCnt ='찜('+$likeCnt+')';
						$('#likeBnt').append(icon+likeCnt);
					}else{//already like // minus 1
						$('#likeBnt').empty();
						var $likeCnt = data.likeCnt;
						var icon = '<i id="heartFill" class="bi bi-heart"></i>';
						var likeCnt ='찜('+$likeCnt+')';
						$('#likeBnt').append(icon+likeCnt);
					}
				}
			});
			
		}
	}
	
	
	/**lesson enrollment*/
	$('#lessonEnrollBtn').click(function () {
		
			var lessonScheduleIdx = $('#lessonTimeList').val();
			location.href="lessonRequest.do?lessonScheduleIdx="+lessonScheduleIdx;
		
		
	});
	
	/**select lesson date*/
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