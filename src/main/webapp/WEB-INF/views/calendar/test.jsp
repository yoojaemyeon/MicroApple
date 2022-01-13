<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="/resources/jquery-3.6.0.js"></script>
<script>
    $.ajax({
		  url : "calendar1",
		  type : "post",
		  success : function(data) {
		  	alert(data.schdCont);
		  },
		  error : function() {
		  	alert("error");
		  }
		})

    </script>
</head>
<body>

<h1>test중입니다.</h1>

</body>
</html>