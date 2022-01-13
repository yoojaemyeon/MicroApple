<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
        .imgs_wrap {
            width: 600px;
            margin-top: 50px;
        }
        .imgs_wrap img {
            max-width: 200px;
        }
</style>
<script type="text/javascript">
function fn_chk(){
	
	var price = document.getElementById("prodPrice").value;
	var QTY = document.getElementById("prodQty").value;
	
	//숫자면 false 반환
	if(isNaN(price) == false && isNaN(QTY) == false){
		return true;
	}
	if(isNaN(price) == true || isNaN(QTY) == true){
		alert("가격 및 수량은 숫자만 입력가능 합니다. ");
		return false;
	}
	
	//통과 시 return true 아니면 return false;
	return true;
}
</script>

<title>Insert title here</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
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
							<li class="breadcrumb-item"><a href="/mainPage">Home</a></li>
							<li class="breadcrumb-item"><a href="/mcaShop">복지몰</a></li>
							<li class="breadcrumb-item">상품 수정</li>
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
								<!-- 이미지 미리보기 영역 -->
								<div class="imgs_wrap">
            						
      							</div>
							</div>
							<!-- end col -->
							<div class="col-lg-7">
								<form method="post" action="/updateProduct" enctype="multipart/form-data" onsubmit="return fn_chk()">
									<input type="text" value="${detail.prodIdx }" name="prodIdx" style="display: none;">
									
									상품명 : &nbsp; <input type="text" placeholder="상품명 : ${detail.prodNm }" value="${detail.prodNm }" id="prodNm" name="prodNm"><br/><br/>
									
									가격 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="가격: ${detail.prodPrice }원" value="${detail.prodPrice }" id="prodPrice" name="prodPrice"> <br/><br/>
									
									수량 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  placeholder="수량 : ${detail.prodQty }" value="${detail.prodQty }" id="prodQty" name="prodQty" > <br/><br/>
								
									<!-- 첨부파일(이미지파일만 업로드가능) -->
								    <input type="file" value="이미지 파일" id="input_imgs" name="file" multiple />
									<br/>
									<br/>
									<textarea id="productContent" name="prodCont" >${detail.prodCont}</textarea>
									<input type="submit" value="등록">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		CKEDITOR.replace("productContent");
	</script>
	
	
	 <script type="text/javascript">
        
        var sel_files = [];
 
        $(document).ready(function() {
            $("#input_imgs").on("change", handleImgsFilesSelect);
        }); 
 
        function handleImgsFilesSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
 
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
 
                sel_files.push(f);
 
                var reader = new FileReader();
                reader.onload = function(e) {
                    var img_html = "<img src=\"" + e.target.result + "\" />";
                    $(".imgs_wrap").append(img_html);
                }
                reader.readAsDataURL(f);
            });
        }
 
    </script>
	
</body>
</html>