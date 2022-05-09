$myLesson = {
	lessonPrice: 0,
	applyCoupon: function(e){
		var price = e.options[e.selectedIndex].getAttribute('price')
		document.getElementById('price_dd').innerText = price;
		document.getElementById('total_price_hr').innerText ="총 결제 포인트 : " + Math.max(0, $myLesson.lessonPrice - price).toString();	
	}
	
}