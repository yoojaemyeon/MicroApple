<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">	
//승인 
$(function(){
	
	$("a[name='approvalOk']").each(function(index){
	    $(this).on('click', function(e){
	    	let memIdx = $(this).closest("tr").find(".memIdx").val();
	    	let deptNm = $(this).closest("tr").find(".deptNm").val();
	    	let positionNm= $(this).closest("tr").find(".positionNm").val();
	    	let memDvsn = $(this).closest("tr").find(".memDvsn").val();
// 	    	alert("클릭 : " + deptNm + "," + positionNm + "," + memDvsn + "," + index + '번 확인버튼')
			console.log(deptNm + "," + positionNm + "," + memDvsn + "," + index + '번 확인버튼');
			
			var new_form = $("<form></form>");
			new_form.attr("name", "test_form");
	        new_form.attr("method", "post");
	        new_form.attr("action", "/memDivisionsPost");
//		        new_form.attr("target", "_blank")
			
	        new_form.append($('<input/>', {type: 'hidden', name: 'memIdx', value: memIdx}));
	        new_form.append($('<input/>', {type: 'hidden', name: 'deptNm', value: deptNm}));
	        new_form.append($('<input/>', {type: 'hidden', name: 'positionNm', value: positionNm}));
	        new_form.append($('<input/>', {type: 'hidden', name: 'memDvsn', value: '2'}));
	        
	        new_form.appendTo('body');
	        
	        new_form.submit();
// 			alert("보내기");


		});
	}); 
});

//거부
$(function(){
	$("a[name='approvalDenial']").each(function(index){
	    $(this).on('click', function(e){
	    	let memIdx = $(this).closest("tr").find(".memIdx").val();
	    	let deptNm = $(this).closest("tr").find(".deptNm").val();
	    	let positionNm= $(this).closest("tr").find(".positionNm").val();
	    	let memDvsn = $(this).closest("tr").find(".memDvsn").val();
// 			alert(memIdx + "," + memDvsn + "," + index + '번 확인버튼');
			
			var new_form = $("<form></form>");
			new_form.attr("name", "test_form");
	        new_form.attr("method", "post");
	        new_form.attr("action", "/memDivisionsPost");
			
	        new_form.append($('<input/>', {type: 'hidden', name: 'memIdx', value: memIdx}));
	        new_form.append($('<input/>', {type: 'hidden', name: 'deptNm', value: null}));
	        new_form.append($('<input/>', {type: 'hidden', name: 'positionNm', value: null}));
	        new_form.append($('<input/>', {type: 'hidden', name: 'memDvsn', value: '3'}));
	        
	        new_form.appendTo('body');
	        
	        new_form.submit();

		});
	}); 
});

// 	options[target.selectedIndex].value

// 승인 거부 사유
	$(function(){
		
		// 등록 버튼 클릭을 하면 수정모드가 됨
		let reasonUpdateArr = $("a[name='reasonUpdate']");
		console.log("reasonUpdateArr.length : " + reasonUpdateArr.length);
		
		$("a[name='reasonUpdate']").each(function(index){
// 			
			$(this).click(function(e){
				console.log(index + '번 버튼');
				$("input[name='memDnreason']").eq(index).removeAttr("readonly");
				$("div[name='divEdit']").eq(index).css("display","none");
				$("div[name='divConfirm']").eq(index).css("display","block");
			});
		});
		
		$("a[name='reasonCancel']").each(function(index){
			$(this).click(function(e){
				console.log(index + '번 취소버튼');
				$("div[name='divEdit']").eq(index).css("display","block");
				$("div[name='divConfirm']").eq(index).css("display","none");
				$("input[name='memDnreason']").eq(index).attr("readonly", "readonly").val("${member.memDnreason}");
			});
		});
		
		//승인 거부 사유 수정
		$("a[name='reasonOk']").each(function(index){
			$(this).click(function(e){
				
				tr = $(this).parents("tr");
				let memId = $("input[name='memId']").eq(index).val();
				let memIdx = $("input[name='memIdx']", tr).val();
				let memDnreason = $("input[name='memDnreason']").eq(index).val();
// 				alert(index + " memIdx : " + memIdx);
// 				클릭했을 때 memNm과 DB의 memNm이 일치할 때,
// 				input의 memDnreason의 내용이 Controller로 가서 최종 DB에 update가 된다.
				console.log("memId : " + memId + ", memDnreason : " + memDnreason);
				console.log(index + '번 확인버튼');
				// 클릭한 영역의 체크박스(기본키) -> 체크하면 이메일
				// 이름, 사유를 controller로 보내도록
				var new_form = $("<form></form>");
				new_form.attr("name", "test_form");
		        new_form.attr("method", "post");
		        new_form.attr("action", "/memberApprovalDeny");
// 		        new_form.attr("target", "_blank")
				
		        new_form.append($('<input/>', {type: 'hidden', name: 'memIdx', value: memIdx}));
		        new_form.append($('<input/>', {type: 'hidden', name: 'memDnreason', value: memDnreason}));
		        
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
                                   		승인
                                    </li>
                                </ol>
                            </div>
                            <h4 class="page-title">승인</h4>
                        </div>
                    </div>
                </div>     



                <!-- 승인대기 목록 -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive col-12">
                                    <table class="scroll table table-centered table-striped dt-responsive nowrap w-100" id="products-datatable">
                                    	<h4>승인 대기</h4>
                                    	<div class="form-group row" style="float: right;">
	                                	</div>
	                                	
                                        <thead style="text-align: center;">
                                            <tr >
                                                <th style="width: 15px;" >이  름</th>
                                                <th class="col-lg-2" >연락처</th>
                                                <th class="col-lg-2" >이메일</th>
                                                <th class="col-lg-3" >부  서</th>
                                                <th class="col-lg-3">직  급</th>
                                                <th class="col-lg-2"></th>
                                            </tr>
                                        </thead>
                                        
                                        
                                        <form:form class="approvalMember" modelAttribute="member" id="approval" method="post" action="/memDivisionsPost">
	                                        <tbody data-simplebar >
	                                        	<!-- c태그 memDvsn eq 1인사람 리스트 반복 -->
	                                        	<c:forEach var="a" items="${list}" varStatus="stat">
	                                        		<c:if test="${a.memDvsn eq '1'}"  >
	
			                                            <tr style="text-align: center;">
			                                                <td style="width: 18px;" name="memNm"> ${a.memNm}</td>
			                                                <td >${a.memPh}</td>
			                                                <td >${a.memEm}</td>
			                                                
			                                                <td >
				                                                <select class="deptNm" name="deptNm" style="width: 160px;"
				                                                			class="custom-select custom-select-sm">
																    <option selected="selected" disabled="disabled" value="" style="text-align: center;">부서선텍</option>
																    <c:forEach items="${deptList}" var="dept" varStatus="stat">
																		<option>
																			<c:out value="${dept.deptNm}">
																				${dept.deptNm}
																			</c:out> 
																		</option>
																	</c:forEach>
																</select> 
															</td>
															
			                                                <td >
			                                                	<select class="positionNm" name="positionNm" style="width: 160px;"
	                                                					class="custom-select custom-select-sm" >
																    <option selected="selected" disabled="disabled" value="" style="text-align: center;">직급선택</option>
																    <c:forEach items="${positionList}" var="position" varStatus="stat">
																		<option>
																			<c:out value="${position.positionNm }">
																				${position.positionNm }
																			</c:out> 
																		</option>
																	</c:forEach>
																    
																</select> 
			                                                </td>
			                                                <td >
				                                                <div>
				                                                	<div>
<!-- 								                                    	<button type="button" class="btn btn-info" style="text-align: center; float: left;" >승인</button> -->
								                                    	<a href="javascript:void(0)" name="approvalOk" 
								                                    		style="margin: 5px; text-align: center; float: left;"  class="btn btn-info">승인</a> 
								                                    </div>
								                                    <div>
								                                    	<a href="javascript:void(0)" name="approvalDenial"
								                                    		style="margin: 5px; text-align: center;"  class="btn btn-secondary">거부</a> 
								                                    </div>
				                                                </div>
			                                                </td>
			                                                                           
				                                            <input class="memIdx" type="hidden" name="memIdx" value="${a.memIdx }" />
				                                            <input class="memDvsn" type="hidden" name="memDvsn" />
			                                            
			                                            </tr>
			                                            
	                                        		</c:if>
	                                        	</c:forEach>
	                                        </tbody>
                                        </form:form>
                                    </table>
                                </div>
                            </div> 
                        </div> <!-- end card-->
                    </div> <!-- end col -->
                </div><!-- 승인대기 목록 끝-->
                
                
                
                <!-- 승인 거부 목록 시작 -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive col-12">
                                    <table class="scroll table table-centered table-striped dt-responsive nowrap w-100" id="products-datatable">
                                   <h4>승인 거부</h4>
                                        <thead>
                                            <tr style="text-align: center;">
                                                <th ></th>
                                                <th ></th>
                                                <th style="text-align: left;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름</th>
                                                <th style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;연락처</th>
                                                <th style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일</th>
                                                <th style="text-align:center; width: 1000px;">사유</th>
                                                <th style="width: 10px;"></th>
                                            </tr>   
                                        </thead>     
                                        
                                        <form:form modelAttribute="member" id="denial" name="denial" method="post" action="/memberApprovalListPost"
                                        			 class="denialMember">
                                        	<tbody data-simplebar>
	                                        	<c:forEach var="a" items="${list}" varStatus="stat">
	                                        		<c:if test="${a.memDvsn eq '3'}"  >
				                                        <tr style="text-align: center;">
			                                                <td > ${a.memNm}</td>
			                                                <td >${a.memPh}</td>
			                                                <td >${a.memEm}</td>
			                                                <td style="width: 700px;">
			                                                	<form:input path="memDnreason" name="memDnreason" 
			                                                				readonly="true" class="form-control" placeholder="사유" value="${a.memDnreason}"
			                                                				style="float: left; width: 700px;"/>
			                                                	
			                                                </td>
			                                                <td >
			                                                	<div style="    justify-content: center;" class="form-group row" name="divEdit">
			                                                		<a href="javascript:void(0)" style="margin: 5px;" name="reasonUpdate" class="btn btn-secondary">등록</a>
			                                                	</div>
			                                                	<div class="form-group row" name="divConfirm" style="display:none;">
			                                                		<div>
			                                                		<a href="javascript:void(0)" style="margin: 5px; float: left;" name="reasonOk" class="btn btn-info">확인</a>
			                                                		</div>
			                                                		<div>
			                                                		<a href="javascript:void(0)" style="margin: 5px;" name="reasonCancel" class="btn btn-danger">취소</a>
			                                                		</div>
			                                                	</div>
			                                                
			                                                </td>
			                                                <input type="hidden" name="memIdx" value="${a.memIdx }" />
			                                            </tr>    
				                                            
	                                        		</c:if>
	                                        	</c:forEach>
                                        	</tbody>
                                        </form:form>
                                            
                                            
                                    </table>
                                </div>
                            </div> <!-- 승인대기 목록 끝-->
                        </div> <!-- end card-->
                    </div> <!-- end col -->
                </div><!-- 거부 목록 끝-->
            </div> <!-- container -->
        </div> <!-- content -->
	</div>
	<!-- END wrapper -->
	

</body>
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


