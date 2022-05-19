var count = 5;

setInterval(function(){
	$('#second').text(count+'초');
	count--;
	if(count==-1){
		window.location.href = 'index.do';
	}
},1000);