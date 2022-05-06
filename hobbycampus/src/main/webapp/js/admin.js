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