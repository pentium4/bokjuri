<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
var _isSave = "N";

require(['init'], function () {
	$(document).ready(function () {
		$("#tx_resizer").hide();
		$("#tx_canvas_wysiwyg").height(250);
		
		$("#receive").on("click", function(){
			$("#dialog-form-receive").dialogPopup({
				 height: 600
				,width: 800
				,callback: function(){
					var lvl = 0;
					var $outgoingOrganCode = $("#outgoingOrganCode").find(":selected");
					var data = $outgoingOrganCode.data();
					if(data.outgoinglvl == 1 || data.outgoinglvl == 2){
						lvl = 1;
					}
					
					$(".dialog").tabs({
						 active: lvl
						,activate: function(event, ui){
							if(ui.newTab.index() == 0){
								$outgoingOrganCode.data("lvl", 4);
							} else if(ui.newTab.index() == 1){
								$outgoingOrganCode.data("lvl", 3);
							} else if(ui.newTab.index() == 2){
								$outgoingOrganCode.data("lvl", 2);
							} else if(ui.newTab.index() == 3){
								$outgoingOrganCode.data("lvl", 1);
							}
							
							listOrganCode();
						}
					});
				}
			});
			
			$("#organCode_chosen").width("60%");
		});
		
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl: 3
			,searchable: true
			,auth: false
			,fixVal: "${MM7_01VO.organCode}"
		});
		
		$("#outgoingOrganCode").on("change", function(){
			$(".recivelist ul").empty();	
			
			listOrganCode();
		});
		
		listOrganCode();
		
		$("#btnSave").on("click", function(){
			_isSave = "Y";
			if(!$("form").valid()){
				return false;
			}
			
			fileId.startUpload();
		});
		
		$("#btnOutgoing").on("click", function(){
			_isSave = "N";
			if(!$("form").valid()){
				return false;
			}
			
			if(!validForm(Editor)){
				return false;
			}
			
			var recivelistLength = $(".recivelist ul input:checkbox").length;
			if(recivelistLength == 0){
				alert("받는조직을 입력해 주세요.");
				$("#receive").trigger("click");
				return false;
			}
			
			if(!confirm('발신하시면 지정 발신처로 발신됩니다.\n발신하시겠습니까?')) {
				return false;
			}
			
			fileId.startUpload();
		});

		$("#btnDeleteDoc").on("click", function(){
			if(!confirm('삭제하시겠습니까?')) {
				return false;
			}
			
			var params = [];
			params.push({name: "idnNo", value: "${MM7_01VO.idnNo}"});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  "/MM7/MM7_1/MM7_01/deleteDoc.do",
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						opener._search();
						closeWin();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.");
				}
			});
		});
		
		
		Editor.modify({
			"content": $tx('editor_content') /* 내용 문자열, 주어진 필드(textarea) 엘리먼트 */ 
		});
		
		$("#r .r").on("click", function(){
			var total = $("#organlist input:checkbox:checked").length;
			$("#organlist input:checkbox:checked").each(function(index){
				var $li = $(this).closest("li");
				var $recive = $("#recive ul");
				
				$recive.append($li.clone());
				$li.remove();
				
				if(total == index + 1){
					$recive.find("input:checkbox").prop("checked", false);
					
					$("#reciveCheckAll").checkbox({
						check: $("#recive input:checkbox")
					});					
				}
			});
		});
		
		$("#r .l").on("click", function(){
			var total = $("#recive input:checkbox:checked").length;
			$("#recive input:checkbox:checked").each(function(index){
				var $li = $(this).closest("li");
				var data = $(this).data();
				
				$li.remove();
				
				if(total == index + 1){
					listOrganCode();
				}
			});
		});
		
		$("#reciveCheckAll").checkbox({
			check: $("#recive input:checkbox")
		});
		
		$("#close").on("click", function(){
			if(confirm('저장하시겠습니까?')) {
				$("#btnSave").trigger("click");
			} else {
				closeWin();
			}
		});
		
// 		$("#docTemplate").on("click", function(){
// 			$("#editor_content").val("test!!!");
// 			Editor.modify({
// 				"content": $tx('editor_content') /* 내용 문자열, 주어진 필드(textarea) 엘리먼트 */ 
// 			});
// 		});
		
		$("#btnDocTemplate").on("click", function(){
			new lions.popup({
				 url: '/MM7/MM7_1/MM7_02/docTemplatePopup.do'
				,name: "docTemplatePopup"
				,width: "600"
				,height: "400"
				,oncomplate: function(r){
		 			$("#editor_content").html(r.data);
		 			Editor.modify({
		 				"content": $tx('editor_content') /* 내용 문자열, 주어진 필드(textarea) 엘리먼트 */ 
		 			});
				}
			}).open();			
// 			openPopup('<c:url value="/MM7/MM7_1/MM7_02/docTemplatePopup.do" />', 600, 400, 'docTemplatePopup');
		});		
		
        $('#printPreview').on("click", function(){
    		openPopup('<c:url value="/MM7/MM7_1/MM7_01/previewPrintPopup.do?idnNo=${MM7_01VO.idnNo}" />', 1000, 800, 'printPreviewPopup');
        });		
	});
});

function listOrganCode(){
	progressBar.start();
	var $outgoingOrganCode = $("#outgoingOrganCode").val();
	var data = $("#outgoingOrganCode").find(":selected").data();
	
	// 연합회
	if(data.outgoinglvl == 1){
		$(".dialog").tabs({
			disabled: [0, 3]
		});
		
	// 복합지구
	} else if(data.outgoinglvl == 2){
		$(".dialog").tabs({
			disabled: [0]
		});
	
	} else if(data.outgoinglvl == 3){
		$(".dialog").tabs({
			disabled: []
		});
		
	// 클럽
	} else if(data.outgoinglvl == 4){
		$(".dialog").tabs({
			disabled: [2, 3]
		});
	}
	
	var params = [];
	params.push({name: "outgoingOrganCode", value: $outgoingOrganCode});
	params.push({name: "outgoingLvl", value: data.outgoinglvl});
	params.push({name: "lvl", value: data.lvl});
	
	$.ajax({
		type: "POST",
		url:  "/MM7/MM7_1/MM7_01/listOrganCode.do",
		data: params,
		dataType: 'json',
		success: function(data) {
			if(data.result){
				var $organlist = $("#organlist ul");
				$organlist.empty();
				
				var total = data.listOrganCode.length;
				$.each(data.listOrganCode, function(index, object){
					var dupCheck = false;
					$(".recivelist ul input:checkbox").each(function(index){
						if($(this).val() == object.organCode){
							dupCheck = true;
						}
					});
					
					if($outgoingOrganCode == object.organCode){
						dupCheck = true;
					}
					
					if(!dupCheck){
						var labelOrganCode = "(" + object.organCode.substring(0, 3) + "-" + object.organCode.substring(3, 6) + ")"
						$organlist.append("<li><label><input type='checkbox' value=" + object.organCode + " /> " + object.organName + labelOrganCode + "</label></li>");
					}
					
					if(total == index + 1){
						$(".listCheckAll").checkbox({
							check: $("#organlist input:checkbox")
						});
						
						progressBar.stop();
					}
				});
				
				if(total == 0){
					progressBar.stop();
				}
			}
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.");
		}
	});			
}

function uploadCompleted(){
	progressBar.start();

	var url = '<c:url value="/MM7/MM7_1/MM7_01/saveDoc.do" />';
	
	var params = $("form").serializeArray();
	params.push({name: "fileId", value: fileId.fileId});
	params.push({name: "docContent", value: Editor.getContent()});
	params.push({name: "docCreateKind", value: _isSave});
	
	$("#recive input:checkbox").each(function(index){
		var $this = $(this);
		var data = $this.data();
		
		params.push({name: "receiveArray[" + index + "].receiveOrganCode", value: $this.val()});
		params.push({name: "receiveArray[" + index + "].organCode", value: data.organcode});
	});
	
	$.ajax({
		type: "POST",
		url:  url,
		data: params,
		dataType: 'json',
		success: function(data) {
			if(data.result){
				opener._search();
				closeWin();
			}
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
	});
}
</script>
<style>
<!--
.organlist, .recivelist{
	padding: 3px;
}

#r{
	margin-top: 60px;
}

.r, .l{
	margin-top: 10px;
}
-->
</style>
<form:form id="form" modelAttribute="MM7_01VO">
	<h3><div>문서 만들기</div></h3>
	
	<div class="popup_bg" style="padding-top: 0;">
		<div class="btnBox2">
			<img id="btnDocTemplate" src="/images/lionsclubs/btn/btn_doc_template.png" alt="문서템플릿" class="pointer" />
			<img id="btnSave" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" class="pointer" />
			<img id="btnOutgoing" src="/images/lionsclubs/btn/btn_outgoing.png" alt="발신" class="pointer" />
			<c:if test="${not empty MM7_01VO.idnNo and id eq MM7_01VO.insertName }">
				<img id="btnDeleteDoc" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" class="pointer" />
				<img id="printPreview" src="/images/lionsclubs/btn/btn_print_preview.png" class="pointer" alt="프린트미리보기" />
			</c:if>
		</div>
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col width="300px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>보존년한</th>
					<td><lions:codeselect groupCode="9500" path="storageDate" topLabel="무제한" /></td>
					<th>문서번호</th>
					<td>${MM7_01VO.docNo }</td>
				</tr>
				<tr>
					<th>보내는날짜</th>
					<td><fmt:formatDate value="${now }" pattern="yyyy.MM.dd" /></td>
					<th>받는조직</th>
					<td><img id="receive" src="/images/lionsclubs/btn/btn_add_organ.png" title="받는조직입력" class="pointer" /></td>
				</tr>
				<tr>
					<th>보내는사람</th>
					<td>${name }</td>
					<th>전화번호</th>
					<td>${mobile }</td>
				</tr>
				<tr>
					<th>보내는조직</th>
					<td colspan="3">
						<form:select path="outgoingOrganCode">
							<c:forEach items="${listWriteOrganCode }" var="list">
								<form:option value="${list.organCode }" data-outgoinglvl="${list.outgoingLvl }" data-lvl="${list.lvl }">${list.organName }</form:option>
							</c:forEach>
						</form:select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><form:input path="docTitle" cssClass="input required" size="120" caption="제목" /></td>
				</tr>
			</tbody>
		</table>
		<div class="tblPopupH2 mT10" style="height: 350px;">
			<%@ include file="/WEB-INF/jsp/lionsclubs/com/common/daumeditor/editor.jsp" %>
			
			<textarea id="editor_content" style="display: none;"><c:out value="${MM7_01VO.docContent }" /></textarea>
		</div>
		
		<jwork:fileuploader 
			objectId="fileId"  
			uploadCompletedEvent="uploadCompleted"
			fileType="all" 
			maxFileSize="1000" 
			maxFileCount="0" 
			usePreview="true"
			useSecurity="false"
			uploadMode="db"
			fileId="${MM7_01VO.fileId }"
		/>		
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<img id="close" src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" class="pointer" />
	</div>
	
	<!-- Modal Popup -->  
	<div id="dialog-form-receive" class="dialog" style="display: none;">
		<div id="popup">
			<h3><div>받는조직</div></h3>
			<div class="popup_bg">
				<ul class="Height_0 mb10">
					<li><a href="#tabs-1">클럽</a></li>
					<li><a href="#tabs-2">지구</a></li>
					<li><a href="#tabs-3">복합지구</a></li>
					<li><a href="#tabs-4">연합회</a></li>
				</ul>			
				<div style="float:left;">
					<h4 id="tabs-1"><div><input type="checkbox" class="listCheckAll" />클럽명</div></h4>
					<h4 id="tabs-2"><div><input type="checkbox" class="listCheckAll" />지구명</div></h4>
					<h4 id="tabs-3"><div><input type="checkbox" class="listCheckAll" />복합지구명</div></h4>
					<h4 id="tabs-4"><div><input type="checkbox" class="listCheckAll" />연합회명</div></h4>
					<div style="border: 1px #aaa solid; width: 330px; height: 383px; overflow: auto;" id="organlist" class="organlist">
						<ul>
							<c:forEach items="${listOrganCode }" var="list">
								<c:if test="${clubCode ne list.organCode }">
									<li><label><input type="checkbox" value="${list.organCode }" /> ${list.organName }(${lions:formatOrganCode(list.organCode) })</label></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
				
				<div id="moveRecive" style="float:left; text-align: center; width: 100px; height: 383px; vertical-align: middle;">
					<div id="r">
						<div class="r pointer"><img src="/images/lionsclubs/right_arrow.png" width="30" height="30" /></div>
						<div class="l pointer"><img src="/images/lionsclubs/left_arrow.png" width="30" height="30" /></div>
					</div>
				</div>
				
				<div style="float:left;">
					<h4><div><input type="checkbox" id="reciveCheckAll" />받는조직</div></h4>
					<div style="border: 1px #aaa solid; width: 330px; height: 383px; overflow: auto;" id="recive" class="recivelist">
						<ul>
							<c:forEach items="${listReceiveOrganCode }" var="list">
								<li><label><input type="checkbox" value="${list.receiveOrganCode }" data-organcode="${list.organCode }" /> ${list.receiveOrganName }(${lions:formatOrganCode(list.receiveOrganCode) })</label></li>
							</c:forEach>
						</ul>
					</div>
				</div>				
			</div><!-- popup_bg -->
			
			<div class="popupBtn">
				<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
			</div>
		</div><!-- popup -->
	</div>
	<form:hidden path="idnNo" />
</form:form>
