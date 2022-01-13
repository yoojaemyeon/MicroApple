<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>알림 메시지</title>
</head>
<body>
<form action="/insert">
	<p>사원번호 : <input type="text" name="empIdx"></p>
	<p>내용 : <input type="text" name="noticeContent"></p>
	<p>주소(URL) : <input type="text" name="noticeUrl"></p>
	<p>읽음 : <input type="text" name="noticeOk"></p>
	<p>출처 : <input type="text" name="noticeFrom"></p>
	<p><input type="submit" value="전송"></p>

</form>



</body>
</html>