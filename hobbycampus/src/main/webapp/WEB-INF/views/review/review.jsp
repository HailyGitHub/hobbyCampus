<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

작성 가능한 리뷰
<form>

<table>
<tr>
	<td><img src="#">클래스 이름</td>
	<td>클래스 제목<br>
		작가명 </td>
</tr> 
<tr>
	<td colspan="2"> 별이 5개다!!</td>
</tr>
<form name="review" action="review.do">
<tr>
	<td> <textarea>리뷰 내용</textarea>
		<input type="submit" value="리뷰 작성">
	</td>
</tr>
</form>	


</table>
</form>
</body>
</html>