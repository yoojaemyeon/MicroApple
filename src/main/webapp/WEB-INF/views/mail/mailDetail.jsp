<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 상세보기</title>
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
                                <div class="card" style="min-height: 610px; max-height: 810px;">
                                    <div class="card-body">
                                        <!-- Left sidebar -->
                                       <jsp:include page="/WEB-INF/views/mail/mailPageAside.jsp" flush="true"/>
                                        <!-- End Left sidebar -->
                                        <div class="page-aside-right">

<!-- 메일상세 -->	
									<div class="mt-3">
										<c:forEach items="${data}" var="data" varStatus="status" begin="0" end="0">
                                                <h5 class="font-18">제목 : ${data.emTitle}</h5>
                                                <hr/>

                                                <div class="media mb-3 mt-1">
                                                    <img class="d-flex mr-2 rounded-circle" src="/resources/images/mail.jpg" alt="placeholder image" height="32">
                                                    <div class="media-body">
                                                        <small class="float-right">${data.emOuttime}</small>
                                                        <h6 class="m-0 font-12">${data.memNm}</h6>
                                                        <small class="text-muted">From: ${data.emOut}</small>
                                                    </div>
                                                </div>	
                                                	<div style="height: 390px; overflow-x: auto;">
														${data.emCont}
													</div>
										</c:forEach>
												<br>
                                                <h5 class="mb-3">첨부파일</h5>

                                                <form name="fileSelect" action="/download" method="post">
                                                <div class="row" style="overflow-x: auto; height: 80px;">
                                                    <c:forEach items="${data}" var="data" varStatus="status">
                                                    <div class="col-xl-4">
                                                        <div class="card mb-1 shadow-none border">
                                                        
                                                        	
	                                                            <div class="p-2">
	                                                                <div class="row align-items-center">
	                                                                    <div class="col-auto">
	                                                                        <div class="avatar-sm">
	                                                                            <span class="avatar-title bg-primary-lighten text-primary rounded">
	                                                                                ${data.emExtn}
	                                                                            </span>
	                                                                        </div>
	                                                                    </div>
		                                                                   		 <div class="col pl-0">
			                                                                        <a href="#" class="text-muted font-weight-bold">${data.emNm}</a>
			                                                                        <p class="mb-0">${data.emfSize}</p>
			                                                                    </div>
			                                                                    <div class="col-auto">
			                                                                        <!-- Button -->
			                                                                        <a href="<%=request.getContextPath()%>/download?emfIdx=${data.emfIdx}" class="btn btn-link btn-lg text-muted">
			                                                                            <i class="dripicons-download"></i>
			                                                                        </a>
		                                                                    </div>
	                                                                </div>
	                                                            </div>
                                                            
                                                            
                                                        </div>
                                                    </div> <!-- end col -->
                                                   </c:forEach>
                                                    
                                                    
                                                </div>
                                                   </form>
                                                <!-- end row-->
     
     
                                            </div>
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