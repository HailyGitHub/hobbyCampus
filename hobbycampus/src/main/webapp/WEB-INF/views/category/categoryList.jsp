<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>카테고리 리스트 관리</title>
	<!-- Title Icon -->
    <link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!--BootStarp-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- CSS -->
    <link rel="stylesheet" href="/hobbycampus/css/main.css">
        <style>
    	.main-area{
    		width: 80%;
    		margin: 0px auto;
    		min-height: 70vh;
    	}
    	.rounded-circle{
    		border: 1px solid black;
    		width: 100px;
    	}
    	#cate2-img{
    		width: 30px;
    	}
    </style>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	
	<!-- MAIN -->
	<main class="main-area">
		<!-- Button for Create Category1 -->
		<article class="select-list m-5">
			<div class="d-grid gap-2 d-md-block col-md-12 text-center">
				<button class="btn btn-lg btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#inputCate"><i class="bi bi-bookmark-plus-fill"></i> 큰 카테고리 생성</button>
			</div>
		</article>
		
		<!-- Input Category One Modal -->
		<article class="create-cate1-modal">
			<div class="modal fade" id="inputCate" tabindex="-1" aria-labelledby="inputCate" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable" role="document">
					<div class="modal-content rounded-5 shadow">
						<!-- Model Header -->
						<div class="modal-header p-5 pb-4 border-bottom-0">
							<h3 class="modal-title" id="modal_title"><i class="bi bi-bookmark-plus-fill"></i> 큰 카테고리 생성</h3>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<!-- Model Body -->
						<div class="modal-body p-5 pt-0">
							<form name="Cate1Form" action="uploadCateOne.do" method="post" enctype="multipart/form-data">
								<!-- Input Category Name -->
								<div class="form-floating mb-3">
									<input type="text" class="form-control rounded-4" name="cate1_name" id="cate1_name" maxlength="7" placeholder="큰 카테고리 이름 입력" required>
									<label for="floatingInput">큰 카테고리 이름</label>
								</div>
								<!-- Upload Category Image -->
								<div class="mb-3">
									<label for="formFile" class="form-label">파일 업로드</label>
									<input class="form-control" type="file" name="cate1Upload" id="cate1_img" required>
								</div>
								<hr class="my-4">
								<!-- Submit Button -->						
								<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit" onclick="return checkFile('cate1_img')">생성하기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</article>
		
		<!-- Category_1 List -->
		<div class="row m-2">
			<!-- GET Cate1 Lists -->
			<c:set var="dto" value="${lists}"></c:set>
			<c:forEach var="i" begin="1" end="${size}" step="1">
				<div class="col-sm-3">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title text-center">${dto[i-1].cate1_name}</h5>
							<div class="text-center">					
								<img class="rounded-circle text-center m-1" src="/hobbycampus/hobbyImg/category1/${dto[i-1].cate1_img}">
							</div>
							<div class="text-center mt-2">						
								<button type="button" class="btn btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#cateInfo" onclick="showCate(${dto[i-1].cate1_idx},'${dto[i-1].cate1_name}','${dto[i-1].cate1_img}')">
									<i class="bi bi-search"></i>상세보기
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- To new line -->
				<c:if test="${i%4==0}"> 
					</div><div class="row m-2">
				</c:if>
			</c:forEach>
		</div>
		
		<!-- Category1,2 Information Modal -->
		<article class="cate-info-modal">
			<div class="modal fade" id="cateInfo" tabindex="-1" aria-labelledby="inputCate" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable" role="document">
					<div class="modal-content rounded-5 shadow">
						<!-- Model Header -->
						<div class="modal-header p-5 pb-4 border-bottom-0">
							<div class="row" id="title-row" data-cateOne-idx="">
								<!-- From JQuery -->
							</div>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<!-- Model Body -->
						<div class="modal-body p-5 pt-0">
							<!-- Category One Image -->
							<div class="form-floating mb-3 text-center" id="img-row">
								<!-- From JQuery -->
							</div>
							<div id="cateOne-form-area"></div>
							<hr class="my-4">
							<!-- Category Two List -->
							<div class="form-floating mb-3">
								<div class="row">
									<h5 class="col-md-6"><b>하위 카테고리</b></h5>
									<div class="col-md-6 text-end" id="btn-plus">
										<!-- From JQuery -->
									</div>									
								</div>
								<table class="table table-striped m-2">
									<thead>
										<tr>
											<th scope="col" class="col-md-2">#</th>
											<th scope="col" class="col-md-4">이미지</th>
											<th scope="col" class="col-md-4">이름</th>
											<th scope="col" class="col-md-2">버튼</th>
										</tr>
									</thead>
									<tbody class="cateTwo-tbody">
										<!-- From JQuery -->
									</tbody>
								</table>
							</div>
							<div id="cateTwo-form-area"></div>
							<hr class="my-4">
							<!-- Submit Button -->						
							<div class="text-center">
								<button type="button" class="btn btn-primary btn-lg" data-bs-dismiss="modal" aria-label="Close">확인</button>								
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</main>
	
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/hobbycampus/js/category.js"></script>
</html>