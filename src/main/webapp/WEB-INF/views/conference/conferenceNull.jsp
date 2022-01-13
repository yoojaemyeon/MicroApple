<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type"text/css">
A:link {text-decoration:none; color:#646464;}
A:visited {text-decoration:none; color:#646464;}
A:active {text-decoration:none; color:#646464;}
A:hover {text-decoration:none; color:#646464;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesteet" href="/resources/bootstrap/css/bootstrap.css">
</head>
<body>
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">
			<!-- start page title -->
			<div class="row">
				<div class="col-12">
					<div class="page-title-box">
						<div class="page-title-right">
							 <ol class="breadcrumb bg-light-lighten p-2 mb-0">
                                <li class="breadcrumb-item"><a href="#"><i class="uil-home-alt"></i> Home</a></li>
							        <li class="breadcrumb-item"><a href="#">전자결재</a></li>
							        <li class="breadcrumb-item active" aria-current="page">회의록</li>
                             </ol>
						</div>
						<h4 class="page-title">회의록</h4>
					</div>
				</div>
			</div>
			<!-- end page title -->
			<div class="container">
				<form action="/searchConference" method="post">
					<div class="input-group" style="position: relative; left: 882px;">
						<input type="search" placeholder="검색어...">
						<input type="text" value="${member.memNm }" name="memNm" style="display: none;">
						<input type="text" value="${mtngTitle.MTNG_TITLE}" name="mtngTitle" style="display: none;">
						
						<div class="input-group-append-sm">
							<button type="submit">검색</button>
						</div>
					</div>
				</form>
				<br />
				<!-- 		<table class="table table-striped"> -->
				<h1>작성된 회의록이 없습니다.</h1>
				<button type="button" onclick="javascript:location.href='/ConferenceWrite';" class="btn btn-secondary" style="float: right;">글쓰기</button>
				
				<br />
			</div>
		</div>
	</div>
	<script type="/resources/jquery-3.6.0.js"></script>
	<script type="/resources/bootstrap/js/bootstrap.js"></script>
</body>
</html>