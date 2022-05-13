<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>하비 캠퍼스 메인 화면</title>
    <link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
    <!--CSS-->
    <link rel="stylesheet" href="/hobbycampus/css/main.css">
</head>
<body id="mainBody">
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	
	<!-- MAIN -->

<!-- Button trigger modal -->
<div style="margin-top : 100px;  width: 80%; text-align: right;">
<a href="#" style="text-decoration: none; color: black;" data-bs-toggle="modal" data-bs-target="#exampleModal"><b>쿠폰 등록</b></a>

</div>
	<table>
	<thead>
		<tr>
			<th>발급번호</th>
			<th>쿠폰명</th>
			<th>할인률</th>
			<th>이미지</th>
			<th>만료일</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="4"align="center">${pageStr}</td>
			<td><a href="#"> </a></td>
		</tr>
		
	</tfoot>
	<tbody>
	<c:if test="${empty lists}">
	<tr>
		<td colspan="5" align="center">
		발행 쿠폰 데이터 없음
		</td>
	</tr>
	</c:if>
	<c:forEach var="dto" items="${lists}">
		<tr>
			<td>${dto.coupon_idx}</td>
			<!-- create url -->
			<c:url var="url" value="coupon.do">
				<c:param name="idx">${dto.coupon_idx}</c:param>
			</c:url>
			<!-- insert url -->
			<td>
				<a href="#" style="text-decoration: none; color: black;" onclick="getResume(${dto.coupon_idx})" data-bs-toggle="modal" data-bs-target="#exampleModal">
				${dto.coupon_title} 
				</a>
			</td>
			<td>${dto.coupon_rate}</td>
			<td>${dto.coupon_img}</td>
			<td>${dto.coupon_end}</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <div class="modal-body p-5 pt-0">
        <form class="">
          <div class="form-floating mb-3">
            <input type="email" class="form-control rounded-4" id="modal_idx"  placeholder="name@example.com">
           
            <label for="floatingInput">Email address</label>
            <a id="modal_idx"></a>
          </div>
          <div class="form-floating mb-3">
            <input type="password" class="form-control rounded-4" id="floatingPassword" placeholder="Password">
            <label for="floatingPassword">Password</label>
          </div>
          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit">Sign up</button>
          <small class="text-muted">By clicking Sign up, you agree to the terms of use.</small>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="return gettrue()">Save changes</button>
      </div>
    </div>
  </div>
</div>


	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>

<script>
function gettrue(){
	if(!confirm('test')) return false;
	alert('true 확인');
	$('#exampleModal').modal('hide');
}

/* Input Info to Modal */
function getResume(idx){
   console.log(idx);
   $.ajax({
      type: 'GET',
      url: 'couponMakeForm.do',
      data: {'coupon_idx': idx},
      dataType: 'json',
      success: function(result){// json에서 불러온 결과값을 호출하는 함수. 즉 couponMakeForm 메소드 그 자체라 생각하면 된다.
         var dto = result.dto; // couponMakeFor에 저장된 데이터인 dto를 호출 couponMakeForm ().dto;
        // var ImgSrc = '/hobbycampus/img/';
        console.log(result);
        console.log(dto.coupon_idx); //couponMakeForm().dto.coupon_idx;
		
        $('#exampleModalLabel').text('쿠폰정보'); //coupon_idx 라는 키값으로 해시데이터를 삽입, 화면에는 안보임.
        $('#modal_idx').attr('data-coupon_idx', dto.coupon_idx); //coupon_idx 라는 키값으로 해시데이터를 삽입, 화면에는 안보임.
        $('#modal_idx').attr('value', dto.coupon_idx); //해당 태그의 value에 데이터 삽입
        $('#modal_idx').text(dto.coupon_idx);
        // $('#modal_img').attr('src', ImgSrc + dto.resume_img);
        // $('#modal_intro').text(dto.resume_intro);
         //$('#modal_cate1_name').text(dto.cate1_name);
        // $('#modal_cate2_name').text(dto.cate2_name);
       }//success : function
   });//ajax
}//getResume()
</script>
</html>
