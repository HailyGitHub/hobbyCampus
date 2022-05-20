<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Header -->
<header>
    <div class="top_nav">
        <span class="top_nav_area">

             <a href="temp.do">강사</a> | <a href="mylessonList.do">마이페이지</a>


        <c:if test="${empty sessionScope.u_name}">
            <a href="userJoin.do" onclick="window.open(this.href,'user','width=600,height=1000');return false;">회원가입</a> 
            | <a href="userLogin.do" onclick="window.open(this.href,'user','width=600,height=1000');return false;">로그인</a>
      	</c:if>
      
      <c:if test="${!empty sessionScope.u_name}">
      	${sessionScope.u_name} 님  | <a href="userLogout.do">로그아웃</a>
      </c:if> 
        </span>
    </div>
    
    <!-- Logo -->
    <nav class="navbar navbar-dark bg-dark" aria-label="First navbar example">
        <div class="container-fluid">
          <a class="navbar-brand" href="index.do">
            <img src="/hobbycampus/img/main.png" alt="main_img">Hobby Campus
        </a>

        <!-- Category One List -->
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle navbar-brand" href="#" id="dropdown03" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
            <ul class="dropdown-menu" aria-labelledby="dropdown03" id="head-cate">
	            <!-- Data From JQuery -->
            </ul>
        </li>
        <a class="navbar-brand" href="lessonList.do?lesson_type=라이브">라이브</a>
        <a class="navbar-brand" href="lessonList.do?lesson_type=온라인">온라인</a>
        <a class="navbar-brand" href="lessonList.do?lesson_type=오프라인">오프라인</a>
        <a class="navbar-brand" href="noticeList.do">공지사항</a>

        <!-- Search Button-->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample01" aria-controls="navbarsExample01" aria-expanded="false" aria-label="Toggle navigation">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
				<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
			</svg> <!-- ICON -->
        </button>
        <!-- Search Bar -->
        <div class="collapse navbar-collapse" id="navbarsExample01">
            <form>
            <div class="row">
            <div class="input-group">
            	<div class="col-md-1">
	                <select class="form-select" id="find-lesson-select">
	                    <option value="0" selected>종류</option>
	                    <option value="라이브">라이브</option>
	                    <option value="온라인">온라인</option>
	                    <option value="오프라인">오프라인</option>
	                </select>
                </div>
                <div class="col-md-10">
	                <input type="text" class="form-control" id="find-lesson-keyword" placeholder="검색할 내용">
                </div>
                <div class="col-md-1">                
	                <button class="btn btn-outline-secondary" type="button" onclick="return findLesson()">검색</button>
                </div>
            </div>
            </div>
            </form>
        </div>
        </div>
      </nav>
</header>
<script>
	$(document).ready(function(){
		$('#head-cate').empty();
		$.ajax({
			type: 'GET',
			url: 'sideBarCateOne.do',
			dataType: 'json',
			success: function(head){
				var $headCate = head.cateOne;
				//console.log(head);
				
				for(var h=0; h<$headCate.length; h++){
					$('#head-cate').append('<li><a class="dropdown-item" href="lessonListByCateOne.do?cate1_idx='+ $headCate[h].cate1_idx +'"'
											+ 'data-idx="'+ $headCate[h].cate1_idx +'">'
											+ $headCate[h].cate1_name +'</a></li>');
				}	
			}
		});
	});
	
	function findLesson(){
		var $param = $('#find-lesson-select').val();
		var $keyword = $('#find-lesson-keyword').val();
		
		if($param==0){
			alert('수업 종류를 선택해 주세요.')
			return false;
		}
		if($keyword==''){
			alert('내용을 입력해 주세요')
			return false;
		}
		
		window.location.href = 'findLessonByKeyword.do?lesson_type='+$param+'&keyword='+$keyword;
	}
</script>