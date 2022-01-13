<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"/></title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
		<link rel="shortcut icon" href="/resources/assets/images/favicon.ico">
		<script src="/resources/assets/js/jquery-3.6.0.js" ></script>
		
        <!-- third party css -->

        <link href="/resources/assets/css/vendor/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- third party css end -->
        <!-- App css -->
        <link href="/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="/resources/assets/css/app.min.css" rel="stylesheet" type="text/css" id="light-style" />
        <link href="/resources/assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="dark-style" />
        <link href="/resources/aside.css">
		<link rel="/resources/jquery-3.6.0.js">
</head>
<body class="loading" data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}'>

	<div class="wrapper mm-active">
	
			<tiles:insertAttribute name="aside"/>
			  <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <div class="content-page">
                <div class="content">
                
			<tiles:insertAttribute name="header" />
			<tiles:insertAttribute name="body"/>
			
			 	</div>
                <!-- content -->
            </div>
            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->
			
			<tiles:insertAttribute name="footer" />
			<!-- 오른쪽 사이드바(설정누르면 나옴) -->
			<jsp:include page="/WEB-INF/views/tiles/rightSidebar.jsp" flush="true"/>

	</div>



        <!-- bundle -->
		<script src="/resources/assets/js/vendor.min.js"></script>
        <script src="/resources/assets/js/app.min.js"></script>


        <!-- third party js -->
        <script src="/resources/assets/js/vendor/apexcharts.min.js"></script>
        <script src="/resources/assets/js/vendor/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="/resources/assets/js/vendor/jquery-jvectormap-world-mill-en.js"></script>

        <!-- third party js ends -->

        <!-- demo app -->
        <script src="/resources/assets/js/pages/demo.dashboard.js"></script>

        <!-- end demo js-->
</body>
</html>