<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div>보유 하빗      ${tPoint}하빗</div>
 <hr>
 <form name="toPoint" action="exToPoint.do">
 <input type="hidden" value="1" name="t_idx">
 	<ul>
 		<li><input type="text" name="exPoint">
 		<input type="submit" value="포인트로 전환" onclick="toPoint();"></li>
 	</ul>
 </form>
 
 <form name="toCash" action="exToCash.do">
 <input type="hidden" value="1" name="t_idx">
 	<ul>
 		<li><input type="text" name="exPoint">	z
 		<input type="submit" value="현금입금 신청" onclick="toChash();"></li>
 	</ul>
 </form>
 <hr>
</body>

</html>