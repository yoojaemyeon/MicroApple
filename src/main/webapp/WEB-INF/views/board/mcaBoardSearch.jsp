<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>복지몰 건의사항 목록</title>
<script src="/resources/jquery-3.6.0.js"></script>
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
	         <div class="form-group mb-2" style="position: relative; left: 25px;">
	            <input type="text" value="${map.memIdx}" style="display: none;">
	            <input type="search" class="form-control" name="boardTitle" id="boardTitle" placeholder="Search...">
	            <input type="hidden" class="form-control" name="boardCont" id="boardCont" placeholder="Search...">
	            <input type="submit" class="btn btn-primary btn-flat" value="검색" />
	         </div>
		</form>
		
		<!-- 게시글 시작 -->
			<c:forEach var="row" items="${list}" >
				<div class="card-body pb-1">
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
									<div class="dropdown float-right text-muted">
										<a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown" aria-expanded="false">
											<i class="mdi mdi-dots-horizontal"></i>
										</a>
										<c:if test="${map.memIdx==row.memIdx}">	
											<div class="dropdown-menu dropdown-menu-right">
												<a href="javascript:location.href='/mcaBoardEdit?boardIdx=${row.boardIdx}';" class="dropdown-item">수정</a>
												<a href="javascript:location.href='/mcaBoardDelete?boardIdx=${row.boardIdx}';" 
													class="dropdown-item" onclick="return confirm('정말 삭제 하시겠습니까?');"  >삭제</a>
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
								<div style="height: 400px; width: auto; ">							
									<div class="font-16 text-dark my-3">${row.boardCont}</div>
								</div>
							</div>
						</div>
						<hr class="m-1" /><br />
						<!-- 게시물 바로밑 댓글 시작 -->
						<div data-simplebar style="max-height: 300px;">
							<div class="card" id="commList">
								<c:forEach var="row2" items="${commList}">
									<c:if test="${row.boardIdx==row2.boardIdx}">
										<div class="card-body pb-1">
											<div class="media">
												<c:choose>
													<c:when test="${row2.memPicture!=null}">								
														<img src="/resources/images/${row2.memPicture}"class="mr-2 rounded" alt="profile-image"
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
														<c:if test="${member.memIdx==row2.memIdx}">	
															<div class="dropdown-menu dropdown-menu-right">
																<a href="javascript:location.href='/freeCommDel?commIdx=${row2.commIdx}';" 
																	class="dropdown-item" onclick="return confirm('정말 삭제 하시겠습니까?');" ><i class="mdi mdi-delete mr-1"></i>삭제</a>
															</div>
														</c:if>									
													</div>
													<h5 class="m-0">${row2.memNm}</h5>
													<input type="text" class="form-control" value="${row2.commIdx}" name="commIdx" style="display: none;">
													<p class="text-muted mb-0">
														<small>${row2.commDate}</small>
													</p>
													<p class="my-1" id="commContUp">${row2.commCont}</p>
												</div>
											</div>
											<br /><hr />
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- 게시물 내용 끝 -->
					<br>
					<br>
					<br>
			</div>
			</c:forEach>
			<!-- 게시물 끝 -->
		</div>

</body>
</html>