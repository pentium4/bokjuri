<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.egovframe.go.kr/tags/ext/jfile/jsp" prefix="jwork"%>
<link rel="stylesheet" href="/js/lionsclubs/daumeditor/css/trex/editor/attachbox.css" type="text/css" charset="utf-8"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<input type="hidden" id="totalFileSize" value="0" />
<div id="tx_attach_div" class="swfupload-control">
	<div id="tx_attach_box" class="tx-attach-box">
		<div class="tx-attach-box-inner">
			<div id="tx_attach_preview" class="tx-attach-preview"><p></p><img src="/js/lionsclubs/daumeditor/images/icon/editor/pn_preview.gif" width="147" height="108" unselectable="on"/></div>
			<div class="tx-attach-main">
				<div id="tx_upload_progress" class="tx-upload-progress"><div>0%</div><p>파일을 업로드하는 중입니다.</p></div>
				<ul class="tx-attach-top">
					<li id="tx_attach_all" class="tx-attach-all"><span id="spanButtonAllDown" class="allDown"><button onclick="return false;" /></span></li>
					
					<li id="tx_attach_size" class="tx-attach-size">
						파일총 사이즈 : <span id="totalFileSizeDisplay">0 Byte</span>
					</li>
					<li id="tx_attach_tools" class="tx-attach-tools">
					</li>
				</ul>
				<ul id="tx_attach_list" class="tx-attach-list"></ul>
			</div>
		</div>
	</div>
</div>


<!-- <div id="swfupload-control" class="swfupload-control">	 -->
<!-- 	<div class="middle"> -->
<!-- 		<div class="title"> -->
<!-- 			<div class="title_left">*첨부파일</div> -->
<!-- 			<div class="title_right"> -->
<!-- 				파일총 사이즈 : <span id="totalFileSizeDisplay">0 Byte</span> -->
<!-- 				<span id="spanButtonAllDown" class="allDown"><button onclick="return false;" /></span> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<div class="content"> -->
<!-- 				<div class="content_left"> -->
<!-- 					<span id="spanButtonPlaceHolder" class="swfupload"></span> -->
<%-- 					<span id="spanThumbnail" class="thumbnail"><img src="${ctx}/resource/jfile/swfupload/images/preview_img.gif" /></span> 		 --%>
<!-- 				</div> -->
<!-- 				<div class="content_right"> -->
<!-- 					<div style="width: 100%"> -->
<!-- 					<table id="fileAreaTable"  width="100%" cellpadding="0" cellspacing="0" style="border-collapse: collapse;" class="board_view2"> -->
<%-- 						<colgroup> --%>
<%-- 							<col width="*"/> --%>
<%-- 							<col width="100px"/> --%>
<%-- 							<col width="100px"/> --%>
<%-- 							<col width="80px"/> --%>
<%-- 						</colgroup> --%>
<!-- 						<tr> -->
<%-- 							<th class="top" style="background-image: url('${ctx}/resource/jfile//swfupload/images/text-bg.gif');background-repeat: repeat-x;">파일명</th> --%>
<%-- 							<th class="top" style="background-image: url('${ctx}/resource/jfile//swfupload/images/text-bg.gif');background-repeat: repeat-x;">사이즈</th> --%>
<%-- 							<th class="top" style="background-image: url('${ctx}/resource/jfile//swfupload/images/text-bg.gif');background-repeat: repeat-x;">다운로드 수</th> --%>
<%-- 							<th class="top" style="background-image: url('${ctx}/resource/jfile//swfupload/images/text-bg.gif');background-repeat: repeat-x;">다운로드</th> --%>
<!-- 						</tr> -->
<!-- 						<tr id="noDataRow"> -->
<!-- 							<td class="all_txt" colspan="4">첨부된 파일이 없습니다.</td> -->
<!-- 						</tr> -->
<!-- 					</table> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
