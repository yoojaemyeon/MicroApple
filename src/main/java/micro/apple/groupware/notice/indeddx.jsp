<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<!-- 클라이언트 화면에 넣기 -->
<input id="btnSend" value="Send" type="button">
<input type="text" id="msg" value="알림테스트" class="form-control" />

<script>
$(document).ready(function() {
	$("#btnSend").on("click",function(event){
		event.preventDefault();
		if(socket.readyState != 1) return;
		let msg = $("#msg").val();
		socket.send(msg);	// 소켓에 입력된 메시지 전송
		
	});
});

</script>
<!-- 클라이언트 화면에 넣기 -->






<!-- 
어느 페이지에 있던 알림을 받기 위해 공통으로 쓰이는 페이지 
index.jsp
-->
<script>
var socket = null;

$(document).ready(function() {
	connectWS();
});

	function connectWS() {
		var ws = new WebSocket("ws://localhost:8092/notice");
		socket = ws;
		ws.open = function (message) {
			console.log(message);
		};
		
		ws.onmessage = function (event){
			$("#socketAlert").text(event.data);
			$("#socketAlert").css("display","block");
		};
		
		ws.onclose = function (event){
			console.log("Server disConnect");	
		};
		
		ws.onerror = function (event){
			console.log("Server Error");
		};
	}	

</script>

</body>
</html>