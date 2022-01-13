 <%@page import="micro.apple.groupware.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 웹소켓 설정 시작 12/28 한주연 -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="/resources/jquery-3.6.0.js"></script>

 <!-- Topbar Start -->
 <div class="navbar-custom">
     <ul class="list-unstyled topbar-right-menu float-right mb-0">
         <li class="dropdown notification-list d-lg-none">
             <a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                 <i class="dripicons-search noti-icon"></i>
             </a>
             <div class="dropdown-menu dropdown-menu-animated dropdown-lg p-0">
                 <form class="p-3">
                     <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                 </form>
             </div>
         </li>

		
		<li class="dropdown notification-list d-none d-sm-inline-block">
                                <a href="<%=request.getContextPath()%>/webDiskMain" class="nav-link dropdown-toggle arrow-none" >
                                    <i class="dripicons-cloud noti-icon"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated dropdown-lg p-0">
                                    <div class="p-2">
                                        <div class="row no-gutters">
                                        </div>
                                    </div>
                                </div>
                            </li>
<!-- 일일업무보고 버튼 
		<li class="dropdown notification-list">
			<a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
			    <i class="uil-file-edit-alt noti-icon"></i>
			</a>
		</li>
-->		


<!-- 채팅 버튼 -->
        <li class="dropdown notification-list">
        	<a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown" href="#" role="button"  style="margin-top: 18px;">
				<i class="mdi mdi-chat-outline mdi-24px"></i>
            </a>
            	<jsp:include page="./../chatting/pop_chat.jsp" flush="true"/>
        </li>
<!-- 채팅 버튼 -->
        
<!-- 화상회의 버튼 
        <li class="dropdown notification-list d-none d-sm-inline-block">
            <a href="videoMeeting" class="nav-link dropdown-toggle arrow-none" style="margin-top: 18px;">
                <i class="mdi mdi-video-outline mdi-24px mdi-set"></i>
            </a>

        </li>
 -->       
  		<!-- 알림버튼 12/24 오전 9:36 한주연 -->
        <li class="dropdown notification-list" id="notifyBtn">
            <a class="nav-link right-bar-toggle" href="javascript: void(0);">
                <i class="dripicons-bell noti-icon"></i><span class="noti-icon-badge"></span>
            </a>
        </li>
        <!-- 알림 버튼 12/24 오전 9:36 한주연 -->
<!-- 프로필 메뉴 시작 서혜란 -->

		<%
		String memNm = session.getAttribute("MEMBERVO") == null? "알 수 없음" : ((MemberVO)(session.getAttribute("MEMBERVO"))).getMemNm();
		String memPicture = session.getAttribute("MEMBERVO") == null? "알 수 없음" : ((MemberVO)(session.getAttribute("MEMBERVO"))).getMemPicture();
		String positionNm = session.getAttribute("MEMBERVO") == null? "알 수 없음" : ((MemberVO)(session.getAttribute("MEMBERVO"))).getPositionNm();
		%>
        <li class="dropdown notification-list" style="width: 150px;">
            <a class="nav-link dropdown-toggle nav-user arrow-none mr-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="false"
                aria-expanded="false">
                <span class="account-user-avatar"> 
                
                    <img src="/resources/images/profile/<%=memPicture %>" onerror="this.src ='/resources/images/pro.jpg'" 
<%--                     <img src="/resources/images/profile/<%=((MemberVO)session.getAttribute("member")).getMemPicture()%>" onerror="this.src ='/resources/images/pro.jpg'"  --%>
                    		style="width: 50px;height: 50px;margin: -7px;" alt="user-image" class="rounded-circle">
                </span>
                <span style="float: right;">
                    <span class="account-user-name"><%=memNm%></span>
                    <span class="account-position"><%=positionNm%></span>
                </span>
            </a>
            <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated topbar-dropdown-menu profile-dropdown">
                <!-- item-->
                <div class=" dropdown-header noti-title">
                    <h6 class="text-overflow m-0">환영합니다!</h6>
                </div>

                <!-- item-->
                <a href="/memberMyPage" class="dropdown-item notify-item">
                    <i class="mdi mdi-account-circle mr-1"></i>
                    <span>My Page</span>
                </a>

                <!-- item-->
                <a href="/logout" class="dropdown-item notify-item">
                    <i class="mdi mdi-logout mr-1"></i>
                    <span>Logout</span>
                </a>

            </div>
        </li>
        <!-- 프로필 메뉴 끝 서혜란-->

    </ul>
    <button class="button-menu-mobile open-left disable-btn">
        <i class="mdi mdi-menu"></i>
    </button>
    <div class="app-search dropdown d-none d-lg-block">
    
		<!-- 통합검색 창 -->
        <form class="form-inline" action="/allSearchPost" method="get" onsubmit="fn_search()">
			<div class="input-group">
				<input type="search" class="form-control" name="keyword"
					 placeholder="검색어를 입력하세요" id="keyword" style="size: 50px;" />
				
				<input type="search" class="form-control" name="boardTitle"
					 placeholder="검색어를 입력하세요" id="boardTitle" style="size: 50px; display: none;" />
				<input type="text" value="${member.memIdx}" name="memIdx" style="display: none;" />
				<span class="mdi mdi-magnify search-icon"></span>
				<div class="input-group-append">
					<!-- Search 누르면 통합검색 페이지 나오도록 onclick 이벤트 -->
					<input type="submit" class="btn btn-primary" value="Search" />
				</div>
			</div>
		</form>
		<!-- 통합검색 창 -->

        
    </div>
</div>
<!-- end Topbar -->
<!-- 한주연 2021/12/14 시작 -->
<script type="text/javascript">
//통합 검색 버튼 누르면
function fn_search(search_form) {

// 		event.preventDefault();	// 적용하면 페이지가 안바뀌지만 url도 안바뀌면서 keyword가 새로고침 X, 하지만 통합 검색 버튼 눌림?이 찍힘
	console.log("통합 검색 버튼 눌림?");
	
	// 게시판 관련 value
	var memIdx = '${member.memIdx}';
	var boardIdx = search_form.boardIdx.value;
	var boardTitle = search_form.boardTitle.value;
	var boardCont = search_form.boardCont.value;
	
	// 일정 관련 value
	var schdIdx = search_form.schdIdx.value;
	var schdTitle = search_form.schdTitle.value;
	var schdStart = search_form.schdStart.value;
	var schdEnd = search_form.schdEnd.value;
	
	var keyword = search_form.keyword.value;
	
	console.log("memIdx : " + memIdx);
	console.log("boardIdx : " + boardIdx);
	console.log("boardTitle : " + boardTitle);
	console.log("boardCont : " + boardCont);
	
	console.log("schdIdx : " + schdIdx);
	console.log("schdTitle : " + schdTitle);
	console.log("schdStart : " + schdStart);
	console.log("schdEnd : " + schdEnd);
	
	console.log("keyword : " + keyword); 
	
	 var v_data="memIdx=" + memIdx + "&boardIdx=" + boardIdx + "&boardTitle="
				 + boardTitle + "&boardCont=" + boardCont + "&keyword=" + keyword + "&schdIdx=" + schdIdx
				 + "&schdTitle=" + schdTitle + "&schdStart=" + schdStart + "&schdEnd=" + schdEnd;
	 
	 $.ajax({
		type : "get",
		url : "/allSearchPost",
		dataType : "json",
		data : v_data,
		success : function (data) {
			console.log("통합 검색 data : ",data);
			
			location.href = "/allSearchPost";
		}
	 });

}

</script>

