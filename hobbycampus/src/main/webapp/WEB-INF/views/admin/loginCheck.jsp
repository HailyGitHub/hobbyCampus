<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="adminName" value="${s_a_name }"></c:set>
<c:if test="${empty adminName}">
	<script>
		alert('사용권한이 없는 페이지입니다.');
		window.location.href = 'index.do';
	</script>
</c:if>