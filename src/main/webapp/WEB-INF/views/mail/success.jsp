<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                                            


        <div class="auth-fluid" style="min-height: 70vh;">
            <!--Auth fluid left content -->
            <div class="auth-fluid-form-box">
                <div class="align-items-center d-flex h-100">
                    <div class="card-body">

                        <!-- Logo -->
                        <div class="auth-brand text-center text-lg-left">
                            <a href="index.html" class="logo-dark">
                                <span><img src="assets/images/logo-dark.png" alt="" height="18"></span>
                            </a>
                            <a href="index.html" class="logo-light">
                                <span><img src="assets/images/logo.png" alt="" height="18"></span>
                            </a>
                        </div>

                        <!-- email send icon with text-->
                        <div class="text-center m-auto">
<!--                             <img src="assets/images/mail_sent.svg" alt="mail sent image" height="64" /> -->
                            <h4 class="text-dark-50 text-center mt-4 font-weight-bold">메세지 전송이 성공하였습니다.</h4>
                            <p class="text-muted mb-4">
<!--                                 A email has been send to <b>youremail@domain.com</b>. -->
<!--                                 Please check for an email from company and click on the included link to -->
<!--                                 reset your password.  -->
                            </p>
                        </div>

                        <!-- form -->
<!--                         <form action="index.html"> -->
<!--                             <div class="form-group mb-0 text-center"> -->
<!--                                 <button class="btn btn-primary btn-block" type="submit"><i class="mdi mdi-home mr-1"></i> Back to Home </button> -->
<!--                             </div> -->
<!--                         </form> -->
                        <!-- end form-->

                        <!-- Footer-->
                        <footer class="footer footer-alt">
                            <p class="text-muted"><script>document.write(new Date().getFullYear())</script> © Hyper - Coderthemes.com</p>
                        </footer>

                    </div> <!-- end .card-body -->
                </div> <!-- end .align-items-center.d-flex.h-100-->
            </div>
            <!-- end auth-fluid-form-box-->

            <!-- Auth fluid right content -->
            <div class="auth-fluid-right text-center">
                <div class="auth-user-testimonial">
                    <h2 class="mb-3">I love the color!</h2>
                    <p class="lead"><i class="mdi mdi-format-quote-open"></i> It's a elegent templete. I love it very much! . <i class="mdi mdi-format-quote-close"></i>
                    </p>
                    <p>
                        - Hyper Admin User
                    </p>
                </div> <!-- end auth-user-testimonial-->
            </div>
            <!-- end Auth fluid right content -->
        </div>
        <!-- end auth-fluid-->
        
        
        
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