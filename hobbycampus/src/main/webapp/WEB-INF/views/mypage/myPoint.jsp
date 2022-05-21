<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--BootStarp-->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
   crossorigin="anonymous"></script>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<!--CSS-->
<link rel="stylesheet" href="/hobbycampus/css/main.css">
<link rel="stylesheet" href="/hobbycampus/css/pointShop.css">
<link rel="stylesheet" href="/hobbycampus/css/pointShop.css">
<script src="/hobbycampus/js/myPoint.js"></script>
<script src="/hobbycampus/js/lib/ajax.js"></script>
</head>
<body>
   <!-- HEADER -->
   <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
   <!-- SIDEBar -->
   <main class="mainArea">
      <div class="row">
         <div class="col-md-2">
            <jsp:include page="/WEB-INF/views/myPageSide.jsp"></jsp:include>
         </div>
         <!-- main -->
         <div class="col-md-10">
            <!-- body -->
            <div class="container">
      <div id="wrap">
         <h3>
            <span class="hb_yellow">포인트 내역 <img src="img/honey.png"
               class="imgsize"></span>
         </h3>
         <br>
         <h5 class="hb_price">내 포인트</h5>
         <h4>
            <span class="hb_yellow"><i class="bi bi-currency-exchange"></i> ${userVO.uPoint} 하빗</span>
         </h4>
         <table class="table table-striped table-hover">
            <thead>
               <tr>
                  <th>구매일</th>
                  <th>포인트</th>
                  <th>사용 내용</th>
                  <th>상태</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach items="${payList}" var="pay">
                  <tr>
                     <td><c:out value="${pay.payDate}" /></td>
                     <td><c:out value="${pay.point}" /></td>
                     <td><c:out value="${pay.title}" /></td>
                     <td><c:choose>
                           <c:when test="${pay.type == '입금' || pay.type == '충전'}">
                              <button payListIdx="${pay.payListIdx}"
                                 onclick="$myPoint.refund(this)">환불요청</button>
                           </c:when>
                           <c:otherwise>
                           ${pay.type}
                        </c:otherwise>
                        </c:choose></td>
                  </tr>
               </c:forEach>
               
            </tbody>
            <tfoot>
               <!--  com.hobbycam.page-->
               <td colspan="5" align="center">${pageMake}</td>
            </tfoot>
         </table>
      </div>
   </div>
</div>
</div>
</body>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>