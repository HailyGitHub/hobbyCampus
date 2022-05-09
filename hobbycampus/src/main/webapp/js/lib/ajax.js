$ajax = {
	ajax: function(url, param, type, callbackFunc, errCallbackFunc) {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() { // 요청에 대한 콜백함수
			if (xhr.readyState === xhr.DONE) { // 요청이 완료되면 실행
				if (xhr.status === 200 || xhr.status === 201) { // 응답 코드가 200 혹은 201
					callbackFunc(xhr.responseText);
				} else {
					errCallbackFunc(xhr.reponseText);
				}
			}
		};
		xhr.open(type, url); // http 메서드와 URL설정
		if (type == 'GET') {
			xhr.send(); // 요청 전송
			for (key in param) {
				if (url.includes("?")) {
					url += "&" + key + "=" + param[key];
				} else {
					url += "?" + key + "=" + param[key];
				}
			}
		} else {
			xhr.setRequestHeader('Content-Type', 'application/json'); // 콘텐츠 타입을 json으로
			xhr.send(JSON.stringify(param)); // 데이터를 문자열로 동봉해서 전송한다
		}
	},

	get: function() {
		$ajax.ajax(url, param, 'GET', callbackFunc, errCallbackFunc);
	},
	post: function() {
		$ajax.ajax(url, param, 'POST', callbackFunc, errCallbackFunc);
	}

}