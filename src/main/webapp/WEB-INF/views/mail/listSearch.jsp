<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
<!-- 				<th>조회수</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td><a href="/board/view?bno=${list.mailIdx}">${list.mailIdx}</a></td>
					<td>${list.title}</td>
					<td><fmt:formatDate value="${list.outtime}"
							pattern="yyyy-MM-dd hh:mm:ss" /></td>
					<td>${list.fromMail}</td>
<%-- 					<td>${list.viewCnt}</td> --%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<ul>
			<c:if test="${pageMaker.prev}">
				<li><a
					href="listSearch${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li><a href="listSearch${pageMaker.makeQuery(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="listSearch${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>

	<div class="search">
		<select id="searchType" name="searchType">
			<option value="n"
				<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
			<option value="t"
				<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
			<option value="c"
				<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
			<option value="w"
				<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
			<option value="tc"
				<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
		</select> <input type="text" name="keyword" id="keywordInput"
			value="${scri.keyword}" />

		<button onclick="search()">검색</button>
	</div>
	
<script type="text/javascript">

function search() {
	self.location = "listSearch"
	+ '${pageMaker.makeQuery(1)}'
	+ "&searchType="
	+ document.querySelector('#searchType').value
	+ "&keyword="
	+ document.getElementById('keywordInput').value
	
}	
	
</script>

</body>
</html>