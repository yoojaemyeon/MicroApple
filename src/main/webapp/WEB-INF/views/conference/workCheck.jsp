<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Datatables css -->
<link href="assets/css/vendor/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
<link href="assets/css/vendor/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	
<table id="basic-datatable" class="table dt-responsive nowrap w-100">
    <thead>
        <tr>
            <th>이름</th>
            <th>날짜</th>
            <th>출근시간</th>
            <th>퇴근시간</th>
            <th>구분</th>
            <th>내용</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>유제이</td>
            <td>2021-12-06</td>
            <td>08:50</td>
            <td>18:10</td>
            <td>출근</td>
            <td>-</td>
        </tr>
        <tr>
            <td>유제이</td>
            <td>2021-12-07</td>
            <td>-</td>
            <td>-</td>
            <td>출근</td>
            <td>P12345</td>
        </tr>
    </tbody>
</table>	
	

<!-- Datatables js -->
<script src="assets/js/vendor/jquery.dataTables.min.js"></script>
<script src="assets/js/vendor/dataTables.bootstrap4.js"></script>
<script src="assets/js/vendor/dataTables.responsive.min.js"></script>
<script src="assets/js/vendor/responsive.bootstrap4.min.js"></script>

<!-- Datatable Init js -->
<script src="assets/js/pages/demo.datatable-init.js"></script>	
</body>
</html>