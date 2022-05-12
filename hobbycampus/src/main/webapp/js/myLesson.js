$myLesson = {
	goWithFilter: function(e){
		var url = "/hobbycampus/mylessonList.do"
		if(e.value != '전체 목록'){
			url += "?lessonRecordState=" +encodeURIComponent(e.value); 
		}
		location.href = url;
	}


}