<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<h2>내 포인트 내역</h2>
		<p>
			내 포인트: --$보유포인트표시$-- <span>하빗</span>
		</p>
		<table class="blueone" border="1">
			<thead>
				<tr>
					<th>구매일</th>
					<th>충전 포인트</th>
					<th>사용 포인트</th>
					<th>결제 내용</th>
					<th>환불</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
			<tfoot>
				<!-- 페이징 -->
				<td colspan="5" align="center">${pageStr }</td>
			</tfoot>
		</table>
</body>
</html>