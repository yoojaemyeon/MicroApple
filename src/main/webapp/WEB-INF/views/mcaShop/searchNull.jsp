<%@page import="micro.apple.groupware.mcaShop.vo.McaShopVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>복지몰 목록</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="page-title-box">
					<div class="page-title-right">
						<ol class="breadcrumb m-0">
							<li class="breadcrumb-item"><a href="/mainPage">Home</a></li>
							<li class="breadcrumb-item active">복지몰</li>
						</ol>
					</div>
					<h4 class="page-title">Products</h4>
				</div>
			</div>
		</div>
		
		<a href="/mcaShop">목록 돌아가기</a>
		
		<!-- end page title -->
		<div data-simplebar style="max-height: 2000px;">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="row mb-2">
								<div style="position: relative; left:  1325px;"><!-- 검색 창 시작 -->
									<form class="form-inline" action="/search" method="post">
								         <div class="form-group mb-2">
								         	<input type="text" value="${member.memIdx}" style="display: none;" > 
								            <input type="search" class="form-control" name="prodNm" id="prodNm" placeholder="Search...">
								            <input type="submit" class="btn btn-primary btn-flat" value="검색" />
								         </div>
			    				 	</form>
			    				 	
		    					 </div> <!-- 검색 창 끝 -->
								<div class="col-sm-8"></div>
							</div>
							<div class="table-responsive">
							<h2> 검색어가 없습니다.</h2>
								<table class="table table-centered w-100 dt-responsive nowrap"
									id="products-datatable">
									<thead class="thead-light">
										<tr>
											<th class="all" style="width: 20px;">
												<div class="custom-control custom-checkbox">
													<input type="checkbox" class="custom-control-input" id="customCheck1">
													<label class="custom-control-label" for="customCheck1">&nbsp;</label>
												</div>
											</th>
											<th class="all"></th>
											<th>상품명</th>
											<th>가격</th>
											<th>수량</th>
											<th>내용</th>
										</tr>
									</thead>
									<tbody>
											<tr>
												<td>
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input" id="customCheck2">
														<label class="custom-control-label" for="customCheck2">&nbsp;</label>
													</div>
												</td>
												<td>
													<a href="/productDetail?prodIdx" class="text-body">
													</a>
												</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>