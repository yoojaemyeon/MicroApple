<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
                                        <ol class="breadcrumb bg-light-lighten p-2 mb-0">
											<li class="breadcrumb-item"><a
												href="<%=request.getContextPath()%>/mainPage">
													<i class="uil-home-alt"></i>Home</a></li>
											<li class="breadcrumb-item active" aria-current="page">내게 쓴 메세지</li>
										</ol>
                                    </div>
                                    <h4 class="page-title">내게 쓴 메세지</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page email-title --> 
                        <div class="row">
                            <!-- Right Sidebar -->
                            <div class="col-12">
                                <div class="card" style="min-height: 774px; max-height: 774px; border:1px solid; border-radius: 0.5em;">
                                    <div class="card-body">
                                        <!-- Left sidebar -->
                                       <jsp:include page="/WEB-INF/views/mail/mailPageAside.jsp" flush="true"/>
                                        <!-- End Left sidebar -->
                                        <div class="page-aside-right">
                                            <div>
												<h3>내게 쓴 메세지 리스트</h3>
												<hr>
											</div>
                                            
             <c:set var="cont" scope="page" value="${listPage}" />
				<c:choose>
					<c:when test="${cont != '[]'}">
		                               
                                            
						              <!-- 메일 내용 -->                              
									<c:forEach items="${listPage}" var="listPage">
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
						                           <a href="javascript: void(0);" class="email-title">${listPage.emOut}</a>
							</div>
						                       <div class="email-content">
						                           <a href="<%=request.getContextPath()%>/Detail?mailIdx=${listPage.emIdx}" style="text-decoration-line : none; text-decoration: none;">
						                           ${listPage.emTitle} &nbsp;&nbsp;
						                               <span></span>
						                           </a>
						                           <div class="email-date">
						                         	  <fmt:formatDate value="${listPage.emOuttime}" pattern="yyyy-MM-dd"/>
						                           </div>
						                       </div>
						                       <div class="email-action-icons">
						                           <ul class="list-inline">
						                               <li class="list-inline-item">
						                                   <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
						                               </li>
						                           </ul>
						                       </div>
						                   </li>
						                   </ul>
						                   </div>
						              </c:forEach> 
							  </c:when>	
							<c:when test="${cont eq '[]'}">
								<div class="card-body p-4">
                                <div class="text-center m-auto">
                                    <img src="/resources/assets/images/mail_sent.svg" alt="mail sent image" height="64">
                                    <h4 class="text-dark-50 text-center mt-4 font-weight-bold">전달받은 메세지가 없습니다.</h4>
                                </div>
                            </div>
							</c:when>
						</c:choose>
											</div>
							
							
		
                                        
                                        
                                        
                                        
                                        <!-- end inbox-rightbar-->
                                    </div>
				<div class="mt-2 bg-light p-3 rounded">
				<nav aria-label="Page navigation example">
   					 <ul class="pagination mb-0" style="justify-content: center;">
						<c:if test="${pageMaker.prev}">
							<li class="page-item disabled">
								<a class="page-link" tabindex="-1" aria-disabled="true" href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
							</li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<li class="page-item active" aria-current="page">
								<a class="page-link" href="mailToMe${pageMaker.makeQuery(idx)}">${idx}<span class="sr-only">(current)</span></a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item">
								<a class="page-link" href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
							</li>
						</c:if>
					</ul>
					</nav>
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