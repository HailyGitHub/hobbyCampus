<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Header -->
<header>
    <div class="top_nav">
        <span class="top_nav_area">
           ${s_a_name } 님 | <a href="adminLogout.do">로그아웃</a>
        </span>
    </div>
    <!-- Logo -->
    <nav class="navbar navbar-dark bg-dark" aria-label="First navbar example">
        <div class="container-fluid">
			<a class="navbar-brand" href="resumeList.do">
			  <img src="/hobbycampus/img/main.png" alt="main_img">Hobby Campus
			</a>

	        <!-- Category List -->
	        <a class="navbar-brand" href="resumeList.do">이력서</a>
	        <a class="navbar-brand" href="#">계정관리</a>
	        <a class="navbar-brand" href="#">카테고리</a>
	        <a class="navbar-brand" href="#">결제</a>
	        <a class="navbar-brand" href="#">쿠폰</a>
	        <a class="navbar-brand" href="#">레벨</a>
	        <a class="navbar-brand" href="#">통계</a>

	        <!-- Search Button-->
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample01" aria-controls="navbarsExample01" aria-expanded="false" aria-label="Toggle navigation">
	            <i class="bi bi-search"></i>
	        </button>
	        <!-- Search Bar -->
	        <div class="collapse navbar-collapse" id="navbarsExample01">
            <form>
	            <div class="row">
	            <div class="input-group">
	            	<div class="col-md-1">
		                <select class="form-select">
		                    <option selected>선택</option>
		                    <option value="1">강사</option>
		                    <option value="2">학생</option>
		                </select>
	                </div>
	                <div class="col-md-10">
		                <input type="text" class="form-control" placeholder="검색할 내용" aria-label="Example text with two button addons">
	                </div>
	                <div class="col-md-1">                
		                <button class="btn btn-outline-secondary" type="button">검색</button>
	                </div>
	            </div>
	            </div>
            </form>
	        </div>
        </div>
      </nav>
</header>