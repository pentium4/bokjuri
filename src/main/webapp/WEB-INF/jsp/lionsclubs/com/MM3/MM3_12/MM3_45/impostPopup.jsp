<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#genDate").datepicker();
		$("#impost").maskMoney({precision:0}).numericOnly();
		
		// 클럽코드 세팅
		$("#clubCode").organCode({
			 lvl: 4
			,upperOrganCode: "${MM3_45VO.organCode}"
			,searchable: true
			,fixVal: "${MM3_45VO.clubCode}"
		});

		$("#classItemCode").on("change", function(){
			$("#detailItemCode").option1Code({ 
		    	 groupCode: "7000"	// 그룹코드
		    	,code: $(this).val()	// 코드
		    	,topLabel: '--선택--'	// 상단명(상단명을 정하지 않으면 나타나지 않음)
		    	,fixVal: "${MM3_45VO.detailItemCode}"	// 고정값
			});
		}).change();
		
		$("#btnSave").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			var params = $("form").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM3/MM3_12/MM3_45/saveImpost.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1") {
						opener._pagingFixSearch();
						closeWin();
					} else {
						alert(data.result);
						_search();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					return false;
				}
			});			
		});
		
		
		$("#detailItemCode").on("change", function(){
			var data = $(this).find(":selected").data();
			
			if(data.code1 == "$"){
				$("#dollarKind").text("달러(USD)로 입력해 주세요.");
				$("#impost").maskMoney({precision:2}).numericOnly();
			} else {
				$("#dollarKind").text("원화(KRW)로 입력해 주세요.");
				$("#impost").maskMoney({precision:0}).numericOnly();
			}
		});
		
		var dollarKind = "${MM3_45VO.dollarKind}";
		if(dollarKind == "$"){
			$("#dollarKind").text("달러(USD)로 입력해 주세요.");
			$("#impost").val(parseFloat("${MM3_45VO.impostDollar}").toFixed(2));
			$("#impost").maskMoney({precision:2}).numericOnly();
		}
	});
});	

function _search(){
	$("form").submit();
}
</script>	

<form:form modelAttribute="MM3_45VO" action="/MM3/MM3_12/MM3_45/impostPopup.do">
	<double-submit:preventer tokenKey="impost" />
	
	<h3><div>납부금 입력</div></h3>
	<div class="popup_bg">
		<table class="tblType2">
			<colgroup>
				<col width="120px" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th>클럽코드<span class="require">*</span></th>
					<td>
						<form:select path="clubCode" cssClass="required" caption="클럽코드" />
					</td>
				</tr>
				<tr>
					<th>부과일자<span class="require">*</span></th>
					<td>
						<form:input path="genDate" cssClass="input date required" caption="부과일자" />
					</td>
				</tr>
				<tr>
					<th>분류항목코드<span class="require">*</span></th>
					<td>
						<lions:codeselect groupCode="7000" path="classItemCode" cssClass="required" caption="분류항목코드" />
					</td>
				</tr>
				<tr>
					<th>세부항목코드<span class="require">*</span></th>
					<td>
						<form:select path="detailItemCode" cssClass="required" caption="세부항목코드" />
					</td>
				</tr>
				<tr>
					<th>부과금<span style="margin-right: 10px;" /><span class="require">*</span></th>
					<td style="padding: 5px;">
						<div id="dollarKind">원화(KRW)로 입력해 주세요.</div>
						<form:input path="impost" size="35" min="1" maxlength="35" cssClass="required input" caption="부과금" />
					</td>
				</tr>
				<tr>
					<th>참고사항</th>
					<td>
						<form:textarea path="reference" cssClass="textarea" maxlength="4000" cols="42" rows="15" caption="참고사항" />
					</td>
				</tr>				
			</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<form:hidden path="organCode" />
	<form:hidden path="sessionYear" />
	<form:hidden path="idnNo" />
	
	<div class="popupBtn">
		<c:choose>
			<c:when test="${not empty MM3_45VO.idnNo }">
				<img title="수정" id="btnSave" src="/images/lionsclubs/btn/btn_edit.gif" class="pointer" />
			</c:when>
			<c:otherwise>
				<img title="입력" id="btnSave" src="/images/lionsclubs/btn/btn_input.gif" class="pointer" />
			</c:otherwise>
		</c:choose>
		<img title="닫기" id="btnClose" src="/images/lionsclubs/btn/btn_close.gif" onclick="closeWin();" class="pointer" />
	</div>
</form:form>
