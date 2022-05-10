<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	
	window.alert("${msg}");
	var result = window.confirm("${msgConfirm}");
	if(result){
		window.alert('사용할게요!');
	}else{
		window.alert('사용x!');
	}
</script>