<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
        .imgs_wrap {
            width: 600px;
            margin-top: 50px;
        }
        .imgs_wrap img {
            max-width: 200px;
        }
</style>

<title>Insert title here</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
</head>
<body>
	<!-- Start Content-->
	<div class="container-fluid">
      	  <div class="row">
              <div class="col-12">
                  <div class="page-title-box">
                      <div class="page-title-right">
                          <nav aria-label="breadcrumb">
							<ol class="breadcrumb bg-light-lighten p-2 mb-0">
							    <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/mainPage"><i class="uil-home-alt"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/reservation">예약</a></li>
							        <li class="breadcrumb-item active" aria-current="page">물품 리스트 수정</li>
							    </ol>
							</nav>
                       </div>
                       <h4 class="page-title">물품 리스트 수정</h4>
                   </div>
               </div>
           </div>    
           
		<div class="row">
       		<div class="col-2">
           		<div class="card">
                     <div class="card-body" style="border:1px solid; border-radius: 0.5em; ">
                     <h4 class="header-title mb-3">등록 목록</h4>
                          <div class="page-aside-left">
								<form method="get" action="/deleteArticle">
							 	<ul class="metismenu">
								<c:forEach var="article" items="${arti_list}"  varStatus="varStatus">
			                            <li class="side-nav-item">
		                                    <input type="radio" id="article_${varStatus.index }" name="artiIdxs" value="${article.artiIdx }"/>
		                                    <label for="article_${varStatus.index }">${article.artiNm}</label>
		                                </li>
								</c:forEach>
								
								
								</ul>
									<input type="hidden" name="artiIdx" value="${artiIdx}">
									<button type="submit" class="btn btn-danger" >
										<i class="uil-minus-square"></i> 삭제
									</button>
								</form>
						</div>
					</div>
				</div>
			</div>
				<div class="col-xl-3">
					<div class="card">
						<div class="card-body" style="height: 250px; border:1px solid; border-radius: 0.5em; ">
						<h4 class="header-title mb-3">물품 등록</h4>
						<form method="get" action="/insertArticle">
								<label for="artiDvsn">물품구분 : </label> <!-- $("#artiDvsn").val() -->
								<select id= "artiDvsns"> <!-- $("#artiDvsns option:selected").val(); -->
									<option value="${arti_info.artiDvsn==1}">회의실</option> 
									<option value="${arti_info.artiDvsn==2}">회의 물품</option>
								</select><br><br>
								<label for="artiDvsnNm">물 품 명 : </label>
								<input type="text" placeholder="물품명..." id="artiDvsnNum"  name="artiNm" ><br/><br/><!-- $("input[name=artiNm]").val(); -->
								<button type="submit" class="btn btn-success">
									<i class="uil-plus-square"></i> 등록
								</button>
						</form>
						</div>
					</div>
				</div>
		</div>
	</div>
	
	<script>

		var artiDvsnNum = $('input:radio[name=artiIdxs]:ckecked').val();
		console.log("artiNm : " + artiNm);
		

	</script>