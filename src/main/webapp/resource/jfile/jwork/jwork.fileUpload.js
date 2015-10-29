if(jwork == undefined) var jwork = {};

var _fileType = "all";
/**
 * 생성자 
 * @param elementId	파일업로드 컴포넌트를 삽입할 위치의 ID 
 * @param ctx		웹 컨텐츠 root 명
 * @param fileId	서버에 저장되어 있는 파일을 가져올 경우 사용되는 fileId, null일 경우 업로드용으로 사용한다.		
 * @param options	fileUpload에 필요한 option 집합
 */
if(jwork.fileUpload == undefined)
jwork.fileUpload = function(elementId, ctx, fileId, options){
	// 필수 데이터 
	this.elementId = elementId;
	this.ctx = ctx;

	// options
	this.initProperties(ctx);
	if(options) {
		this.setOptions(options);
	}

	if(options.fileType == "image"){
		this.htmlUrl = this.ctx+"/jfile/jfileImageuploadForm.do";
		_fileType = options.fileType;
	}
	
	// HTML 로드 
	this.initHtml();
	
	// SWF 셋팅
	this.initSwf();
	// 수정 모드일 경우 서버에서 파일 리스트 가져오기
	if(fileId && fileId != 'null') {
		this.fileId = fileId;
		this.getFileList();
	}
	//this.debugProperties();
};

//////////////////////////////// Static Area ////////////////////////////////
/**
 * swfUpload Flash Player 로드 전
 * @return 
 */
jwork.fileUpload.swfPreLoadHandler = function() {
	if (!this.support.loading) {
		alert("9.028 이상의 Flash Player가 필요합니다.");
		return false;
	}
};

/**
 * swfUpload Flash Player 로드 중 에러 발생시
 * @return
 */
jwork.fileUpload.swfuploadLoadFailedHandler = function() {
	alert("Flash Player 로드 중 에러가 발생했습니다.\n관리자에게 문의하십시오.");
};

/**
 * swfUpload 파일 선택 Dialog를 열기 전
 */
jwork.fileUpload.fileDialogStartHandler = function() {
};

/**
 * SwfUpload를 이용하여 멀티 파일 선택시
 * @param file	SwfUpload가 전달하는 file 정보를 담은 객체 
 * @return
 */
jwork.fileUpload.fileQueueHandler = function(swfFile) {
	if(_fileType == "image"){
		$("#" + this.elementId).find(".cen img").trigger( "click" );	
	}	
	
	this.fileUploadRef.appendFileRow(swfFile);
};

/**
 * swfUpload가 파일을 큐에 넣는 과정에서 실패시
 * @param file 		실패한 파일
 * @param errorCode	에러 코드
 * @param message	swfUpload가 던져 주는 에러에 대한 추가 정보
 * @return
 */
jwork.fileUpload.fileQueueErrorHandler = function(file, errorCode, message) {
	try {
		if (errorCode === SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED) {
			alert("파일 갯수에 문제가 있습니다.\n파일을 " + this.fileUploadRef.maxFileCount + "개 이하로 선택하셔야 합니다."); 
			return;
		}

		switch (errorCode) {
		case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
			alert("파일의 크기가 너무 큽니다.\n최대 " + this.fileUploadRef.maxFileSize + "MB까지 올릴수 있습니다.");
			this.debug("Error Code: 파일의 크기가 너무 큽니다., File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
			alert("파일이 0 byte보다 커야 합니다.");
			this.debug("Error Code: 파일이 0 byte보다 커야 합니다., File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
			alert("파일 타입이 잘못되었습니다.\n지원되는 파일 타입인지 확인하여 주십시오.");
			this.debug("Error Code: 파일 타입이 잘못되었습니다. 지원되는 파일 타입인지 확인하여 주십시오., File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
			alert("파일 최대 제한 갯수보다 많은 파일을 선택하였습니다.\n" +  (message > 1 ? "앞으로 최대 " +  message + "개까지 추가할수 있습니다." : "더 이상 파일을 추가할수 없습니다."));
			break;
		default:
			if (file !== null) {
				alert("파일을 큐에 넣는 과정에서 오류가 발생하였습니다.\n관리자에게 문의하여 주십시오.");
			}
			this.debug("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		}
	} catch (ex) {
        this.debug(ex);
    }
};

/**
 * 파일 선택후 Dialog가 닫힐 때
 * @param numFilesSelected	선택된 파일 갯수
 * @param numFilesQueued
 * @return	
 */
jwork.fileUpload.fileDialogCompleteHandler = function(numFilesSelected, numFilesQueued) {
	try {
		/* 파일 선택후 자동으로 업로드 시작하게 하려면 주석 해제 */
//		this.startUpload();
	} catch (ex)  {
        this.debug(ex);
	}
};

/**
 * 업로드 시작
 * @param file 업로드할 파일
 * @return 
 */
jwork.fileUpload.uploadStartHandler = function(file) {
	try {
		this.startUpload();
		jQuery("#deleteButton_" + file.id).remove();
	}
	catch (ex) {
	}
	
	return true;
};

/**
 * 파일 삭제 버튼 클릭시 
 * @param fileUploadObj 삭제하려는 파일을 관리하는 fileUpload 객체
 * @return
 */
jwork.fileUpload.cancelUploadHandler = function(event, imgButton) {
	var fileUploadObj = event.data.fileUploadObj;
	fileUploadObj.deleteFileItem(imgButton);
};

/**
 * 파일 업로드 상태
 * @param file			업로드 중인 파일 
 * @param bytesLoaded	업로드한 파일 크기
 * @param bytesTotal	파일 전체 크기
 * @return
 */
var fileCount = 0;
var tempFileId;
var fileTotalCount = 0;
jwork.fileUpload.uploadProgressHandler = function(file, bytesLoaded, bytesTotal) {
	try {
		if(fileCount == 0){
			progressBar.fileuploadStart();
			var fileAreaTable = jQuery("#" + this.elementId).find("#tx_attach_list");
			fileTotalCount = fileAreaTable.find(".progressBarInProgress").length;
		}
		
		if(file.id != tempFileId){
			fileCount++;
			$("#tx_upload_progress p").text("파일을 업로드하는 중입니다.(" + fileTotalCount + "/" + fileCount + ")");
		}
		
		var percent = Math.ceil((bytesLoaded / bytesTotal) * 100);

//		var progressContainer = fileAreaTable.find("#progressBar_"+file.id);
//		var progressBarInProgress = jQuery(fileAreaTable.find("div.progressBarInProgress").get(0));
//		progressBarInProgress.width(percent + "%");
		
		$("#tx_upload_progress div").width(percent - 10 + "%");
		$("#tx_upload_progress div").text(percent - 10 + "%");
		
		tempFileId = file.id;
//		progressBar.fileuploadStart();
	} catch (ex) {
		this.debug(ex);
	}
};

/**
 * 파일 업로드 성공
 * @param file			업로드한 파일 
 * @param serverData	서버 응답 데이터
 */
jwork.fileUpload.uploadSuccessHandler = function(file, serverData) {
	try {
		var data = JSON.parse(serverData);
		if(data.JsonResultCode == "failure") {
			this.cancelQueue();
			alert("파일을 전송하는 중에 에러가 발생하였습니다.\n관리자에게 문의하십시오.");
		}
	} catch (ex) {
		this.debug(ex);
	}
};

/**
 * 업로드 완료시 
 * @param file SwfUpload가 전달하는 file 정보를 담은 객체 
 * @return
 */
jwork.fileUpload.uploadCompleteHandler = function(file) {
	var fileAreaTable = jQuery("#" + this.elementId).find("#tx_attach_list");
	var progressContainer = fileAreaTable.find("#progressBar_"+file.id);
	var progressBarInProgress = jQuery(progressContainer.find(".progressBarInProgress").get(0));
	progressBarInProgress.removeClass("progressBarInProgress").addClass("progressBarComplete");
	
	$("#tx_upload_progress div").width("100%");
	$("#tx_upload_progress div").text("100%");
	// 모든 업로드 완료시
	if (this.getStats().files_queued === 0) {
		this.fileUploadRef.uploadFinished();
//		progressBar.fileuploadStop();
	}
};

/**
 * 파일 업로드 실패시
 * @param file 		실패한 파일
 * @param errorCode	에러 코드
 * @param message	swfUpload가 던져 주는 에러에 대한 추가 정보
 * @return
 */
jwork.fileUpload.uploadErrorHandler = function(file, errorCode, message) {
	try {
		
		switch (errorCode) {
		case SWFUpload.UPLOAD_ERROR.HTTP_ERROR:
			
			if('9999' == message) {
				alert('시스템 에러가 발생 했습니다 관리자에게 문의 하십시오');
			}else if('8888' == message) {
				alert('파일명 길이는 100 자 이상을 초과 할 수 없습니다.');
			}else{
				alert("에러가 발생하였습니다. ( Upload Error: " + message + " )");
			}
			this.debug("Error Code: HTTP Error, File name: " + file.name + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.MISSING_UPLOAD_URL:
			alert("에러가 발생하였습니다. ( Configuration Error )");
			this.debug("Error Code: No backend file, File name: " + file.name + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED:
			alert("에러가 발생하였습니다. ( Upload Failed. )");
			this.debug("Error Code: Upload Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.IO_ERROR:
			alert("에러가 발생하였습니다. ( Server (IO) Error )");
			this.debug("Error Code: IO Error, File name: " + file.name + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR:
			alert("에러가 발생하였습니다. ( Security Error )");
			this.debug("Error Code: Security Error, File name: " + file.name + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
			alert("에러가 발생하였습니다. ( Upload limit exceeded. )");
			this.debug("Error Code: Upload Limit Exceeded, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.SPECIFIED_FILE_ID_NOT_FOUND:
			alert("에러가 발생하였습니다. ( File not found. )");
			this.debug("Error Code: The file was not found, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.FILE_VALIDATION_FAILED:
			alert("에러가 발생하였습니다. ( Failed Validation.  Upload skipped. )");
			this.debug("Error Code: File Validation Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
			if (this.getStats().files_queued === 0) {
				document.getElementById(this.customSettings.cancelButtonId).disabled = true;
			}
			alert("에러가 발생하였습니다. ( Cancelled )");
			progress.setCancelled();
			break;
		case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
			alert("에러가 발생하였습니다. ( Stopped )");
			break;
		default:
			alert("에러가 발생하였습니다. ( Unhandled Error: " + error_code + " )");
			this.debug("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		}
	} catch (ex) {
        this.debug(ex);
    }
};

/**
 * 파일이 모두 전송됬을 경우
 * @return
 */
jwork.fileUpload.queueCompleteHandler = function() {
};

/**
 * 화면에 표시할 파일 크기 문자열 생성(Byte, KB, MB)
 * @param fileSize 바이트 크기 정수
 * @return 생성된 문자열
 */
jwork.fileUpload.getFileSizeDisplayString = function(fileSize) {
	var displayString = "";
	
	if(fileSize < 1024)
		displayString  = fileSize + " Byte";
	else if(fileSize >= 1024 && fileSize < 1024*1024)
		displayString = (fileSize/1024).toFixed(1)+" KB";
	else if(fileSize >= 1024*1024)
		displayString = (fileSize/1024/1024).toFixed(1)+" MB";
	
	return displayString;
};
/////////////////////////////////////////////////////////////////////////////

/**
 * 현재 객체의 멤버 필드와 멤버 함수 debug 정보 출력(id가 debug인 dom 객체 필요)
 * @return
 */
jwork.fileUpload.prototype.debugProperties = function() {
	var text;
	
	for(var i in this) {
		text += i + " : " + this[i] + "<br/>";
	}
	var debug = jQuery("#debug");
	if(debug) {
		debug.html(text);
	}
};

/**
 * fileId getter
 * @return fileId
 */
jwork.fileUpload.prototype.getFileId = function() {
	return this.fileId;
};

/**
 * fileId setter
 * @param	fileId
 */
jwork.fileUpload.prototype.setFileId = function(fileId) {
	this.fileId = fileId;
};

/**
 * 서버에 저장되어 있는 파일 리스트를 가져온다.
 * @return
 */
jwork.fileUpload.prototype.getFileList = function() {
	var fileUpload = this;

	jQuery.ajax({
		url : this.ctx + "/jfile/readDownloadFiles.do",
		type: "POST",
		data : { fileId : this.fileId, beanId : this.beanId, uploadPathKey : this.uploadPathKey, useSecurity : this.useSecurity, uploadMode : this.uploadMode },
		dataType : "json",
		success : function(result) {
			switch(result.JsonResultCode) {
			case "success":
				fileUpload.insertFileList(result.fileList);
				break;
			case "failure":
				alert("파일 목록을 서버에서 가져오는 중에 에러가 발생하였습니다.\n관리자에게 문의하십시오.");
				break;
			default:
				break;
			}
		},
		error : function(xhr, ajaxSettings, thrownError){
			if (xhr.status == 901) {
				alert("세션이 종료 되었습니다.");
				self.location.href= this.ctx;
			}else{
				alert('프로세스 수행 중 장애가 발생 하였습니다. ');
			}
		}
	});
};

/**
 * 서버에서 받아온 파일 리스트의 정보를 현재 객체와 페이지에 저장
 * @param fileList 서버에서 받아온 파일 리스트
 * @return
 */
jwork.fileUpload.prototype.insertFileList = function(fileList) {
	if(fileList.length <=0) {
		return;
	}
	
	for(var i=0; i<fileList.length; i++) {
		var fileInfo = fileList[i];
		
		var savedFile = new Object();
		savedFile.id = this.elementId + "_" + fileInfo.fileSeq;
		savedFile.seq = fileInfo.fileSeq;
		savedFile.name = fileInfo.fileName;
		savedFile.size = fileInfo.fileSize;				
		
		this.appendFileRow(savedFile, true);
		this.fileSeqList[savedFile.id] = fileInfo.fileSeq;
	}
	
	this.showBtnAllDown();
};

/**
 * 현재 객체의 멤버 필드와 멤버 함수 초기화. options에 명시하지 않은 필드와 함수는 초기화 정보 이용
 * @return
 */

jwork.fileUpload.prototype.initProperties = function() {
	
	// 파일업로드 컴포넌트 관련 
	this.fileList = {};
	this.fileSeqList = {};
	this.deletedFileSeqList = new Array();
	this.fileId = "";
	this.beanId = "";
	this.useSecurity = "";
	this.uploadMode = "";
	this.uploadPathKey = "";
	
	this.htmlUrl = this.ctx+"/jfile/jfileuploadForm.do";	
	this.uploadCompleted = null;
	this.totalSize = 0;
	this.usePreview = false;
	this.previewType = "click";
	this.previewDelay = 1000;
	this.isNetworkAccessError = false;
	this.isKeepSession = false;
	
	// swfLoader 관련
	this.flashUrl = this.ctx + "/resource/jfile/swfupload/swfupload/swfupload.swf";
	this.flash9Url = this.ctx + "/resource/jfile/swfupload/swfupload/swfupload_fp9.swf";
	this.uploadUrl = this.ctx + "/jfile/processUpload.do";
	this.maxFileSize = 10;
	this.fileType = "all";
	this.maxFileCount = 20;
	this.fileQueueLimit = 0;
	this.progressTarget = "fsUploadProgress";
	this.cancelButtonId = "btnCancel";
	this.debug = false;
	this.buttonImageUrl = this.ctx + "/images/lionsclubs/btn_find.gif";
	this.buttonWidth = 92,
	this.buttonHeight = 25,
	this.buttonPlaceholderId = "spanButtonPlaceHolder";
	this.buttonCursor = SWFUpload.CURSOR.HAND;
	
	// handler 관련
	this.swfuploadPreloadHandler = jwork.fileUpload.swfPreLoadHandler;
	this.swfuploadLoadFailedHandler = jwork.fileUpload.swfuploadLoadFailedHandler;
	this.fileDialogStartHandler = jwork.fileUpload.fileDialogStartHandler;
	this.fileQueuedHandler = jwork.fileUpload.fileQueueHandler;
	this.fileQueueErrorHandler = jwork.fileUpload.fileQueueErrorHandler;
	this.fileDialogCompleteHandler = jwork.fileUpload.fileDialogCompleteHandler;
	this.uploadStartHandler = jwork.fileUpload.uploadStartHandler;
	this.uploadProgressHandler = jwork.fileUpload.uploadProgressHandler;
	this.uploadSuccessHandler = jwork.fileUpload.uploadSuccessHandler;
	this.uploadCompleteHandler = jwork.fileUpload.uploadCompleteHandler;
	this.uploadErrorHandler = jwork.fileUpload.uploadErrorHandler;
	this.queueCompleteHandler = jwork.fileUpload.queueCompleteHandler;
};

/**
 * 사용자가 options에 명시한 내용으로 값 변경
 * @param options 변경할 값을 가진 options 객체
 * @return
 */
jwork.fileUpload.prototype.setOptions = function(options) {
	for(var i in options) {
		if(options[i]) {
			this[i] = options[i];
		}
	}
};

/**
 * File 타입 값 반환 (SwfUpload 객체에서 요구하는 값)
 * @return
 */
jwork.fileUpload.prototype.getFileTypeForSwfUpload = function() {
	var fileType;
	if(this.fileType == "all") {
		fileType = "*.*";
	}
	else if(this.fileType == "image") {
		fileType = "*.bmp;*.gif;*.jpg;*.jpeg;*.png";
	}
	else if(this.fileType == "images") {
		fileType = "*.bmp;*.gif;*.jpg;*.jpeg;*.png";
	}	
	else if(this.fileType == "html") {
		fileType = "*.htm;*.html";
	}
	else if(this.fileType != "") {		
		//화면에서 넘겨주는 값으로 세팅
		fileType = this.fileType;
	}
	else {
		fileType = "*.*";
	}
	
	return fileType;
};

/**
 * File 타입에 대한 설명 반환 (SwfUpload가 화면에 보여주는 파일 유형 값)
 * @return
 */
jwork.fileUpload.prototype.getFileTypeDescForSwfUpload = function() {
	var fileTypeDesc;
	if(this.fileType == "all") {
		fileTypeDesc = "All Files";
	}
	else if(this.fileType == "image") {
		fileTypeDesc = "Image";
	}
	else if(this.fileType == "images") {
		fileTypeDesc = "Images";
	}	
	else if(this.fileType == "html") {
		fileTypeDesc = "HTML";
	}
	else {
		fileTypeDesc = "All Files";
	}
	
	return fileTypeDesc;
};

/**
 * 객체에 할당된 값으로 SwfUpload가 요구하는 options 값 반환
 * @return SwfUpload에 전달할 options 객체
 */
jwork.fileUpload.prototype.getSettings = function() {
	var settings = {
			file_type: this.fileType,
			flash_url : this.flashUrl,
			flash9_url : this.flash9Url,
			upload_url: this.uploadUrl,
			post_params: {"fileId" : this.fileId, "beanId" : this.beanId, "uploadPathKey" : this.uploadPathKey, "useSecurity" : this.useSecurity, "uploadMode" : this.uploadMode},
			file_size_limit : this.maxFileSize + " MB",
			file_types : this.getFileTypeForSwfUpload(),
			file_types_description : this.getFileTypeDescForSwfUpload(),
			file_upload_limit : this.maxFileCount,
			file_queue_limit : this.fileQueueLimit,
			custom_settings : {
				progressTarget : this.progressTarget,
				cancelButtonId : this.cancelButtonId,
				context : this.ctx
			},
			debug: this.debug,

			// Button settings
			button_image_url: this.buttonImageUrl,
			button_width: this.buttonWidth,
			button_height: this.buttonHeight,
			button_placeholder_id: this.buttonPlaceholderId,
			button_cursor : this.buttonCursor,
			
			// 기본으로 handlers.js의 handler 사용. 일부는 필요에 의해 재정의 
			swfupload_preload_handler : this.swfuploadPreloadHandler,
			swfupload_load_failed_handler : this.swfuploadLoadFailedHandler,
			file_dialog_start_handler : this.fileDialogStartHandler,
			file_queued_handler : this.fileQueuedHandler,
			file_queue_error_handler : this.fileQueueErrorHandler,
			file_dialog_complete_handler : this.fileDialogCompleteHandler,
			upload_start_handler : this.uploadStartHandler,
			upload_progress_handler : this.uploadProgressHandler,
			upload_success_handler : this.uploadSuccessHandler,
			upload_complete_handler : this.uploadCompleteHandler,
			upload_error_handler : this.uploadErrorHandler,
			queue_complete_handler : this.uploadCompleted || this.queueCompleteHandler
			
		};
	return settings;
};

/**
 * Swf 초기화
 * @return
 */
jwork.fileUpload.prototype.initSwf = function() {
	this.swfu = new SWFUpload(this.getSettings());
	this.swfu.elementId = this.elementId;
	this.swfu.fileUploadRef = this;
	this.movieName = "SWFUpload_" + this.element_id;
};

/**
 * 화면에 파일업로드 컴포넌트 표시
 * @return
 */
jwork.fileUpload.prototype.initHtml = function() {
	var element = jQuery("#" + this.elementId);
	jQuery.ajax({
		url : this.htmlUrl,
		async : false,
		success : function(resultText, status) {
			
			element.html(resultText);
		},
		error : function(xhr, ajaxSettings, thrownError){
			if (xhr.status == 901) {
				alert("세션이 종료 되었습니다.");
				self.location.href= this.ctx;
			}else{
				alert('프로세스 수행 중 장애가 발생 하였습니다. ');
			}
		}
	});
	
	var spanAllDown = element.find("#spanButtonAllDown");
	spanAllDown.hover(
		function() {
			jQuery(this).addClass("hover");
		},
		function() {
			jQuery(this).removeClass("hover");
		}
	);
	
	if(this.usePreview !== true) {
		element.find("#spanThumbnail").hide();	
	}
};

/**
 * 파일 추가시 컴포넌트 화면에 해당 파일 아이템 표시
 * @param file 		추가할 파일의 정보를 담은 객체
 * @param isSaved	서버에 저장되어 있는 파일인지 여부
 * @return
 */
jwork.fileUpload.prototype.appendFileRow = function(file, isSaved) {
	var element = jQuery("#" + this.elementId);
	// 파일 목록에 저장
	file.isSaved = (isSaved === true ? true : false);
	this.fileList[file.id] = file;
	
	// 파일총 사이즈 설정
	this.totalSize += file.size;
	var totalSizeStr = jwork.fileUpload.getFileSizeDisplayString(this.totalSize); 
	jQuery("#" + this.elementId).find("#totalFileSizeDisplay").html(totalSizeStr);
	
	// 파일 컨테이너 생성
	element.find("#noDataRow").hide();
	var fileAreaTable = jQuery("#" + this.elementId).find("#tx_attach_list");
	
	var imgButton = jQuery("<img id='deleteButton_"+file.id+"' src='"+this.ctx+"/resource/jfile/swfupload/images/cancel.png' style='cursor: pointer;' />");
	imgButton.on("click", {fileUploadObj : this}, function(event) {
		jwork.fileUpload.cancelUploadHandler(event, this);
	});
	
	var trClassName = isSaved ? "savedFileItem" : "insertFileItem";
	var progressClassName = isSaved ? "progressBarSaved" : "progressBarInProgress";
	var fileSizeStr = jwork.fileUpload.getFileSizeDisplayString(file.size);
	
	var spanFileName = jQuery("<span title=" + file.name + ">" + file.name + "(" + fileSizeStr + ")</span>");
	var btnDownload = file.isSaved ? this.getBtnDownload(file) : "";
	
	var fileAreaTableTr =	jQuery("<li class='type-image tx-existed fileItem " + trClassName + "' id='" + file.id + "'></li>").append(
							jQuery("<dl></dl>").append(
							jQuery("<dt class='tx-name'></dt>").append(spanFileName)).append(
							jQuery("<dt id='fsUploadProgress' style='display:none'></dt>").append(
							jQuery("<div id='progressBar_"+file.id+"' class='progressContainer' />").append(
							jQuery("<div class='" + progressClassName + "' />")))).append(
							jQuery("<dd class='tx-button cen ml10'></dd>").append(imgButton)).append(
							jQuery("<dd class='tx-button'></dd>").append(btnDownload)).append(
							));
									
//	var fileAreaTableTr =	jQuery("<tr class='fileItem " + trClassName + "' id='"+file.id+"' ></tr>").append(
//							jQuery("<td class='first'></td>").append(spanFileName)).append(
//							jQuery("<td class='right' >" + fileSizeStr + "</td>")).append(
//							jQuery("<td id='fsUploadProgress'></td>").append(
//							jQuery("<div id='progressBar_"+file.id+"' class='progressContainer' >").append(
//							jQuery("<div class='" + progressClassName + "' >")))).append(
//							jQuery("<td class='center'></td>").append(btnDownload)).append(
//							jQuery("<td class='cen' ></td>").append(imgButton));
	this.addHighlightEvent(fileAreaTableTr);
	this.addPreviewEvent(spanFileName);

//	parent.Editor.getSidebar().getAttacher("image").attachHandler({
//	    'imageurl': 'http://cfile284.uf.daum.net/image/116E89154AA4F4E2838948',
//	    'filename': 'editor_bi.gif',
//	    'filesize': 640,
//	    'imagealign': 'C',
//	    'originalurl': 'http://cfile284.uf.daum.net/original/116E89154AA4F4E2838948',
//	    'thumburl': 'http://cfile284.uf.daum.net/P150x100/116E89154AA4F4E2838948'
//	});
	
	fileAreaTable.append(fileAreaTableTr);
	/* title이 있는 모든곳에 tooltip 적용 */
	$("*[title]").each(function(){
		$(this).tooltipster();
	});
};

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#blah').prop('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

/**
 * 마우스 다운로드 버튼을 생성
 * @param file	다운받을 파일의 정보를 담은 객체
 */
jwork.fileUpload.prototype.getBtnDownload = function(file) {
	var element = jQuery("#" + this.elementId);
	
	var ctx = this.ctx;
	var fileId = this.fileId;
	var beanId = this.beanId;
	var useSecurity = this.useSecurity;
	var uploadMode = this.uploadMode;
	var uploadPathKey = this.uploadPathKey;
	return jQuery("<img src=" + this.ctx + "/resource/jfile/swfupload/images/arrow_bg_no1.png />").on("click", 
				function() {
					var form = jQuery("<form />").prop("method", "get")
												 .prop("action", ctx + "/jfile/readDownloadFile.do");
					
					form.append( jQuery("<input />").prop("type", "hidden")
													.prop("name", "fileId")
													.prop("value", fileId) );
										
					form.append( jQuery("<input />").prop("type", "hidden")
													.prop("name", "fileSeq")
													.prop("value", file.seq) );					
					form.append( jQuery("<input />").prop("type", "hidden")
													.prop("name", "beanId")
													.prop("value", beanId) );
					form.append( jQuery("<input />").prop("type", "hidden")
													.prop("name", "uploadPathKey")
													.prop("value", uploadPathKey) );
					form.append( jQuery("<input />").prop("type", "hidden")
													.prop("name", "useSecurity")
													.prop("value", useSecurity) );
					form.append( jQuery("<input />").prop("type", "hidden")
													.prop("name", "uploadMode")
													.prop("value", uploadMode) );
					
					element.append(form);
					$(window).unbind();
					form.get(0).submit();
			
					form.remove();
				}
			).css("cursor", "pointer");
};

/**
 * 마우스 over시에 해당 줄 하이라이트
 * @param element	미리보기 이벤트 발생 위치
 */
jwork.fileUpload.prototype.addHighlightEvent = function(element) {
	var file = this.fileList[jQuery(element).prop("id")];
	
	element.on("mouseover",
		function() {
			var mouseoutEvent = jQuery(element).on("mouseout",
				function() {
					jQuery(element).find("li").css("background", "#ffffff");
					jQuery(element).unbind("mouseout", mouseoutEvent);
				}
			);
		
			jQuery(element).find("li").css("background", "#f5fafe");
		}
	);
};

/**
 * 미리보기 이벤트 추가
 * @param element	이벤트 발생 위치
 * @return
 */
jwork.fileUpload.prototype.addPreviewEvent = function(element) {
	if(this.usePreview !== true) {
		return;
	}
	
	switch(this.previewType) {
	case "click" :
		this.addPreviewEventByClick(element);
		break;
	case "mouseover" :
		this.addPreviewEventByOver(element);
		break;
	default:
		break;
	}
};

/**
 * 미리보기 이벤트 추가(onmouseover)
 * @param element	미리보기 이벤트 발생 위치
 * @return
 */
jwork.fileUpload.prototype.addPreviewEventByOver = function(element) {
	var fileupload = this;
	var tr = jQuery(element).parents().filter("tr").get(0);
	var file = this.fileList[jQuery(tr).prop("id")];
	
	jQuery(tr).on("mouseover",
		function() {
			var isOver = true;
			
			var mouseoutEvent = jQuery(tr).on("mouseout",
				function() { 
					isOver = false;
					jQuery(tr).unbind("mouseout", mouseoutEvent);
				}
			);
			
			if(fileupload.usePreview !== true) {
				return;
			}
			fileupload.showPreview();
			setTimeout(	
				function() {	
					if(isOver && file.isSaved) {
						fileupload.changePreview(fileupload.fileId, file.seq);	
					}
					else if(isOver && !file.isSaved) {
						fileupload.changePreviewByUrl(fileupload.ctx + "/resource/jfile/swfupload/images/no_img.gif");		
					}
				},
				fileupload.previewDelay
			);	
		}
	);
};

/**
 * 미리보기 이벤트 추가(onclick)
 * @param element		미리보기 이벤트 발생 위치
 * @return
 */
jwork.fileUpload.prototype.addPreviewEventByClick = function(element) {
	var fileupload = this;
	var tr = jQuery(element).parents().filter("li").get(0);
	var file = this.fileList[jQuery(tr).prop("id")];
	
	jQuery(element).on("click",
		function() {
			if(file.isSaved) {
				fileupload.changePreview(fileupload.fileId, file.seq);	
			}
			else if(!file.isSaved) {
				fileupload.changePreviewByUrl(fileupload.ctx + "/resource/jfile/swfupload/images/no_img.gif");		
			}
		}
	).css("cursor", "pointer");
};

/**
 * 파일 미리보기 이미지를 변경
 * @param fileId 서버에 저장되어 있는 파일의 fileId
 * @param fileSeq 서버에 저장되어 있는 파일의 seq
 */
jwork.fileUpload.prototype.changePreview = function(fileId, seq) {
	if(!fileId) {
		fileId = "";
	}	
	if(!seq) {
		seq = "";
	}
	var element = jQuery("#" + this.elementId);
	var img = element.find("#tx_attach_preview").find("img").get(0);
	jQuery(img).prop("src", this.ctx + "/jfile/preview.do?fileId=" + fileId + "&fileSeq=" + seq+ "&beanId="+this.beanId+"&uploadPathKey="+this.uploadPathKey+"&useSecurity="+this.useSecurity+"&uploadMode="+this.uploadMode);
};

/**
 * 파일 미리보기 이미지를 변경(경로를 직접 입력)
 * @param imageUrl 파일의 경로
 */
jwork.fileUpload.prototype.changePreviewByUrl = function(imageUrl) {
	var element = jQuery("#" + this.elementId);
	var img = element.find("#tx_attach_preview").find("img").get(0);
	jQuery(img).prop("src", imageUrl);	
};

/**
 * 파일 미리보기 이미지를 보인다.
 */
jwork.fileUpload.prototype.showPreview = function() {
	var element = jQuery("#" + this.elementId);
	var img = element.find("#tx_attach_preview").find("img").get(0);
	jQuery(img).show();
};

/**
 * 파일 미리보기 이미지를 숨김
 * @return
 */
jwork.fileUpload.prototype.hidePreview = function() {
	var element = jQuery("#" + this.elementId);
	var img = element.find("#tx_attach_preview").find("img").get(0);
	jQuery(img).hide();
};

/**
 * 삭제 버튼 클릭시 해당 파일을 삭제 처리
 * @return
 */
jwork.fileUpload.prototype.deleteFileItem = function(imageButton) {
	var fileAreaTable = jQuery(imageButton).parents().filter("#tx_attach_list");
	var tr = jQuery(imageButton).parents().filter("li").get(0);
	var id = jQuery(tr).prop("id");
	var seq = this.fileSeqList[id];
	
	// 서버에 파일을 지워야 할 경우 Seq 목록에 추가 
	if(seq) {
		this.deletedFileSeqList.push(seq);
	}
	// SwfUpload에서 해당 파일 삭제
	else {
		var swfFileId = jQuery(tr).prop("id");
		this.swfu.cancelUpload(swfFileId, false);
	}
	
	// 테이블에서 삭제 
	jQuery(tr).remove();
	if(fileAreaTable.find("li.fileItem").length <= 0) {
		fileAreaTable.find("#noDataRow").show();
	}

	// 파일총 사이즈 변경
	this.totalSize -= this.fileList[id].size;
	var totalSizeStr = jwork.fileUpload.getFileSizeDisplayString(this.totalSize); 
	jQuery("#" + this.elementId).find("#totalFileSizeDisplay").html(totalSizeStr);
	
	
	// 파일 리스트에서 제거
	this.fileList[id] = null;
};

/**
 * 파일 업로드 전 fileId 요청 및 서버 파일 삭제 플러그 변경
 * 파일 업로드 : fileId 요청
 * 파일 수정 : 서버 파일 삭제 플러그 변경
 * @return
 */
jwork.fileUpload.prototype.beforeUpload = function() {
	var fileId;
	var fileUpload = this;

	jQuery.ajax({
		type: "POST",
		async: false,
		url: this.ctx+"/jfile/readFileId.do",
		data: {	fileId        : this.fileId, 
				fileSeqs       : this.deletedFileSeqList,
				beanId        : this.beanId,
				useSecurity   : this.useSecurity,
				uploadMode    : this.uploadMode,
				uploadPathKey : this.uploadPathKey},
		dataType: "json",
		success: function(result){
			switch(result.JsonResultCode){
				case "success" :
										
					fileId = result.fileId;
					
					if("errorFileId" == fileId) {
						fileUpload.isNetworkAccessError = true;
					}
					
					break;
				case "failure" :
					fileId = "";
					fileUpload.swfu.cancelQueue();
					alert("파일을 전송하는 중에 에러가 발생하였습니다.\n관리자에게 문의하십시오.");
					break;
				default:
					break;
			}
		},
		error : function(xhr, ajaxSettings, thrownError){
			if (xhr.status == 901) {
				alert("세션이 종료 되었습니다.");
				self.location.href= this.ctx;
			}else{
				alert('프로세스 수행 중 장애가 발생 하였습니다. ');
				isAccessError = true;
			}
		}
	});
	this.fileId = fileId;
	if(this.isKeepSession == true) {
		this.checkUploading();
	}else{
		//this.checkUploadingOneTime();
	}
	
};

jwork.fileUpload.prototype.checkUploadingOneTime = function() {
	
	jQuery.ajax({
		type: "GET",
		async: false,
		url: this.ctx+"/jfile/uploadingCheck.do",
		data: {fileId : this.fileId},
		dataType: "json",
		success: function(result){
			switch(result.JsonResultCode){
				case "success" :
					
					if(result.hasFileId == true) {
						if(window.maxTime) {
							window.maxTime = result.maxInactiveInterval;
						}						
					}
					fileId = result.fileId;
					break;
				case "failure" :
					
					break;
				default:
					break;
			}
		},
		error : function(xhr, ajaxSettings, thrownError){
			if (xhr.status == 901) {
				
			}else{
				//alert("bb xhr.status => "+ xhr.status);
				//alert('프로세스 수행 중 장애가 발생 하였습니다. ');
			}
		}
	});
};

jwork.fileUpload.prototype.checkUploading = function() {
	
	var fileUpload = this;
	jQuery.ajax({
		type: "GET",
		async: false,
		url: this.ctx+"/jfile/uploadingCheck.do",
		data: {fileId : this.fileId},
		dataType: "json",
		success: function(result){
			switch(result.JsonResultCode){
				case "success" :
					
					if(result.hasFileId == true) {
						if(window.maxTime) {
							window.maxTime = result.maxInactiveInterval;
						}
						setTimeout(function() { fileUpload.checkUploading(); }, 2000);
					}
					fileId = result.fileId;
					break;
				case "failure" :
					
					break;
				default:
					break;
			}
		},
		error : function(xhr, ajaxSettings, thrownError){
			if (xhr.status == 901) {
				
			}else{
				//alert("bb xhr.status => "+ xhr.status);
				//alert('프로세스 수행 중 장애가 발생 하였습니다. ');
			}
		}
	});
};
/**
 * 파일 업로드
 * @return
 */
jwork.fileUpload.prototype.startUpload = function() {
	this.beforeUpload();
	if(this.isNetworkAccessError) {
		this.isNetworkAccessError = false;
		this.refresh();
		return;
	};
	
	this.swfu.removePostParam("fileId");
	this.swfu.addPostParam("fileId", this.fileId);

	this.swfu.removePostParam("beanId");
	this.swfu.addPostParam("beanId", this.beanId);
	
	this.swfu.removePostParam("uploadPathKey");
	this.swfu.addPostParam("uploadPathKey", this.uploadPathKey);
	
	this.swfu.removePostParam("useSecurity");
	this.swfu.addPostParam("useSecurity", this.useSecurity);
	
	this.swfu.removePostParam("uploadMode");
	this.swfu.addPostParam("uploadMode", this.uploadMode);
	
	if(this.swfu.getStats().files_queued === 0) {
		this.uploadFinished();
		if(this.uploadCompleted) {
			this.uploadCompleted();
		}
		else {
			this.queueCompleteHandler();
		}
	}
	else {
		this.swfu.startUpload();	
	}
};

/**
 * 모든 파일 업로드 완료시 
 * @return
 */
jwork.fileUpload.prototype.uploadFinished = function() {
	var fileUpload = this;
	jQuery.ajax({
		type: "POST",
		async: false,
		url: this.ctx+"/jfile/afterProcessUploadCompleted.do",
		data: {	fileId : this.fileId, beanId : this.beanId, uploadPathKey : this.uploadPathKey, useSecurity : this.useSecurity, uploadMode : this.uploadMode },
		dataType: "json",
		success: function(result){
			if(result.JsonResultCode == "failure") {
				alert("파일을 전송하는 중에 에러가 발생하였습니다.\n관리자에게 문의하십시오.");
			}
		},
		error : function(xhr, ajaxSettings, thrownError){
			/*
			if (xhr.status == 901) {
				alert("세션이 종료 되었습니다. finish");
				self.location.href= this.ctx;
			}else{
				alert('프로세스 수행 중 장애가 발생 하였습니다. ');
			}
			*/
		}
	});
};

/**
 * 화면을 갱신한다. fileId가 설정된 경우 서버로 부터 해당 fileId의 파일 리스트를 가져오고, 없을 경우 화면을 파일 리스트를 비운다. 
 * @return
 */
jwork.fileUpload.prototype.refresh = function() {
	this.fileList = {};
	this.fileSeqList = {};
	this.deletedFileSeqList = new Array();
	this.totalSize = 0;
	
	this.initHtml();
	
	this.initSwf();
	
	if(this.fileId) {
		this.getFileList();
	}
};

/**
 * 전체 다운로드 버튼을 숨긴다.
 * @return
 */
jwork.fileUpload.prototype.hideBtnAllDown = function() {
	var btnAllDown = jQuery("#" + this.elementId).find("#spanButtonAllDown");
	
	btnAllDown.unbind("click");
	
	btnAllDown.hide();
};

/**
 * 전체 다운로드 버튼을 보인다.
 * @return
 */
jwork.fileUpload.prototype.showBtnAllDown = function() {
	var element = jQuery("#" + this.elementId);
	
	var btnAllDown = element.find("#spanButtonAllDown");
	
	var ctx           = this.ctx;
	var fileId        = this.fileId;
	var beanId        = this.beanId;
	var uploadPathKey = this.uploadPathKey;
	var useSecurity   = this.useSecurity;
	var uploadMode    = this.uploadMode;
	
	btnAllDown.on("click", function(){
		var form = jQuery("<form />").prop("method", "get")
								.prop("action", ctx + "/jfile/downloadAll.do");
		form.append( jQuery("<input />").prop("type", "hidden")
								   		.prop("name", "fileId")
								   		.prop("value", fileId));
		form.append( jQuery("<input />").prop("type", "hidden")
				   						.prop("name", "beanId")
				   						.prop("value", beanId));
		form.append( jQuery("<input />").prop("type", "hidden")
										.prop("name", "uploadPathKey")
										.prop("value", uploadPathKey));		
		form.append( jQuery("<input />").prop("type", "hidden")
										.prop("name", "useSecurity")
										.prop("value", useSecurity));
		form.append( jQuery("<input />").prop("type", "hidden")
										.prop("name", "uploadMode")
										.prop("value", uploadMode));
		element.append(form);
		$(window).unbind();
		form.get(0).submit();
		form.remove();
	});
	
	btnAllDown.show();
	
	
};