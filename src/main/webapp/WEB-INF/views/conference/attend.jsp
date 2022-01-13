<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.UnknownHostException"%>
<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>

<script src="/resources/js/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<input type="text" id="atmnStart" value="<%=sf.format(nowTime)%>"
		style="display: none;">
	<input type="text" id="currentIp"
		value="<%=InetAddress.getLocalHost().getHostAddress()%>"
		style="display: none;">

	<div class="container-fluid">
		<!-- start page email-title -->
		<div class="row">
			<div class="col-12">
				<div class="page-title-box">
					<div class="page-title-right">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb bg-light-lighten p-2 mb-0">
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/mainPage">
						<i class="uil-home-alt"></i>Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">근태관리</li>
			</ol>
		</nav>
	</div>
	<div style="display: inline-block;">
		<h4 class="page-title">근태관리</h4>
	</div>
			</div>
		</div>
		</div>
		<!-- end page email-title -->


		<div class="row">
			<!-- Right Sidebar -->
			<div class="col-12">

				<div class="card" style="border:1px solid; border-radius: 0.5em;">
					<div class="card-body" >

						<!-- Left sidebar -->
						<div class="page-aside-left">

							<div class="card-body">
								<img src="/resources/images/profile/${member.memPicture }"
									class="Square avatar-lg img-thumbnail" alt="profile-image"
									style="width: 150px; height: 180px;" onerror="this.src ='/resources/images/pro.jpg'">

								<h4 class="mb-0 mt-2">${member.memNm}</h4>
								<p class="text-muted font-14">웹 개발자</p>

								<button type="button" id="hi" name="hi" class="btn btn-info"
									style="width: 70px;">출근</button>
								<button type="button" id="bye" name="bye"
									class="btn btn-success" style="width: 70px;">퇴근</button>

							</div>
							<!-- end card-body -->


						</div>
						<!-- End Left sidebar -->


						<div class="page-aside-right">
							<div class="mt-3">
								<button class="button-menu-mobile open-left disable-btn">
									<i class="mdi mdi-menu"></i>
								</button>
								<div class="container">
									<table class="table table">
										<thead style="text-align: center;">
											<tr class="alert alert-info alert-dismissible fade show">
												<th style="width: 70px;">출근 기록</th>
											</tr>
										</thead>
										<tbody style="text-align: center;">
											<tr>
												<td><input type="button" class="btn btn-light"
													id="workCheck" value="나의  출근 기록"></td>
											</tr>
											<c:if test="${member.deptIdx == 4}">
<!-- 											<tr class="alert alert-info alert-dismissible fade show"> -->
												<td><input type="button" class="btn btn-light"
													id="AllworkCheck" value="사원 출근 기록"></td>
<!-- 											</tr> -->
											</c:if>
										</tbody>
									</table>
									<hr />
									<br />
								</div>

							</div>
							<!-- end .mt-4 -->
							<!-- end row-->
						</div>
						<!-- end inbox-rightbar-->
					</div>
					<!-- end card-body -->
					<div class="clearfix"></div>
				</div>
				<!-- end card-box -->

			</div>
			<!-- end Col -->
		</div>
		<!-- End row -->
	</div>
	<!-- container -->

	<script type="text/javascript">
		var memIdx = ${member.memIdx}
		$("#workCheck").on("click",function(){
			var win = window.open("/workCheck?memIdx="+memIdx,"PopupWin", "width=1000,height=600");
		});
		$("#AllworkCheck").on("click",function(){
			var win = window.open("/AllworkCheck?memIdx="+memIdx,"PopupWin2", "width=1000,height=600");
		});
	</script>
	<script type="text/javascript">
	
	var memIdx = ${member.memIdx}
	var atmnStart = $("#atmnStart").val();
	var currentIp = $("#currentIp").val(); //해당 IP
	
		$("#hi").on("click",() => {
			
			console.log('하이') 
			
			//데이터 : 현재시간, 해당 IP 
			$.ajax({
				type : 'post',
				dataType : 'json',
				url : '/workCheckHi',
				data :{
					memIdx : memIdx,
					currentIp : currentIp,	
				},
				success: function(data){
					console.log(data);
					if(data.check){
						alert(data.reason);
					}else{
						alert(data.reason);
					}
				}
			}) //end ajax
		}); //end hi
		
		
		$("#bye").on("click",() => {
		//데이터 : 현재시간, 해당 IP 
		$.ajax({
			type : 'post',
			dataType : 'json',
			url : '/workCheckBye',
			data :{
				memIdx : memIdx,
				currentIp : currentIp,	
			},
			success: function(data){
				console.log(data);
				
				if(data.check){
					alert("정말 고생 많았어요! 퇴근 완료!");
					console.log(data.reason);
				}else{
					alert("회사 IP가 아닙니다. 당신은 누규~~!");
				}
			}
		}) //end ajax
	}); //end hi
	
	
</script>


</body>
</html>