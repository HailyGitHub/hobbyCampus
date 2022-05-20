<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if(${result}){
		window.alert('메일이 전송 되었습니다.');
		
	}else{
		window.alert('메일이 전송에 실패하였습니다.');
		
	}
	
	location.href="lessonCont.do?lesson_idx="+${lesson_idx};
	window.self.close();
	
</script>