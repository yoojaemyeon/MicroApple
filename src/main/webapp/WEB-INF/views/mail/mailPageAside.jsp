<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="page-aside-left">


	<div class="email-menu-list mt-3">
	<h5>ExternalContact</h5>
		<a href="/mailSend"><i class="dripicons-exit mr-2"></i>외부 메일 쓰기</a> 
		<hr>
		<h5>MicroApple</h5>
		<a href="/messageSend"><i class="dripicons-inbox mr-2"></i>메세지 보내기</a> 
		<a href="<%=request.getContextPath()%>/mail/listPage"><i class="dripicons-inbox mr-2"></i>받은 메세지</a> 
		<a href="<%=request.getContextPath()%>/mail/sentMailBox"><i class="dripicons-tag mr-2"></i>보낸메세지</a>
		<a href="<%=request.getContextPath()%>/mail/mailToMe"><i class="dripicons-clock mr-2"></i>내게 쓴 메세지</a> 
		<a href="<%=request.getContextPath()%>/mail/importMailBox"><i class="dripicons-document mr-2"></i>중요 메세지</a> 
		<a href="<%=request.getContextPath()%>/mail/trashBox"><i class="dripicons-trash mr-2"></i>휴지통</a>
	</div>


<!-- 	<div class="mt-5"> -->
<!-- 		<h4> -->
<!-- 			<span class="badge badge-pill p-1 px-2 badge-secondary-lighten">FREE</span> -->
<!-- 		</h4> -->
<!-- 		<h6 class="text-uppercase mt-3">Storage</h6> -->
<!-- 		<div class="progress my-2 progress-sm"> -->
<!-- 			<div class="progress-bar progress-lg bg-success" role="progressbar" -->
<!-- 				style="width: 46%" aria-valuenow="46" aria-valuemin="0" -->
<!-- 				aria-valuemax="100"></div> -->
<!-- 		</div> -->
<!-- 		<p class="text-muted font-13 mb-0">7.02 GB (46%) of 15 GB used</p> -->
<!-- 	</div> -->

</div>



