<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script>
require(['init'], function () {
	$(document).ready(function () {
		$("#schkAll").on("click", function(){
			$(".scheck").prop("checked", $(this).is(":checked"));
		});
		
		$("#ichkAll").on("click", function(){
			$(".icheck").prop("checked", $(this).is(":checked"));
		});
		
		$("#tchkAll").on("click", function(){
			$(".tcheck").prop("checked", $(this).is(":checked"));
		});
		
		/*
			권한그룹 팝업창에서 추가 
		*/
		$( "#b_groupAdd" ).on("click", function(){
			if($("#form-insert #groupName").val() == ""){
				alert("그룹명을 입력해 주세요.");
				$("#groupName").focus();
				return false;
			}	
			
			if($("#form-insert #authOrganCode").val() == ""){
				alert("권한조직을 선택해 주세요.");
				$("#authOrganCode").focus();
				return;
			}
			
			$("#form-insert").attr("action","/SM1/SM1_1/SM1_02_WRITE.do");
		    $("#form-insert").submit();						
		});
	
		/*
		권한그룹 팝업창에서 추가 
		*/
		$( "#b_groupEdit" ).on("click", function(){
			if($("#form-insert #groupName").val() == ""){
				alert("그룹명을 입력해 주세요.");
				$("#groupName").focus();
				return false;
			}	
			
			if($("#form-insert #authOrganCode").val() == ""){
				alert("권한조직을 선택해 주세요.");
				$("#authOrganCode").focus();
				return;
			}
			
			var authGroupCode = $("#form-delete > input[name=authGroupCode]").val();
			$("#form-insert").append("<input type=hidden name=authGroupCode value='" + authGroupCode + "'");
			$("#form-insert").attr("action","/SM1/SM1_1/SM1_02_UPDATE.do");
			$("#form-insert").submit();						
		});	
		
		/*
			권한그룹 추가
		*/
		$( "#create-user" ).on("click", function(){
			$(".validateTips").html("새로운 권한그룹을 추가 합니다.");
			
			$("#authGroupCode").val("");
			$("#groupName").val("");
			$("#authOrganCode").val("");
			
			$("#b_groupEdit").css("display","none");
			$("#b_groupAdd").css("display","inline");				
			
			$("#dialog-commitment").dialogPopup({
				width: 350, height: 250
		 	});
		});
		/*
			권한그룹 수정
		*/
		$( "#update-user" ).on("click", function(){
				if($("#form-delete > input[name=authGroupCode]").val() == ""){
					alert('수정 할 권한그룹을 선택해주세요.');
					return false;
				}
				
				$(".validateTips").html("권한그룹을 수정 합니다.");
				$("#authOrganCode").val($("#form-delete > input[name=authOrganCode]").val());
				$("#groupName").val($("#form-delete > input[name=groupName]").val());
				
				$("#b_groupEdit").css("display","inline");
				$("#b_groupAdd").css("display","none");
				
				$("#dialog-commitment").dialogPopup({
					width: 350, height: 250
			 	});
		});
		/*
			권한그룹 삭제 (화면권한 포함)
		*/
		$( "#delete-user" ).on("click", function(){
			if($("#form-delete > input[name=authGroupCode]").val() == ""){
				alert('삭제 할 권한그룹을 선택해주세요.');
				return false;
			}

			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}
			
			$("#form-delete").attr("action","/SM1/SM1_1/SM1_02_DELETE.do");
			$("#form-delete").submit();
		});
			
		/*
			화면권한 - 조회 및 등록 업데이트
		*/
		$("input:checkbox" ).on("click", function() {
			if($("#form-delete > input[name=authGroupCode]").val() == ""){
				alert('권한그룹을 선택해주세요.');
				return false;
			}		
		});
		
		$("#check-update").on("click", function() {
			if($("#form-delete > input[name=authGroupCode]").val() == ""){
				alert('권한그룹을 선택해주세요.');
				return false;
			}
			
			progressBar.start(function(){
				//----------------------------------------------------------------------------
				var sbox = $("input:checkbox[name=scheck]");		/* 조회 */
				var ubox = $("input:checkbox[name=icheck]");		/* 등록 */
				var tbox = $("input:checkbox[name=tcheck]");		/* 직책 */
				
				sbox.each(function(index){
					if($(this).is(":checked")){	
						$("input:hidden[name=selectArray]").eq(index).val("Y");
					}else{
						$("input:hidden[name=selectArray]").eq(index).val("N");
					}
				});
				
				ubox.each(function(index){
					if($(this).is(":checked")){
						$("input:hidden[name=inputArray]").eq(index).val("Y");
					}else{
						$("input:hidden[name=inputArray]").eq(index).val("N");
					}
				});
				
				tbox.each(function(index){
					if($(this).is(":checked")){
						$("input:hidden[name=titleArray]").eq(index).val($("input:hidden[name=tcode]").eq(index).val());
					}else{
						$("input:hidden[name=titleArray]").eq(index).val("N");
					}
				});	
				
				var authGroupCode = $("#form-delete > input[name=authGroupCode]").val();
				$("#form-check").append("<input type=hidden name=authGroupCode value='" + authGroupCode + "' />");
				$("#form-check").attr("action","/SM1/SM1_1/SM1_02_UPDATE_AUTH.do");
				$("#form-check").submit();				
			});
		});		
		
		/*
			권한 그룹 리스트 - 기본셋팅
		*/
		$("input[name=authGroupCode]").val("");
		
		var tbl = $("#authgroup tbody tr");
		/*
			권한 그룹 리스트 - 선택시 처리
		*/
		tbl.on("click", function(){
			progressBar.start();
			
			$("#schkAll,#ichkAll,#tchkAll").prop("checked", false);
			
			var gcode = $(this).find("input:hidden[name=gcode]").eq(0).val();
			var ocode = $(this).find("input:hidden[name=ocode]").eq(0).val();
			var gname = $(this).find("td").eq(1).text();
			
			tbl.css("background-color","#ffffff");
		    $(this).css("background-color","#E0FFE0");
		    
		    $("#form-delete input:hidden[name=authOrganCode]").val(ocode);
		    $("#form-delete input:hidden[name=authGroupCode]").val(gcode);
		    $("#form-delete input:hidden[name=groupName]").val(gname);
	    
		    $.ajax({
				type: "POST",
				async: true,			
				url: '<c:url value="/SM1/SM1_1/SM1_02_SELECT.do" />',
		 		data: { authGroupCode: gcode, authOrganCode : ocode },
				dataType: 'json',
				success: function(data) {
					if(data.result){
						// 화면권한 리스트 출력
						var adata = data.resultUiAuthList;	
						
						var ahtml = "";
						for(var i=0; i<adata.length; i++){
							acheck1 = (adata[i].select == "Y") ? "checked=\"checked\"" : "";
							acheck2 = (adata[i].input == "Y") ? "checked=\"checked\"" : "";
							ahtml += "";
							ahtml += "<tr> ";    
							ahtml += "	<td>" + (i+1) + "</td>";
							ahtml += "	<td class=\"left\">" + adata[i].title + "</td>";
							ahtml += "	<td><input type=\"checkbox\" class='scheck' name=\"scheck\" " + acheck1 + " /></td>";
							ahtml += "	<td><input type=\"checkbox\" class='icheck' name=\"icheck\" " + acheck2 + " /></td>";
							ahtml += "	<input type=\"hidden\" name=\"uinoArray\" value='" + adata[i].uiNo + "' /> ";
							ahtml += "	<input type=\"hidden\" name=\"selectArray\" value='" + adata[i].select + "' />";
							ahtml += "	<input type=\"hidden\" name=\"inputArray\" value='" + adata[i].input + "' />";
							ahtml += "</tr>	";
						}
						$("#table_uilist > tbody").html("").append(ahtml);
						
						// 직책 리스트 출력
						var bdata = data.resultOrganList;
						
						var bhtml = "";
						for(var i=0; i<bdata.length; i++){
							bcheck1 = (bdata[i].useYn == "Y") ? "checked=\"checked\"" : "";
							bhtml += "";
							bhtml += "<tr>  ";
							bhtml += "	<td>" + bdata[i].code + "</td>";
							bhtml += "	<td class=\"left\">" + bdata[i].codeName + "</td>";
							bhtml += "	<td><input type=\"checkbox\" class='tcheck' name=\"tcheck\" " + bcheck1 + " /></td>";
							bhtml += "	<input type=\"hidden\" name=\"titleArray\" value=\"" + bdata[i].useYn + "\" />";
							bhtml += "	<input type=\"hidden\" name=\"tcode\" value=\"" + bdata[i].code + "\" />";
							bhtml += "</tr>";
						}
						$("#table_titlelist > tbody").html("").append(bhtml);
						
						Scroll_Table1();
						progressBar.stop();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"error:"+error);
				}
			});
		});
	});
});
</script>
<style>
#authgroup tbody tr{
	cursor: pointer;
}
</style>
<form:form id="form-check" modelAttribute="SM1_02VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	
	<div class="table clfix">
		<div class="fL" style="position:relative;width:38%;margin-right:10px;">
			<h4>권한그룹 관리</h4>
			<div style="position:absolute;top:10px;right:0;z-index:1000">
				<img id="create-user" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" class="pointer authorization write"/>
				<img id="update-user" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" class="pointer authorization write"/>
				<img id="delete-user" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" class="pointer authorization write"/>
			</div>
			
			<div class="tblTitle Scroll_Title Height_0">
				<table class="tblType2_1" summary="권한그룹 관리표">
					<caption>권한그룹 관리</caption>
					<colgroup>
						<col width="40px" />
						<col width="*" />
						<col width="125px" />
						<col width="40px" />
						<col width="40px" />
					</colgroup>
					<thead>
						<tr>
							<th rowspan="2">No</th>
							<th rowspan="2">그룹명</th>
							<th rowspan="2">권한조직</th>
							<th colspan="2">화면권한</th>
						</tr>
						<tr>
							<th>조회</th>
							<th>등록</th>
						</tr>
					</thead>
				</table>
			</div><!-- tblTitle -->
			<div class="Height_1">
				<table class="tblType2_1 Scroll_Table" id="authgroup">
					<colgroup>
						<col width="40px" />
						<col width="*" />
						<col width="125px" />
						<col width="40px" />
						<col width="40px" />
					</colgroup>
					<tbody>
						<form:form id="form-list" modelAttribute="SM1_02VO">
							<c:forEach items="${resultList}" var="list" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td class="left">${list.groupName }</td>
									<td>${list.authOrganName }</td>
									<td>${list.sTotal }</td>
									<td>${list.iTotal }</td>
									<input type="hidden" name="gcode" value="${list.authGroupCode }" />
									<input type="hidden" name="ocode" value="${list.authOrganCode }" />
								</tr>
							</c:forEach>
						</form:form>	
					</tbody>
				</table>
			</div>
		</div><!-- fL -->
	
		<div class="fL" style="width:28%;margin-right:10px;">
			<h4>화면권한</h4>
			<div class="innerTitle Scroll_Title" style="border-bottom:1px solid #aaa;">
				<table class="tblType2" id="table_uilist_head" summary="권한그룹별 직책등록표">
					<caption>화면권한</caption>
					<colgroup>
						<col width="80px" />
						<col width="*" />
						<col width="40px" />
						<col width="40px" />
					</colgroup>
					<thead>
						<tr>
							<th>화면No</th>
							<th>화면명</th>
							<th>
								조회
								<input id="schkAll" type="checkbox" />
							</th>
							<th>
								등록
								<input id="ichkAll" type="checkbox" />
							</th>
						</tr>
					</thead>
				</table>
			</div><!-- tblTitle -->
			<div class="Height_1">
				<table class="tblType2_1 Scroll_Table" id="table_uilist">
					<colgroup>
						<col width="80px" />
						<col width="*" />
						<col width="40px" />
						<col width="40px" />
					</colgroup>
					<tbody>
						<c:forEach items="${resultUiAuthList}" var="uiauthlist" varStatus="status">
							<c:choose>
								<c:when test="${uiauthlist.select eq 'Y'}"><c:set var="sdata" value="Y"/></c:when>
								<c:otherwise><c:set var="sdata" value="N"/></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${uiauthlist.input eq 'Y'}"><c:set var="udata" value="Y"/></c:when>
								<c:otherwise><c:set var="udata" value="N"/></c:otherwise>
							</c:choose>
							<tr>     
								<td>${status.count }</td>
								<td class="left">${uiauthlist.title }</td>
								<td><input type="checkbox" class="scheck" name="scheck" <c:if test="${uiauthlist.select eq 'Y'}">checked="checked"</c:if> /></td>
								<td><input type="checkbox" class="icheck" name="icheck" <c:if test="${uiauthlist.input eq 'Y'}">checked="checked"</c:if> /></td>
								<input type="hidden" name="uinoArray" value="${uiauthlist.uiNo }"/>
								<input type="hidden" name="selectArray" value="<c:out value="${sdata}" />" />
								<input type="hidden" name="inputArray" value="<c:out value="${udata}" />" />
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div><!-- fR -->
	
		<div class="fL" style="position:relative;width:28%;">
			<h4>권한그룹별 직책등록</h4>
			<div style="position:absolute;top:10px;right:0;z-index:1000">
				<img id="check-update" src="/images/lionsclubs/btn/btn_set.gif" alt="적용" style="width:57px" onclick="return false;" class="pointer authorization write"/>
			</div>
			
			<div class="tblTitle Scroll_Title" style="border-bottom:1px solid #aaa;">
				<table class="tblType2" summary="권한그룹별 직책등록표">
					<caption>권한그룹별 직책등록</caption>
					<colgroup>
						<col width="80px" />
						<col width="*" />
						<col width="40px" />
					</colgroup>
					<thead>
						<tr>
							<th>직책코드</th>
							<th>직책명</th>
							<th>
								선택
								<input id="tchkAll" type="checkbox" />
							</th>
						</tr>
					</thead>
				</table>
			</div><!-- tblTitle -->
			<div class="Height_1">
				<table class="tblType2_1 Scroll_Table" id="table_titlelist">
					<colgroup>
						<col width="80px" />
						<col width="*" />
						<col width="40px" />
					</colgroup>
					<tbody>
						<c:forEach items="${resultOrganList}" var="organlist" varStatus="status">
							<c:choose>
								<c:when test="${organlist.useYn eq 'Y'}"><c:set var="odata" value="Y"/></c:when>
								<c:otherwise><c:set var="odata" value="N"/></c:otherwise>
							</c:choose>
							
							<tr>     
								<td>${organlist.code }</td>
								<td class="left">${organlist.codeName }</td>
								<td><label for="title-choice">직책권한-등록</label><input type="checkbox" class="tcheck" name="tcheck" <c:if test="${organlist.useYn eq 'Y'}">checked="checked"</c:if> /></td>
								<input type="hidden" name="tcode" value="${organlist.code }"/>
								<input type="hidden" name="titleArray" value="<c:out value="${odata}" />" />
							</tr>
						</c:forEach>	
					</tbody>
				</table>
			</div>
		</div><!-- fR -->
	</div><!-- Height_1 -->
</form:form>

<!-- //Contents_Table_area -->
 <!-- 권한그룹관리 -->
<form name="form-delete" id="form-delete" >
<input type="hidden" name="authGroupCode" /> 
<input type="hidden" name="authOrganCode" /> 
<input type="hidden" name="groupName" /> 
</form>

<!-- Modal Popup -->  
<div id="dialog-commitment" class="dialog" style="display: none;" title="권한그룹 추가">
	<div id="popup"> 
		<h3><div>권한 그룹</div></h3>
		<form:form id="form-insert" modelAttribute="SM1_02VO" action="/SM1/SM1_1/SM1_02_WRITE.do">
			<div class="popup_bg">
				<table class="tblType2" style="width:98%;">
					<colgroup>
						<col width="100px" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>그룹명</th>
							<td>
								<form:input path="groupName" cssClass="input text" size="25" />
							</td>
						</tr>
						<tr>
							<th>권한조직</th>
							<td>
								<lions:codeselect path="authOrganCode" groupCode="7810" />
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- popup_bg -->
							
			<div class="popupBtn">
		        <input type="image" id="b_groupAdd" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" onclick="return false;" />
		        <input type="image" id="b_groupEdit" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px;display:none;" onclick="return false;" />
		    </div>	
		</form:form>
	</div><!-- warp : end -->
</div>
