<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
	<!-- Start Content-->
	<div class="container-fluid">
		<!-- start page title -->
		<div class="row">
			<div class="col-12">
				<div class="page-title-box">
					<div class="page-title-right">
						<ol class="breadcrumb m-0">
							<li class="breadcrumb-item"><a href="/mcaShop/addProduct">상품 추가</a></li>
							<li class="breadcrumb-item"><a href="javascript: void(0);">상품 수정</a></li>
						</ol>
					</div>
					<h1 class="page-title">상품 정보</h1>
				</div>
			</div>
		</div>
		<!-- end page title -->
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-5">
								<!-- Product image -->
								<a href="/resources/images/wandoo.jpg" class="text-center d-block mb-4">
									<img src="/resources/images/wandoo.jpg" class="img-fluid" style="max-width: 600px;" alt="Product-img" />
								</a>
							</div>
							<!-- end col -->
							<div class="col-lg-25" >
								<form method="post" action="" style="display: inline-block; width: 60px; " >
									<input type="text" value="상품명 : 완두콩" readonly="readonly" style="border: 0 solid black">
									<br />
									<br />
									<input type="text" value="가격 : 10000원" readonly="readonly" style="border: 0 solid black">
									<br />
									<br />
									<input type="text" value="수량 : 10개" readonly="readonly" style="border: 0 solid black">
									<br />
									<br />
									<input type="text" value="나의 잔여 포인트 : 1000 포인트" readonly="readonly" size="100;" style="border: 0 solid black;">
									<br />
									<br />
									<input type="submit" class="btn btn-success" style="margin-top: 15px; margin-bottom: 20px;" value="구매"></input>
								</form>
								<div style="display: inline-block; margin-top: 15px; margin-top: 0px; padding: 0px;" >
									<input type="button" class="btn btn-danger" id="pointUp" value="포인트 충전" style="position:relative; top:-2px;">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#pointUp").on("click",function(){
			var win = window.open("/mcaShop/pointBuy","PopupWin", "width=500,height=600");
		});
	</script>
	
	<script type="text/javascript">
		CKEDITOR.replace("productContent");
	</script>
</body>
</html>