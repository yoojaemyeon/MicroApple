<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/assets/css/vendor/summernote-bs4.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>공지게시판 게시글 수정</title>
</head>
<body>
	
	<div class="page-title-box">
		<div class="page-title-right">
			<ol class="breadcrumb m-0">
				<li class="breadcrumb-item"><a href="javascript:location.href='/mainPage';"><i class="uil-home-alt"></i>Home</a></li>
				<li class="breadcrumb-item"><a href="javascript:location.href='/announce';">공지게시판</a></li>
				<li class="breadcrumb-item active">공지 게시글 수정</li>
			</ol>
		</div>
		<h2 class="page-title">공지 게시판 수정</h2>
	</div>

	<div class="card-body">
		<div class="row mb-2">
			<div class="col-lg-8">
				<form class="form-inline">
					<div class="form-group mb-2"></div>
				</form>
			</div>
		</div>

		<!-- 게시글 작성 폼 -->
		<c:forEach var="row" items="${list}">	
			<form method="post" action="/announceEditPost">
				<div class="card">
					<div class="card-body pb-1">
						<div class="media">
							<c:choose>
								<c:when test="${row.memPicture!=null}">								
									<img src="/resources/images/${row.memPicture}"class="mr-2 rounded" alt="profile-image"
										style="width: 50px; height: 50px;" onerror="this.src ='/resources/images/pro.jpg'">
								</c:when>
								<c:otherwise>
									<img class="mr-2 rounded" src="/resources/images/pro.jpg" alt="Generic placeholder image" height="32">
								</c:otherwise>
							</c:choose>
							<div class="media-body">
								<input type="text" placeholder="${row.boardTitle}" name="boardTitle" />
								<input type="text" value="${row.boardDvsn}" name="boardDvsn" style="display: none;" />
								<input type="text" value="${row.boardIdx}" name="boardIdx" style="display: none;" />
								<p class="text-muted">
									<small>${row.memIdx}<span class="mx-1">⚬</span> <span>${row.boardWrdate}</span></small>
								</p>
							</div>
						</div>
		
						<hr class="m-0" />
						<!-- 게시글 수정 내용 -->
						<textarea id="summernote-basic" name="boardCont" >${row.boardCont}</textarea>
						<hr class="m-0" />
					</div>
				</div>
					<div class="text-lg-right">
						<input type="submit" class="btn btn-secondary" value="저장" >
					</div>
			</form>
		</c:forEach>	
	</div>






<script src="/resources/assets/js/vendor/summernote-bs4.min.js"></script>
<!-- Summernote demo -->
<script src="/resources/assets/js/pages/demo.summernote.js"></script>


</body>
</html>