<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script>
	
	if(${pointUpdate}){
		window.alert("포인트 전환/환전 신청이 완료되었습니다.");
	}else{
		window.alert("포인트 전환/환전 신청이 실패되었습니다.");
	}
	
	location.href="teacherPoint.do";
	
</script>