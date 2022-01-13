<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_download(fname) {
		location.href = "/Cdownload?mtngFile=" + encodeURIComponent(fname);
	}
</script>


<style type="text/css">
table.type09 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
}

table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.type09 tbody th {
	width: 350px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.type09 td {
	width: 1200px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>

</head>
<body>
	<!-- Start Content-->
	<div class="container-fluid">
		<!-- start page email-title -->
		<div class="row">
			<div class="col-12">
				<div class="page-title-box">
					<div class="page-title-right">
						<ol class="breadcrumb m-0">
							<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/mainPage">
						<i class="uil-home-alt"></i>Home</a></li>
							<li class="breadcrumb-item active"><a href="/conference">회의록</a></li>
							<li class="breadcrumb-item active">상세보기</li>
						</ol>
					</div>
					<div style="position: relative;">
                  <h4 class="page-title">회의록</h4>
                  </div>
               <c:if test="${member.memIdx != detail.MEM_IDX }">
                  <div style="position: relative;">
                     <div style="position: relative; top: 58px;">
                        <h4 ></h4>
                     </div>
                     <div
                        style="display: inline-block; position: relative; left: 63px;">
                        <a href="/updateConference?mtngIdx=${detail.MTNG_IDX }"> <i></i> 
                        </a> <a href="/deleteConference?mtngIdx=${detail.MTNG_IDX }"
                           onclick="return confirm('정말 삭제 하시겠습니까?')"
                           > <i></i> 
                        </a>
                     </div>
                  </div>
               </c:if>
               
               <c:if test="${member.memIdx == detail.MEM_IDX }">
                  <div style="position: relative;">
                     <div
                        style="display: inline-block; position: relative; ">
                        <a href="/updateConference?mtngIdx=${detail.MTNG_IDX }"
                           class="btn btn-secondary mb-2"> <i
                           class="mdi mdi-plus-circle mr-2"></i> 수정
                        </a> <a href="/deleteConference?mtngIdx=${detail.MTNG_IDX }"
                           onclick="return confirm('정말 삭제 하시겠습니까?')"
                           class="btn btn-danger mb-2"> <i
                           class="mdi mdi-plus-circle mr-2"></i> 삭제
                        </a>
                     </div>
                  </div>
               </c:if>
            </div>
         </div>
      </div>
   </div>

	<!-- Right Sidebar -->
	<div class="col-12">
<!-- 		<div class="card"> -->
<!-- 			<div class="card-body"> -->

<!-- 				<div class="page-aside-right"> -->

					<table class="type09">
						<thead>
							<tr>
								<th scope="cols" style="font-size: 30px;">${detail.MTNG_TITLE }</th>
								<th scope="cols" style="font-size: 30px;"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">작성 일자</th>
								<td>${detail.MTNG_DATE }</td>
							</tr>
							<tr>
								<th scope="row">회의 내용</th>
								<td>${conVO.mtngCont }</td>
							</tr>
							<tr>
								<th scope="row">회의 결과</th>
								<td>${conVO.mtngResults }</td>
							</tr>
							<tr>
								<th scope="row">파일</th>
								<td>

									<div class="col-xl-4" style="position: relative; right: 20px;">
										<div class="card mb-0 shadow-none border">
											<div class="p-2">
												<div class="row align-items-center">
													<div class="col-auto">
														<div class="avatar-sm">
															<span class="avatar-title bg-secondary rounded">
																회의록 </span>
														</div>
													</div>
													<div class="col pl-0">
														<a id="f_nm"
															href="javascript:fn_download('${detail.MTNG_FILE }')"
															class="text-muted font-weight-bold jscript">
															${detail.MTNG_FILE.split("_")[1]} </a>
													</div>
													<div class="col-auto">
														<!-- Button -->
														<a href="javascript:fn_download('${detail.MTNG_FILE }')"
															class="btn btn-link btn-lg text-muted"> <i
															class="dripicons-download"></i>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>


								</td>
							</tr>
						</tbody>
					</table>
					<div class="mt-3"></div>
				</div>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

</body>
</html>