<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8" />
    	<link href="/resources/css/weather/weather-icons.min.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
<style type="text/css">

 .weatherLoaction > option {
 	background-color: gray;
 }
 
 .weatherForecast > tbody > tr > td {
 	width: 105px;
 }

</style>
    </head>
<script src="/resources/assets/js/jquery-3.6.0.js" ></script>
<script src="/resources/js/weather.js" ></script>
<script src="https://kit.fontawesome.com/9b429fd177.js" crossorigin="anonymous"></script>

    <body class="loading" data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}'>
        <!-- Begin page -->
        <div class="wrapper">
                    <div class="container-fluid">
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <form class="form-inline">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-light" id="dash-daterange">
                                                    <div class="input-group-append">
                                                        <span class="input-group-text bg-primary border-primary text-white">
                                                            <i class="mdi mdi-calendar-range font-13"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="javascript: void(0);" class="btn btn-primary ml-2">
                                                <i class="mdi mdi-autorenew"></i>
                                            </a>
                                            <a href="javascript: void(0);" class="btn btn-primary ml-1">
                                                <i class="mdi mdi-filter-variant"></i>
                                            </a>
                                        </form>
                                    </div>
                                    <h5 class="page-title">Dashboard</h5>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->


                        <div class="row">
							<div class="col-xl-6">
                                <div class="card">
                                    <div class="card-body" style="border:1px solid; border-radius: 0.5em;">
<!--                                         <div class="dropdown float-right"> -->
<!--                                             <a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown" aria-expanded="false"> -->
<!--                                                 <i class="mdi mdi-dots-vertical"></i> -->
<!--                                             </a> -->
<!--                                             <div class="dropdown-menu dropdown-menu-right"> -->
<!--                                                 item -->
<!--                                                 <a href="calendar" class="dropdown-item">일정</a> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                        <h5 class="header-title mb-3">달력</h5>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div data-provide="datepicker-inline" data-date-today-highlight="true" class="calendar-widget"></div>
                                        </div>
                                        <!-- end row -->

                                    </div> <!-- end card body-->
                                </div> <!-- end card -->
                                
                               <!-- end card-->
                          
                                
                                
                            </div><!-- end col-->	
                             <!-- end col-->
							  
							  
							
                           </div>
                           
        
         <div class="col-xl-6">
                                <div class="card">
                                    <div class="card-body" style="border:1px solid; border-radius: 0.5em;">
										<div class="page-title-box">
											<h5 class="header-title mb-3">업무노트</h5>
										</div>
										<div data-simplebar style="max-height: 360px;">
										<div class="mt-2" >
											<div class="col-12" style="height: 365px;">
                                <div class="board" style="overflow: visible;">
                                    <div class="tasks" data-plugin="dragula" data-containers='["task-list-one", "task-list-two", "task-list-three", "task-list-four"]'>
                                        <h5 class="mt-0 task-header">부장일정 (3)</h5>
                                        
                                        <div id="task-list-one" class="task-list-items">

                                            <!-- Task Item -->
                                            <div class="card mb-0">
                                                <div class="card-body p-3">
                                                    <small class="float-right text-muted">2022-01-18</small>
                                                    <span class="badge badge-danger">High</span>

                                                    <h5 class="mt-2 mb-2">
                                                        <a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">영업부 영업계획 보고</a>
                                                    </h5>

                                                    <p class="mb-0">
                                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                                            301호 회의실
                                                        </span>
                                                        <span class="text-nowrap mb-2 d-inline-block">
                                                            <i class="mdi mdi-comment-multiple-outline text-muted"></i>
                                                            <b>74</b> Comments
                                                        </span>
                                                    </p>

                                                    <div class="dropdown float-right">
                                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                                        </a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-pencil mr-1"></i>Edit</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-delete mr-1"></i>Delete</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-plus-circle-outline mr-1"></i>Add People</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-exit-to-app mr-1"></i>Leave</a>
                                                        </div>
                                                    </div>

                                                    <p class="mb-0">
                                                        <img src="/resources/images/UJ.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                                        <span class="align-middle">유제이</span>
                                                    </p>
                                                </div> <!-- end card-body -->
                                            </div>
                                            <!-- Task Item End -->

                                            <!-- Task Item -->
                                            <div class="card mb-0">
                                                <div class="card-body p-3">
                                                    <small class="float-right text-muted">2022-01-17</small>
                                                    <span class="badge badge-secondary">Medium</span>

                                                    <h5 class="mt-2 mb-2">
                                                        <a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">인사부 사원 간담회</a>
                                                    </h5>

                                                    <p class="mb-0">
                                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                                            3층 휴게실
                                                        </span>
                                                        <span class="text-nowrap mb-2 d-inline-block">
                                                            <i class="mdi mdi-comment-multiple-outline text-muted"></i>
                                                            <b>28</b> Comments
                                                        </span>
                                                    </p>

                                                    <div class="dropdown float-right">
                                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                                        </a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-pencil mr-1"></i>Edit</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-delete mr-1"></i>Delete</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-plus-circle-outline mr-1"></i>Add People</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-exit-to-app mr-1"></i>Leave</a>
                                                        </div>
                                                    </div>

                                                    <p class="mb-0">
                                                        <img src="/resources/images/juyeon.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                                        <span class="align-middle">한주연</span>
                                                    </p>
                                                </div> <!-- end card-body -->
                                            </div>
                                            <!-- Task Item End -->

                                            <!-- Task Item -->
                                            <div class="card mb-0">
                                                <div class="card-body p-3">
                                                    <small class="float-right text-muted">2022-01-17</small>
                                                    <span class="badge badge-success">Low</span>

                                                    <h5 class="mt-2 mb-2">
                                                        <a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">회식</a>
                                                    </h5>

                                                    <p class="mb-0">
                                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                                            장소 미정
                                                        </span>
                                                        <span class="text-nowrap mb-2 d-inline-block">
                                                            <i class="mdi mdi-comment-multiple-outline text-muted"></i>
                                                            <b>8</b> Comments
                                                        </span>
                                                    </p>

                                                    <div class="dropdown float-right">
                                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                                        </a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-pencil mr-1"></i>Edit</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-delete mr-1"></i>Delete</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-plus-circle-outline mr-1"></i>Add People</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-exit-to-app mr-1"></i>Leave</a>
                                                        </div>
                                                    </div>

                                                    <p class="mb-0">
                                                        <img src="/resources/images/hyeran.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                                        <span class="align-middle">서혜란</span>
                                                    </p>
                                                </div> <!-- end card-body -->
                                            </div>
                                            <!-- Task Item End -->
                                            
                                        </div> <!-- end company-list-1-->
                                    </div>

                                    <div class="tasks">
                                        <h5 class="mt-0 task-header text-uppercase">전체 일정 (2)</h5>
                                        
                                        <div id="task-list-two" class="task-list-items">

                                            <!-- Task Item -->
                                            <div class="card mb-0">
                                                <div class="card-body p-3">
                                                    <small class="float-right text-muted">2022-01-18</small>
                                                    <span class="badge badge-secondary">Medium</span>

                                                    <h5 class="mt-2 mb-2">
                                                        <a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">사무용품 지급예정</a>
                                                    </h5>

                                                    <p class="mb-0">
                                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                                            1층 로비
                                                        </span>
                                                        <span class="text-nowrap mb-2 d-inline-block">
                                                            <i class="mdi mdi-comment-multiple-outline text-muted"></i>
                                                            <b>17</b> Comments
                                                        </span>
                                                    </p>

                                                    <div class="dropdown float-right">
                                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                                        </a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-pencil mr-1"></i>Edit</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-delete mr-1"></i>Delete</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-plus-circle-outline mr-1"></i>Add People</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-exit-to-app mr-1"></i>Leave</a>
                                                        </div>
                                                    </div>

                                                    <p class="mb-0">
                                                        <img src="/resources/images/juyi.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                                        <span class="align-middle">강주희</span>
                                                    </p>
                                                </div> <!-- end card-body -->
                                            </div>
                                            <!-- Task Item End -->

                                            <!-- Task Item -->
                                            <div class="card mb-0">
                                                <div class="card-body p-3">
                                                    <small class="float-right text-muted">2022-01-17</small>
                                                    <span class="badge badge-success">Low</span>

                                                    <h5 class="mt-2 mb-2">
                                                        <a href="#" data-toggle="modal" data-target="#task-detail-modal" class="text-body">설 명절 비상연락망</a>
                                                    </h5>

                                                    <p class="mb-0">
                                                        <span class="pr-2 text-nowrap mb-2 d-inline-block">
                                                            <i class="mdi mdi-briefcase-outline text-muted"></i>
                                                            각부서별
                                                        </span>
                                                        <span class="text-nowrap mb-2 d-inline-block">
                                                            <i class="mdi mdi-comment-multiple-outline text-muted"></i>
                                                            <b>48</b> Comments
                                                        </span>
                                                    </p>

                                                    <div class="dropdown float-right">
                                                        <a href="#" class="dropdown-toggle text-muted arrow-none" data-toggle="dropdown" aria-expanded="false">
                                                            <i class="mdi mdi-dots-vertical font-18"></i>
                                                        </a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-pencil mr-1"></i>Edit</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-delete mr-1"></i>Delete</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-plus-circle-outline mr-1"></i>Add People</a>
                                                            <!-- item-->
                                                            <a href="javascript:void(0);" class="dropdown-item"><i class="mdi mdi-exit-to-app mr-1"></i>Leave</a>
                                                        </div>
                                                    </div>

                                                    <p class="mb-0">
                                                        <img src="/resources/images/profile/yoon.jpg" alt="user-img" class="avatar-xs rounded-circle mr-1" />
                                                        <span class="align-middle">윤주원</span>
                                                    </p>
                                                </div> <!-- end card-body -->
                                            </div>
                                            <!-- Task Item End -->

                                        </div> <!-- end company-list-2-->
                                    </div>

                                </div> <!-- end .board-->
                            </div> <!-- end col -->

								</div>
							</div>
                           <!-- end col -->
                        </div>
                        <!-- end row -->
                    </div>
                    <!-- container -->
    		    </div>
       		
                          
        <!-- END wrapper -->
<!--         날씨 -->
        <div class="col-xl-3">
        	<div class="card">
        		   
                                    <div class="card-body"style="border:1px solid; border-radius: 0.5em;">
										<div class="page-title-box">
											<h5 class="header-title mb-3">오늘의 날씨</h5>
										</div>
										<div class="mt-2" style="display: flex;">
											<div class="weatherforecast" id="weatherforecast" style="border:groove; width: fit-content;font-weight: bolder;color: white; margin-right: 5px;">
												<table class="weather" style="width: 330px; height: 200px; text-align: center;">
													<tr>
														<td colspan="4">
															  <select class="weatherLoaction" name="location" style="background-color: inherit;border: none;color: white;appearance: none;">
																  <option value="seoul">서울특별시 </option>
																  <option value="daejeon">대전광역시 </option>
																  <option value="daegu">대구광역시 </option>
																  <option value="busan">부산광역시 </option>
																  <option value="incheon">인천광역시 </option>
																  <option value="Gwangju">광주광역시  </option>
																  <option value="Ulsan">울산광역시   </option>
																  <option value="Sejong">세종특별자치시   </option>
																  <option value="Jeju-do">제주특별자치도    </option>
															  </select>
														</td>
													</tr>
													<tr>
														<td colspan="2" rowspan="4">
															<i id="icon" class="#" style="font-size: 70px;"></i>
														</td>
														<td colspan="2">
															<span id="weatherDetail"></span>
														</td>
													</tr>
													<tr>
														<td>온도
															<i class="fas fa-thermometer-three-quarters"></i>
														</td>
														<td>
															<span id="temp"></span>
															<i class="mdi mdi-temperature-celsius"></i>
														</td>
													</tr>
													<tr>
														<td>습도
															<i class="fas fa-tint"></i>
														</td>
														<td>
															<span id="humidity"></span>
															<i class="mdi mdi-percent-outline"></i>
														</td>
													</tr>
													<tr>
														<td>바람
															<i class="fas fa-wind"></i>
														</td>
														<td>
															<span id="wind"></span>&nbsp;m/s
														</td>
													</tr>
												</table>
											</div>
                                    </div>
                                    <!-- end card-body -->
                                </div>
                                
        	</div>
        </div>

<!--        	일기예보 -->

        <div class="col-xl-6">
        	<div class="card">
        		   
                                    <div class="card-body"style="border:1px solid; border-radius: 0.5em;">
										<div class="page-title-box">
											<h5 class="header-title mb-3">7일간 일기예보</h5>
										</div>
										<div class="mt-2" style="display: flex;">
		<div style="color: white;text-align-last: center;font-weight: bolder;">
			<table class="weatherForecast" id="weatherForecast">
				<tr>
					<td><span id="dateFormat1"></span></td>
					<td><span id="dateFormat2"></span></td>
					<td><span id="dateFormat3"></span></td>
					<td><span id="dateFormat4"></span></td>
					<td><span id="dateFormat5"></span></td>
					<td><span id="dateFormat6"></span></td>
					<td><span id="dateFormat7"></span></td>
				</tr>
				<tr>
					<td>
						<div>
							<i id="subIcon1" class="#" style="font-size: 70px;"></i><br>
							<span id="description1"></span><br>
							최고기온<span id="maxTemp1"></span><br>
							최저기온<span id="minTemp1"></span><br>
						</div>
					</td>
					<td>
						<div>
							<i id="subIcon2" class="#" style="font-size: 70px;"></i><br>
							<span id="description2"></span><br>
							최고기온<span id="maxTemp2"></span><br>
							최저기온<span id="minTemp2"></span><br>
						</div>
					</td>
					<td>
						<div>
							<i id="subIcon3" class="#" style="font-size: 70px;"></i><br>
							<span id="description3"></span><br>
							최고기온<span id="maxTemp3"></span><br>
							최저기온<span id="minTemp3"></span><br>
						</div>
					</td>
					<td>
						<div>
							<i id="subIcon4" class="#" style="font-size: 70px;"></i><br>
							<span id="description4"></span><br>
							최고기온<span id="maxTemp4"></span><br>
							최저기온<span id="minTemp4"></span><br>
						</div>
					</td>
					<td>
						<div>
							<i id="subIcon5" class="#" style="font-size: 70px;"></i><br>
							<span id="description5"></span><br>
							최고기온<span id="maxTemp5"></span><br>
							최저기온<span id="minTemp5"></span><br>
						</div>
					</td>
					<td>
						<div>
							<i id="subIcon6" class="#" style="font-size: 70px;"></i><br>
							<span id="description6"></span><br>
							최고기온<span id="maxTemp6"></span><br>
							최저기온<span id="minTemp6"></span><br>
						</div>
					</td>
					<td>
						<div>
							<i id="subIcon7" class="#" style="font-size: 70px;"></i><br>
							<span id="description7"></span><br>
							최고기온<span id="maxTemp7"></span><br>
							최저기온<span id="minTemp7"></span><br>
						</div>
					</td>
				</tr>
			</table>
		</div>			



                                    </div>
                                    <!-- end card-body -->
                                </div>
                                
        	</div>
        </div>





<!--            쪽지          -->
         <div class="col-lg-3">
                                <!-- Todo-->
                                <div class="card">
                                    <div class="card-body"style="border:1px solid; border-radius: 0.5em;">
                                        <div class="dropdown float-right">
                                            <a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown" aria-expanded="false">
                                                <i class="mdi mdi-dots-vertical"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item">Settings</a>
                                                <!-- item-->
                                                <a href="javascript:void(0);" class="dropdown-item">Action</a>
                                            </div>
                                        </div>
                                        <h4 class="header-title mb-3">TODO</h4>

                                        <div class="todoapp">
                                            <div class="row">
                                                <div class="col">
                                                    <h5 id="todo-message"><span id="todo-remaining">1</span> of <span id="todo-total">3</span> remaining</h5>
                                                </div>
                                                <div class="col-auto">
                                                    <a href="" class="float-right btn btn-light btn-sm" id="btn-archive">Archive</a>
                                                </div>
                                            </div>

                        <div style="max-height: 314px;" data-simplebar="init">
                           <div class="simplebar-wrapper" style="margin: 0px;">
                              <div class="simplebar-height-auto-observer-wrapper">
                                 <div class="simplebar-height-auto-observer"></div>
                              </div>
                              <div class="simplebar-mask">
                                 <div class="simplebar-offset"
                                    style="right: 0px; bottom: 0px;">
                                    <div class="simplebar-content-wrapper"
                                       style="height: auto; overflow: hidden;">
                                       <div class="simplebar-content" style="padding: 0px;">
                                       <div data-simplebar style="max-height: 130px;">
                                          <ul class="list-group list-group-flush todo-list"
                                             id="todo-list" >
                                             <li class="list-group-item border-0 pl-0">
                                             <div
                                                   class="custom-control custom-checkbox">
                                                   <input type="checkbox"
                                                      class="custom-control-input todo-done" id="6"
                                                      checked="">
                                                      <label class="custom-control-label"
                                                      for="6">내용 바꾸기</label>
                                                </div></li>
                                             <li class="list-group-item border-0 pl-0"><div
                                                   class="custom-control custom-checkbox">
                                                   <input type="checkbox"
                                                      class="custom-control-input todo-done" id="5"
                                                      checked=""><label class="custom-control-label"
                                                      for="5">testsetestset</label>
                                                </div></li>
                                             <li class="list-group-item border-0 pl-0"><div
                                                   class="custom-control custom-checkbox">
                                                   <input type="checkbox"
                                                      class="custom-control-input todo-done" id="1"><label
                                                      class="custom-control-label" for="1">Design
                                                      One page theme</label>
                                                </div></li>
                                          </ul>
                                       </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="simplebar-placeholder"
                                 style="width: 333px; height: 137px;"></div>
                           </div>
                           <div class="simplebar-track simplebar-horizontal"
                              style="visibility: hidden;">
                              <div class="simplebar-scrollbar"
                                 style="width: 0px; display: none;"></div>
                           </div>
                           <div class="simplebar-track simplebar-vertical"
                              style="visibility: hidden;">
                              <div class="simplebar-scrollbar"
                                 style="height: 0px; transform: translate3d(0px, 0px, 0px); display: none;"></div>
                           </div>
                        </div>

<!--                         <form name="todo-form" id="todo-form" class="needs-validation" novalidate=""> -->
                                                <div class="row">
                                                    <div class="col">
                                                        <input type="text" id="todo-input-text" name="todo-input-text" class="form-control" placeholder="Add new todo" required="">
                                                        <div class="invalid-feedback">
                                                            Please enter your task name
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <button class="btn-primary btn-md btn-block btn waves-effect waves-light" type="submit" id="todo-btn-submit">Add</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div> <!-- end .todoapp-->

                                    </div> <!-- end card-body -->
                                </div> <!-- end card-->
                            </div>
          

                          
                          </div>
                         </div>
                          
                  </div>
        
        <script src="/resources/assets/js/ui/component.todo.js"></script>
        <script src="/resources/assets/js/vendor/dragula.min.js"></script>
        <script src="/resources/assets/js/ui/component.dragula.js"></script>
      <!-- Summernote js -->
        <script src="/resources/assets/js/vendor/summernote-bs4.min.js"></script>
        <script>
            $(document).ready(function(e) {
                $('#taskDesk').summernote({
                    airMode: true,
                    callbacks: {
                        // fix broken checkbox on link modal
                        onInit: function onInit(e) {
                            var editor = $(e.editor);
                            editor.find('.custom-control-description').addClass('custom-control-label').parent().removeAttr('for');
                        }
                    }
                });
            });
        </script>
    </body>
</html>