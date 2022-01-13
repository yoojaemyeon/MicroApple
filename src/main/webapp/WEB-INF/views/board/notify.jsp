<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/jquery-3.6.0.js"></script>
<script type="text/javascript">
// alert("오니");
send_notify('${noticeAddr}','${noticeCont}','${noticeUrl}','${memIdx}');
location.href="/announce?boardDvsn=2";

</script>