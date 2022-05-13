<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.alert("${msg}");
	if(${result}){
		location.href="nameCheck.do";
	}else{
		opener.document.updateTeacher.t_name.value='${t_name}';
		window.self.close();
	}
	
</script>