<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
<script src="/resources/jquery-3.6.0.js"></script>
<script type="text/javascript">

var page = 1;
$(window).scroll(function () {
// 	if($(window).scrollTop() == $(document).height() - $(window).height()){
		console.log(++page);
		$("#enters").append("<h1>Page " + page + "</h1><BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~");
	}
	
});

if($("body").height() < $(window).height()){
	alert("스크롤바 있쇼");
}
</script>
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
							<li class="breadcrumb-item active" aria-current="page">자유게시판</li>
						</ol>
					</nav>
				</div>
				
				<div style="display: inline-block;">
					<h4 class="page-title">자유게시판</h4>
				</div>
			</div>
		</div>
	</div>


	<div class="col-xl-9 col-lg-9 order-lg-9 order-xl-9" id="main-container" style="position: relative; left: 150px;">
		<!-- 자유게시판 작성 버튼 -->
		<div style="position: relative; right: 25px;">
			<button type="button" id="freeWriteBtn" class="btn btn-secondary" style="float: right;" onclick="javascript:location.href='/freeWrite';">작성</button>
		</div>
		<!-- 검색 창 -->
		<form class="form-inline" action="/freeSearch?boardDvsn=1" method="post">
	         <div class="form-group mb-2"  style="position: relative; left: 25px;">
	            <input type="search" 	class="form-control" name="boardTitle" id="boardTitle" placeholder="Search...">
	            <input type="text" style="display: none;" value="${member.memIdx}" name="memIdx">
	            <input type="submit" class="btn btn-primary btn-flat" value="검색" />
	         </div>
		</form>
		
		<!-- 게시글 시작 -->
			<section id="card-list" class="card-list">
				<div class="card-body pb-1">
					<c:forEach var="row" items="${freeList}" >
						<div class="card" style="border:1px solid; border-radius: 0.5em;">
							<div class="card-body pb-1">
								<div class="media">
									<c:choose>
										<c:when test="${row.memPicture!=null}">								
											<img src="/resources/images/profile/${row.memPicture}"class="mr-2 rounded" alt="profile-image"
												style="width: 50px; height: 50px;" onerror="this.src ='/resources/images/pro.jpg'">
										</c:when>
										<c:otherwise>
											<img class="mr-2 rounded" src="/resources/images/pro.jpg" alt="Generic placeholder image" height="32">
										</c:otherwise>
									</c:choose>
									<div class="media-body">
										<div class="dropdown float-right text-muted">
											<a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown" aria-expanded="false">
												<i class="mdi mdi-dots-horizontal"></i>
											</a>
											<c:if test="${member.memIdx==row.memIdx}">	
												<div class="dropdown-menu dropdown-menu-right">
													<a href="javascript:location.href='/freeEdit?boardIdx=${row.boardIdx}';" class="dropdown-item"><i class="mdi mdi-pencil mr-1"></i>수정</a>
													<a href="javascript:location.href='/freeDelete?boardIdx=${row.boardIdx}';" 
														class="dropdown-item" onclick="return confirm('정말 삭제 하시겠습니까?');" ><i class="mdi mdi-delete mr-1"></i>삭제</a>
												</div>
											</c:if>									
										</div>
										<h5 class="m-0">${row.boardTitle}</h5>
										<p class="text-muted">
											<small>${row.memNm} <span class="mx-1">⚬</span> <span>${row.boardWrdate}</span></small>
										</p>
									</div>
								</div>
								<hr class="m-0" />
								<div data-simplebar style="max-height: 400px;">
									<div class="font-16 text-dark my-3">${row.boardCont}</div>
								</div>
							</div>
							<hr class="m-4" /><br />
							<!-- 게시물 바로밑 댓글 시작 -->
							<div data-simplebar style="max-height: 300px;">
								<div class="card" id="commList" >
									<c:forEach var="row2" items="${freeCommList}">
										<c:if test="${row.boardIdx==row2.boardIdx}">
											<div class="card-body pb-1">
												<div class="media">
													<c:choose>
														<c:when test="${row2.memPicture!=null}">								
															<img src="/resources/images/profile/${row2.memPicture}"class="mr-2 rounded" alt="profile-image"
																style="width: 50px; height: 50px;" onerror="this.src ='/resources/images/pro.jpg'">
														</c:when>
														<c:otherwise>
															<img class="mr-2 rounded" src="/resources/images/pro.jpg" alt="Generic placeholder image" height="32">
														</c:otherwise>
													</c:choose>
													<div class="media-body">
														<div class="dropdown float-right text-muted">
															<a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown" aria-expanded="false">
																<i class="mdi mdi-dots-horizontal"></i>
															</a>
															<c:if test="${member.memIdx==row2.memIdx}">	
																<div class="dropdown-menu dropdown-menu-right">
																	<a href="javascript:location.href='/freeCommDel?commIdx=${row2.commIdx}';" 
																		class="dropdown-item" onclick="return confirm('정말 삭제 하시겠습니까?');" ><i class="mdi mdi-delete mr-1"></i>삭제</a>
																</div>
															</c:if>									
														</div>
														<h5 class="m-0">${row2.memNm}</h5>
														<input type="text" class="form-control" value="${row2.commIdx}" name="commIdx" style="display: none;">
														<p class="text-muted mb-0">
															<small>${row2.commDate}</small>
														</p>
														<p class="my-1" id="commContUp">${row2.commCont}</p>
													</div>
												</div>
												<br /><hr />
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
							<!-- 내 댓글 입력 -->
							<form method="post" action="/freeCommWritePOST" onsubmit="fn_comm(this)">
								<div class="form-group" style="position: relative; left: 20px;">
									<div>
						                <span><strong>Comments</strong></span> <span id="cCnt"></span>
						            </div>
						            	<div class="card-body">
						            		<div class="row">
						            			<div class="form-group col-sm-10">
									           	 	<input type="text" class="form-control" value="${row.boardIdx}" name="boardIdx" style="display: none;">
										            <input type="text" class="form-control" id="commCont" name="commCont" placeholder="댓글 입력" />
												</div>
										        <div class="form-group col-sm-2">           	
							                    	<input type="submit" class="btn btn-light" id="commBtn" value="등록" 
						    	                		 style="position: relative; right: 20px;"/><br />
												</div>
											</div>
										</div>
									</div>
			                </form>
						</div>
						<!-- 게시물 내용 끝 -->
						<br>
						<br>
						<br>
					</c:forEach>
				</div>
			<!-- 게시물 끝 -->
			</section>
			<div class="paginaiton">paginaiton</div>
			<!-- 스크롤을 위한 div -->
		</div>




<script type="text/javascript">

// 댓글 등록 
function fn_comm(free_form) {

		event.preventDefault();
		console.log("댓글 등록 버튼 눌림?");
	
		var memIdx = ${member.memIdx};
		var boardIdx = free_form.boardIdx.value;
		var commCont = free_form.commCont.value;
	    
	    console.log("memIdx : " + memIdx);
	    console.log("boardIdx : " + boardIdx);
	    console.log("commCont : " + commCont);
	    
	    var v_data="memIdx="+memIdx+"&"+"boardIdx="+boardIdx+"&"+"commCont="+commCont;
	    
	    $.ajax({
	        type : "post",
	        url : "/freeCommWritePOST",
	        dataType : "json",
	        data : v_data,
	        success : function (data) {
	        	console.log("kkkkkk",data);
	            if (data != "" || data!=null || data!=" ") {
	               alert("댓글이 등록되었습니다.");
	               var html = '';
		               html += '<div class="card-body pb-1">';
		               html += '<div class="media">';
		               html += '<img class="mr-2 rounded" src="/resources/images/pro.jpg" alt="Generic placeholder image" height="32">';
		               html += '<div class="media-body">';
		               html += '<h5 class="m-0">' + data.info.memNm + '</h5>';
		               html += '<p class="text-muted mb-0">';
		               html += '<small>'+(new Date())+'</small>';
		               html += '</p>';
		               html += '<p class="my-1">'+commCont+'</p>';
		               html += '</div>';
		               html += '</div>';
		               html += '<br /><hr />';
		               html += '</div>';
	               
	               $("#commList").prepend(html);
	            }
	        }
	    });
}

</script>

<script src="/resources/assets/js/vendor/summernote-bs4.min.js"></script>
<!-- Summernote demo -->
<script src="/resources/assets/js/pages/demo.summernote.js"></script>

</body>
</html>