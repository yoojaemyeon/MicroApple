<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>통합 검색</title>
</head>
<body>
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

			<!-- 페이지의 타이틀 시작 -->
			<div class="row">
				<div class="col-12">
					<div class="page-title-box">
						<div class="page-title-right">
							<ol class="breadcrumb m-0">
								<li class="breadcrumb-item"><a href="javascript:location.href='/mainPage';"><i class="uil-home-alt"></i>Home</a></li>
								<li class="breadcrumb-item active">통합검색</li>
							</ol>
						</div>
						<h4 class="page-title">통합검색</h4>
					</div>
					<h3 class="page-title">' ${keyword} ' (으)로 검색한 결과..</h3>
				</div>
			</div>
			<br /> <br />
			<!-- 페이지의 타이틀 끝 -->
			<div class="row">
				<div class="col-12">
					<div class="board">
						<!-- 자유게시판 키워드 조회 -->
						<div class="tasks" data-plugin="dragula" data-containers="[&quot;task-list-one&quot;, &quot;task-list-two&quot;, &quot;task-list-three&quot;, &quot;task-list-four&quot;]">
							<h5 class="mt-0 task-header" align="center">자유게시판</h5>
							<div data-simplebar style="max-height: 450px;">
								<div id="task-list-one" class="task-list-items">
									<c:forEach var="row" items="${freeList}">
										<c:if test="${not empty keyword || keyword ne ''}">
											<div class="card mb-0">
												<div class="card-body p-3">
													<h5 class="mt-2 mb-2">
														<a href="/boardDetail?boardIdx=${row.boardIdx}">${row.boardTitle}</a>
<!-- 														<a href="/free?boardDvsn=1?boardIdx=${row.boardIdx}"  -->
<%-- 															data-toggle="modal" data-target="#task-detail-modal" class="text-body">${row.boardTitle}</a> --%>
													</h5>
													<small class="float-right text-muted">${row.boardWrdate}</small>
			
													<p class="mb-0">
														<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i>${row.memNm}
														</span>
													</p>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
						<!-- 공지게시판 키워드 조회 -->
						<div class="tasks" data-plugin="dragula" data-containers="[&quot;task-list-one&quot;, &quot;task-list-two&quot;, &quot;task-list-three&quot;, &quot;task-list-four&quot;]">
							<h5 class="mt-0 task-header" align="center">공지게시판</h5>
							<div data-simplebar style="max-height: 450px;">
								<div id="task-list-one" class="task-list-items">
									<c:forEach var="row2" items="${announceList}">
										<c:if test="${not empty keyword || keyword ne ''}">
											<div class="card mb-0">
												<div class="card-body p-3">
													<h5 class="mt-2 mb-2">
														<a href="/announceDetail?boardIdx=${row2.boardIdx}">${row2.boardTitle}</a>
													</h5>
													<small class="float-right text-muted">${row2.boardWrdate}</small>
			
													<p class="mb-0">
														<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i>${row2.memNm}
														</span>
													</p>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
						<!-- 복지몰 건의사항 키워드 조회 -->
						<div class="tasks" data-plugin="dragula" data-containers="[&quot;task-list-one&quot;, &quot;task-list-two&quot;, &quot;task-list-three&quot;, &quot;task-list-four&quot;]">
							<h5 class="mt-0 task-header" align="center">복지몰 건의사항</h5>
							<div data-simplebar style="max-height: 450px;">
								<div id="task-list-one" class="task-list-items">
									<c:forEach var="row3" items="${mcaBoardList}">
										<c:if test="${not empty keyword || keyword ne ''}">
											<div class="card mb-0">
												<div class="card-body p-3">
			
													<h5 class="mt-2 mb-2">
														<a href="/mcaBoardDetail?boardIdx=${row3.boardIdx}">${row3.boardTitle}</a>
													</h5>
													<small class="float-right text-muted">${row3.boardWrdate}</small>
			
													<p class="mb-0">
														<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i>${row3.memNm}
														</span>
													</p>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>

						<!-- 일정 목록 조회 -->
						<div class="tasks" data-plugin="dragula" data-containers="[&quot;task-list-one&quot;, &quot;task-list-two&quot;, &quot;task-list-three&quot;, &quot;task-list-four&quot;]">
							<h5 class="mt-0 task-header" align="center">일정</h5>
							<div data-simplebar style="max-height: 450px;">
								<div id="task-list-one" class="task-list-items">
									<c:forEach var="row4" items="${schdList}">
										<c:if test="${not empty keyword || keyword ne ''}">
											<c:if test="${row4.memIdx==member.memIdx}">
												<div class="card mb-0">
													<div class="card-body p-3">
				
														<h5 class="mt-2 mb-2">
															<a href="javascript:;" onclick="window.open('/calendarDetail?schdIdx=${row4.schdIdx}', 'test', 'loaction=no, width=600px, height=630px, toolbar=no, menubar=no, status=no, scrollbars=no');">${row4.schdTitle}</a>
														</h5>
														<small class="float-right text-muted">시작일 ${row4.schdStart}</small><br />
														<small class="float-right text-muted">종료일 ${row4.schdEnd}</small>
				
														<p class="mb-0">
															<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i>${row4.memNm}
															</span>
														</p>
													</div>
												</div>
											</c:if>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
						
						<!-- 일정 목록 조회 -->
					</div>
				</div>
			</div>
			<!-- 통합검색 밑 내용 끝 -->
		</div>
	</div>

</body>
</html>
