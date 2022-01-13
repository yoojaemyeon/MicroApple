<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹 디스크</title>
<link href="/resources/assets/css/vendor/webDisk.css" rel="stylesheet" type="text/css" />
<script src="/resources/assets/js/webDisk.js"></script>

</head>
<body>
<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<div class="page-title-right">
			   <ol class="breadcrumb m-0">
			       <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/mainPage"><i class="uil-home-alt"></i> Home</a></li>
			        <li class="breadcrumb-item active">웹디스크</li>
			    </ol>
			</div>
			<div class="alert alert-light" role="alert">
			<h4 class="page-title">웹 디스크</h4>
			    <i class="dripicons-information mr-2"></i> 폴더 및 파일을 <strong>선택 (폴더명  or 체크박스) 후 우클릭</strong>을 하세요!
			</div>
		</div>
	</div>
</div>     	
	
<!-- start of sidebar(Left sidebar) -->
<jsp:include page="sidebarTop.jsp" flush="false" />
<!-- end of sidebar(Left sidebar) -->
	
<!-- contents 영역 시작 -->
<div class="col-sm-9 col-xs-2">
	<div class="card" id="content_frame">
		<div class="card-body" style="min-height: 700px; max-height: 700px;">
			<div class="wedDiskpage-aside-right1">
				<table class="table table-sm" id="disk_content_frame">
					<thead style="text-align: center;">
						<tr>
							<th style="width: 5%;"><input type="checkbox" name="check_all" id="check_all" onclick="checkAll();" ></th>
							<th style="width: 1%;"></th>
							<th style="width: 10%;">이름</th>
							<th style="width: 15%;">파일설명</th>
							<th style="width: 10%;">작성자</th>
							<th style="width: 5%;">크기</th>
							<th style="width: 10%;">확장자</th>
							<th style="width: 10%;">등록일자</th>
						</tr>
					</thead>
					<tbody class="fileBody">
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- contents 영역 끝 -->
	
<!-- start of sidebar -->
<jsp:include page="sidebarBottom.jsp" flush="false" />
<!-- end of sidebar -->
</body>
</html>