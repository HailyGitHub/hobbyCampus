<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Header -->
<header>
    <div class="top_nav">
        <span class="top_nav_area">
            <a href="#">회원가입</a> | <a href="#">로그인</a>
        </span>
    </div>
    <!-- Logo -->
    <nav class="navbar navbar-dark bg-dark" aria-label="First navbar example">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">
            <img src="/hobbycampus/img/main.png" alt="main_img">Hobby Campus
        </a>

        <!-- Category List -->
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle navbar-brand" href="#" id="dropdown03" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
            <ul class="dropdown-menu" aria-labelledby="dropdown03">
            <li><a class="dropdown-item" href="#">언어</a></li>
            <li><a class="dropdown-item" href="#">수학</a></li>
            <li><a class="dropdown-item" href="#">체육</a></li>
            </ul>
        </li>
        <a class="navbar-brand" href="#">라이브</a>
        <a class="navbar-brand" href="#">온라인</a>
        <a class="navbar-brand" href="#">오프라인</a>
        <a class="navbar-brand" href="#">공지사항</a>

        <!-- Search Button-->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample01" aria-controls="navbarsExample01" aria-expanded="false" aria-label="Toggle navigation">
            <i class="bi bi-search"></i>
        </button>
        <!-- Search Bar -->
        <div class="collapse navbar-collapse" id="navbarsExample01">
            <form>
            <div class="input-group mb-3">
                <select class="form-select">
                    <option selected>전체</option>
                    <option value="1">라이브</option>
                    <option value="2">온라인</option>
                    <option value="3">오프라인</option>
                </select>
                <input type="text" class="form-control" placeholder="검색할 내용" aria-label="Example text with two button addons">
                <button class="btn btn-outline-secondary" type="button">검색</button>
            </div>
            </form>
        </div>
        </div>
      </nav>
</header>