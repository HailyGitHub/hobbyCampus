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
<body>
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	
	<!-- MAIN -->
	
	
<h1 style="text-align: center; padding-top: 150px;margin-bottom : 100px;"><b>레벨 관리 페이지</b></h1>
<!-- Button trigger modal -->

<article class="list-table">
			<div class="col-md-12">
	<table class="table m-4 table-hover">
	<thead>
		<tr>
			<th scope="col" class="col-md-1">레벨</th>
			<th scope="col" class="col-md-1">아이콘</th>
			<th scope="col" class="col-md-3">타이틀</th>
			<th scope="col" class="col-md-2">수수료</th>
			<th scope="col" class="col-md-2">조건</th>
		</tr>
	</thead>

		
	<tbody>
	<c:if test="${empty lists}">
	<tr>
		<td colspan="5" align="center">
		레벨 시트 조회 불가능
		</td>
	</tr>
	</c:if>
	<c:forEach var="dto" items="${lists}">
		<tr onclick="getInfo(${dto.lev_idx})" data-bs-toggle="modal" data-bs-target="#exampleModal">
			<td>${dto.lev_idx}</td>
			<!-- create url -->
			<c:url var="url" value="levelList.do">
				<c:param name="idx">${dto.lev_idx}</c:param>
			</c:url>
			
			<!-- insert url -->
			<td><img src="/hobbycampus/hobbyImg/level/${dto.lev_img}" style="width: 20px;"></td>
			<td>
				<a href="${url}">
				</a>
				<a href="#" style="text-decoration: none; color: black;" >
				${dto.lev_name} 
				</a>
			</td>
			<td> 환전 수수료 ${dto.lev_rate} % </td>
			<td>누적 매출 ${dto.lev_sales} 원</td>
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
           <input type="hidden" class="form-control rounded-4" id="modal_lev_idx" placeholder="modal_lev_idx">
        	<h5 class="modal-title" id="t_modal_title">레벨</h5>
            <input type="hidden" id="h_modal_title">
           <input type="Text" class="form-control rounded-4" id="modal_lev_name" placeholder="modal_lev_name" readonly="readonly">
          </div>
          <div class="form-floating mb-3">
        	<h5 class="modal-title" id="t_modal_rate">혜택</h5>
            <input type="hidden" id="h_modal_rate">
           <input type="Text" class="form-control rounded-4" id="modal_lev_rate" placeholder="modal_lev_rate">
          </div>
           <div class="form-floating mb-3">
        	<h5 class="modal-title" id="t_modal_idx">조건</h5>
           <input type="Text" class="form-control rounded-4" id="modal_lev_sales" placeholder="modal_lev_sales" readonly="readonly">
          </div>	
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
        <button type="button" id="modal_udt_btn" class="btn btn-primary" onclick="return updtLev()">Update</button>
      </div>
    </div>
  </div>
</div>
	
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>

<script>

function updtLev(){
	if(!confirm('수정사항을 저장하시겠습니까?')) return false;
	
	
	$.ajax({
	      type: 'GET',
	      url: 'levelUpdate.do',
	      data: {
	    	  'lev_rate': $('#modal_lev_rate').val(), 
	    	  'lev_idx': $('#modal_lev_idx').val()},
	      dataType: 'json',
	      success: function(result){
	    	  console.log('수정되었습니다.');
	    	  
	      }
	   });//ajax
		alert('수정되었습니다.');
	   location.reload();
	   //$('#exampleModal').modal('hide');
}

function getInfo(idx){

	console.log(idx);
   $.ajax({
      type: 'GET',
      url: 'levelUpdateForm.do',
      data: {'lev_idx': idx },
      dataType: 'json',
      success: function(result){
        console.log(result);
        console.log(result.dto.coupon_idx); //couponMakeForm().dto.coupon_idx;
        $('#modal_title').text('레벨정보'); 
        
        $('#modal_lev_idx').attr('data-coupon_idx', idx); 
        $('#modal_lev_idx').attr('value', result.dto.lev_idx);
        
       // $('#modal_coupon_title').attr('data-coupon_idx', title); 
        $('#modal_lev_name').attr('value', result.dto.lev_name);
    	
        
        $('#modal_lev_sales').attr('value', result.dto.lev_sales);
    	
       //$('#modal_coupon_rate').attr('data-coupon_rate', rate); 
        $('#modal_lev_rate').attr('value', result.dto.lev_rate);
       
       }
   });//ajax
}//getResume()

</script>
</html>