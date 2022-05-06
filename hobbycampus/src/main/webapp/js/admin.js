var s_pwd1 = document.getElementById('secret_pwd1');
var s_pwd2 = document.getElementById('secret_pwd2');
var s_pwd3 = document.getElementById('secret_pwd3');
var s_enter = document.getElementById('secret_enter');

var pwd = '32131';
var user = '';

s_pwd1.addEventListener('click',clickPwd);
s_pwd2.addEventListener('click',clickPwd);
s_pwd3.addEventListener('click',clickPwd);
s_enter.addEventListener('click',showAdmin);

function clickPwd() {
  user += this.getAttribute('data-pwd');
}

function showAdmin() {
  if(pwd==user){
    alert('관리자 페이지로 이동합니다.');
  }
}


/* About Page Method */
var m_title = document.getElementById('ModalLabel').firstChild;
var m_content = document.getElementById('modal-body').firstChild;
	
function showUs(){
	sendRequest('aboutUs.do', null, showUsResult, 'GET');
}
function showUsResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
		var data = XHR.responseText;
		
		m_title.nodeValue = '회사소개';
		m_content.nodeValue = data;
		}
	}
}

function showHR(){
	sendRequest('aboutHR.do', null, showHRResult, 'GET');
}
function showHRResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
		var data = XHR.responseText;
		
		m_title.nodeValue = '인사채용';
		m_content.nodeValue = data;
		}
	}
}

function showPolicy(){
	sendRequest('aboutPolicy.do', null, showPolicyResult, 'GET');
}
function showPolicyResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
		var data = XHR.responseText;
		
		m_title.nodeValue = '운영정책';
		m_content.nodeValue = data;
		}
	}
}

function showCenter(){
	sendRequest('aboutCenter.do', null, showCenterResult, 'GET');
}
function showCenterResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
		var data = XHR.responseText;
		
		m_title.nodeValue = '고객센터';
		m_content.nodeValue = data;
		}
	}
}
