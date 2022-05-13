var target_1 = document.all.btn_1;
var target_2 = document.all.btn_2;
var target_3 = document.all.btn_3;

target_1.addEventListener('click',function(){
	window.location.href = 'memberUserList.do';
});
target_2.addEventListener('click',function(){
	window.location.href = 'memberTeacherList.do';
});
target_3.addEventListener('click',function(){
	window.location.href = 'memberWithdrawList.do';
});

function switchActive(idx){
	var btn_switch = document.getElementById(idx); //Get each switch button
	var state = btn_switch.getAttribute('data-state'); //Get u_state
	
	if(state=='탈퇴'){return false;}
	if(!window.confirm('활성화를 변경하시겠습니까?')){return false;} // Comfirm switch

	// Switch active atate
	if(state=='활성'){
		state = '정지' //on -> off
	}else if(state!='활성'){
		state = '활성' //off -> on
	}
	
	var param = 'u_idx=' + idx + '&' + 'u_state=' + state;
	sendRequest('switchUserState.do', param, switchResult, 'GET');
	
	function switchResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
			var data = XHR.responseText;
			alert(data);
			window.location.reload();
			}
		}
	}
}