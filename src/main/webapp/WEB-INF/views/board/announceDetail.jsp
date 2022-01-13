<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>공지게시판 상세</title>
</head>
<body>
<div class="wrapper">
	<div class="col-12">
		<div class="page-title-box">
			<div class="page-title-right">
				<ol class="breadcrumb m-0">
					<li class="breadcrumb-item"><a href="javascript:location.href='/mainPage';"><i class="uil-home-alt"></i>Home</a></li>
					<li class="breadcrumb-item"><a href="javascript:location.href='/announce?boardDvsn=2';">공지게시판</a></li>
					<li class="breadcrumb-item active">상세조회</li>
				</ol>
			</div>
			<h4 class="page-title">공지 게시판</h4>
		</div>
	</div>
	<div class="content-page">
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					
				</div>

				<div>
					<div class="col-xl-8 col-lg-6">
						<div class="card d-block">
							<div class="card-body">
								<c:forEach var="row" items="${boardDetail}">
									<div class="dropdown float-right">
										<a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown" aria-expanded="false">
											<i class="dripicons-dots-3"></i>
										</a>
										<div class="dropdown-menu dropdown-menu-right">
											<a href="javascript:location.href='/announceEdit?boardIdx=${row.boardIdx}';" class="dropdown-item"><i class="mdi mdi-pencil mr-1"></i>수정</a>
											<a href="javascript:location.href='/announceDelete?boardIdx=${row.boardIdx}';" 
												class="dropdown-item" onclick="return confirm('정말 삭제 하시겠습니까?');" ><i class="mdi mdi-delete mr-1"></i>삭제</a>
										</div>
									</div>
									<h3 class="mt-0">${row.boardTitle}</h3>
	
									<div class="row" style="float: right;">
										<div class="col-md-12">
											<h5>${row.memNm}</h5>
											<small>${row.boardWrdate}</small>
										</div>
									</div>
									<br /><hr />
									<div data-simplebar style="max-height: 401px;">
										<div style="height: 400px; width: auto; ">									
											<p class="text-muted mb-2">${row.boardCont}</p>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>



</body>
</html>