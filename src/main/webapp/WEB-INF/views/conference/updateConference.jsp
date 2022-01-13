<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/assets/css/vendor/summernote-bs4.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>자유게시판 게시글 작성</title>
</head>
<body>

   <div class="page-title-box">
      <div class="page-title-right">
         <ol class="breadcrumb m-0">
            <li class="breadcrumb-item"><a href="javascript:location.href='/mainPage';">Home</a></li>
            <li class="breadcrumb-item"><a href="/conference">회의록</a></li>
            <li class="breadcrumb-item">수정</li>
         </ol>
      </div>
      <h2 class="page-title">회의록</h2>
   </div>

   <div class="card-body">
      <div class="row mb-2" style="position: relative; right: 20px;">
         <div class="col-lg-8">
            <form class="form-inline">
               <div class="form-group mb-2"></div>
            </form>
         </div>
         <div class="col-lg-4">
            <div class="text-lg-right">

            </div>
         </div>
         <!-- end col-->
      </div>

      <!-- 게시글 작성 폼 시작 -->
      <form method="post" action="/updateConference" enctype="multipart/form-data">
         <div class="container">
            <div class="row">
               <!--          <form method="post" action="writeAction.jsp"> -->
               <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                  <thead>
                     <tr>
                        <th colspan="2" style="background-color: #eeeeee; text-align: center;">회의록</th>
                     </tr>
                     <tr>
                        <td>
                          <input type="text" value="${member.memNm}" name="memNm" style="display: none;">
                          <input type="text" value="${detail.mtngIdx}" name="mtngIdx" style="display: none;">
                          <input type="text" value="${member.memIdx}" name="memIdx" style="display: none;">
                          <input type="text" class="form-control" value="${detail.mtngTitle}" placeholder="회의 제목" name="mtngTitle">
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <input type="file" class="form-control"  placeholder="파일" name="file" >
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <input type="text" class="form-control" value="${detail.mtngResults}" placeholder="회의 결과" name="mtngResults">
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <textarea id="summernote-basic" name="mtngCont"><c:out value="${detail.mtngCont}"></c:out> </textarea>
                        </td>
                     </tr>
                  </thead>
               </table>
               <br />
            </div>
         </div>
      <input type="submit" class="btn btn-secondary" value="등록" >
   </form>
</div>
<script src="/resources/assets/js/vendor/summernote-bs4.min.js"></script>
<!-- Summernote demo -->
<script src="/resources/assets/js/pages/demo.summernote.js"></script>

</body>
</html>