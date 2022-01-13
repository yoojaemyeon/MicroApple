<%@page import="micro.apple.groupware.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.right-bar {width: 400px !important; right: -400px;}

</style>

<!-- Right Sidebar -->
	<!-- 알림내용 2021/12/14 한주연 -->
	<div class="right-bar">
		<div class="rightbar-title">
			<a href="javascript:void(0);" class="right-bar-toggle float-right">
				<i class="dripicons-cross noti-icon"></i>
			</a>
			<h5 class="m-0">
				알림
			</h5>
		</div>
			
		<div class="rightbar-content h-100" data-simplebar>
			<!-- 알림 내용 출력 시작 -->
			<div class="p-3" id="notify_list"></div> 
			<!-- 알림 내용 출력 끝 -->
		</div>
	</div>
	<div class="rightbar-overlay"></div>
<!-- /Right-bar -->




<script type="text/javascript">
var socket = null;

// 웹소켓 연결
sock = new SockJS('<c:url value="/notify"/>');
socket = sock;
console.log("소켓 연결 ok");

// 데이터 전달 받았을 때
sock.onmessage = onMessage;	// toast(시간지나면 바로 사라지는 메시지) 생성

notifyList();
	
function test_notify(){
	send_notify(noticeAddr, noticeCont, noticeUrl, memIdx);
}

//toast생성 및 추가
function onMessage(evt){
	notifyList();
	console.log(evt);
	
	var strs = evt.data.split("#@#");
	var noticeAddr = strs[0];
	var noticeCont = strs[1]; 
	var noticeUrl = strs[2];
	var memIdx = strs[3];
	var noticeSendall = strs[4];
	var noticeIdx = strs[5];
	
	var text = noticeCont + '<br><button type="button" class="btn btn-sm btn-secondary" onclick="location.href=\''+noticeUrl+'\';">바로가기</button>';
	
	$.toast({
		text: text, // Text that is to be shown in the toast
		heading: noticeAddr, // Optional heading to be shown on the toast
		icon: 'secondary', // Type of toast icon
		showHideTransition: 'fade', // fade, slide or plain
		allowToastClose: true, // Boolean value true or false
		hideAfter: 10000, // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden
		stack: 5, // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time
		position: 'top-right', // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values
		
		textAlign: 'left',  // Text alignment i.e. left, right or center
		showDuration : 30000,
// 		hideDuration : 1000,
		timeOut : 5000,
		loader: true,  // Whether to show loader or not. True by default
		loaderBg: '#9bbef2',  // Background color of the toast loader
		beforeShow: function () {}, // will be triggered before the toast is shown
		afterShown: function () {}, // will be triggered after the toat has been shown
		beforeHide: function () {}, // will be triggered before the toast gets hidden
		afterHidden: function () {}  // will be triggered after the toast has been hidden
	});
};	

// 알림 전송 funciton
// send_notify(발신위치(String), 알림내용(String), 버튼클릭시이동URL(String), 대상memIdx(int, 0 입력시 전체대상), 전체전송여부, 알림번호(int))
function send_notify(noticeAddr, noticeCont, noticeUrl, memIdx, noticeSendall, noticeIdx, noticeWrdate) {
	
	var noticeWrdate = new Date();
	
	var noticeSendall = 'N';
	if(memIdx == 0){
		noticeSendall = 'Y';
	}
	
	$.ajax({
		type: 'post',
		dataType: 'json',
		url: '/insertNotify',
		data : {
			noticeAddr : noticeAddr,
			noticeCont : noticeCont,
			noticeUrl : noticeUrl,
			memIdx : memIdx,
			noticeSendall : noticeSendall,
			noticeIdx : noticeIdx,
			noticeWrdate : noticeWrdate
		},
		success: function (data){	// db 전송 성공하면 알림 전송
			console.log(data);
	         if(!data.check){
	        	 alert("전송 실패!");
	         }else{
				// 소켓에 전달되는 메시지 stomp js socketDTO
				socket.send(noticeAddr + "#@#" + noticeCont + "#@#" + noticeUrl + "#@#" 
								+ memIdx + "#@#" + noticeSendall + "#@#" + noticeIdx + "#@#" + noticeWrdate);
	         }
		}
	});
		
};
// 알림 목록 출력 function
function notifyList() {
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : '/notifyList',
		success : function (data) {
			 console.log(data);
			 
			 var html = '';
			 $('#notify_list').html(html);
			 $.each(data.notifyList ,function (i,v){
				 html += '<div class="card border-secondary border">';
				 html += '<h6 class="card-header">' + v.noticeAddr + '</h6>';
				 html += '<a href="javascript:location.href=\'/notifyDelete?noticeIdx='+v.noticeIdx+'\';"class="dropdown-item" onclick="return confirm("정말 삭제 하시겠습니까?");" style="text-align:right;" >';
				 html += '<i class="mdi mdi-delete mr-1"></i></a>';
				 html += '<input type="hidden" value="'+v.noticeIdx+'" name="noticeIdx">'; // 알림 번호 가져오기
				 html += '<div class="card-body">';
				 html += '<h5 class="card-title">' + v.noticeAddr + '</h5>';
				 html += '<p class="card-text">' + v.noticeCont + '</p>';
				 html += '<button type="button" class="btn btn-sm btn-secondary" onclick="location.href=\''+v.noticeUrl+'\';">바로가기</button>';
				 html += '</div>';
				 html += '<div class="card-footer text-muted">' + v.noticeWrdate + '</div>';
				 html += '</div>';
			 });
			 $('#notify_list').html(html);
		}
	});
}
</script>

