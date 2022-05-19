<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

{cate1_idx: [
  
<c:forEach var="cate2" items="${cate2List}"> 
	{cate2_idx:${cate2.cate2_idx}, cate2_name:'${cate2.cate2_name}'},
</c:forEach>

]}