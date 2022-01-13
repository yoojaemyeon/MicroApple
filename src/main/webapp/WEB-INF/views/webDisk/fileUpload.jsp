<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="org.springframework.web.multipart.MultipartFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// MultipartRequest multi = new MultipartRequest(request, 
// 		"C:\\Users\\JH\\OneDrive\\바탕 화면\\대기만성\\fileupload",
// 		5 * 1024 * 1024,
// 		"UTF-8",
// 		new DefaultFileRenamePolicy()
// 		);
// Enumeration params = multi.getParameterNames();
// while(params.hasMoreElements()) {
//    // 요청 파라미터 이름
//    String name = (String)params.nextElement();
//    String value = multi.getParameter(name);
//    out.println(name + " = " + value + "<br>");
// }
// out.print("---------------------------<br>");
// // 요청 파라미터 중 파일을 전달받도록 MultipartRequest
// // 객체 타입의 getFileNames()메소드 사용
// Enumeration<?> files = multi.getFileNames();
// while(files.hasMoreElements()){
//    // name : input type="file" name="filename"의 filename
//    String name = (String)files.nextElement();
//    // 저장 파일 이름
//    String filename = multi.getFilesystemName(name);
//    // 실제 파일 이름
//    String original = multi.getFilesystemName(name);
//    // 파일 콘텐츠 타입
//    String type = multi.getContentType(name);
//    // 파일 객체
//    File file = multi.getFile(name);
//    out.println("요청 파라미터 이름 : " + name + "<br>");
//    out.println("저장 파일 이름 : " + filename + "<br>");
//    out.println("실제 파일 이름 : " + original + "<br>");
//    out.println("파일 콘텐츠 타입 : " + type + "<br>");
//    if(file != null) {
//       out.println("파일 크기 : " + file.length());
//       out.println("<br>");
//    }
// }

%>


<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<div class="col-xl-4 col-lg-5">

    <div class="card">
        <div class="card-body">
            <h5 class="card-title mb-3">파일 업로드</h5>

			<!-- form태그의enctype이란 form태그 안의 데이터가 서버로 제출될때 해당 데이터가 인코딩되는 방법을 명시함 -->
            <form name="fileUpload" method="post" enctype="multipart/form-data"
            	action="/">
                    <input name="file" type="file" />
            </form>

<!--             <form action="/" method="post" class="dropzone" id="myAwesomeDropzone" data-plugin="dropzone" data-previews-container="#file-previews" -->
<!--                 data-upload-preview-template="#uploadPreviewTemplate"> -->
<!--                 <div class="fallback"> -->
<!--                     <input name="file" type="file" /> -->
<!--                 </div> -->

<!--                 <div class="dz-message needsclick"> -->
<!--                     <i class="h3 text-muted dripicons-cloud-upload"></i> -->
<!--                     <h4>Drop files here or click to upload.</h4> -->
<!--                 </div> -->
<!--             </form> -->

<!--             Preview -->
<!--             <div class="dropzone-previews mt-3" id="file-previews"></div> -->

<!--          file preview template -->
<!--             <div class="d-none" id="uploadPreviewTemplate"> -->
<!--                 <div class="card mt-1 mb-0 shadow-none border"> -->
<!--                     <div class="p-2"> -->
<!--                         <div class="row align-items-center"> -->
<!--                             <div class="col-auto"> -->
<!--                                 <img data-dz-thumbnail src="#" class="avatar-sm rounded bg-light" alt=""> -->
<!--                             </div> -->
<!--                             <div class="col pl-0"> -->
<!--                                 <a href="javascript:void(0);" class="text-muted font-weight-bold" data-dz-name></a> -->
<!--                                 <p class="mb-0" data-dz-size></p> -->
<!--                             </div> -->
<!--                             <div class="col-auto"> -->
<!--                                 Button -->
<!--                                 <a href="" class="btn btn-link btn-lg text-muted" data-dz-remove> -->
<!--                                     <i class="dripicons-cross"></i> -->
<!--                                 </a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
            <!-- end file preview template -->


<!--             <div class="card my-1 shadow-none border"> -->
<!--                 <div class="p-2"> -->
<!--                     <div class="row align-items-center"> -->
<!--                         <div class="col-auto"> -->
<!--                             <div class="avatar-sm"> -->
<!--                                 <span class="avatar-title rounded"> -->
<!--                                     .ZIP -->
<!--                                 </span> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col pl-0"> -->
<!--                             <a href="javascript:void(0);" class="text-muted font-weight-bold">Hyper-admin-design.zip</a> -->
<!--                             <p class="mb-0">2.3 MB</p> -->
<!--                         </div> -->
<!--                         <div class="col-auto"> -->
<!--                             Button -->
<!--                             <a href="javascript:void(0);" class="btn btn-link btn-lg text-muted"> -->
<!--                                 <i class="dripicons-download"></i> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->

<!--             <div class="card mb-1 shadow-none border"> -->
<!--                 <div class="p-2"> -->
<!--                     <div class="row align-items-center"> -->
<!--                         <div class="col-auto"> -->
<!--                             <img src="assets/images/projects/project-1.jpg" class="avatar-sm rounded" alt="file-image" /> -->
<!--                         </div> -->
<!--                         <div class="col pl-0"> -->
<!--                             <a href="javascript:void(0);" class="text-muted font-weight-bold">Dashboard-design.jpg</a> -->
<!--                             <p class="mb-0">3.25 MB</p> -->
<!--                         </div> -->
<!--                         <div class="col-auto"> -->
<!--                             Button -->
<!--                             <a href="javascript:void(0);" class="btn btn-link btn-lg text-muted"> -->
<!--                                 <i class="dripicons-download"></i> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->

<!--             <div class="card mb-0 shadow-none border"> -->
<!--                 <div class="p-2"> -->
<!--                     <div class="row align-items-center"> -->
<!--                         <div class="col-auto"> -->
<!--                             <div class="avatar-sm"> -->
<!--                                 <span class="avatar-title bg-secondary rounded"> -->
<!--                                     .MP4 -->
<!--                                 </span> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col pl-0"> -->
<!--                             <a href="javascript:void(0);" class="text-muted font-weight-bold">Admin-bug-report.mp4</a> -->
<!--                             <p class="mb-0">7.05 MB</p> -->
<!--                         </div> -->
<!--                         <div class="col-auto"> -->
<!--                             Button -->
<!--                             <a href="javascript:void(0);" class="btn btn-link btn-lg text-muted"> -->
<!--                                 <i class="dripicons-download"></i> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->

        </div>
    </div>
</div>
</body>
</html>