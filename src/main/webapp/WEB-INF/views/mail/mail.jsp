<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="/resources/jquery-3.6.0.js">
<title>받은편지함</title>
</head>
<body>
 

            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

                    <!-- Start Content-->
                    <div class="container-fluid">
                        <!-- start page email-title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">메인</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">메일</a></li>
                                            <li class="breadcrumb-item active">받은 메일함</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">받은 메일함</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page email-title --> 
                        <div class="row">
                            <!-- Right Sidebar -->
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <!-- Left sidebar -->
                                       <jsp:include page="/WEB-INF/views/mail/mailPageAside.jsp" flush="true"/>
                                        <!-- End Left sidebar -->
                                        <div class="page-aside-right">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-secondary"><i class="mdi mdi-archive font-16"></i></button>
                                                <button type="button" class="btn btn-secondary"><i class="mdi mdi-alert-octagon font-16"></i></button>
                                                <button type="button" class="btn btn-secondary"><i class="mdi mdi-delete-variant font-16"></i></button>
                                            </div>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-secondary dropdown-toggle arrow-none" data-toggle="dropdown" aria-expanded="false">
                                                    <i class="mdi mdi-folder font-16"></i>
                                                    <i class="mdi mdi-chevron-down"></i>
                                                </button>
                                                <div class="dropdown-menu">
                                                    <span class="dropdown-header">Move to:</span>
                                                    <a class="dropdown-item" href="javascript: void(0);">Social</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Promotions</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Updates</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                                                </div>
                                            </div>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-secondary dropdown-toggle arrow-none" data-toggle="dropdown" aria-expanded="false">
                                                    <i class="mdi mdi-label font-16"></i>
                                                    <i class="mdi mdi-chevron-down"></i>
                                                </button>
                                                <div class="dropdown-menu">
                                                    <span class="dropdown-header">Label as:</span>
                                                    <a class="dropdown-item" href="javascript: void(0);">Updates</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Social</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Promotions</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                                                </div>
                                            </div>

                                            <div class="btn-group">
                                                <button type="button" class="btn btn-secondary dropdown-toggle arrow-none" data-toggle="dropdown" aria-expanded="false">
                                                    <i class="mdi mdi-dots-horizontal font-16"></i> More
                                                    <i class="mdi mdi-chevron-down"></i>
                                                </button>
                                                <div class="dropdown-menu">
                                                    <span class="dropdown-header">More Options :</span>
                                                    <a class="dropdown-item" href="javascript: void(0);">Mark as Unread</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Add to Tasks</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Add Star</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Mute</a>
                                                </div>
                                            </div>
                                            
                                            
						              <!-- 메일 내용 -->                              
									<c:forEach var="row" items="${list}" varStatus="stat">
										<div class="mt-3">
						               <ul class="email-list" style="margin-bottom: -1rem;">
						                   <li class="unread">
						                       <div class="email-sender-info">
						                           <div class="checkbox-wrapper-mail">
						                               <div class="custom-control custom-checkbox">
						                                   <input type="checkbox" class="custom-control-input" id="mail1">
						                                   <label class="custom-control-label" for="mail1"></label>
						                               </div>
						                           </div>
						                           <span class="star-toggle mdi mdi-star-outline text-warning"></span>
						                           <a href="javascript: void(0);" class="email-title">${row.emOut}</a>
						                       </div>
						                       <div class="email-content">
						                           <a href="mailDetail?mailIdx=${row.emIdx}" style="text-decoration-line : none; text-decoration: none;">
						                           ${row.emTitle} &nbsp;&ndash;&nbsp;
						                               <span></span>
						                           </a>
						                           <div class="email-date">
						                         	  <fmt:formatDate value="${row.emOut}" pattern="yyyy-MM-dd"/>
						                           </div>
						                       </div>
						                       <div class="email-action-icons">
						                           <ul class="list-inline">
						                               <li class="list-inline-item">
						                                   <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
						                               </li>
						                               <li class="list-inline-item">
						                                   <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
						                               </li>
						                               <li class="list-inline-item">
						                                   <a href="javascript: void(0);"><i class="mdi mdi-email-open email-action-icons-item"></i></a>
						                               </li>
						                               <li class="list-inline-item">
						                                   <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
						                               </li>
						                           </ul>
						                       </div>
						                   </li>
						                   </ul>
						                   </div>
						              </c:forEach> 


              
              
              
									<div class="row">
                                                <div class="col-7 mt-1">
                                                    Showing 1 - 20 of 289
                                                </div> <!-- end col-->
                                                <div class="col-5">
                                                    <div class="btn-group float-right">
                                                        <button type="button" class="btn btn-light btn-sm"><i class="mdi mdi-chevron-left"></i></button>
                                                        <button type="button" class="btn btn-info btn-sm"><i class="mdi mdi-chevron-right"></i></button>
                                                    </div>
                                                </div> <!-- end col-->
                                            </div>
                                            <!-- end row-->
                                        </div> 
                                        
                                        
                                        
                                        
                                        <!-- end inbox-rightbar-->
                                    </div>
                                    <!-- end card-body -->
                                    <div class="clearfix"></div>
                                </div> <!-- end card-box -->
                            </div> <!-- end Col -->
                        </div><!-- End row -->
                    </div> <!-- container -->

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


			



</body>
</html>