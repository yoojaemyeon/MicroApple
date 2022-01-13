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
								<li class="breadcrumb-item"><a href="javascript:location.href='/mainPage';">Home</a></li>
								<li class="breadcrumb-item active">통합검색</li>
							</ol>
						</div>
						<h4 class="page-title">통합검색</h4>
					</div>
					<h3 class="page-title">' 키워드 ' (으)로 검색한 결과..</h3>
				</div>
			</div>
			<br /> <br />
			<!-- 페이지의 타이틀 끝 -->
			<div class="row">
				<div class="col-12">
					<div class="board">
						<div class="tasks" data-plugin="dragula" data-containers="[&quot;task-list-one&quot;, &quot;task-list-two&quot;, &quot;task-list-three&quot;, &quot;task-list-four&quot;]">
							<h5 class="mt-0 task-header">자유게시판</h5>

							<div id="task-list-one" class="task-list-items">

								<!-- Task Item -->
								<!-- 자유 첫번째 게시글 -->
								<div class="card mb-0">
									<div class="card-body p-3">

										<h5 class="mt-2 mb-2">
											<a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">제목 </a>
										</h5>
										<small class="float-right text-muted">2021/12/07</small>

										<p class="mb-0">
											<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i> 작성자
											</span>
										</p>

									</div>
									<!-- end card-body -->
								</div>
								<!-- 자유 두번째 게시글 끝-->

								<!-- 자유 두번째 게시글 -->
								<div class="card mb-0">
									<div class="card-body p-3">

										<h5 class="mt-2 mb-2">
											<a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">오늘 점심 뭐먹지 </a>
										</h5>
										<small class="float-right text-muted">2021/12/07</small>

										<p class="mb-0">
											<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i> 작성자
											</span>
										</p>

									</div>
									<!-- end card-body -->
								</div>
								<!-- 자유 두번째 게시글 끝-->

								<!-- 자유 세번째 게시글 -->
								<div class="card mb-0">
									<div class="card-body p-3">

										<h5 class="mt-2 mb-2">
											<a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">토마토마토 </a>
										</h5>
										<small class="float-right text-muted">2021/12/07</small>

										<p class="mb-0">
											<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i> 작성자
											</span>
										</p>

									</div>
									<!-- end card-body -->
								</div>
								<!-- 자유 세번째 게시글 끝-->
								<!-- Task Item End -->

								<!-- Task Item -->
								<div class="card mb-0">
									<div class="card-body p-3">
										<small class="float-right text-muted">18 Jul 2018</small> <span class="badge badge-secondary">Medium</span>

										<h5 class="mt-2 mb-2">
											<a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">Topnav layout design</a>
										</h5>

										<p class="mb-0">
											<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i> Hyper
											</span> <span class="text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-comment-multiple-outline text-muted"></i> <b>28</b> Comments
											</span>
										</p>

										<div class="dropdown float-right">
											<a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
												<i class="mdi mdi-dots-vertical font-18"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right">
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-pencil mr-1"></i>Edit
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-delete mr-1"></i>Delete
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-plus-circle-outline mr-1"></i>Add People
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-exit-to-app mr-1"></i>Leave
												</a>
											</div>
										</div>

										<p class="mb-0">
											<img src="assets/images/users/avatar-1.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1"> <span class="align-middle">Coder Themes</span>
										</p>
									</div>
									<!-- end card-body -->
								</div>
								<!-- Task Item End -->

								<!-- Task Item -->
								<div class="card mb-0">
									<div class="card-body p-3">
										<small class="float-right text-muted">11 Jul 2018</small> <span class="badge badge-success">Low</span>

										<h5 class="mt-2 mb-2">
											<a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">Invite user to a project</a>
										</h5>

										<p class="mb-0">
											<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i> CRM
											</span> <span class="text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-comment-multiple-outline text-muted"></i> <b>68</b> Comments
											</span>
										</p>

										<div class="dropdown float-right">
											<a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
												<i class="mdi mdi-dots-vertical font-18"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right">
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-pencil mr-1"></i>Edit
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-delete mr-1"></i>Delete
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-plus-circle-outline mr-1"></i>Add People
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-exit-to-app mr-1"></i>Leave
												</a>
											</div>
										</div>

										<p class="mb-0">
											<img src="assets/images/users/avatar-3.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1"> <span class="align-middle">Lucas Hardy</span>
										</p>
									</div>
								</div>
							</div>
						</div>

						<div class="tasks">
							<h5 class="mt-0 task-header text-uppercase">공지게시판</h5>

							<div id="task-list-two" class="task-list-items">

								<!-- Task Item -->
								<div class="card mb-0">
									<div class="card-body p-3">
										<small class="float-right text-muted">22 Jun 2018</small> <span class="badge badge-secondary">Medium</span>

										<h5 class="mt-2 mb-2">
											<a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">Write a release note</a>
										</h5>

										<p class="mb-0">
											<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i> Hyper
											</span> <span class="text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-comment-multiple-outline text-muted"></i> <b>17</b> Comments
											</span>
										</p>

										<div class="dropdown float-right">
											<a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
												<i class="mdi mdi-dots-vertical font-18"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right">
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-pencil mr-1"></i>Edit
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-delete mr-1"></i>Delete
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-plus-circle-outline mr-1"></i>Add People
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-exit-to-app mr-1"></i>Leave
												</a>
											</div>
										</div>

										<p class="mb-0">
											<img src="assets/images/users/avatar-5.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1"> <span class="align-middle">Sean White</span>
										</p>
									</div>
									<!-- end card-body -->
								</div>
								<!-- Task Item End -->

								<!-- Task Item -->
								<div class="card mb-0">
									<div class="card-body p-3">
										<small class="float-right text-muted">19 Jun 2018</small> <span class="badge badge-success">Low</span>

										<h5 class="mt-2 mb-2">
											<a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">Enable analytics tracking</a>
										</h5>

										<p class="mb-0">
											<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i> CRM
											</span> <span class="text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-comment-multiple-outline text-muted"></i> <b>48</b> Comments
											</span>
										</p>

										<div class="dropdown float-right">
											<a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
												<i class="mdi mdi-dots-vertical font-18"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right">
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-pencil mr-1"></i>Edit
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-delete mr-1"></i>Delete
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-plus-circle-outline mr-1"></i>Add People
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-exit-to-app mr-1"></i>Leave
												</a>
											</div>
										</div>

										<p class="mb-0">
											<img src="assets/images/users/avatar-6.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1"> <span class="align-middle">Louis Allen</span>
										</p>
									</div>
									<!-- end card-body -->
								</div>
								<!-- Task Item End -->

							</div>
							<!-- end company-list-2-->
						</div>


						<div class="tasks">
							<h5 class="mt-0 task-header text-uppercase">일정</h5>
							<div id="task-list-three" class="task-list-items">

								<!-- Task Item -->
								<div class="card mb-0">
									<div class="card-body p-3">
										<small class="float-right text-muted">2 May 2018</small> <span class="badge badge-danger">High</span>

										<h5 class="mt-2 mb-2">
											<a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">Kanban board design</a>
										</h5>

										<p class="mb-0">
											<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i> CRM
											</span> <span class="text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-comment-multiple-outline text-muted"></i> <b>65</b> Comments
											</span>
										</p>

										<div class="dropdown float-right">
											<a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
												<i class="mdi mdi-dots-vertical font-18"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right">
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-pencil mr-1"></i>Edit
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-delete mr-1"></i>Delete
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-plus-circle-outline mr-1"></i>Add People
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-exit-to-app mr-1"></i>Leave
												</a>
											</div>
										</div>

										<p class="mb-0">
											<img src="assets/images/users/avatar-1.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1"> <span class="align-middle">Coder Themes</span>
										</p>
									</div>
									<!-- end card-body -->
								</div>
								<!-- Task Item End -->

								<!-- Task Item -->
								<div class="card mb-0">
									<div class="card-body p-3">
										<small class="float-right text-muted">7 May 2018</small> <span class="badge badge-secondary">Medium</span>

										<h5 class="mt-2 mb-2">
											<a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">Code HTML email template</a>
										</h5>

										<p class="mb-0">
											<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i> CRM
											</span> <span class="text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-comment-multiple-outline text-muted"></i> <b>106</b> Comments
											</span>
										</p>

										<div class="dropdown float-right">
											<a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
												<i class="mdi mdi-dots-vertical font-18"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right">
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-pencil mr-1"></i>Edit
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-delete mr-1"></i>Delete
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-plus-circle-outline mr-1"></i>Add People
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-exit-to-app mr-1"></i>Leave
												</a>
											</div>
										</div>

										<p class="mb-0">
											<img src="assets/images/users/avatar-9.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1"> <span class="align-middle">Zak Turnbull</span>
										</p>
									</div>
									<!-- end card-body -->
								</div>
								<!-- Task Item End -->

								<!-- Task Item -->
								<div class="card mb-0">
									<div class="card-body p-3">
										<small class="float-right text-muted">8 Jul 2018</small> <span class="badge badge-secondary">Medium</span>

										<h5 class="mt-2 mb-2">
											<a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">Brand logo design</a>
										</h5>

										<p class="mb-0">
											<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i> Design
											</span> <span class="text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-comment-multiple-outline text-muted"></i> <b>95</b> Comments
											</span>
										</p>

										<div class="dropdown float-right">
											<a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
												<i class="mdi mdi-dots-vertical font-18"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right">
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-pencil mr-1"></i>Edit
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-delete mr-1"></i>Delete
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-plus-circle-outline mr-1"></i>Add People
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-exit-to-app mr-1"></i>Leave
												</a>
											</div>
										</div>

										<p class="mb-0">
											<img src="assets/images/users/avatar-8.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1"> <span class="align-middle">Lily Parkin</span>
										</p>
									</div>
									<!-- end card-body -->
								</div>
								<!-- Task Item End -->

								<!-- Task Item -->
								<div class="card mb-0">
									<div class="card-body p-3">
										<small class="float-right text-muted">22 Jul 2018</small> <span class="badge badge-danger">High</span>

										<h5 class="mt-2 mb-2">
											<a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">Improve animation loader</a>
										</h5>

										<p class="mb-0">
											<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i> CRM
											</span> <span class="text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-comment-multiple-outline text-muted"></i> <b>39</b> Comments
											</span>
										</p>

										<div class="dropdown float-right">
											<a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
												<i class="mdi mdi-dots-vertical font-18"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right">
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-pencil mr-1"></i>Edit
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-delete mr-1"></i>Delete
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-plus-circle-outline mr-1"></i>Add People
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-exit-to-app mr-1"></i>Leave
												</a>
											</div>
										</div>

										<p class="mb-0">
											<img src="assets/images/users/avatar-4.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1"> <span class="align-middle">Riley Steele</span>
										</p>
									</div>
									<!-- end card-body -->
								</div>
								<!-- Task Item End -->

							</div>
							<!-- end company-list-3-->
						</div>

						<div class="tasks">
							<h5 class="mt-0 task-header text-uppercase">Done (1)</h5>
							<div id="task-list-four" class="task-list-items">

								<!-- Task Item -->
								<div class="card mb-0">
									<div class="card-body p-3">
										<small class="float-right text-muted">16 Jul 2018</small> <span class="badge badge-success">Low</span>

										<h5 class="mt-2 mb-2">
											<a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">Dashboard design</a>
										</h5>

										<p class="mb-0">
											<span class="pr-2 text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-briefcase-outline text-muted"></i> Hyper
											</span> <span class="text-nowrap mb-2 d-inline-block"> <i class="mdi mdi-comment-multiple-outline text-muted"></i> <b>287</b> Comments
											</span>
										</p>

										<div class="dropdown float-right">
											<a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
												<i class="mdi mdi-dots-vertical font-18"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right">
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-pencil mr-1"></i>Edit
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-delete mr-1"></i>Delete
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-plus-circle-outline mr-1"></i>Add People
												</a>
												<!-- item-->
												<a href="javascript:void(0);" class="dropdown-item">
													<i class="mdi mdi-exit-to-app mr-1"></i>Leave
												</a>
											</div>
										</div>

										<p class="mb-0">
											<img src="assets/images/users/avatar-10.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1"> <span class="align-middle">Harvey Dickinson</span>
										</p>
									</div>
									<!-- end card-body -->
								</div>
								<!-- Task Item End -->

							</div>
							<!-- end company-list-4-->
						</div>

					</div>
					<!-- end .board-->
				</div>
				<!-- end col -->
			</div>
			<!-- 통합검색 밑 내용 끝 -->
		</div>
	</div>

</body>
</html>
