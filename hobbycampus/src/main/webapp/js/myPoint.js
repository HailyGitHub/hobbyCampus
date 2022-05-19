$myPoint = {
	refund: function(e) {
		var payListIdx = e.getAttribute('payListIdx');
		
		var url = "/hobbycampus/myPointRefund.do?payListIdx=" + payListIdx;
		$ajax.get(url, {}, $myPoint.refundCallback, $myPoint.refundErrorCallback)

	},


	refundCallback: function(response) {
		if (response == "success") {
			location.reload();
		} else {
			alert(response);
		}


	},

	refundErrorCallback: function() {
		alert("환불 도중 오류가 발생했습니다.");
		return;
	}

}