<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<link rel="stylesheet" href="/js/lionsclubs/daumeditor/css/editor.css" type="text/css" charset="utf-8"/>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#save").on("click", function(){
			fileId.startUpload();
		});
		
		$("#del").on("click", function(){
			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}
			
			var params =[];
			params.push({name: "idnNo", value: "${result.idnNo}"});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/notice/noticeDelete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						goUrl("/notice/notice.do?noticeCode=${result.noticeCode}");
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}		
			});	
		});	
		
		var iBody = $("#iContent").contents().find("body");
		iBody.append($("#content").val());
		iBody.append($("#comment").html().trim());
		iBody.css("font-size", "10pt");
		
		var $iframe = $("#iContent").contents();
		$iframe.find(".textarea").val("").placeholder().autosize();

		listReply();
		
		// 덧글 등록/수정
		$iframe.find(".btnConfirm").on("click", function(){
			var $textarea = $(this).closest("tr").find("textarea");
			if($textarea.val().isEmpty()){
				alert("덧글을 입력해 주세요.");
				$textarea.focus();
				return false;
			}
			
			saveReply($(this));
		});
	});
});

function listReply(){
	var params = [];
	params.push({name: "idnNo", value: "${noticeVO.idnNo}"});
	$.ajax({
		type: "POST",
		async: true,
		url:  "/notice/listReply.do",
		data: params,
		dataType: 'json',
		success: function(data) {
			if(data.result){
				var tempGroupIndex = "";
				var $iframe = $("#iContent").contents();

				$iframe.find(".replyTotalCnt").text("덧글 " + data.replyTotalCnt + "개");
				
				var total = data.resultList.length;
				$iframe.find("#cmt_list").empty();
				
				$.each(data.resultList, function(index, object){
					var html = "";
					var $ul = $("#iContent").contents().find("ul");
					
					if($ul.find("li").length != 0 
							&& tempGroupIndex != object.groupIndex){
						html += "<li class='reply-line'></li>";
					}
					
					if(object.lvl == 1){
						html += "<li data-replyidnno='" + object.replyIdnNo + "'>";	
					} else {
						html += "<li class='reply' data-replyidnno='" + object.replyIdnNo + "'>";
					}

					html += "	<div class='comm_cont'>";
					
					if(object.delReplyYn == 'N'){
						html += "		<div class='h'>";
						html += "			<span class='memberName b pointer' data-replymemberno='" + object.updateName + "'>" + object.name + "</span>";
						
						var date = new Date(object.updateDate);
						var updateDate = date.getFullYear() + '.' + (date.getMonth() + 1) + '.' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes();						
						html += "			<span class='date'>" + updateDate + "</span>";
						html += "			<span class='dsc_comm btnReply pointer' data-upperreplyidnno='" + object.replyIdnNo + "'>답글</span>";
						html += "			<span class='dsc_comm btnReplyCancel cancel pointer' style='display: none; color: #ff3c00;'>답글취소</span>";
						
						if("${id}" == object.updateName){
							html += "			<p class='btn_edit'>";
							html += "				<span class='edit-10 btnEdit pointer' data-replyidnno='" + object.replyIdnNo + "'>수정</span>";
							html += "				<span class='edit-10'>|</span>";
							html += "				<span class='edit-10 btnDelete pointer' data-replyidnno='" + object.replyIdnNo + "'>삭제</span>";
							html += "				<span class='btnEditCancel cancel pointer' style='display: none; color: #ff3c00;'>수정취소</span>";
							html += "			</p>";
						}
						
						html += "		</div>";
						html += "		<p class='comm'>";
						
						var content = "";
						
						if(object.replyMemberNo == null){
							content = object.content;
						} else {
							content = "<span class='memberName mention_nicknames b pointer' data-replymemberno='" + object.replyMemberNo + "'>" + object.replyMemberName + "</span>" + '  ' + object.content;
						}
						html += "			<span class='comm_body'>" + newline(content) + "</span>";
						html += "		</p>";
						
					} else {
						html += "		<p class='comm'>";
						html += "			<span class='comm_body'>삭제된 덧글 입니다.</span>";
						html += "		</p>";
					}
					html += "	</div>";
					html += "</li>";
					
					$iframe.find("#cmt_list").append(html);
					
					tempGroupIndex = object.groupIndex;
					
					if(index == total - 1){
						// 답글
						$iframe.find(".btnReply").on("click", function(){
							var $this = $(this);
							var data = $this.data();
							replyCancel();
							
							var $li = $this.closest("li");
							var $replyTable = $iframe.find(".reply-comm");

							var html = "";
							html += $replyTable.html();
							
							$li.after(html);
							$iframe.find("ul").find(".reply-warp .textarea").val("").autosize();
							$iframe.find("ul").find(".reply-warp .btnConfirm").attr("data-upperreplyidnno", data.upperreplyidnno);
										
							$this.hide();
							$li.find(".btnReplyCancel").show();
							
							// 덧글 등록/수정
							$iframe.find("ul").find(".btnConfirm").on("click", function(){
								var $textarea = $(this).closest("tr").find("textarea");
								if($textarea.val().isEmpty()){
									alert("덧글을 입력해 주세요.");
									$textarea.focus();
									return false;
								}
								
								$(this).off("click");
								saveReply($(this));
							});
						});
						
						// 수정
						$iframe.find(".btnEdit").on("click", function(){
							var $this = $(this);
							var _data = $this.data();
							var params = [];
							params.push({name: "replyIdnNo", value: _data.replyidnno});
							
							$.ajax({
								type: "POST",
								async: false,
								url:  "/notice/objectReply.do",
								data: params,
								dataType: 'json',
								success: function(data) {
									if(data.result){
										var object = data.object;
										
										replyCancel();
										var $li = $this.closest("li");
										var $replyTable = $iframe.find(".reply-comm-edit");
										
										$li.find(".comm_cont").after($replyTable.html());
										$iframe.find("ul").find(".reply-warp .textarea").val(object.content).autosize();
										$iframe.find("ul").find(".reply-warp .btnConfirm").attr("data-replyidnno", _data.replyidnno);
										
										$li.find(".comm_body").hide();
										$li.find(".edit-10").hide();
										$li.find(".btnEditCancel").show();
										
										// 덧글 등록/수정
										$iframe.find("ul").find(".btnConfirm").on("click", function(){
											var $textarea = $(this).closest("tr").find("textarea");
											if($textarea.val().isEmpty()){
												alert("덧글을 입력해 주세요.");
												$textarea.focus();
												return false;
											}
											
											$(this).off("click");
											saveReply($(this));
										});
									}
								},									
								error:function(request,status,error){
									alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
									//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}		
							});
						});
						
						// 삭제
						$iframe.find(".btnDelete").on("click", function(){
							if(!confirm("삭제 하시겠습니까?")){
								return false;
							}
							
							var $this = $(this);
							var _data = $this.data();
							var params = [];
							params.push({name: "replyIdnNo", value: _data.replyidnno});
							
							$.ajax({
								type: "POST",
								async: true,
								url:  "/notice/updateDelReply.do",
								data: params,
								dataType: 'json',
								success: function(data) {
									if(data.result){
										listReply();
									}
								},									
								error:function(request,status,error){
									alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
									//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}
							});
						});
						
						// 취소
						$iframe.find(".cancel").on("click", function(){
							replyCancel();							
						});
						
						// 회원정보
						$iframe.find(".memberName").on("click", function(){
							var data = $(this).data();
							
							openPopup("/MM2/MM2_1/MM2_07/profileBasicPopup.do?memberNo=" + data.replymemberno, '530', '230');
						});
					}
				});
			}
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
	});	
}

function replyCancel(){
	var $iframe = $("#iContent").contents();
	
	// 답글취소
	$iframe.find(".btnReply").show();
	$iframe.find(".btnReplyCancel").hide();
	$iframe.find("ul").find(".reply-warp").remove();
	
	// 수정취소
	$iframe.find("ul").find(".comm_body").show();
	$iframe.find("ul").find(".edit-10").show();
	$iframe.find("ul").find(".btnEditCancel").hide();
	
	$iframe.find(".textarea").val("");
	$iframe.find(".textarea").height(60);
}

function saveReply($this){
	var data = $this.data();
	var content = $this.closest("table").find(".textarea").val();
	
	var params =[];
	params.push({name: "idnNo", value: "${result.idnNo}"});
	params.push({name: "replyIdnNo", value: data.replyidnno});
	params.push({name: "upperReplyIdnNo", value: data.upperreplyidnno});
	params.push({name: "content", value: content});
	
	$.ajax({
		type: "POST",
		async: false,
		url:  '<c:url value="/notice/saveReply.do" />',
		data: params,
		dataType: 'json',
		success: function(data) {
			if(data.result == "1"){
				replyCancel();
				listReply();
			} else {
				alert(data.result);
			}
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});	
}

function _search(){
	$("form").submit();
}
</script>
<style>
<!--
.article_subject {
    padding: 8px 8px 9px 17px;
    word-wrap: break-word;
    clear: both;
    position: relative;
    border-width: 1px;
    border-top-style: solid;
    border-bottom-style: dashed;
}

.article_writer {
    position: relative;
    clear: both;
    padding: 8px 8px 9px 17px;
    margin-bottom: 20px;
    z-index: 11;
}
-->
</style>
<form:form id="form" modelAttribute="noticeVO">
	<form:hidden path="noticeCode"/>
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<c:if test="${id eq result.insertName}">
				<a href="/notice/noticeWrite.do?idnNo=${result.idnNo }" onclick="goUrl(this.href); return false;">
					<input id="update" type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" onclick="return false;" />
				</a>
				<input id="del" type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" onclick="return false;" />
			</c:if>
		</div>
		
		<div class="tblTitle Height_0" style="height: 65px;">
			<div class="article_subject">
				${result.title }
			</div>
			<div class="article_writer">
				${result.name }(${result.insertName }) | 조회 ${result.hit } | <fmt:formatDate value="${result.insertDate }" pattern="yyyy.MM.dd hh:mm" />
			</div>
		</div>
		
		<div class="Scroll_Title Height_1" style="overflow: hidden; padding-left: 8px;">
			<iframe id="iContent" width="100%" height="100%"></iframe>
		</div><!-- tblTitle -->
		
		<c:if test="${result.fileCnt ne 0 }">
			<div class="tblTitle Height_0" style="height: 130px;">
				<jwork:filedownloader objectId="fileId" fileId="${result.fileId }" />
			</div>
		</c:if>
	
		<textarea id="content" style="display: none;"><c:out value="${result.content }" /></textarea>
		
		<div id="comment" style="display: none;">
			<link rel="stylesheet" media="screen" href="<c:url value="/css/lionsclubs/reply/style.css" />" type="text/css" />
			
			<span class="replyTotalCnt b"></span>
			
			<div class="box-reply">
				<ul class="cmlist" id="cmt_list">
						
				</ul>
				
				<table>
					<colgroup>
						<col width="*" />
						<col width="80px" />
					</colgroup>
					<tbody>
						<tr>
							<td><textarea class="textarea" style="height: 60px;" placeholder="덧글을 입력해 주세요."></textarea></td>
							<td style="text-align: right; vertical-align: bottom;"><img class="btnConfirm pointer" src="/images/lionsclubs/btn/btn_reply_confirm.gif" /></td>
						</tr>
					</tbody>
				</table>			
				
				<div class="reply-comm" style="display: none;">
					<div class="reply-warp">
						<li class="reply">
							<div class="comm_cont">
								<table>
									<colgroup>
										<col width="*" />
										<col width="80px" />
									</colgroup>
									<tbody>
										<tr>
											<td><textarea class="textarea" style="height: 60px;" placeholder="덧글을 입력해 주세요."></textarea></td>
											<td style="text-align: right; vertical-align: bottom;"><img class="btnConfirm pointer" src="/images/lionsclubs/btn/btn_reply_confirm.gif" /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</li>			
					</div>
				</div>
				
				<div class="reply-comm-edit" style="display: none;">
					<div class="reply-warp" style="padding-left: 28px;">
						<li>
							<table>
								<colgroup>
									<col width="*" />
									<col width="80px" />
								</colgroup>
								<tbody>
									<tr>
										<td><textarea class="textarea" style="height: 60px;" placeholder="덧글을 입력해 주세요."></textarea></td>
										<td style="text-align: right; vertical-align: bottom;"><img class="btnConfirm pointer" src="/images/lionsclubs/btn/btn_reply_confirm.gif" /></td>
									</tr>
								</tbody>
							</table>
						</li>
					</div>
				</div>
			</div>
		</div>
		
		<div class="tblTitle Height_0 mT10">
			<div class="prenext_paging">
				<ul>
					<c:if test="${not empty prenextPaging.prevIdnNo }">
						<li class="pointer" onclick="goUrl('/notice/noticeDetail.do?noticeCode=${param.noticeCode}&idnNo=${prenextPaging.prevIdnNo }');">
							▲ 윗글 | ${prenextPaging.prevTitle }
						</li>
					</c:if>
					<c:if test="${not empty prenextPaging.nextIdnNo }">
						<li class="pointer" onclick="goUrl('/notice/noticeDetail.do?noticeCode=${param.noticeCode}&idnNo=${prenextPaging.nextIdnNo }');">
							▼ 아랫글 | ${prenextPaging.nextTitle }
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div><!-- table -->
</form:form>