<%@page import="micro.apple.groupware.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String memNm = ((MemberVO)(session.getAttribute("MEMBERVO"))).getMemNm();
String memIdx = session.getAttribute("MEMBERVO") == null ? "" : ((MemberVO)(request.getSession().getAttribute("MEMBERVO"))).getMemIdx();
String memPicture = session.getAttribute("MEMBERVO") == null? "알 수 없음" : ((MemberVO)(session.getAttribute("MEMBERVO"))).getMemPicture();
%>
<style>
.dropdown-menu.chat-dropdown{
	min-width: 30rem;
}
</style>
<!-- <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated dropdown-lg show" x-placement="bottom-end"> -->
<!-- 	style="position: absolute; transform: translate3d(-278px, 70px, 0px); top: 0px; left: 0px; will-change: transform;"> -->
<div class="dropdown-menu chat-dropdown">
	<!-- item-->
	<div class="dropdown-item noti-title" >
		<h5 class="m-0">
			<span class="float-right"> <a href="javascript: void(0);"
				class="text-dark"> <small></small>
			</a>
			</span>채팅 목록
		</h5>
	</div>

	<!-- 채팅목록 시작 -->
	<div class="row">
		<!-- start chat users-->
		<div class="col-xl-1 col-lg-1 order-lg-1 order-xl-1"></div>
		<div class="col-xl-10 col-lg-10 order-lg-10 order-xl-1">
			<div class="card" id="chat-room-list">
				<div class="card-body p-0">
				</div>
<!-- 				end card-body p-0 -->
			</div>
<!-- 			end card -->
		</div>
		<div class="col-xl-1 col-lg-1 order-lg-1 order-xl-1"></div>
<!-- 		end col-xl-3 col-lg-6 order-lg-1 order-xl-1" -->
	</div>
<!-- 	end row -->
<!-- </div> -->
</div>


<script>



var memIdx = '<%=memIdx %>';
get_chatting_room();
function get_chatting_room(){
	$.ajax({
		type: 'post',
		dataType: 'json',
		url: '/chat/getRoomList',
		data: {
			memIdx : memIdx
		},
		success: function(data){
			console.log(data);
			var target = $('#chat-room-list .card-body');
			var html = '';
			target.html(html);
			$.each(data, function(i,v){
				html += '<a href="javascript:void(0);" onclick="window.open(\'/view_chat/?chatIdx='+v.CHAT_IDX+'\', \'chatIdx_'+v.CHAT_IDX+'\', \'width=500,height=500\');">';
				html += '<div class="media mt-1 p-2">';
				html += '<img src="/resources/images/profile/<%=memPicture%>" class="mr-2 rounded-circle" height="48" alt="Brandon Smith">';
				html += '<div class="media-body">';
				html += '<h5 class="mt-0 mb-0 font-14">';
				var d = new Date(v.CHAT_CRDATE);
				var dt = (d.getYear() + 1900) + '-' +(d.getMonth() + 1) + '-' + (d.getDate());
				html += '<span class="float-right text-muted font-12">생성일 : '+ dt +'</span>';
				html += v.CHAT_NM;
				html += '</h5>';
				html += '<p class="mt-1 mb-0 text-muted font-14">';
				html += '<span class="w-25 float-right text-right"></span>';
				html += '<span class="w-75">'+v.LAST_CHAT+'</span>';
				html += '</p>';
				html += '</div>';
				html += '</div>';
				html += '</a>';
			});
			html += '<a href="javascript:void(0);" onclick="createChattingRoom();">';
			html += '<div class="media mt-1 p-2">';
			html += '<div class="media-body">';
			html += '<h5 class="mt-0 mb-0 font-14" style="margin-top: 1rem !important;">';
			html += '<i class="uil-comment-plus"> </i>';
			html += '<span class="float-right text-muted font-12"></span>';
			html += '채팅방 만들기';
			html += '</h5>';
			html += '</div>';
			html += '</div>';
			html += '</a>';
				
			target.html(html);
		}
	});
}
function createChattingRoom(){
	var targetMemIdx = prompt('상대방 idx를 입력하세요');
	if(targetMemIdx.trim() == '') return false;
	var chatNm = prompt('방이름을 입력하세요');
	if(chatNm.trim() == '') return false;
	$.ajax({
		type: 'post',
		dataType: 'json',
		url: '/createChattingRoom',
		data: {
			targetMemIdx : targetMemIdx,
			memIdx : memIdx,
			chatNm : chatNm
		},
		success: function(data){
			get_chatting_room();
		}
	});
}
</script>