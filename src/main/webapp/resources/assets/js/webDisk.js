/** 목록영역 우클릭 */
$(document).ready(function(){ 
	/**해당영역에서만 contextmenu 생성*/
	$('#content_frame').contextmenu(function(e){
		var idx = $('#folder_idx').val();
		console.log("폴더상세내역에서 우클릭했을때");
		console.log(idx);
		var checkVal = $("#file_idx").val();	//check된 값의 value값 가져오기
		console.log(checkVal);
		//modal-title4 ==> 파일업로드
		if($('.modal-title4')){	
			$("#webUptoIdx").val(idx);
		}
		
		var originNm = $('#originFileNm').val();
		console.log("파일 저장명");
		console.log(originNm);
		
		
		//Get window size: 
		var winWidth = $(document).width(); 
		var winHeight = $(document).height(); 
		//Get pointer position: 
		var posX = e.pageX; 
		var posY = e.pageY; 
		//Get contextmenu size: 
		var menuWidth = $("#contextmenu_content").width(); 
		var menuHeight = $("#contextmenu_content").height(); 
		//Security margin: 
		var secMargin = 10;
		//Prevent page overflow: 
		//Case 1: right-bottom overflow: 
		if(posX + menuWidth + secMargin >= winWidth && posY + menuHeight + secMargin >= winHeight){ 
			posLeft = posX - menuWidth - secMargin + "px"; 
			posTop = posY - menuHeight - secMargin + "px"; 
		}else if(posX + menuWidth + secMargin >= winWidth){ 	//Case 2: right overflow: 
			posLeft = posX - menuWidth - secMargin + "px"; 
			posTop = posY + secMargin + "px";
		}else if(posY + menuHeight + secMargin >= winHeight){ //Case 3: bottom overflow: 
			posLeft = posX + secMargin + "px"; 
			posTop = posY - menuHeight - secMargin + "px"; 
		}else{ 												//Case 4: default values: 
			posLeft = posX + secMargin + "px"; 
			posTop = posY + secMargin + "px"; 
		}; 
		$("#contextmenu_content").css({ 				//Display contextmenu: 
			"left": posLeft, 
			"top": posTop 
		}).show(); 
		//Prevent browser default contextmenu. 
		return false; 
		
	}); 
	$(document).click(function(){ 		//Hide contextmenu: 
		$("#contextmenu_content").hide(); 
	});
}); 

//1MB(메가바이트)는 1024KB(킬로바이트)
var maxSize = 2048;
function fileCheck() {
	//input file 태그.
	var file = document.getElementById('fileInput');
	//파일 경로.
	var filePath = file.value;
	console.log('파일 경로 : ' + filePath);
	//전체경로를 \ 나눔.
	var filePathSplit = filePath.split('\\'); 
	//전체경로를 \로 나눈 길이.
	var filePathLength = filePathSplit.length;
	//마지막 경로를 .으로 나눔.
	var fileNameSplit = filePathSplit[filePathLength-1].split('.');
	//파일명 : .으로 나눈 앞부분
	var fileName = fileNameSplit[0];
	//파일 확장자 : .으로 나눈 뒷부분
	var fileExt = fileNameSplit[1];
	//파일 크기
	var fileSize = file.files[0].size;

	console.log('파일명 : ' + fileName);
	console.log('파일 확장자 : ' + fileExt);
	console.log('파일 크기 : ' + fileSize);
}

/** 파일업로드 후 썸네일 */
$('#img_file').change(function(e){		
	   var reader = new FileReader();		
	   reader.readAsDataURL(e.target.files[0]);		
	 
	   reader.onload = function  () {
	       var tempImage = new Image();		
	       tempImage.src = reader.result;
	       tempImage.onload = function () {
	            var canvas = document.createElement('canvas');
	            var canvasContext = canvas.getContext("2d");
	 
	            canvas.width = 100; 
	            canvas.height = 100;
	 
	            canvasContext.drawImage(this, 0, 0, 100, 100);
	 
	            var dataURI = canvas.toDataURL("image/jpeg");
	 
	            var imgTag = "<img id='PREVIEW_IMG' style='width: 35%;' src='"+dataURI+"'/>";
	            $("#PREVIEW_IMG_DIV").append(imgTag);
	        };
	    };
	});
