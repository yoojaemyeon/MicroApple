<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="left-side-menu">

	<!-- LOGO -->
	<a href="<%=request.getContextPath()%>/mainPage" class="logo text-center logo-light">
		<span class="logo-lg"> <img src="/resources/assets/images/logo.png" alt="" height="40">
		</span> <span class="logo-sm"> <img src="/resources/assets/images/logo_sm.png" alt="" height="16">
		</span>
	</a>

	<!-- LOGO -->
	<div class="simplebar-wrapper" data-simplebar="init">
		<a href="<%=request.getContextPath()%>/mainPage" class="logo text-center logo-dark">
			<span class="logo-lg"> <img src="/resources/assets/images/logo-dark.png" alt="" height="16"></span> 
			<span class="logo-sm"> <img src="/resources/assets/images/logo_sm_dark.png" alt="" height="16"></span>
		</a>
	</div>
	
	<div class="h-100" id="left-side-menu-container" data-simplebar="init">
		<div class="simplebar-wrapper" style="margin: 0px;">
			<div class="simplebar-height-auto-observer-wrapper">
				<div class="simplebar-height-auto-observer"></div>
			</div>
			<div class="simplebar-mask">
				<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
					<div class="simplebar-content-wrapper" style="height: 100%; overflow: hidden scroll;">
						<div class="simplebar-content" style="padding: 0px;">

							<!--- Sidemenu -->
							<ul class="metismenu side-nav">

								<li class="side-nav-title side-nav-item">Navigation</li>

								<li class="side-nav-item"><a href="<%=request.getContextPath()%>/mainPage" class="side-nav-link">
										<i class="uil-home-alt"></i> <span> 홈 </span>
									</a></li>

								<li class="side-nav-title side-nav-item">카테고리</li>

								<li class="side-nav-item"><a href="<%=request.getContextPath()%>/calendar" class="side-nav-link">
										<i class="uil uil-calendar-alt"></i> <span> 일정 </span>
									</a></li>

								<li class="side-nav-item"><a href="javascript: void(0);" class="side-nav-link">
										<i class="uil-monitor"></i> <span> 전자결재 </span> <span class="menu-arrow"></span>
									</a>
									<ul class="side-nav-second-level mm-collapse" aria-expanded="false">
										<li><a href="<%=request.getContextPath()%>/eDocument">전자결재</a></li>
										<li><a href="<%=request.getContextPath()%>/conference">회의록</a></li>
										<li><a href="<%=request.getContextPath()%>/attend">근태관리</a></li>
									</ul>
								</li>


<!-- 유제이 복지몰 -->
								<li class="side-nav-item"><a href="javascript: void(0);" class="side-nav-link">
										<i class="uil-shopping-trolley"></i><span> 복지몰 </span> <span class="menu-arrow"></span>
									</a>
									<ul class="side-nav-second-level mm-collapse" aria-expanded="false">
										<li><a href="<%=request.getContextPath()%>/mcaShop">복지몰 목록</a></li>
										<li><a href="<%=request.getContextPath()%>/orlist">상품 주문 목록</a></li>
										<li><a href="<%=request.getContextPath()%>/point">포인트</a></li>
										<li><a href="<%=request.getContextPath()%>/mcaBoard?boardDvsn=3">복지몰 건의사항</a></li>
									</ul>
								</li>
<!-- 유제이 복지몰 -->            

								<li class="side-nav-item"><a href="<%=request.getContextPath()%>/mail/listPage" class="side-nav-link">
										<i class="uil-envelope"></i> <span> 메세지 </span>
									</a>
								</li>

								<li class="side-nav-item"><a href="<%=request.getContextPath()%>/reservation" class="side-nav-link">
										<i class="uil-calender"></i> <span> 예약 </span>
									</a>
								</li>

								<li class="side-nav-item"><a href="javascript: void(0);" class="side-nav-link">
										<i class="uil-clipboard-notes"></i> <span> 게시판 </span> <span class="menu-arrow"></span>
									</a>
									<ul class="side-nav-second-level mm-collapse" aria-expanded="false">
										<li><a href="<%=request.getContextPath()%>/announce?boardDvsn=2">공지 게시판</a></li>
										<li><a href="<%=request.getContextPath()%>/free?boardDvsn=1">자유 게시판</a></li>
										
									</ul>
								</li>
								<c:if test="${sessionScope.MEMBERVO.deptIdx=='4'}">
								<li class="side-nav-item"><a href="javascript: void(0);" class="side-nav-link">
										<i class="uil-users-alt"></i> <span>직원관리</span> <span class="menu-arrow"></span>
									</a>
									<ul class="side-nav-second-level mm-collapse" aria-expanded="false">
										<li><a href="<%=request.getContextPath()%>/memberList">사원 목록</a></li>
										<li><a href="<%=request.getContextPath()%>/memberApprovalList">승인 결재</a></li>
									</ul>
								</li>
								</c:if>
								</ul>
								
			
								
							<!-- Setting Box-->
								<div class="text-center gb_Qd gb_Sa gb_Ed" style="position: fixed; bottom: 0; text-align: center;">
									<div>
										<!-- Default dropright button -->
										<div class="btn-group dropup" >
										  <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
<!-- 										    <a class=" right-bar-toggle" href="javascript: void(0);"> -->
												<i class="dripicons-gear noti-icon" style="font-size: 22px;"></i>
<!-- 											</a> -->
										  </button>
										  <div class="dropdown-menu" >
										    <!-- Dropdown menu links -->
											<h4 class="m-0" style="text-align: center;">Settings</h4>
												<div class="p-3">

													<!-- Settings -->
													<h5 class="mt-3">Color Scheme</h5>
													<hr class="mt-1" />

													<div class="custom-control custom-switch mb-1">
														<input type="radio" class="custom-control-input" name="color-scheme-mode" value="light" id="light-mode-check" checked />
														<label class="custom-control-label" for="light-mode-check">Light Mode</label>
													</div>

													<div class="custom-control custom-switch mb-1">
														<input type="radio" class="custom-control-input" name="color-scheme-mode" value="dark" id="dark-mode-check" />
														<label class="custom-control-label" for="dark-mode-check">Dark Mode</label>
													</div>

													<!-- Width -->
													<h5 class="mt-4">Width</h5>
													<hr class="mt-1" />
													<div class="custom-control custom-switch mb-1">
														<input type="radio" class="custom-control-input" name="width" value="fluid" id="fluid-check" checked />
														<label class="custom-control-label" for="fluid-check">Fluid</label>
													</div>
													<div class="custom-control custom-switch mb-1">
														<input type="radio" class="custom-control-input" name="width" value="boxed" id="boxed-check" />
														<label class="custom-control-label" for="boxed-check">Boxed</label>
													</div>

													<!-- Left Sidebar-->
													<h5 class="mt-4">Left Sidebar</h5>
													<hr class="mt-1" />
													<div class="custom-control custom-switch mb-1">
														<input type="radio" class="custom-control-input" name="theme" value="default" id="default-check" checked />
														<label class="custom-control-label" for="default-check">Default</label>
													</div>

													<div class="custom-control custom-switch mb-1">
														<input type="radio" class="custom-control-input" name="theme" value="light" id="light-check" />
														<label class="custom-control-label" for="light-check">Light</label>
													</div>

													<div class="custom-control custom-switch mb-3">
														<input type="radio" class="custom-control-input" name="theme" value="dark" id="dark-check" />
														<label class="custom-control-label" for="dark-check">Dark</label>
													</div>

													<div class="custom-control custom-switch mb-1">
														<input type="radio" class="custom-control-input" name="compact" value="fixed" id="fixed-check" checked />
														<label class="custom-control-label" for="fixed-check">Fixed</label>
													</div>

													<div class="custom-control custom-switch mb-1">
														<input type="radio" class="custom-control-input" name="compact" value="condensed" id="condensed-check" />
														<label class="custom-control-label" for="condensed-check">Condensed</label>
													</div>

													<div class="custom-control custom-switch mb-1">
														<input type="radio" class="custom-control-input" name="compact" value="scrollable" id="scrollable-check" />
														<label class="custom-control-label" for="scrollable-check">Scrollable</label>
													</div>

													<button class="btn btn-primary btn-block mt-4" id="resetBtn">Reset to Default</button>
												</div>
												<!-- end padding-->
										  </div>
										</div>
									
									
<!-- 										<a class="dripicons-arrow-right">fixed</a> -->

									</div>
<!-- 										<div id="sidebar-toggle" class="custom-control custom-switch mb-1" > -->
<!-- 											<input type="radio" class="custom-control-input" name="compact" value="fixed" id="fixed-check" checked /> -->
<!-- 											<label class="mdi mdi-arrow-right-bold"  id="a" style="font-size: 40px;" for="fixed-check"/> -->
<!-- 											<input type="radio" class="custom-control-input" name="compact" value="condensed" id="condensed-check" /> -->
<!-- 											<label class="mdi mdi-arrow-left-bold"  id="b" style="font-size: 40px; width:350px;" for="condensed-check"/> -->
<!-- 										</div> -->
								</div>
						<!-- end Setting Box -->
							<div class="clearfix"></div>

							
							<!-- End Sidebar -->
							
						</div>

					</div>
				</div>
			</div>
			<div class="simplebar-placeholder" style="width: 260px; height: 1475px;"></div>
		</div>
		<div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
			<div class="simplebar-scrollbar" style="width: 0px; display: none; transform: translate3d(0px, 0px, 0px);"></div>
		</div>
		<div class="simplebar-track simplebar-vertical" style="visibility: visible;">
			<div class="simplebar-scrollbar" style="height: 547px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
		</div>
	</div>
	<!-- Sidebar -left -->

</div>


