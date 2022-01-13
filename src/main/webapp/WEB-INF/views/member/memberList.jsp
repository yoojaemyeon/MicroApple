<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	// 퇴직처리
	
		$("a[name='retirement']").each(function(index){
			$(this).on('click', function(e){
// 					$("#danger-header-modal").modal("show");
				if(confirm("퇴사 처리 하시겠습니까?") == true){
				   } else{ 
					   
					   return;}
				let memIdx = $(this).closest("tr").find(".memIdx").text();
				//alert("사원번호 : " + memIdx);
		    	
		    	// 				클릭했을 때 memNm과 DB의 memNm이 일치할 때,
// 				input의 memDnreason의 내용이 Controller로 가서 최종 DB에 update가 된다.
// 				alert("memIdx : " + memIdx );
				console.log("memIdx : " + memIdx);
				console.log(index + '번 확인버튼');
				// 클릭한 영역의 체크박스(기본키) -> 체크하면 이메일
				// 이름, 사유를 controller로 보내도록
				var new_form = $("<form></form>");
				new_form.attr("name", "test_form");
		        new_form.attr("method", "post");
		        new_form.attr("action", "/retirementPost");
				
		        new_form.append($('<input/>', {type: 'hidden', name: 'memIdx', value: memIdx}));
		        new_form.append($('<input/>', {type: 'hidden', name: 'memDvsn', value: '4'}));
		        
		        new_form.appendTo('body');
		        
		        new_form.submit();
			});
		});
	
});
	</script>

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
                                   		사원 목록
                                    </li>
                                </ol>
                            </div>
                            <h4 class="page-title">사원 목록</h4>
                        </div>
                    </div>
                </div>     


                
                <!-- 사원 회원 목록 시작 -->
                <div class="row" id="tabcontent">
                    <div class="col-12">
                    
                    <div class="card" >
                    
                    

                    
                        <div class="card" style="height: 715px;">
               						
                        	<!-- 승인 직원 목록 -->
                            <div class="card-body" style="height: 700px; padding: 0px;">
			                    <ul class="nav nav-tabs mb-3">
			                    
			                    
								    <li class="nav-item">
								        <a href="javascript:void(0)"  data-toggle="tab" aria-expanded="true" class="nav-link active">
								            <i class="mdi mdi-member-circle d-md-none d-block"></i>
								            <span class="d-none d-md-block">직원 목록</span>
								        </a>
								    </li>
								    
								    <li class="nav-item">
								        <a href="/retirementList"  aria-expanded="false" class="nav-link">
								        	
			<!-- 					            <i class="mdi mdi-retirement-circle d-md-none d-block"></i> -->
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
<!--                                     <h4>직원 목록</h4> -->
                                        <thead>
                                            <tr style="text-align: center;">
<!--                                                 <th style="width: 20px; text-align: center;"> -->
<!--                                                     <div class="custom-control custom-checkbox"> -->
<!--                                                         <input type="checkbox" class="custom-control-input" id="customCheck5"> -->
<!--                                                         <label class="custom-control-label" for="customCheck1">&nbsp;</label> -->
<!--                                                     </div> -->
<!--                                                 </th> -->
                                                <th>부서</th>
                                                <th>직급</th>
                                                <th>이름</th>
                                                <th>사번</th>
                                                <th>연락처</th>
                                                <th>이메일</th>
                                                <th>입사날짜</th>
                                                <th>우편번호</th>
                                                <th>주소</th>
<!--                                                 <th></th> -->
                                                <th></th>
                                            </tr>
                                        </thead>
                                         <form:form modelAttribute="member" id="memberList" name="memberList" method="post" action="/retirementPost">
                                        <tbody>
                                        <!-- c태그 memDvsn eq 2인사람 리스트 반복 -->
                                        	<c:forEach var="a" items="${list}" varStatus="stat">
                                        		<c:if test="${a.memDvsn eq '2'}"  >
													<tr style="text-align: center;">
<!-- 		                                                <td style="width: 20px; text-align: center;"> -->
<!-- 		                                                    <div class="custom-control custom-checkbox"> -->
<!-- 		                                                        <input type="checkbox" class="custom-control-input" id="Check"> -->
<!-- 		                                                        <label class="custom-control-label" for="customCheck2">&nbsp;</label> -->
<!-- 		                                                    </div> -->
<!-- 		                                                </td> -->
		                                                <td style="width: 30px; padding: 0px;" name="deptNm" class="deptNm">${a.deptNm}</td>
                                                      <td style="width: 30px;  padding: 0px;" name="positionNm" class="positionNm">${a.positionNm}</td>
                                                      <td style="width: 30px;  padding: 0px;" name="memNm" class="memNm">${a.memNm }</td>
                                                      <td style="width: 40px;  padding: 0px;" name="memIdx" class="memIdx">${a.memIdx }</td>
                                                      <td style="width: 40px;  padding: 0px;" name="memPh" class="memPh">${a.memPh }</td>
                                                      <td style="width: 40px;  padding: 0px;" name="memEm" class="memEm">${a.memEm }</td>
                                                      <td style="width: 40px;  padding: 0px;" name="memStart" class="memStart">${a.memStart}</td>
                                                      <td style="width: 40px;  padding: 0px;" name="memZipcode" class="memZipcode">${a.memZipcode}</td>
                                                      <td style="text-align: left;  padding: 0px;" name="memAddr1 memAddr2" class="memAddr1 memAddr2">${a.memAddr1 }, ${a.memAddr2 }</td>
<!--                                                       <td></td> -->
                                                      <td style="padding: 0px; padding-left: 40px">
                                                         <div>
                                                         <a href="javascript:void(0)" name="retirement" 
                                                               style="margin: 5px; text-align: center; float: center;" data-target="#danger-header-modal" class="btn btn-dark" disabled>퇴사</a> 
                                                         </div>
                                                      </td>
<!--                                                       <input class="memDvsn" type="hidden"  name="memDvsn" /> -->
                                                  </tr>
		                                            
                                        		</c:if>
                                        	</c:forEach>
                                            
                                        </tbody>
                                        </form:form>


									</table>
                                </div>
                            </div>
							<nav aria-label="Page navigation example">
								<div class="col-sm-12 " style="text-align: center;">
<!-- 									<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite"> -->
<%-- 										Showing ${pageMaker.cri.pageNum*3-2} to ${pageMaker.cri.pageNum*3} of ${pageMaker.total} entries --%>
<!-- 									</div> -->
								</div>
							
								<ul class="pagination justify-content-center">
									<c:if test="${pageMaker.prev}">
										<li class="paginate_button page-item">
										
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
										<li class="paginate_button page-item next" <c:if test="${pageMaker.next}"> disabled</c:if>>
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
}).resize(); 
// Trigger resize handler
</script>


