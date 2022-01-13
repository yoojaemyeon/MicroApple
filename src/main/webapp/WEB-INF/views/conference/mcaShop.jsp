<%@page import="micro.apple.groupware.mcaShop.vo.McaShopVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>복지몰 목록</title>
</head>
<body>
	<div class="container-fluid">
		<!-- start page email-title -->
		<div class="row">
			<div class="col-12">
				<div class="page-title-box">
					<div class="page-title-right">
						<ol class="breadcrumb m-0">
							<li class="breadcrumb-item"><a href="/mainPage">Home</a></li>
							<li class="breadcrumb-item active">복지몰</li>
						</ol>
					</div>
					
					<c:if test="${member.deptIdx != 4 }">
						<div style="position: relative;">
							<h4 class="page-title">복지몰</h4>
						</div>
						<div style="position: relative;">
							<div style="position: relative; top: 58px;">
								<h4 class="page-title"></h4>
							</div>
							<div
								style="display: inline-block; position: relative; left: 63px;">
								<a href="/addProduct" > 
									<i ></i> 
								</a>
							</div>
						</div>
					</c:if>
					<c:if test="${member.deptIdx == 4 }">
						<div style="position: relative;">
							<div style="position: relative; top: 58px;">
								<h4 class="page-title">복지몰</h4>
							</div>
							<div
								style="display: inline-block; position: relative; left: 63px;">
								<a href="/addProduct" class="btn btn-danger mb-2"> 
									<i class="mdi mdi-plus-circle mr-2"></i> 상품 추가
								</a>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
		
		<!-- end page title -->
<!-- 		<div data-simplebar style="max-height: 2000px;"> -->
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<div class="row mb-2">
							<div style="position: relative; left:  1325px;"><!-- 검색 창 시작 -->
								<form class="form-inline" action="/search" method="post">
							         <div class="form-group mb-2">
							            <input type="search" class="form-control" name="prodNm" id="prodNm" placeholder="Search...">
							            <input type="submit" class="btn btn-primary btn-flat" value="검색" />
							         </div>
	    					   </form>
    					   </div> <!-- 검색 창 끝 -->
							<div class="col-sm-8"></div>
							<!-- end col-->
						</div>
						<div class="table-responsive">
							<table class="table table-centered w-100 dt-responsive nowrap" id="products-datatable">
								<thead class="thead-light">
									<tr>
										<th class="all" style="width: 20px;">
										</th>
										<th class="all">상품 이미지</th>
										<th>상품명</th>
										<th>가격(포인트)</th>
										<th>수량(개)</th>
										<th>내용</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${list}">	
										<tr>
											<td>
											</td>
											<td>
												<a href="/productDetail?prodIdx=${row.prodIdx }" class="text-body">
													<c:forEach var="files" items="${row.fProdVO}" begin="0" end="0" step="1" >
														<img src="/resources/images/thumbnail/s_${files.fprodNm}"  alt="contact-img" title="contact-img" class="rounded mr-3" width="90" height="80"/>
													</c:forEach>
												</a>
											</td>
											<td>${row.prodNm }</td>
											<td style="position: relative; left: 33px;"> <fmt:formatNumber value="${row.prodPrice }" pattern="#,###" />  </td>
											<td style="position: relative; left: 15px;">${row.prodQty }</td>
											<td>${row.prodCont }</td>
										</tr>
									</c:forEach>	
								</tbody>
							</table>
						</div>
					</div>
					<!-- end card-body-->
				</div>
				<!-- end card-->
			</div>
			<!-- end col -->
		</div>
<!-- 		</div> -->
		<!-- end row -->
<!-- 	</div> -->
	<!-- container -->
	 <!-- /mcaShop/pointBuy  -->

</body>
</html>