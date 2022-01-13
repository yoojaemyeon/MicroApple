<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<body class="loading" data-layout-config='{"leftSideBarTheme":"dark","layoutBoxed":false, "leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false, "showRightSidebarOnStart": true}'>
	    <!-- Begin page -->
	<div class="wrapper">
        <div class="content">
            <!-- Start Content-->
            <div class="container-fluid">
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
									<li class="breadcrumb-item">
										<a href="<%=request.getContextPath()%>/mainPage">
											<i class="uil-home-alt"></i> 
                                       		Home
										</a>
                                    </li>
									<li class="breadcrumb-item active">
                                   		퇴직 직원 목록
                                    </li>
                                </ol>
                            </div>
                            <h4 class="page-title">사원 목록</h4>
                        </div>
                    </div>
                </div>     

                
                <!-- 퇴직사원 회원 목록 시작 -->
                <div class="row">
                    <div class="col-12">
                    
                    <div class="card">

                    
                        <div class="card" style="height: 715px">
                        	<!-- 승인 직원 목록 -->
                            <div class="card-body" style="height: 700px; padding: 0px;">
			                    <ul class="nav nav-tabs mb-3">
			                    
								    <li class="nav-item">
								        <a href="/memberList"   aria-expanded="false" class="nav-link">
								            <i class="mdi mdi-member-circle d-md-none d-block"></i>
								            <span class="d-none d-md-block">직원 목록</span>
								        </a>
								    </li>
								    <li class="nav-item">
								        <a href="javascript:void(0)"  data-toggle="tab" aria-expanded="true" class="nav-link active">
								        	
								            <span class="d-none d-md-block">퇴직 직원 목록</span>
								        </a>
								    </li>
			                    </ul>
                                <div style="height: 700px;" class="table-responsive col-12">
                                   
										 <!-- 검색창 -->
								            <form  class="form-inline" action="/searchConference" method="post">
								               <div class="form-group mb-2" style="position: relative; left: 1300px;">
								                  <input type="search" class="form-control"  name="memNm" placeholder="Search...">
								                  <div class="input-group-append-sm">
								                     <button type="submit" class="btn btn-primary btn-flat">검색</button>
								                  </div>
								               </div>
								            </form>
                                <!-- 검색창끝 -->
                                    
                                    <table class="table table-centered table-striped dt-responsive nowrap w-100 tabcontent" id="products-datatable">
<!--                                     <h4>퇴직 사원 목록</h4> -->
                                        <thead>
                                            <tr style=" text-align: center;">
<!--                                                 <th style="width: 20px; text-align: center;"> -->
<!--                                                     <div class="custom-control custom-checkbox"> -->
<!--                                                         <input type="checkbox" class="custom-control-input" id="customCheck5"> -->
<!--                                                         <label class="custom-control-label" for="customCheck1">&nbsp;</label> -->
<!--                                                     </div> -->
<!--                                                 </th> -->
                                                <th style="width: 25px;  padding: 0px; text-align: center; padding: 0px;">부서</th>
                                                <th style="width: 25px;  padding: 0px; text-align: center; padding: 0px;">직급</th>
                                                <th style="width: 25px;  padding: 0px; text-align: center; padding: 0px;">이름</th>
                                                <th style="width: 30px;  padding: 0px; text-align: center; padding: 0px;">사번</th>
                                                <th style="width: 30px;  padding: 0px; text-align: center; padding: 0px;">연락처</th>
                                                <th style="width: 30px;  padding: 0px; text-align: center; padding: 0px;">이메일</th>
                                                <th style="width: 30px;  padding: 0px; text-align: center; padding: 0px;">퇴사날짜</th>
                                                <th style="width: 25px;  padding: 0px; text-align: center; padding: 0px;">우편번호</th>
                                                <th  class="col-lg-5" >주소</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <!-- c태그 memDvsn eq 2인사람 리스트 반복 -->
                                        	<c:forEach var="a" items="${list}" varStatus="stat">
                                        	<script>console.log('${a.memDvsn}');</script>
                                        		<c:if test="${a.memDvsn eq '4'}" >
													<tr >
		                                                <td style="width: 25px;text-align: center; padding: 0px;">${a.deptNm}</td>
		                                                <td style="width: 25px;text-align: center; padding: 0px;">${a.positionNm}</td>
		                                                <td style="width: 25px;text-align: center; padding: 0px;">${a.memNm }</td>
		                                                <td style="width: 30px;text-align: center; padding: 0px;">${a.memIdx }</td>
		                                                <td style="width: 30px;text-align: center; padding: 0px;">${a.memPh }</td>
		                                                <td style="width: 30px;text-align: center; padding: 0px;">${a.memEm }</td>
		                                                <td style="width: 30px;text-align: center; padding: 0px;">${a.memEnd }</td>
		                                                <td style="width: 25px;text-align: center; padding: 0px;">${a.memZipcode}</td>
		                                                <td style=" padding: 9px;"> ${a.memAddr1 }, ${a.memAddr2 }</td>
<!-- 		                                                 <input class="memDvsn" type="hidden"  name="memDvsn" /> -->
		                                            
                                        		</c:if>
                                        	</c:forEach>
                                        </tbody>
									</table>
                                </div>
                            </div>
							<nav aria-label="Page navigation example">
<!-- 								<div class="col-sm-12 " style="text-align: center;"> -->
<!-- 									<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite"> -->
<%-- 										Showing ${pageMaker.cri.pageNum*10-9} to ${pageMaker.cri.pageNum*10} of ${pageMaker.total} entries --%>
<!-- 									</div> -->
<!-- 								</div> -->
							
								<ul class="pagination justify-content-center">
									<c:if test="${pageMaker.prev}">
										<li class="paginate_button page-item"   >
										
											<a class="page-link" href="${pageMaker.startPage-1}" aria-label="dataTable" tabindex="-1">
												이전
											</a>
							            </li>
						            </c:if>
							
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<li class="paginate_button  page-item ${pageMaker.cri.pageNum == num ? 'active' :''}">
							            	<a class="page-link" href="${num}" aria-controls="dataTable" data-dt-idx="${num}">
							            		${num}
							            	</a>
							            </li>
									</c:forEach>
									<c:if test="${pageMaker.next}">
										<li class="paginate_button page-item next" <c:if test="${pageMaker.next}"> disabled</c:if>">
											<a class="page-link" href="${pageMaker.endPage+1}" aria-label="Next">
												다음
											</a>
							            </li>
						            </c:if>
								</ul>
							
								<form id="actionForm" action="/memberList" method="get">
									<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
								    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
								</form>
							</nav>
                        </div> <!-- end card-->
                        
                        
                        
                        </div>
                        
                        
                    </div> <!-- end col -->
                </div><!--  목록  끝-->
            </div> <!-- container -->
        </div> <!-- content -->
	</div>
	<!-- END wrapper -->
	

</body>
<script>
$(document).ready(function(){
	
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click",function(e){
	
		e.preventDefault();
	    actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	    actionForm.submit();
	});
});
</script>
<style>
table{
	white-space: nowrap;
/* 	width: 2%; */
    }
table.scroll {
/*        width: 100%; /* Optional */    */
      border-collapse: collapse; 
     border-spacing: 0; 
}

table.scroll tbody,
table.scroll thead { display: block; }


table.scroll tbody {
    height: 250px;
    width: auto;
    overflow-y: auto;
    overflow-x: hidden;
}


  tbody td{  
       width: 20%; /* Optional */  
  }  

tbody td:last-child, thead th:last-child {
     border-right: none; 
}
</style>


<script>
//Change the selector if needed
var $table = $('table.scroll'),
    $bodyCells = $table.find('tbody tr:first').children(),
    colWidth;

// Adjust the width of thead cells when window resizes
$(window).resize(function() {
    // Get the tbody columns width array
    colWidth = $bodyCells.map(function() {
        return $(this).width();
    }).get();
    
    // Set the width of thead columns
    $table.find('thead tr').children().each(function(i, v) {
        $(v).width(colWidth[i]);
    });    
}).resize(); // Trigger resize handler
</script>


