$myLessonRequest = {
	lessonPrice: 0,
	applyCoupon: function(e) {
		var couponPrice = e.options[e.selectedIndex].getAttribute('price')
		document.getElementById('price_dd').innerText = couponPrice;
		$myLessonRequest.paymentPrice = $myLessonRequest.totalPrice - couponPrice;
		document.getElementById('total_price_hr').innerText = "총 결제 포인트 : " + Math.max(0, $myLessonRequest.paymentPrice).toString();
	},
	payment: function() {
		//먼저 배송지가 있는 경우 비어있는거 체크
		if (!$myLessonRequest.validate()) {
			return;
		}

		//먼저 포인트가 충분한지 확인
		if ($myLessonRequest.uPoint < $myLessonRequest.paymentPrice) {
			//충전 confirm 창 생성
			if (confirm("충전하시겠습니까?")) {
				//포인트 부족
				var url = "/hobbycampus/pointShop.do?rurl=" + encodeURIComponent(location.href);
				//기존에 주소가 저장되어있지 않았음.
				if ($myLessonRequest.postSaved == "N") {
					url += "&postReceiver=" + document.getElementById('post_receiver').value;
					url += "&postTel=" + document.getElementById('post_tel').value;
					url += "&postAddr=" + document.getElementById('post_addr').value;
					url += "&postEtc=" + document.getElementById('post_etc').value;
				}
				window.location.href = url;
				return;
			}
			return;
		} else {
			//포인트 충분-> 결제
			var url = "/hobbycampus/mylessonList.do";
			url += "?lessonScheduleIdx=" + $myLessonRequest.lessonScheduleIdx;
			url += "&pricePoint=" + $myLessonRequest.paymentPrice;

			//기존에 주소가 저장되어있지 않았음
			if ($myLessonRequest.postSaved == "N") {
				url += "&postReceiver=" + document.getElementById('post_receiver').value;
				url += "&postTel=" + document.getElementById('post_tel').value;
				url += "&postAddr=" + document.getElementById('post_addr').value;
				url += "&postEtc=" + document.getElementById('post_etc').value;
			}
			window.location.href = url;
			return;


		}
	},

	validate: function() {
		if (document.getElementById('post_receiver') && document.getElementById('post_receiver').value == '') {
			alert("수령인을 입력해주세요.");
			return false;
		}
		if (document.getElementById('post_tel') && document.getElementById('post_tel').value == '') {
			alert("전화번호를 입력해주세요.");
			return false;
		}
		if (document.getElementById('post_addr') && document.getElementById('post_addr').value == '') {
			alert("수령지를 입력해주세요.");
			return false;
		}
		if (document.getElementById('post_etc') && document.getElementById('post_etc').value == '') {
			alert("내용을 입력해주세요.");
			return false;
		}
		return true;
	}


}