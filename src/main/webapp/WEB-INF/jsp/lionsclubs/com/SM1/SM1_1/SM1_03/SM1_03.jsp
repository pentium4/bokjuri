<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script>
require(['init'], function () {
	$(document).ready(function () {
		$("#schkAll").on("click", function(){
			$(".scheck").prop("checked", $(this).is(":checked"));
		});
		
		$("#ichkAll").on("click", function(){
			$(".icheck").prop("checked", $(this).is(":checked"));
		});
	
		/*
			조직권한 부여 - 추가 
		*/
		$("#cInsert").on("click", function(){
			var params = [];
			params.push({name:"auth", value:"false"});
			params.push({name:"returnFunction", value:"appSectorCodeResult"});	// 팝업에서 리턴할 function
			organSearchPopup(params);		
		});
		
		/*
		 *	조직권한 부여 - 체크박스 선택 후 적용버튼 !!! 실행
		 */
		$("#cUpdate").click(function(){
			progressBar.start();
			var mbox = $( "input:checkbox[name=mcheck]" );			
			var mcheck = 0;
			mbox.each(function(index){
				var ocode = $("input:hidden[name=ocode]").eq(index).val();
				if($(this).is(":checked")){	
					mcheck++;
					$( "input:hidden[name=organArray]" ).eq(index).val(ocode);
				}
			});
			
			if(mcheck == 0) {
				alert("조직권한 부여의 선택박스를 선택하세요.");
				return false;
			}
			
			var params = $("#form-update").serializeArray();
			params.push({name: "memberNo", value: $("#form_delete input:hidden[name=memberNo]").val()});
			
			$.ajax({
				type: "POST",
				async: true,			
				url: '<c:url value="/SM1/SM1_1/SM1_03_Update.do" />',
		 		data: params,  
				dataType: 'json',
				success: function(data) {
					if(data.result){
						progressBar.stop();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"error:"+error);
				}
			});
			
		});
		
		/*
		 *	조직권한 부여 - 체크박스 선택 후 삭제버튼 !!! 실행
		 */
		$("#cDelete").click(function(){
			var mbox = $("input:checkbox[name=mcheck]");
			
			var mcheck = 0;
			mbox.each(function(index){
				if($(this).is(":checked")){
					mcheck++;
					var ocode = $("input:hidden[name=ocode]").eq(index).val();
					$("input:hidden[name=organArray]").eq(index).val(ocode);
				}
			});
			
			if(mcheck == 0) {
				alert("조직권한 부여의 선택박스를 선택하세요.");
				return false;
			}

			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}

			var params = $("#form-update").serializeArray();
			params.push({name: "memberNo", value: $("#form_delete input:hidden[name=memberNo]").val()});
			
			$.ajax({
				type: "POST",
				async: true,			
				url: '<c:url value="/SM1/SM1_1/SM1_03_Delete.do" />',
		 		data: params,  
				dataType: 'json',
				success: function(data) {
					if(data.result){
						//성공!!
						var motable = $("#table_myorgan tbody");
						mbox.each(function(index){
							if($(this).is(":checked")){
								var $tr = $(this).closest("tr");
								$tr.remove();		/* 행삭제 */
							}
						});
						$("#table_organpage > tbody").html("");
						Scroll_Table1();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"error:"+error);
				}
			});
		});
		
		/*
			화면권한 부여 - 저장
		 */
		$("#b_uisave").click(function(){
			progressBar.start(function(){
				if($("#form_delete > input[name=organCode]").val() == ""){
					alert('조직권한 부여리스트의 조직을 선택해주세요.');
					return false;
				}
				//----------------------------------------------------------------------------
				var sbox = $( "input:checkbox[name=scheck]" );		/* 조회 */
				var ubox = $( "input:checkbox[name=icheck]" );		/* 등록 */
				
				var select = 0;
				sbox.each(function(index){
					if($(this).is(":checked")){
						select++;
						$( "input:hidden[name=selectArray]" ).eq(index).val("Y");
					}else{
						$( "input:hidden[name=selectArray]" ).eq(index).val("N");
					}
				});
				
				var input = 0;
				ubox.each(function(index){
					if($(this).is(":checked")){
						input++;
						$( "input:hidden[name=inputArray]" ).eq(index).val("Y");
					}else{
						$( "input:hidden[name=inputArray]" ).eq(index).val("N");
					}
				});
				
				var params = $("#form-check").serializeArray();
				params.push({name: "organCode", value: $("#form_delete input:hidden[name=organCode]").val()});
				params.push({name: "memberNo", value: $("#form_delete input:hidden[name=memberNo]").val()});
				$.ajax({
					type: "POST",
					async: true,			
					url: '<c:url value="/SM1/SM1_1/SM1_03_UpdateUiAuth.do" />',
			 		data: params,
					dataType: 'json',
					success: function(data) {
						if(data.result){
							progressBar.stop();
						}
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"error:"+error);
					}
				});				
			});
		});
		
		/*
			권한 그룹 리스트 - 기본셋팅
		*/
		$("input[name=organCode]").val("");
		
		/*
			권한 그룹 리스트 - 선택시 처리
		*/
		$("#table_myorgan").on("click", "td", function(event){
			var $this = $(this);
			var $tr = $this.closest("tr");
			
			if($this.index() == 2){
				return true;
			}
			
			progressBar.start();
			
			$("#schkAll, #ichkAll").prop("checked", false);
			
			var ocode = $tr.find("input:hidden[name=ocode]").eq(0).val();
			var mcode = $("#form_delete input:hidden[name=memberNo]").val();
			
			$("#table_myorgan tr").css("background-color", "#ffffff");
		    $tr.css("background-color", "#E0FFE0");
		    
		    $("#form_delete input:hidden[name=organCode]").val(ocode);
	    
		    $.ajax({
				type: "POST",
				async: true,			
				url: '<c:url value="/SM1/SM1_1/SM1_03_SELECT.do" />',
		 		data: { organCode: ocode, memberNo : mcode },
				dataType: 'json',
				success: function(data) {
					if(data.result){
						// 화면권한 리스트 출력
						var adata = data.resultUiAuthList;	
						
						var ahtml = "";
						for(var i = 0; i < adata.length; i++){
							acheck1 = (adata[i].select == "Y") ? "checked=\"checked\"" : "";
							acheck2 = (adata[i].input == "Y") ? "checked=\"checked\"" : "";
							ahtml += "";
							ahtml += "<tr> ";    
							ahtml += "	<td>"+ (i+1) +"</td>";
							ahtml += "	<td class=\"left\">"+ adata[i].title +"</td>";
							ahtml += "	<td><input type=\"checkbox\" class='scheck' name=\"scheck\" " + acheck1 + " /></td>";
							ahtml += "	<td><input type=\"checkbox\" class='icheck' name=\"icheck\" " + acheck2 + " /></td>";
							ahtml += "	<input type=\"hidden\" name=\"uinoArray\" value='" + adata[i].uiNo + "' /> ";
							ahtml += "	<input type=\"hidden\" name=\"selectArray\" value='" + adata[i].select + "' />";
							ahtml += "	<input type=\"hidden\" name=\"inputArray\" value='" + adata[i].input + "' />";
							ahtml += "</tr>	";
						}
						$("#table_organpage > tbody").html("").append(ahtml);
						
						Scroll_Table1();
						progressBar.stop();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"error:"+error);
				}
			});
		});

		$("#btnInput").on("click", function(){
			openPopup('/SM1/SM1_1/SM1_03/moreAuthManagePopup.do?memberNo=${SM1_03VO.memberNo}', 500, 300, 'editMoreAuthManagePopup');
		});
	});
});

function _search(){
	$("form").submit();
}

/*
 * 조직권한 부여 - 추가
 */
function appSectorCodeResult(value){
	var ocode = $.url(value).param("organCode");
    var ahtml = "";
    ahtml += "<tr>";
    ahtml += "	<td>" + formatOrganCode(ocode) + "</td>";
    ahtml += "	<td class='left'>" + $.url(value).param("koName") + "</td>";
    ahtml += "	<td class=\"center\"><input type=\"checkbox\" name=\"mcheck\" /></td>";
    ahtml += "	<input type=hidden name=ocode value=\"" + ocode + "\" />";
    ahtml += "	<input type=hidden name=organArray value=\"N\" />";
    ahtml += "</tr>";
    
	$.ajax({
		type: "POST",
		async: true,			
		url: '<c:url value="/SM1/SM1_1/SM1_03_Insert.do" />',
 		data: { organCode : ocode, memberNo : $("#form_delete input:hidden[name=memberNo]").val() },  
		dataType: 'json',
		success: function(data) {
			if(data.result){
				var mtable = $("#table_myorgan tbody");
			    if(mtable.find("tr").eq(0).find("td").length == 1) mtable.html("");
			    mtable.css("cursor","pointer").append(ahtml);
			    
			    Scroll_Table1();
			}
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"error:"+error);
		}
    });
}
</script>

<style>
.innerTbl table th{
	border-left:1px solid #c5c5c5;
	border-right:1px solid #c5c5c5;
}

.innerTbl table td{
	border-left:1px solid #c5c5c5;
}

#table_myorgan tbody tr{
	cursor: pointer;
}
</style>

<form:form name="form-list" modelAttribute="SM1_03VO">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<%@ include file="/WEB-INF/jsp/lionsclubs/include/sub_profile.jsp" %>
</form:form>

<div class="table clfix">
	<div class="fL w50">
		<h4>권한그룹 선택</h4>
		<div class="Height_1">
			<div class="innerTbl">
				<div class="tblTitle Scroll_Title">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="*" />
						</colgroup>
						<thead>
							<tr>
								<th>권한그룹</th>
								<th>권한그룹 명칭</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="Inner">
					<table class="Scroll_Table">
						<colgroup>
							<col width="100px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<c:forEach items="${grouplist}" var="list" varStatus="status">
								<tr>
									<td>${list.authGroupCode }</td>
									<td class="left">${list.groupName }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="innerTbl">
				<form:form name="form-update" id="form-update" modelAttribute="SM1_03VO">
					<h4>추가권한 조직
						&nbsp;		
						<c:if test="${not empty authManage.authStartDate}">
							<em style="font-size:11px;color:tomato;">
								적용기간&nbsp;:&nbsp;
								<fmt:parseDate var="authStartDate" value="${authManage.authStartDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${authStartDate }" pattern="yyyy.MM.dd" />
								~
								<fmt:parseDate var="authEndDate" value="${authManage.authEndDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${authEndDate }" pattern="yyyy.MM.dd" />
							</em>
							
							<div class="fLBtn">
								<img id="cInsert" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" class="pointer authorization write" />
								<img id="cUpdate" src="/images/lionsclubs/btn/btn_set.gif" alt="적용" class="pointer authorization write" />
								<img id="cDelete" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" class="pointer authorization write" />
							</div>
						</c:if>
					</h4>
					<div class="tblTitle Scroll_Title">
						<table>
							<colgroup>
								<col width="100px" />
								<col width="*" />
								<col width="60px" /> 
							</colgroup>
							<thead>
								<tr>
									<th>조직코드</th>
									<th>조직명칭</th>
									<th>선택</th>  
								</tr>
							</thead>
						</table>
					</div>
					
					<div class="Inner">
						<table class="Scroll_Table" id="table_myorgan">
							<colgroup>
								<col width="100px" />
								<col width="*" />
								<col width="60px" /> 
							</colgroup>						
							<tbody>	
								<c:forEach items="${organlist}" var="list" varStatus="status">
									<tr>
										<td class="center">${lions:formatOrganCode(list.organCode) }</td>
										<td class="left">${list.koName }</td>
										<td class="center"><input type="checkbox" name="mcheck" <c:if test="${list.useYn eq 'Y'}">checked="checked"</c:if> /></td>
										<input type="hidden" name="ocode" value="${list.organCode }" />
										<input type="hidden" name="organArray" value="${list.useYn }" />
									</tr>		
								</c:forEach>
							</tbody>
						</table>
					</div>
				</form:form>
				
				<div class="innerTbl">
					<h4>
						추가권한 설정내용
						<div class="btnBox" style="right: 2px;">
							<img id="btnInput" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" class="pointer authorization write" />
						</div>
					</h4>
					<div style="border:1px solid #c5c5c5; padding: 5px;">
						${lions:newline(authManage.authDesc) }
					</div>
				</div>				
			</div>			
		</div>
	</div>
	
	<form:form name="form-check" id="form-check" modelAttribute="SM1_03VO">
		<div class="fL w50" >
			<h4>화면권한 부여</h4>
			<div class="btnBox" style="margin-top: 10px;">
				<img id="b_uisave" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" class="pointer authorization write" />
			</div>
			<div class="innerTitle Scroll_Title" style="border-bottom:1px solid #aaa;">
				<table class="tblType2" id="table_organpage_head" summary="화면권한 부여표">
					<caption>화면권한 부여</caption>
					<colgroup>
						<col width="100px" />
						<col width="*" />
						<col width="60px" />
						<col width="60px" />
					</colgroup>
					<thead>
						<tr>
							<th>화면번호</th>
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
			</div>
			<div class="Height_1 hm30">
				<table class="tblType2_1 Scroll_Table" id="table_organpage">
					<colgroup>
						<col width="100px" />
						<col width="*" />
						<col width="60px" />
						<col width="60px" />
					</colgroup>
					<tbody>
					</tbody>
				</table>
			</div><!-- tblInner -->
		</div><!-- fL -->
	</form:form>
</div>
<!-- 본문 내용 끝 -->

 <!-- 권한그룹관리 -->
<form name="form_delete" id="form_delete" >
<input type=hidden name="memberNo" value="${SM1_03VO.memberNo}" />
<input type=hidden name="organCode" />
</form>	
