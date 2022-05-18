<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
       a:link {
          color : black;
        }
        a:visited {
          color : black;
        }
        a:hover{
           color:orange;
        }
        a:active {
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
                 |
                 <span class="fs-3">
                   <button class="btn btn-outline-primary" id="teacher" onclick="teacherClick();">&nbsp;&nbsp;강사&nbsp;&nbsp;</button>
                 </span>
                 <hr>
               </div>
               <ul class="nav nav-pills flex-column mb-auto">
                 <li class="nav-item">
                   <a href="#" class="nav-link">
                     <span class="studentList" >내 수강내역</span>
                   </a>
                   <a href="#" class="nav-link">
                    <span class="teacherList" style="display: none;" >내 강의 신청</span>
                   </a>                     
                 </li>
                 <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="studentList" >내 포인트</span>
                  </a>
                  <a href="#" class="nav-link">
                   <span class="teacherList" style="display: none;" >내 강의 보기</span>
                  </a>                     
                </li>
                
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="studentList" >포인트 충전</span>
                  </a>
                  <a href="teacherRecord.do?t_idx=1" class="nav-link">
                   <span class="teacherList" style="display: none;" id="teacherRecord" >내 강의 이력</span>
                  </a>                     
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="studentList" >내 리뷰</span>
                  </a>
                  <a href="teacherPoint.do?t_idx=1" class="nav-link">
                   <span class="teacherList" style="display: none;" id="teacherPoint">포인트 관리</span>
                  </a>                     
                </li>
                
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="studentList" >찜 목록</span>
                  </a>
                  <a href="teacherInfo.do?t_idx=1" class="nav-link">
                   <span class="teacherList" style="display: none;" id="teacherInfo">프로필 관리</span>
                  </a>                     
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="studentList" >내 쿠폰</span>
                  </a>                   
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <span class="studentList" >내 정보</span>
                  </a>
                                    
                </li>
         </ul>
       </div>
     </nav>
   </div>
 </div>
 
 </body>
 <script>
 function studentClick(){
   $(".teacherList").css("display","none");
   $(".studentList").css("display","");
   
   $("#student").removeClass('btn-light');
   $("#teacher").removeClass('btn-warning');
 
   $("#student").addClass('btn-warning');
   $("#teacher").addClass('btn-light');
 }
 function teacherClick(){
 
   $(".studentList").css("display","none");
   $(".teacherList").css("display","");
   
   $("#student").removeClass('btn-warning');
   $("#teacher").removeClass('btn-light');
 
   $("#student").addClass('btn-light');
   $("#teacher").addClass('btn-warning');
   
 }
 </script>
</html>