<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table.type10 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin: 20px 10px;
}
table.type10 thead th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: #e7708d;
  margin: 20px 10px;
}
table.type10 tbody th {
  width: 150px;
  padding: 10px;
}
table.type10 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
}
table.type10 .even {
  background: #fdf3f5;
}
</style>
<!-- Datatables css -->
<link href="assets/css/vendor/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
<link href="assets/css/vendor/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>
<div style="position: relative; right: 870px;">
<form action="/MemSearchGo" method="post">
				<div class="input-group" style="position: relative;  top: 20px;  left: 1625px;">
		<input type="search" name="memNm" placeholder="검색어...">
		
		<button type="submit" >검색</button>
	</div>
</form>
</div>

<div style="position: relative; left: 14px;">
<a href="/AllworkCheck">사원 출결</a> 
</div>

<div>
<table class="type10">
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
  <c:forEach var="row" items="${list }" >
	        <tr>
	            <td>${row.memNm }</td>
	            <td>${row.atmnDate }</td>
	            <td>${row.atmnStart }</td>
	            <td>${row.atmnEnd }</td>
	            <td>${row.atmnDvsn }</td>
	             <td>
	            	<form action="/saveAtmnCont" method="get">
		            	<input type=text id="atmnCont_${varStatus.index }" value="${row.atmnCont }" name="atmnCont" style="border: 0px; width: 120px;" > 
		            	<input type="text" value="${row.atmnIdx }" name="atmnIdx" style="display: none;">
		            	<input type="submit" value="저장">
	            	</form>
            	</td>
	        </tr>
        </c:forEach>
  </tbody>
</table>	
</div>

<!-- Datatables js -->
<script src="assets/js/vendor/jquery.dataTables.min.js"></script>
<script src="assets/js/vendor/dataTables.bootstrap4.js"></script>
<script src="assets/js/vendor/dataTables.responsive.min.js"></script>
<script src="assets/js/vendor/responsive.bootstrap4.min.js"></script>

<!-- Datatable Init js -->
<script src="assets/js/pages/demo.datatable-init.js"></script>	
</body>
</html>