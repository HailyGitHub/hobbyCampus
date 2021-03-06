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
          <a class="navbar-brand" href="#">
            <img src="/hobbycampus/img/main.png" alt="main_img">Hobby Campus
        </a>

		<!-- Category One List -->
		<li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle navbar-brand" href="#" id="dropdown03" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
            <ul class="dropdown-menu" aria-labelledby="dropdown03">
	            <!-- GET Category One -->
	            <c:forEach var="cateOneDTO" items="${cateOneList}">
	            	<li><a class="dropdown-item" href="#" data-idx="${cateOneDTO.cate1_idx}" data-img="${cateOneDTO.cate1_img}">${cateOneDTO.cate1_name}</a></li>
	            </c:forEach>
            </ul>
        </li>
        <a class="navbar-brand" href="#">라이브</a>
        <a class="navbar-brand" href="#">온라인</a>
        <a class="navbar-brand" href="#">오프라인</a>
        <a class="navbar-brand" href="noticeList.do">공지사항</a>

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
	                    <option selected>전체</option>
	                    <option value="1">라이브</option>
	                    <option value="2">온라인</option>
	                    <option value="3">오프라인</option>
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