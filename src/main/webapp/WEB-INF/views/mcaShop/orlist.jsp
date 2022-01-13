<%@page import="micro.apple.groupware.mcaShop.vo.McaShopVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>복지몰 목록</title>
</head>
<body>
<div class="row">
			<div class="col-12">
				<div class="page-title-box">
					<div class="page-title-right">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb bg-light-lighten p-2 mb-0">
								<li class="breadcrumb-item"><a
									href="<%=request.getContextPath()%>/mainPage"><i
										class="uil-home-alt"></i>Home</a></li>
								<li class="breadcrumb-item"><a
									href="<%=request.getContextPath()%>/mcaShop">복지몰</a></li>
								<li class="breadcrumb-item active" aria-current="page">주문내역</li>
							</ol>
						</nav>
					</div>
					
					<div style="display: inline-block;">
						<h4 class="page-title">주문내역</h4>
					</div>
					</div></div></div>
<div data-simplebar style="max-height: 2000px;">
	<div class="card-body">
		<div class="table-responsive">
			<c:if test="${map.memIdx == 7901}">
				<h1>주문하신 내역이 없습니다.</h1>
			</c:if>
			<table class="table mb-0">
					<thead class="thead-light">
						<tr>
							<th>상품명</th>
							<th>주문 수량(개)</th>
							<th>주문 가격</th>
							<th>주문 날짜</th>
							<th>선택</th>
						</tr>
					</thead>
				<c:forEach var="row" items="${orlist}" varStatus="varStatus">
					<tbody>
						<tr>
							<td>${row.ordrProdnm }</td>
							<td style="position: relative; left: 30px;">${row.ordrProdqty }</td>
							<td><fmt:formatNumber value="${row.ordrProdprice }" pattern="#,###" /> </td>
							<td>${row.ordrDate }</td>
							<td><a href="javascript:location.href='/deleteOrlist?ordrIdx=${row.ordrIdx}';"  onclick="return confirm('정말 삭제 하시겠습니까?');" class="btn btn-success btn-sm" name="rd" value="삭제">삭제 </a></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
</div>

</body>
</html>