<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/resources/js/jquery-3.6.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- Start Content-->
	<div class="container-fluid">
		<!-- start page title -->
		<div class="row">
			<div class="col-12">
				<div class="page-title-box">
					<div class="page-title-right">
						<ol class="breadcrumb bg-light-lighten p-2 mb-0">
							<li class="breadcrumb-item"><a
								href="<%=request.getContextPath()%>/mainPage">
									<i class="uil-home-alt"></i>Home</a></li>
							<li class="breadcrumb-item"><a
								href="<%=request.getContextPath()%>/mcaShop">복지몰</a></li>
							<li class="breadcrumb-item active" aria-current="page">포인트</li>
						</ol>
					</div>
					<h1 class="page-title">포인트</h1>
				</div>
			</div>
		</div>
		<!-- end page title -->
		<div class="row">
			<div class="col-12">
				<div class="card" style="border:1px solid; border-radius: 0.5em;">
					<div class="card-body">
						<div class="row"></div>
						<!-- end col -->
						<div class="col-lg-5">
							<div class="alert alert-primary" role="alert" size="100;">
								<h1>
									<strong>${map.MEM_NM }님의 포인트</strong>
								</h1>
							</div>
							<p>
								잔여 포인트 :
								<c:if test="${map.MEM_POINT != null}">
									<c:out value="${map.MEM_POINT}원">
										<input type="text"  value="${map.MEM_POINT }원" name="memPoint" readonly="readonly" style="border: 0 solid black">
									</c:out>
								</c:if>
								<c:if test="${map.MEM_POINT == null}">
									<c:out value="${map.MEM_POINT = 0}">
										<input type="text"  value="${map.MEM_POINT }원" name="memPoint" readonly="readonly" style="border: 0 solid black">
									</c:out>
								</c:if>
							</p>
							<input type="submit" id="pointUp" value="포인트 충전">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#pointUp").on("click",function(){
			var win = window.open("/pointBuy","PopupWin", "width=800,height=600");
		});
	</script>
</body>
</html>