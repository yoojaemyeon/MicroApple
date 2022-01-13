<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 쓰기</title>
</head>
<body>



            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

                    <!-- Start Content-->
                    <div class="container-fluid">
                        <!-- start page email-title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">메인</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">메일</a></li>
                                            <li class="breadcrumb-item active">메일쓰기</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">메일쓰기</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page email-title --> 
                        <div class="row">
                            <!-- Right Sidebar -->
                            <div class="col-12">
                                <div class="card" style="min-height: 735px; max-height: 735px; border:1px solid; border-radius: 0.5em;">
                                    <div class="card-body">
                                        <!-- Left sidebar -->
                                       <jsp:include page="/WEB-INF/views/mail/mailPageAside.jsp" flush="true"/>
                                        <!-- End Left sidebar -->
                                        <div class="page-aside-right">
                                            <div>
												<h3>외부 메일 쓰기</h3>
												<hr>
											</div>



	<form action="/sendEmail" class="mailSend" method="post" enctype="multipart/form-data">
	
<br>

		<table>
			<tr>
				<td>
					<input type="text" name="toMail" placeholder="받는사람 이메일" class="form-control">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="mailTitle" size="120" style="width: 100%" placeholder="제목을 입력해주세요" class="form-control">
				</td>
			</tr>
			<tr>
				<td>
					<textarea name="mailContent" cols="120" rows="12"
					style="width: 100%; resize: none" placeholder="내용"
					class="form-control"></textarea>
				</td>
			</tr>
		</table>
			<div>
				<input type="file" name="uploadFile" id="uploadFile" multiple>
			</div>
		<p>
		<div>
			<input type="submit" value="메일 보내기" class="btn btn-warning">
		</div>
	</form>

	



                                            <!-- end row-->
                                        </div> 
                                        <!-- end inbox-rightbar-->
                                    </div>
                                    <!-- end card-body -->
                                    <div class="clearfix"></div>
                                </div> <!-- end card-box -->
                            </div> <!-- end Col -->
                        </div><!-- End row -->
                    </div> <!-- container -->

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


	

	

	<script type="text/javascript">
		var fileValue = $("#uploadFile").val().split("\\");
		var fileName = fileValue[fileValue.length - 1]; // 파일명
	</script>



</body>
</html>