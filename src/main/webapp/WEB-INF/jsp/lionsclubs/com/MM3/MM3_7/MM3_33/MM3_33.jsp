<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
var mIndex = 0;
var oIndex = 0;

require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("해당자료가 조회되었습니다.");
		
		$("#form_list input[name=organCode]").mask("a99999");
		
		var adate = $("#form_list input[name=appointDate]");
		adate.each(function(index, vdata){
			if($(vdata).val() == ""){
				$(vdata).val("${MM3_33VO.thisYear-1}.07.01");
			}
		}); 	
		$("#form_list input[name=appointDate]").datepicker();
		$("#form_list input[name=directorAnte]").maskMoney({precision:0}).numericOnly();
		$("#thisYear").sessionYearCombo({
			fixVal: "${MM3_33VO.thisYear}"	// 고정값
			,top:true
			,topLabel:"--전체--"
		});
	
		$("#thisOrganCode").organCode({
			  lvl:3
			, searchable: true     // 검색콤보박스 true/false
			, fixVal:"${MM3_33VO.thisOrganCode}"
			, syncTrue: true
		});
		
		$("#objCheckAll").click(function(){
	
			if($(this).prop("checked")) {
				var i = 0;
				$("#form_list input[name=memberNo]").each(function() {
						$("#form_list input:checkbox[name='chkIdx']").eq(i).prop("checked",($("#form_list input[name=memberNo]").eq(i).val() != "" && $("#form_list input[name=organCode]").eq(i).val() != ""));								
					i++;
				});
			} else {
				$("#form_list input:checkbox[name='chkIdx']").prop("checked", false);								
			}
			
		});
		
		$("#button_search").click(function(){
			$("#form_list").attr("action","/MM3/MM3_7/MM3_33/selectList.do");
			$("#form_list").submit();
		});
		
		$("#button_reset").click(function(){
			linkPage();
		});
		
		$("#button_input").click(function(){
			if(!validateChecker()) return;
			$("#form_list").attr("action","/MM3/MM3_7/MM3_33/insertList.dox");
			$("#form_list").submit();
		});
		
		$("#button_update").click(function(){
			if(!validateChecker()) return;
			$("#form_list").attr("action","/MM3/MM3_7/MM3_33/updateList.dox");
			$("#form_list").submit();
		});
		
		$("#button_delete").click(function(){
			$("#form_list").attr("action","/MM3/MM3_7/MM3_33/deleteList.dox");
			$("#form_list").submit();
		});
		
		/*
		 *	개인발령 적용 버튼
		 */
		$("#button_person").click(function() {		
			if($("#thisOrganCode").val() == "K00000"){
				alert("조직코드를 선택 후 다시 조회를 하셔야 합니다.");			
				return false;			
			}		
			if(!validateChecker()) return;	
			
			if(!confirm("확인을 하시면 시스템에 다음과 같이 적용이 됩니다. \n1.임원선임 내용은 개인기록관리의 경력(선임/위촉)에 자동적용이 됩니다. \n2.임원분담금은 개인납부금의 임원분담금에 자동입력 됩니다. \n3.겸임 직책자인 경우 : 모든 직책을 선택하지 않으시면 선택한 직책만 처리됩니다.")){
				return false;
			}		
			
			Progressbar();		
			var params = $("#form_list_person").serializeArray();
			setTimeout(function(){
					$.ajax({
						type: "POST",
						async: false,
						url:  '<c:url value="/MM3/MM3_7/MM3_33/insertPerson.do" />',
						data: params,
						dataType: 'json',
						success: function(data) {
							if(data.result){
								ProgressbarClose();
								$("#form_list input:checkbox[name='chkIdx']").prop("checked", false);
							} else {
								ProgressbarClose();
								alert(data.message);
							}
						},
						error:function(request,status,error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});	
			
			}, 10);
		});
		
		/*
		 *	회원검색
		 */
		var mText = $("#form_list input:text[name=memberName]");
		mText.each(function(index) {      
			// 이벤트 발생시 처리
			$(this).bind('keypress', function(e) {
				var key = e.charCode || e.keyCode || 0;
				if ( key == 13 ) {
					mIndex = index;
					var mData = $(this).val().replace(/,/g, '');
					guidingMemberPopup(mData);
					event.preventDefault();
				}
			});
		 });
	});
});

function linkPage(){
	$("#form_list").attr("action","/MM3/MM3_7/MM3_33/MM3_33.do");
	$("#form_list").submit();
}

/*
 * 회원찾기 팝업
 */
function guidingMemberPopup(mname){
	var params = [];
	params.push({name: "name", value: mname});	
	
	new lions.popup({
		 url: '/common/member/memberSearchPopup.do'
		,data: params
		,name: "memberSearchPopup"
		,width: "1000"
		,height: "400"		
		,oncomplate: function(r){
			var data = r.data;
			var m1 = data.name;
			var m2 = data.memberno;
			
			//$("input:text[name=memberName]").eq(mIndex).val(m1);
			$("#form_list input:text[name=memberNo]").eq(mIndex).val(m2);
			
			$.ajax({
				url:  '<c:url value="/MM3/MM3_7/MM3_33/selectOrgan.dox" />',
				data: {memberNo : m2 },
				dataType: 'json',
				success: function(data) {
					if(data.result){
						var odata = data.resultData;
						$("#form_list input:text[name=organName]").eq(mIndex).val(odata.organName);
						$("#form_list input:hidden[name=organCode]").eq(mIndex).val(odata.organCode);
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
	}).open();	
}

function validateChecker() {
	if($("#form_list input:checkbox[name='chkIdx']:checked").length <1){
		alert("적용할 자료를 체크하세요.");
		return false;
	}
	
	if($("#form_list #thisOrganCode").val() == ""){
		alert("조직코드를 선택하세요.");
		return false;
	}
	
	if($("#form_list #thisYear").val() == ""){
		alert("회기를 선택하세요.");
		return false;
	}
	
	$("#form_list_person").html("");
	$("#form_list_person")
		.append("<input type=hidden name=thisOrganCode value='"+$("#form_list #thisOrganCode").val()+"' />")
		.append("<input type=hidden name=thisYear value='"+$("#form_list #thisYear").val()+"' />");
	
	var i = 0;
	var rtnValue = true;
	$("#form_list input:checkbox[name='chkIdx']:checked").each(function() {
		var idx = $("#form_list input:checkbox[name='chkIdx']:checked").eq(i).val() - 1;
		
		if($("#form_list input[name=memberName]").eq(idx).val() == "") {
			alert((idx+1)+"번째 행의 회원명을 입력하세요.");
			$("#form_list input[name=memberName]").eq(idx).focus();
			rtnValue = false;
			return false;
		} 
		if($("#form_list input[name=organName]").eq(idx).val() == ""){
			alert((idx+1)+"번째 행의 클럽명을 입력하세요.\n회뭔을 다시 검색하시면 됩니다.");
			rtnValue = false;
			return false;
		}
		if($("#form_list input[name=titleCode]").eq(idx).val() == ""){
			alert((idx+1)+"번째 행의 직책코드를 입력하세요.");
			$("#form_list input[name=titleCode]").eq(idx).focus();
			rtnValue = false;
			return false;
		}
		
		if($("#form_list input[name=appointDate]").eq(idx).val() == ""){
			alert((idx+1)+"번째 행의 임명일자를 입력하세요.");
			$("#form_list input[name=appointDate]").eq(idx).focus();
			rtnValue = false;
			return false;
		}
		
		if($("#form_list input[name=directorAnte]").eq(idx).val() == ""){
			$("#form_list input[name=directorAnte]").eq(idx).val("0");
		}
		
		if($("#form_list input[name=directorAnte]").eq(idx).val() == ""){
			alert((idx+1)+"번째 행의 임원분담금을 입력하세요.");
			$("#form_list input[name=directorAnte]").eq(idx).focus();
			rtnValue = false;
			return false;
		}
		
		$("#form_list_person")
		.append("<input type=hidden name=chkIdx value='"+$("#form_list input[name=chkIdx]").eq(idx).val()+"' />")
		.append("<input type=hidden name=idnNo value='"+$("#form_list input[name=idnNo]").eq(idx).val()+"' />")
		.append("<input type=hidden name=organCode value='"+$("#form_list input[name=organCode]").eq(idx).val()+"' />")
		.append("<input type=hidden name=organName value='"+$("#form_list input[name=organName]").eq(idx).val()+"' />")
		.append("<input type=hidden name=memberNo value='"+$("#form_list input[name=memberNo]").eq(idx).val()+"' />")
		.append("<input type=hidden name=memberName value='"+$("#form_list input[name=memberName]").eq(idx).val()+"' />")
		.append("<input type=hidden name=appointDate value='"+$("#form_list input[name=appointDate]").eq(idx).val()+"' />")
		.append("<input type=hidden name=titleCode value='"+$("#form_list select[name=titleCode]").eq(idx).val()+"' />")
		.append("<input type=hidden name=directorAnte value='"+$("#form_list input[name=directorAnte]").eq(idx).val().replace(/,/g, '')+"' />")
		;
		
		i++;
	});
	
	
	var dData = $("#form_list input[name=directorAnte]");
	dData.each(function(index, v){
		var vData = v.value.replace(/,/g, '');
		dData.eq(index).val(vData);
	});
	
	return rtnValue;
}
</script>

<form:form id="form_list_person" modelAttribute="MM3_33VO">
	<!-- 
	thisOrganCode
	thisYear
	--
	chkIdx
	idnNo
	organCode
	memberNo
	appointDate
	titleCode
	directorAnte
	 -->
</form:form>
<form:form id="form_list" modelAttribute="MM3_33VO">

<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<table class="tblType1" summary="임원선임/분담금표">
	<caption>임원선임/분담금</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>조직코드</th>
		<td><form:select path="thisOrganCode" /></td>
		<th>회기선택</th>
		<td><form:select path="thisYear" cssClass="select" /></td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->


<div class="table">
<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	<div class="btnBox">
		<img id="button_search" src="/images/lionsclubs/btn/btn_search.gif" title="조회" class="pointer authorization read" />&nbsp;&nbsp;
		<img id="button_reset"   src="/images/lionsclubs/btn/btn_reset.gif" class="pointer authorization write" title="초기화" /> 
		<img id="button_input" src="/images/lionsclubs/btn/btn_input.gif" class="pointer authorization write" title="입력" /> 
		<img id="button_update" src="/images/lionsclubs/btn/btn_edit.gif" class="pointer authorization write" title="수정" /> 
		<img id="button_delete" src="/images/lionsclubs/btn/btn_del.gif" class="pointer authorization write" title="삭제" />&nbsp;&nbsp;				
		<img id="button_person" src="/images/lionsclubs/btn/btn_person.gif" title="개인발령적용" style="width:103px" class="pointer authorization write" />
	</div>

<div class="tblTitle Scroll_Title Height_0">
	<table class="tblType2" summary="임원선임 및 분담금 일괄입력">
	<caption>임원선임 및 분담금 일괄입력</caption>
	<colgroup>
		<col width="30px" />
		<col width="40px" />
		<col width="100px" />
		<col width="100px" />
		<col width="*" />
		<col width="140px" />
		<col width="200px" />
		<col width="140px" />
	</colgroup>
	<thead>
	<tr>
		<th><input type="checkbox" id="objCheckAll" value="1" /></th>
		<th>No</th>
		<th>회원명</th>
		<th>회원번호</th>
		<th>클럽명</th>
		<th>임명일자</th>
		<th>직책</th>
		<th>임원분담금</th>
	</tr>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table id="table_input" class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="30px" />
		<col width="40px" />
		<col width="100px" />
		<col width="100px" />
		<col width="*" />
		<col width="140px" />
		<col width="200px" />
		<col width="140px" />
	</colgroup>
	<tbody>

<c:set value="0" var="dTotal"/>
<c:forEach items="${MM3_33VO.listData}" var="list" varStatus="status">
<fmt:parseDate var="appointDate" value="${list.appointDate }" pattern="yyyyMMdd" />
								
					
	<tr>
		<td><input type="checkbox" name="chkIdx" value="${status.count }" />
			<input type="hidden" name="idnNo" value="<c:out value="${list.idnNo }" />" />
			<input type="hidden" name="organCode" value="<c:out value="${list.organCode }" />" />
		</td>
		<td>${status.count }</td>
		<td><input type="text" name="memberName" class="input" value="<c:out value="${list.memberName }" />" maxlength="10" style="width:90%;" /></td>
		<td><input type="text" name="memberNo" class="input" value="<c:out value="${list.memberNo }" />" maxlength="8" style="width:90%;background-color:#E0FFE0;" readonly="readonly" /></td>
		<td><input type="text" name="organName" class="input" value="<c:out value="${list.organName }" />"  style="width:90%;background-color:#E0FFE0;" readonly="readonly" /></td>	
		<td><input type="text" name="appointDate" class="input" value="<fmt:formatDate value="${appointDate }" pattern="yyyy.MM.dd" />" maxlength="10" style="background-color:#E0FFE0;" readonly="readonly" /></td>	
		<td><lions:LionsSelectTagByList id="" name="titleCode" selValue="${list.titleCode}" list="${MM3_33VO.codeList}" /></td>
		<td class="right"><input type="text" name="directorAnte" class="input" value="<c:out value="${list.directorAnte }" />" maxlength="50" style="width:90%;" /></td>
	</tr>
	<c:set value="${dTotal + list.directorAnte}" var="dTotal"/>
</c:forEach>
 
	</tbody>
	</table>
	
</div><!-- Height_1 -->
		<div class="Scroll_Title Height_0 ">
			<table class="tblType2_1">
				<colgroup>
					<col width="*" />
					<col width="140px" />
				</colgroup>
				<tfoot>	
				<tr>
					<th>계</th>					
					<th class="right"><fmt:formatNumber value="${dTotal}" /></th>
				</tr>
				</tfoot>
			</table>
		</div>
</div><!-- table -->

</form:form>