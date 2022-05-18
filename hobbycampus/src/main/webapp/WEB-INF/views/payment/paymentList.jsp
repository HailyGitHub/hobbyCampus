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
	
<h1 style="text-align: center; padding-top: 150px;margin-bottom : 100px;"><b>환불 관리 페이지</b></h1>
<!-- Button trigger modal -->

<article class="list-table">
			<div class="col-md-12">
	<table class="table m-4 table-hover">
	<thead>
		<tr>
			<th>결제번호</th>
			<th>결제자</th>
			<th>결재금액</th>
			<th>결제일자</th>
			<th>상태</th>
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
		결제내역 없음 
		</td>
	</tr>
	</c:if>
	<c:forEach var="dto" items="${lists}">
		<tr onclick="return refund(${dto.pay_list_idx})">
			<td>${dto.pay_list_idx}</td>
			<!-- create url -->
			<c:url var="url" value="paymentList.do">
				<c:param name="idx">${dto.pay_list_idx}</c:param>
			</c:url>
			
			<!-- insert url -->
			<td>
				<a href="#" style="text-decoration: none; color: black;">
				${dto.u_idx} 
				</a>
			</td>
			<td>${dto.pay_point}</td>
			<td> ${dto.pay_date}</td>
			<td>${dto.pay_value}</td>
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
           <input type="hidden" class="form-control rounded-4" id="modal_pay_list_idx" placeholder="modal_pay_list_idx">
        	<h5 class="modal-title" id="t_modal_u_idx">결제자</h5>
            <input type="hidden" id="h_modal_u_idx">
        	<h3 class="modal-title" id="modal_u_idx">결제자</h3>
          </div>
          <div class="form-floating mb-3">
        	<h5 class="modal-title" id="t_modal_pay_point">결제 포인트</h5>
            <input type="hidden" id="h_modal_pay_point">
           <input type="Text" class="form-control rounded-4" id="modal_pay_point" placeholder="modal_pay_point">
          </div>
           <div class="form-floating mb-3">
        	<h5 class="modal-title" id="t_modal_idx">결제 상태</h5>
           <input type="Text" class="form-control rounded-4" id="modal_pay_value" placeholder="modal_pay_value">
          </div>	
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
        <button type="button" id="modal_udt_btn" class="btn btn-primary" onclick="return refund()"  data-bs-toggle="modal" data-bs-target="#exampleModal">refund</button>
      </div>
    </div>
  </div>
</div>

		<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>

<script>

function refund(idx){
	console.log(idx);
	if(!confirm('환불처리하시겠습니까?')) return false;
	
	
	$.ajax({
	      type: 'GET',
	      url: 'refund.do',
	      data: {'pay_list_idx': idx},
	      dataType: 'json',
	      success: function(result){
	    	alert(result.msg); // controller return msg
	    	  
	      }
	   });//ajax
	   location.reload();
	  // $('#exampleModal').modal('hide');
}

</script>
</html>