<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지게시판 목록</title>
<script type="text/javascript">
function fn_download(fname) {
	// iframe 요소
	var vIfrm = document.getElementById("ifrm");
	vIfrm.src = "/Bdownload?boardFile=" + encodeURIComponent(fname);
}
</script>
<script src="/resources/jquery-3.6.0.js"></script>
</head>
<body>
<iframe id="ifrm" name="ifrm" style="display: none;"></iframe>
<!-- 알림을 받기 위해 써야함 -->
<div id="socketAlert" class="alert alert-success" role="alert" style="display:none;"></div>
<!-- 알림을 받기 위해 써야함 -->
	<div class="row">
		<div class="col-12">
			<div class="page-title-box">
				<div class="page-title-right">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb bg-light-lighten p-2 mb-0">
							<li class="breadcrumb-item"><a
								href="<%=request.getContextPath()%>/mainPage"><i
									class="uil-home-alt"></i>Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">공지게시판</li>
						</ol>
					</nav>
				</div>
				
				<div style="display: inline-block;">
					<h4 class="page-title">공지게시판</h4>
				</div>
			</div>
		</div>
	</div>
		
	<div class="col-xl-9 col-lg-9 order-lg-9 order-xl-9" style="position: relative; left: 150px;">
		<!-- 공지게시판 작성 버튼 -->
		<div style="position: relative; right: 25px;">
			<c:if test="${deptIdx=='4'}">
				<button type="button" id="announceWriteBtn" class="btn btn-secondary" style="float: right;" onclick="javascript:location.href='/announceWrite';">작성</button>
			</c:if>
		</div>

		<!-- 검색 창 -->
		<form class="form-inline" action="/announceSearch?boardDvsn=2" method="post">
	         <div class="form-group mb-2"  style="position: relative; left: 25px;">
	            <input type="search" 	class="form-control" name="boardTitle" id="boardTitle" placeholder="Search...">
	            <input type="text" style="display: none;" value="${member.memIdx}" name="memIdx">
	            <input type="submit" class="btn btn-primary btn-flat" value="검색" />
	         </div>
		</form>
		
		<!-- 게시글 시작 -->
			<div class="card-body pb-1">
				<c:forEach var="row" items="${announceList}">
					<div class="card" style="border:1px solid; border-radius: 0.5em;">
						<div class="card-body pb-1">
							<div class="media">
								<c:choose>
									<c:when test="${row.memPicture!=null}">								
										<img src="/resources/images/profile/${row.memPicture}"class="mr-2 rounded" alt="profile-image"
											style="width: 50px; height: 50px;" onerror="this.src ='/resources/images/pro.jpg'">
									</c:when>
									<c:otherwise>
										<img class="mr-2 rounded" src="/resources/images/pro.jpg" alt="Generic placeholder image" height="32">
									</c:otherwise>
								</c:choose>
								<div class="media-body">
									<div class="dropdown float-right text-muted">
										<a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown" aria-expanded="false">
											<i class="mdi mdi-dots-horizontal"></i>
										</a>
										<c:if test="${member.memIdx==row.memIdx}">
											<div class="dropdown-menu dropdown-menu-right">
												<a href="javascript:location.href='/announceEdit?boardIdx=${row.boardIdx}';" class="dropdown-item"><i class="mdi mdi-pencil mr-1"></i>수정</a>
												<a id="announceDel" href="javascript:location.href='/announceDelete?boardIdx=${row.boardIdx}';" 
													class="dropdown-item" onclick="return confirm('정말 삭제 하시겠습니까?');" ><i class="mdi mdi-delete mr-1"></i>삭제</a>
											</div>
										</c:if>
									</div>
									<h5 class="m-0">${row.boardTitle}</h5>
									<p class="text-muted">
										<small>${row.memNm} <span class="mx-1">⚬</span> <span>${row.boardWrdate}</span></small>
									</p>
								</div>
							</div>
							<hr class="m-0" />
							<div data-simplebar style="max-height: 400px;">
								<div class="font-16 text-dark my-3">${row.boardCont}</div>
							</div>
						</div>
							<hr class="m-2" />
							<!-- 파일 다운로드 -->
							<c:if test="${row.boardFile!=null}">
								<div class="card-body">
				            		<div class="row">
				            			<div class="form-group col-sm-12">
											<div class="col-xl-5" style="float:right; position: relative; right: 20px;">
												<div class="card mb-0 shadow-none border">
													<div class="p-2">
														<div class="row align-items-center">
															<div style="width:80px;" class="col-auto" >
																<div class="avatar-sm">
																	<span class="avatar-title bg-secondary rounded" style="width:60px;"> 첨부파일</span>
																</div>
															</div>
															<div class="col pl-0">
																<a id="f_nm"
																	href="javascript:fn_download('${row.boardFile}')"
																	class="text-muted font-weight-bold jscript">
																	${row.boardFile.split("_")[1]} </a>
															</div>
															<div class="col-auto">
																<!-- Button -->
																<a href="javascript:fn_download('${row.boardFile}')"
																	class="btn btn-link btn-lg text-muted"> <i
																	class="dripicons-download"></i>
																</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
							<!-- 파일 다운로드 끝 -->
						</div>
					<br>
					<br>
					<br>
				</c:forEach>
			</div>
		</div>
		<!-- 게시물 끝 -->



</body>
</html>