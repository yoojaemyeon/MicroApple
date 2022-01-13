<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-12">
			<div class="page-title-box">
				<div class="page-title-right">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb bg-light-lighten p-2 mb-0">
							<li class="breadcrumb-item"><a
								href="<%=request.getContextPath()%>/mainPage"><i
									class="uil-home-alt"></i>Home</a></li>
							<li class="breadcrumb-item">
								<a href="javascript:location.href='/mcaBoard?boardDvsn=3';" style="float:right;">복지몰 건의사항</a>
							</li>
							<li class="breadcrumb-item active" aria-current="page">검색</li>
						</ol>
					</nav>
				</div>
				
				<div style="display: inline-block;">
					<h4 class="page-title">복지몰 건의사항</h4>
				</div>
			</div>
		</div>
	</div>
	
	<div class="col-xl-9 col-lg-9 order-lg-9 order-xl-9" style="position: relative; left: 150px;">
		<!-- 검색 창 -->
		<form class="form-inline" action="/mcaBoardSearch" method="post">
	         <div class="form-group mb-2">
	            <input type="text" value="${map.memIdx}" style="display: none;">
	            <input type="search" class="form-control" name="boardTitle" id="boardTitle" placeholder="Search...">
	            <input type="hidden" class="form-control" name="boardCont" id="boardCont" placeholder="Search...">
	            <input type="submit" class="btn btn-primary btn-flat" value="검색" />
	         </div>
		</form>
		<br />
		<br />
		<br />
		
<h1><strong>해당되는 게시물이 존재하지 않습니다.</strong></h1>
</div>
</body>
</html>