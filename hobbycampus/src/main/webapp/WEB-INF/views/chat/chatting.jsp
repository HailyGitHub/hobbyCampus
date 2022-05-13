<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
	* {
	  outline: none;
	}
	
	.container {
	  position: absolute;
	  left: 50%;
	  top: 50%;
	  transform: translate(-50%, -50%);
	  width: 90%;
	  height: 90%;
	}
	
	header {
	  width: 100%;
	  height: 20%;
	  background: orange;
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	  justify-content: center;
	}
	
	header div {
	  width: 90%;
	  height: 50%;
	  margin: 1% !important;
	  background: white;
	  display: flex;
	  flex-direction: row;
	  align-items: center;
	  justify-content: flex-start;
	}
	header div label{
	  color: rgb(255, 180, 41);
	}
	
	header div input {
	  width: 50%;
	  height: 90%;
	  margin-left: 15px;
	}
	
	header div button {
	  width: max-content;
	  height: max-content;
	  padding: 10px;
	  cursor: pointer;
	  margin-left: 15px;
	}
	
	main {
	  width: 100%;
	  height: 70%;
	  background: beige;
	  overflow-y: scroll;
	}
	
	main>div {
	  width: 100%;
	  height: max-content;
	  display: flex;
	}
	
	main>div>div {
	  margin: 5px;
	  width: 50%;
	  height: 100px;
	  background: black;
	  display: flex; flex-direction: column;
	}
	
	main>div>div>div{
	  align-items: center;
	}
	
	main>div.my-msg {
	  justify-content: flex-end;
	}
	
	main>div.friend-msg {
	  justify-content: flex-start;
	}
	
	main>div>div>div.title{
	  width: 100%; height: 20%;
	  display: flex; padding: 2px;
	  background: white;
	}
	
	main>div>div>div.content-msg{
	  width: 100%; height: 80%;
	  display: flex; padding: 2px;
	  background: orange;
	}
	
	main>div.my-msg>div>div{
	  justify-content: flex-end;
	}
	
	
	footer {
	  width: 100%;
	  height: 10%;
	  background: orange;
	  display: flex;
	  flex-direction: row;
	  align-items: center;
	  justify-content: center;
	}
	
	footer textarea {
	  width: 75%;
	  height: 80%;
	  padding: 5px;
	  font: normal 12pt Tahoma;
	  resize: none;
	}
	
	footer button {
	  width: max-content;
	  height: 90%;
	  margin-left: 10px;
	  font: bold 12pt Tahoma;
	  cursor: pointer;
	}
  </style>
</head>

<body>
  <div class="container">
    <header>
      <div class="c1">
        <label>My-ID</label>
        <input type="text" id="my-id" class="myID">
      </div>  
      <div class="c2">
        <label>Connection-ID</label>
        <input type="text" id="f-id" class="fID">
        <button id="conn">Connect</button>
      </div>
    </header>

    <main>
    </main>

    <footer>
      <textarea id="msg"></textarea>
      <button id="send">SEND</button>
    </footer>

  </div>
</body>

  <script src="https://unpkg.com/peerjs@1.3.2/dist/peerjs.min.js"></script>
  <script>
  const obj = {
		  mID : document.querySelector("#my-id"),
		  fID : document.querySelector("#f-id"),
		  conBtn : document.querySelector("#conn"),
		  msg : document.querySelector("#msg"),
		  send : document.querySelector("#send"),
		  Cdisplay : document.querySelector("main")
		};

		var conn = new Peer();
		var Aconn = undefined;

		conn.on("open",(id)=>{
		  obj.mID.value = id;
		});

		conn.on("connection", (NAConn)=>{
		  if(Aconn!=undefined) Aconn.close();
		  obj.fID.value = NAConn.peer;
		  Aconn = NAConn;
		  Aconn.on("data", displayFriendMSG);
		});

		obj.conBtn.addEventListener("click", ()=>{
		  if(obj.fID.value.length>0){
		    if(Aconn!=undefined) Aconn.close();
		    Aconn = conn.connect(obj.fID.value);
		    Aconn.on("data", displayFriendMSG);
		  }
		});

		obj.send.addEventListener("click", ()=>{
		  if(Aconn!=undefined){
		    if(obj.msg.value.length>0){
		      sendData(obj.msg.value);
		      displayMyMSG();
		      obj.msg.value = "";
		    }
		  }
		});

		function displayMyMSG(){
		  obj.Cdisplay.insertAdjacentHTML("beforeend", 
		  '<div class="my-msg"><div><div class="title">'+obj.mID.value+'</div><div class="content-msg">'+obj.msg.value+'</div></div></div>');
		}

		function displayFriendMSG(data){
		  obj.Cdisplay.insertAdjacentHTML("beforeend",
		  '<div class="friend-msg"><div><div class="title">'+obj.fID.value+'</div><div class="content-msg">'+data+'</div></div></div>');
		}

		function sendData(data){
		  if(Aconn!=undefined){
		    Aconn.send(data);
		  }
		}

  </script>

</html>