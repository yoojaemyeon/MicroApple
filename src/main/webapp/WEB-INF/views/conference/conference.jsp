<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

.list123 {text-decoration:none; color:#646464;}
/*  A:visited {text-decoration:none; color:#646464;} */
/*  A:active {text-decoration:none; color:#646464;} */
/*  A:hover {text-decoration:none; color:#646464;}  */
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesteet" href="/resources/bootstrap/css/bootstrap.css">
</head>
<body>
   <div class="content">
      <!-- Start Content-->
      <div class="container-fluid">
         <!-- start page title -->
         <div class="row">
			<div class="col-12">
				<div class="page-title-box">
					<div class="page-title-right">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb bg-light-lighten p-2 mb-0">
								<li class="breadcrumb-item"><a
									href="<%=request.getContextPath()%>/mainPage"><i
										class="uil-home-alt"></i>Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">회의록</li>
							</ol>
						</nav>
					</div>
					
					<div style="display: inline-block;">
						<h4 class="page-title">회의록</h4>
					</div>
            </div>
            </div>
         </div>
         <!-- end page title -->
    
         
         <div class="container">
            
            <form  class="form-inline" action="/searchConference" method="post">
               <div class="form-group mb-2" style="position: relative; left: 882px;">
                  <input type="search" class="form-control"  name="memNm" placeholder="Search...">
                  <div class="input-group-append-sm">
                     <button type="submit" class="btn btn-primary btn-flat">검색</button>
                  </div>
               </div>
            </form>
            
            
            <br />
            <!--       <table class="table table-striped"> -->
            <table class="table table-sm">
                  <thead style="text-align: center;">
                     <tr>
                        <th style="width: 250px;">번호</th>
                        <th style="width: 250px;">제목</th>
                        <th style="width: 250px;">작성자</th>
                        <th style="width: 200px;">날짜</th>
                     </tr>
                  </thead>
                  <tbody style="text-align: center;">
                     <c:forEach var="row" items="${conferencePage.content}" varStatus="varStatus">
                           <tr>
                              <td>${row.RNUM } </td>
                              <td><a class="list123" href="/conferenceDetail?mtngIdx=${row.MTNG_IDX }">${row.MTNG_TITLE }</a></td>
                              <td>${row.MEM_NM }</td>
                              <td>${row.MTNG_DATE }</td>
                           </tr>
                     </c:forEach>
                  </tbody>
            </table>
            <hr />
                 <div class="row">
               <div class="col-sm-12 col-md-5" >
                  <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
                  </div>
               </div>
               <div class="col-sm-12 col-md-7">
                  <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                     <ul class="pagination mb-0">
                        <li class="paginate_button page-item previous <c:if test='${conferencePage.startPage<=5}'>disabled</c:if>" id="dataTable_previous"><a href="/conference?currentPage=${conferencePage.startPage-5}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"> 이전 </a></li>
                        <c:forEach var="pNo" begin="${conferencePage.startPage}" end="${conferencePage.endPage}">
                           <li class="paginate_button page-item <c:if test='${param.currentPage eq pNo}'> active</c:if>"><a href="/conference?currentPage=${pNo}" aria-controls="dataTable" data-dt-idx="${pNo}" tabindex="0" class="page-link"> ${pNo} </a></li>
                        </c:forEach>
                        
                        <li class="paginate_button page-item next <c:if test='${conferencePage.endPage >= conferencePage.totalPages}'>disabled</c:if>" id="dataTable_next"><a href="/conference?currentPage=${conferencePage.startPage+5}" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link"> 다음 </a></li>
                     </ul>
            <button type="button" onclick="javascript:location.href='/ConferenceWrite';" class="btn btn-secondary" style="float: right;">작성</button>
                  </div>
               </div>
            </div>
            <br />
         </div>
         
      </div>
   </div>
      
   <script type="/resources/jquery-3.6.0.js"></script>
   <script type="/resources/bootstrap/js/bootstrap.js"></script>
</body>
</html>