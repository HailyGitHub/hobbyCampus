var XHR = null;

function getXHR(){
	if(window.ActiveXObject){ // only IE
		return new ActiveXObject("Msxml2.XMLHTTP"); // above Ver6 
	}else if(window.XMLHttpRequest){ // Chrome etc
		return new XMLHttpRequest();
	}else {
		return null;
	}
}

function sendRequest(url, params, callback, method){
	
	XHR = getXHR();
	
	var newMethod = method? method : 'GET'; // Method Type Check 1
	if(newMethod!='GET' && newMethod!='POST'){
		newMethod = 'GET'; // Method Type Check 2
	}
	
	var newParams = (params==null||params=='')? null : params;
	var newUrl = url;
	if(newMethod=='GET'&&newParams!=null){
		newUrl = newUrl + '?' + newParams;
	}
	
	XHR.onreadystatechange = callback;
	XHR.open(newMethod, newUrl, true);
	XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	XHR.send(newMethod=='POST'? newParams : null);
	
}