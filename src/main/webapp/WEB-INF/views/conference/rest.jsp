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
            <th>전체 휴가 일수</th>
            <th>사용 휴가 일수</th>
            <th>남은 휴가 일수</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>유제이</td>
            <td style="position: relative; left: 30px;">15</td>
            <td style="position: relative; left: 30px;">2</td>
            <td style="position: relative; left: 30px;">13</td>
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