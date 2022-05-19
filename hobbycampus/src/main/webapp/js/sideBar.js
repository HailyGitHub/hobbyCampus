$(document).ready(function(){
	// Clean Category One List
	$('#cate-sidebar').empty();
	
	$.ajax({
		type: 'GET',
		url: 'sideBarCateOne.do',
		dataType: 'json',
		success: function(one){
			var $cateOne = one.cateOne;
			
			for(var i=0; i<$cateOne.length; i++){
				$('#cate-sidebar').append('<li class="mb-1">'
						+ '<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#co_'+$cateOne[i].cate1_idx+'" aria-expanded="false" onclick="showCateTwo('+$cateOne[i].cate1_idx+')">'
						+ $cateOne[i].cate1_name
						+ '</button>'
						+ '<div class="collapse" id="co_'+$cateOne[i].cate1_idx+'">'
						+ '<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small" id="ul_'+$cateOne[i].cate1_idx+'" data-test="test">'
						+ '</ul></div></li>'
						);
			}
		}
	});
	
});

function showCateTwo(idx){
	
	$.ajax({
		type: 'GET',
		url: 'sideBarCateTwo.do',
		data: {'cate1_idx':idx},
		dataType: 'json',
		success: function(two){
			var $cateTwo = two.cateTwo;
			
			$('#ul_'+idx).empty();
			for(var i=0; i<$cateTwo.length; i++){
				$('#ul_'+idx).append('');				
			}
		}
	});
}