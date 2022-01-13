<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/assets/css/vendor/summernote-bs4.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>복지몰 건의사항글 작성</title>
</head>
<body>

	
	<div class="page-title-box">
		<div class="page-title-right">
			<ol class="breadcrumb m-0">
				<li class="breadcrumb-item"><a href="javascript:location.href='/mainPage';" style="float:right;"><i class="uil-home-alt"></i>Home</a></li>
				<li class="breadcrumb-item"><a href="javascript:location.href='/mcaBoard?boardDvsn=3';" style="float:right;">복지몰 건의사항</a></li>
				<li class="breadcrumb-item active">복지몰 건의사항글 작성</li>
			</ol>
		</div>
		<h2 class="page-title">복지몰 건의사항</h2>
	</div>

	<div class="card-body">
		<div class="row mb-2" style="position: relative; right: 20px;">
			<div class="col-lg-8">
				<form class="form-inline">
					<div class="form-group mb-2"></div>
				</form>
			</div>
		</div>
	
	<!-- 게시글 작성 폼 -->
	<form method="POST" action="/mcaBoardPost">
		 <div class="container">
				<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">복지몰 건의사항</th>
							</tr>
							<tr>
								<td>
									<input type="text" class="form-control" value="3" name="boardDvsn" style="display: none;">	
								</td>
							</tr>
							<tr>
								<td>
									제목 <input type="text" class="form-control" placeholder="글 제목" name="boardTitle"
										style="width:600px; float:right;">						
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" class="form-control" placeholder="작성자" value="${member.memIdx}" name="memIdx"
										style="width:600px; float:right; border: 0; display: none;" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<td>
									<textarea id="summernote-basic" name="boardCont"></textarea>
								</td>
							</tr>
						</thead>
					</table>
				</div>
			</div>
				<div class="text-lg-right">
					<input type="submit" class="btn btn-secondary" value="저장" 
						 style="position: relative; right: 210px;" >
				</div>
		</form>
	</div>
	




<script src="/resources/assets/js/vendor/summernote-bs4.min.js"></script>
<!-- Summernote demo -->
<script src="/resources/assets/js/pages/demo.summernote.js"></script>


</body>
</html>