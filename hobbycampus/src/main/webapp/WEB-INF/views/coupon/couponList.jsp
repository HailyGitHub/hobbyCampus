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
    <style>
    td,th {
    text-align: center;
    }
    .list-table{
    		width: 80%;
    		margin: 0px auto;
    		min-height: 70vh;
    	}
    </style>
</head>
<body id="mainBody">
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	
	<!-- MAIN -->


	<h1 style="text-align: center; padding-top: 150px"><b>쿠폰 관리 페이지</b></h1>
<!-- Button trigger modal -->
<div style="margin-top : 28px;  width: 90%; text-align: right;">
<button class="btn btn-outline-primary btn-lg" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="createCouponForm()"> 쿠폰등록</button>
</div>
<!-- Select Button List -->
				
<article class="list-table">
			<div class="col-md-12">
	<table class="table m-4 table-hover">
	<thead>
		<tr>
			<th scope="col" class="col-md-1">발급번호</th>
			<th scope="col" class="col-md-3">쿠폰명</th>
			<th scope="col" class="col-md-2">할인률</th>
			<th scope="col" class="col-md-2">이미지</th>
			<th scope="col" class="col-md-1">만료일</th>
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
		<tr data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="getInfo(${dto.coupon_idx})">
			<td>${dto.coupon_idx}</td>
			<!-- create url -->
			<c:url var="url" value="coupon.do">
				<c:param name="idx">${dto.coupon_idx}</c:param>
			</c:url>
			<!-- insert url -->
			<td>
				<a href="#" style="text-decoration: none; color: black;" >
				${dto.coupon_title} 
				</a>
			</td>
			<td>${dto.coupon_rate}</td>
			<td><img src="/hobbycampus/hobbyImg/coupon/${dto.coupon_img}" style="width: 20px;"></td>
			<td>${dto.coupon_end}</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	</div>
</article>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modal_title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <div class="modal-body p-5 pt-0">
        <form class="">
          <div class="form-floating mb-3">
           <input type="hidden" class="form-control rounded-4" id="modal_coupon_idx" placeholder="modal_coupon_idx">
        	<h5 class="modal-title" id="t_modal_title">쿠폰명</h5>
            <input type="hidden" id="h_modal_title">
           <input type="Text" class="form-control rounded-4" id="modal_coupon_title" placeholder="modal_title">
          </div>
          <div class="form-floating mb-3">
        	<h5 class="modal-title" id="t_modal_rate">할인율</h5>
            <input type="hidden" id="h_modal_rate">
	            <div class="form mb-3" name="i_option" >
		          <select class="form-select form-select-lg mb-3 fs-9" aria-label=".form-select-lg example" id="modal_coupon_rate">
					  <option selected >할인율을 선택해주세요!</option>
					<c:forEach var="i" begin="5" end="100" step="5">
					  <option value="${i}" >${i} %</option>				
					</c:forEach>
				  </select>
			  </div>
          </div>
           <div class="form-floating mb-3">
        	<h5 class="modal-title" id="t_modal_idx">상태</h5>
        		<div class="form mb-3" name="s_option" >
		          <select class="form-select form-select-lg mb-3 fs-9" aria-label=".form-select-lg example" id="modal_coupon_state">
					  <option selected >활성 여부 </option>
					  <option value="활성">활성</option>
					  <option value="비활성">비활성</option>
				  </select>
			  	</div>
          </div>	
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
        <button type="button" id="modal_udt_btn" class="btn btn-primary" onclick="return updtCoupon()">Update</button>
        <button type="button" id="modal_crt_btn" class="btn btn-primary" onclick="return couponMake()">Create</button>
      </div>
    </div>
  </div>
</div>


	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>

<script>

function createCouponForm(){
	$('#modal_title').text('쿠폰등록');

	$('#modal_udt_btn').css('display','none');
	$('#modal_crt_btn').css('display','block');

	$('#modal_coupon_idx').val('');
	$('#modal_coupon_rate').val('');
	$('#modal_coupon_state').val('');
	$('#modal_coupon_title').val('');

}

function updtCoupon(){
	if(!confirm('수정사항을 저장하시겠습니까?')) return false;
	
	
	$.ajax({
	      type: 'GET',
	      url: 'couponUpdate.do',
	      data: {'coupon_title': $('#modal_coupon_title').val(), 
	    	  'coupon_rate': $('#modal_coupon_rate').val(), 
	    	  'coupon_state': $('#modal_coupon_state').val(),
	    	  'coupon_img': $('#modal_coupon_rate').val()+'.jpg',
	    	  'coupon_idx': $('#modal_coupon_idx').val()},
	      dataType: 'json',
	      success: function(result){
	    	  alert(result.msg);
	    	  
	      }
	   });//ajax
	   location.reload();
	   //$('#exampleModal').modal('hide');
}

function couponMake(){
	if(!confirm('쿠폰을 생성하시겠습니까?')) return false;
	
	
	$.ajax({
	      type: 'GET',
	      url: 'couponMake.do',
	      data: {'coupon_title': $('#modal_coupon_title').val(), 
	    	  'coupon_rate': $('#modal_coupon_rate').val(), 
	    	  'coupon_img': $('#modal_coupon_rate').val()+'.jpg',
	    	  'coupon_state': $('#modal_coupon_state').val()},
	      dataType: 'json',
	      success: function(result){
		alert(result.msg);
	    	  
	      }
	   });//ajax
	   location.reload();
	   //$('#exampleModal').modal('hide');
}

/* Input Info to Modal */
function getInfo(idx){

	console.log(idx);
	$('#modal_udt_btn').css('display','block');
	$('#modal_crt_btn').css('display','none');
   $.ajax({
      type: 'GET',
      url: 'couponMakeForm.do',
      data: {'coupon_idx': idx, },
      dataType: 'json',
      success: function(result){
        console.log(result);
        console.log(result.dto.coupon_idx); //couponMakeForm().dto.coupon_idx;
        $('#modal_title').text('쿠폰정보'); 
        
        $('#modal_coupon_idx').val(result.dto.coupon_idx); 
       // $('#modal_coupon_idx').attr('value', result.dto.coupon_idx);
        
       // $('#modal_coupon_title').attr('data-coupon_idx', title); 
        $('#modal_coupon_title').attr('value', result.dto.coupon_title);
    	
        
        $('#modal_coupon_state').val( result.dto.coupon_state).prop("selected",true);
    	
       //$('#modal_coupon_rate').attr('data-coupon_rate', rate); 
        $('#modal_coupon_rate').val(result.dto.coupon_rate).prop("selected",true);
        
       
       }
   });//ajax
}//getResume()
</script>
</html>
