<%@page import="java.util.Map"%>
<%@page import="micro.apple.groupware.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="micro.apple.groupware.chatting.vo.ChatMessageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
System.out.println("chatList >> ");
System.out.println(request.getAttribute("chatList"));
List<Map<String, Object>> chatList = (List<Map<String, Object>>)(request.getAttribute("chatList"));

String memNm = ((MemberVO)(session.getAttribute("MEMBERVO"))).getMemNm();

String memIdx = ((MemberVO)(session.getAttribute("MEMBERVO"))).getMemIdx();
%>

<head>
<!-- SockJS 웹소켓으로 서버에 연결하고, 메세지를 전송하고, 메세지를 수신 -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>웹소켓 채팅</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	<script type="text/javascript">
		const URLSearch = new URLSearchParams(location.search);
		var webSocket = {
			init: function(param) {
				this._url = param.url;
				this._initSocket();
			},
			sendChat: function() {
				$.ajax({
					type: 'post',
					url: '/saveChat',
					async: false,
					data:{
						chmsgCont: $('#message').val(),
						memIdx: "<%=memIdx %>",
						chatIdx : URLSearch.get('chatIdx')
						
					},
					success: function(data){
						console.log('sendMsg :' + $('#message').val());
					}
				});
				this._sendMessage('${param.chatIdx}', 'CMD_MSG_SEND', $('#message').val());
				$('#message').val('');
			},
			sendEnter: function() {
				this._sendMessage('${param.chatIdx}', 'CMD_ENTER', $('#message').val());
				$('#message').val('');
			},
			receiveMessage: function(msgData) {
				// 정의된 CMD 코드에 따라서 분기 처리
				if(msgData.cmd == 'CMD_MSG_SEND') {		
					console.log("msgData : " + msgData);
					var html = '';
					html += '<div class="chat-content-wrap">';
					if("<%=memIdx %>" == msgData.memIdx) html += '<div class="chat-content content-my">';
					else html += '<div class="chat-content content-other">';
					html += '<div>' + msgData.memIdx + '</div>';
					html += '<div>'+msgData.chmsgCont+'</div>';
					html += '<div style="font-size: 1px; color: gray;">' + msgData.chmsgWrdate + '</div>';
					html += '</div>';
					html += '</div>';
					$('#divChatData').append(html);
				}
				// 입장
				else if(msgData.cmd == 'CMD_ENTER') {
// 					$('#divChatData').append('<div>' + msgData.msg + '</div>');
				}
				// 퇴장
				else if(msgData.cmd == 'CMD_EXIT') {					
// 					$('#divChatData').append('<div>' + msgData.msg + '</div>');
				}
			},
			closeMessage: function(str) {
				$('#divChatData').append('<div>' + '연결 끊김 : ' + str + '</div>');
			},
			disconnect: function() {
				this._socket.close();
			},
			_initSocket: function() {
				this._socket = new SockJS(this._url);
				this._socket.onopen = function(evt) {
					webSocket.sendEnter();
				};
				this._socket.onmessage = function(evt) {
					webSocket.receiveMessage(JSON.parse(evt.data));
				};
				this._socket.onclose = function(evt) {
					webSocket.closeMessage(JSON.parse(evt.data));
				}
			},
			_sendMessage: function(chatIdx, cmd, msg) {
				var msgData = {
						chatIdx : chatIdx,
						cmd : cmd,
						msg : msg
				};
				var jsonData = JSON.stringify(msgData);
				this._socket.send(jsonData);
			}

		};
	</script>	
	<script type="text/javascript">
        $(window).on('load', function () {
			webSocket.init({ url: '<c:url value="/chat" />' });	
		});
	</script>

<style>
.chat-content-wrap {
	display: flow-root;
}
.chat-content {
	max-width: 70%;
	border: 2px solid #eee;
	border-radius: 10px;
	padding: 0.5rem;
	margin: 0.5rem;
}
.content-my {
	float: right;
}
.content-other {
	float: left;
}
</style>
</head>

<body>
<div class="popupChat">
	<h4>채 팅</h4>
	<div style="width: 90%; height: 330px; padding: 10px; border: solid 1px #e1e3e9; overflow-y: auto; display:flex; flex-direction: column-reverse;">
		<div id="divChatData">

		<%
		for(Map<String, Object> MsgItem : chatList){	
		%>
			<div class="chat-content-wrap">
				<%if((MsgItem.get("MEM_IDX") + "").equals(((MemberVO)(request.getSession().getAttribute("MEMBERVO"))).getMemIdx() + "")){ %><div class="chat-content content-my">
				<%}else{ %><div class="chat-content content-other"><%} %>				
				<div><%=MsgItem.get("MEM_NM") %></div>
				<div><%=MsgItem.get("CHMSG_CONT") %></div>
				<div style="font-size: 1px; color: gray;"><%=MsgItem.get("CHMSG_WRDATE") %></div>
				</div>
			</div>
			<% } %>
			</div>
		</div>
	</div>
	<div style="width: 100%; height: 10%; padding: 10px;">
		<input type="text" id="message" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />
		<input type="button" class="btn btn-primary" id="btnSend" value="채팅 전송" onclick="webSocket.sendChat()" />
	</div>

</div>
</body>
