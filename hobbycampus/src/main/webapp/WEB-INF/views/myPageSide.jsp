<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
 
      <!--BootStarp-->

     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
     <!-- JQuery -->
     <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
     <style>
        body {
         margin: 0;
       }
       .sidebarMenu {
         width: 100vw;
         height: 100vh;
       }
       .sideDiv{
         height: 100%;
       }
       .nav-item a:link {
          color : black;
        }
         .nav-item a:visited {
          color : black;
        }

        .nav-item a:hover{
           color:orange;

        }
        .nav-item a:active {
          color : black
        }
     </style>
 
     
 </head>
 <body>
 <div class="container-fluid">
   <div class="row">
     <nav id="sidebarMenu" class="d-md-block bg-light sidebar collapse">
       <div class="position-sticky pt-6 sideDiv" style="height: 1000px;">
         <ul class="nav flex-column" >
           <li class="nav-item">
               <span data-feather="home"></span>
               <svg class="bi me-2" width="40" height="32"></svg>
               <div>
                 <span class="fs-3">
                   <button class="btn btn-outline-primary" id="student" onclick="studentClick();">&nbsp;&nbsp;학생&nbsp;&nbsp;</button>
                   
                 </span>

            <c:if test="${!empty sessionScope.t_idx}">
                    <span class="fs-3">
                 
                   <button class="btn btn-outline-primary" id="teacher" onclick="teacherClick();">&nbsp;&nbsp;강사&nbsp;&nbsp;</button>
                 </span>
                </c:if>
         
                 <hr>
               </div>
               
               
               <ul class="nav nav-pills flex-column mb-auto">
                
                 <li class="nav-item">
                   <a href="mylessonList.do" class="nav-link">
                     <span class="studentList" id="secreteIdx" data-idx="${sessionScope.t_idx}">내 수강내역</span>
                   </a>
                   <a href="lessonReqList.do?t_idx=1" class="nav-link">
                    <span class="teacherList" id="lessonRequest" style="display: none;" >강의 신청 관리
					  
                    </span>
                   </a>                     
                 </li>
                 
                 <li class="nav-item">
                  <a href="myPointList.do" class="nav-link">
                    <span class="studentList" >내 포인트</span>
                  </a>
                  <a href="lessonBasicForm.do?t_idx=1" class="nav-link">
                   <span class="teacherList" id="lessonAdd" style="display: none;" >강의 등록</span>
                  </a>                     
                </li>
           
                <li class="nav-item">
                   <a href="pointShop.do" class="nav-link">
                    <span class="studentList" >포인트 충전</span>
                  </a>
                  <a href="teacherLessonList.do"  class="nav-link">
                   <span class="teacherList" style="display: none;" id="" >내 강의 목록</span>
                  </a>                    
                     
                </li>
                
                <li class="nav-item">
                  <a href="review.do" class="nav-link">
                    <span class="studentList" >내 리뷰</span>
                  </a> 
                  <a href="teacherRecord.do" class="nav-link">
                   <span class="teacherList" style="display: none;" id="teacherRecord" >내 강의 이력</span>
                  </a>              
                </li>
                
                <li class="nav-item">
                  <a href="myLikeList.do" class="nav-link">
                    <span class="studentList" >찜 목록</span>
                  </a>
                  <a href="teacherPoint.do" class="nav-link">
                   <span class="teacherList" style="display: none;" id="teacehrPoint">포인트 관리</span>    
                  </a>                     
                </li>
                
                <li class="nav-item">
                  <a href="mycoupon.do" class="nav-link">
                    <span class="studentList" >내 쿠폰</span>
                  </a>   
                  
                  <a href="teacherInfo.do?" class="nav-link">
                   <span class="teacherList" style="display: none;" id="teacherInfo">프로필 관리</span>
                  </a>                    
                </li>
                
             <li class="nav-item">
                  <a href="userUpdateForm.do" class="nav-link">
                    <span class="studentList" >정보 수정</span>
                  </a>
                </li>
      
      
         </ul>
         
            </li>
         </ul>
       </div>

     </nav>
   </div>
 </div>
 
 </body>
 
 <script>

 $(document).ready(function(){
    
	 var $idx = $('#secreteIdx').attr('data-idx');
	 //alert($idx);
	 
	 $.ajax({
		 type: 'GET',
		 url: 'getLessonReq.do',
		 data:{'t_idx': $idx},
		 dataType: 'json',
		 success: function(i){
			 if(i.reqCnt!=0){
				 $('#lessonRequest').empty();
				 $('#lessonRequest').append('강의 신청 관리');
				 $('#lessonRequest').append('<span class="badge bg-primary">'+i.reqCnt+'</span>');
				 
			 }else{
				 $('#lessonRequest').empty();
				 $('#lessonRequest').append('강의 신청 관리');
			 }
			  
		 }
		 
	 });
	 
	 
	 if(${t_idx==null}){
       $(".teacher").css("display","none");
       $(".student").css("display","none");
       $(".teacherList").css("display","none");
    }
    
    if(getCookie('teacher')&&${t_idx!=null}){
       
         $(".studentList").css("display","none");
         $(".teacherList").css("display","block");
         
         $("#student").removeClass('btn-warning');
         $("#teacher").removeClass('btn-light');
       
         $("#student").addClass('btn-light');
         $("#teacher").addClass('btn-warning');
       
    } else {
         $(".teacherList").css("display","none");
         $(".studentList").css("display","block");
         
         $("#student").removeClass('btn-light');
         $("#teacher").removeClass('btn-warning');
       
         $("#student").addClass('btn-warning');
         $("#teacher").addClass('btn-light');
    }
	
    
 })
 
 
 var setCookie = function(name, value, day) {
     var date = new Date();
     date.setTime(date.getTime() + day * 60 * 1 * 60 * 1000);
     document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
};


var getCookie = function(name) {
var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
return value? value[2] : null;
};


var deleteCookie = function(name) {
    var date = new Date();
    document.cookie = name + "= " + "; expires=" + date.toUTCString() + "; path=/";
}

    
    
 function studentClick(){
   setCookie('student','student',1);
   deleteCookie('teacher');
   
      $(".teacherList").css("display","none");
      $(".studentList").css("display","block");
      
      $("#student").removeClass('btn-light');
      $("#teacher").removeClass('btn-warning');
    
      $("#student").addClass('btn-warning');
      $("#teacher").addClass('btn-light');


 }
 
 function teacherClick(){

      setCookie('teacher','teacher',1);
      deleteCookie('student');

         $(".studentList").css("display","none");
         $(".teacherList").css("display","block");
         
         $("#student").removeClass('btn-warning');
         $("#teacher").removeClass('btn-light');
       
         $("#student").addClass('btn-light');
         $("#teacher").addClass('btn-warning');

 }
 
 </script>
</html>