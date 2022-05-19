//SETTING Hour and Minute
var $hour = ['06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23'];
var $min = ['00','15','30','45'];

function showSchedule(idx){
	//SET Attribute
	$('#s_title').attr('data-idx', idx);
	
	//SET Hour Option List
	$('#m_hour').empty();
	$('#m_hour').append('<option value="none" selected>시간 선택</option>');
	for(var h=0; h<$hour.length; h++){
		$('#m_hour').append('<option value="'+$hour[h]+'">'+$hour[h]+'</option>');
	}
	//SET Minute Option List
	$('#m_min').empty();
	$('#m_min').append('<option value="none" selected>분 선택</option>');
	for(var m=0; m<$min.length; m++){
		$('#m_min').append('<option value="'+$min[m]+'">'+$min[m]+'</option>');
	}
	
	// Schedule List Ajax
	$('#modal-tbody').empty();
	$.ajax({
		type: 'GET',
		url: 'scheduleInfoList.do',
		data: {'lesson_idx':idx},
		dataType: 'json',
		success: function(data){
			$list = data.lists;
			for(var i=0; i<$list.length; i++){
				$('#modal-tbody').append('<tr><th scope="row">'+(i+1)+'</th>'
								+ '<td>'+$list[i].lesson_start+'</td>'
								+ '<td>'+$list[i].lesson_time+'</td>'
								+ '<td>'+$list[i].lesson_people+'</td>'
								+ '<td><button type="button" class="btn btn-outline-secondary btn-sm" onclick="return deleteSchedule('+$list[i].lesson_schedule_idx+')">삭제</button></td>'
								);
			}
		}
		
	});
}//showSchedule(idx)


function schduleSubmit(){
	var $lesson_idx = $('#s_title').attr('data-idx');
	var $schedule_start = $('#m_start').val();
	var $lesson_time = $('#m_hour').val() + ':' + $('#m_min').val();
	var $lesson_people = $('#m_count').val();
	
	//Check Value
	if($('#m_hour').val()=='none' || $('#m_min').val()=='none' || $schedule_start==0 || $lesson_people==0) {
		alert('스케줄 정보를 모두 등록해 주세요.');
		return false; 
	}
	
	//Submit Ajax
	$.ajax({
		type: 'GET',
		url: 'scheduleSubmit.do',
		data: {'lesson_idx':$lesson_idx,'lesson_start':$schedule_start, 'lesson_time':$lesson_time, 'lesson_people':$lesson_people},
		dataType: 'json',
		success: function(data){
			var $result = data.msg;
			alert($result);
			window.location.reload();
		}
	});
}//schduleSubmit()


function deleteSchedule(idx){
	// Check again to delete schedule
	if(!confirm('해당 스케줄을 정말 삭제 하시겠습니까?')) return false;
	
	//Delete Schedule Ajax
	$.ajax({
		type: 'GET',
		url: 'scheduleDelete.do',
		data: {'lesson_schedule_idx':idx},
		dataType: 'json',
		success: function(data){
			var $d_result = data.msg;
			alert($d_result);
			window.location.reload();
		}
	});
}