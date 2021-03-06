<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#expendDate").datepicker();
		$("#amount").maskMoney({precision:0}).numericOnly();
		
		$("#classItemCode").on("change", function(){
			$("#detailItemCode").option1Code({ 
		    	 groupCode: "6600"	// 그룹코드
		    	,code: $(this).val()	// 코드
		    	,fixVal: "${MM3_50VO.detailItemCode}"	// 고정값
		    	,topLabel: '--선택--'	// 상단명(상단명을 정하지 않으면 나타나지 않음)
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
				url:  '<c:url value="/MM3/MM3_12/MM3_50/saveExpend.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1") {
						opener._search();
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
	});
});	

function _search(){
	$("form").submit();
}
</script>	

<form:form modelAttribute="MM3_50VO" action="/MM3/MM3_12/MM3_50/expendPopup.do">
	<double-submit:preventer tokenKey="expend" />
	
	<h3>
		<div>
			연간지출실적
			<c:choose>
				<c:when test="${not empty MM3_50VO.idnNo }">수정</c:when>
				<c:otherwise>추가</c:otherwise>
			</c:choose>
		</div>
	</h3>
	<div class="popup_bg">
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th>지출일자<span class="require">*</span></th>
					<td>
						<form:input path="expendDate" cssClass="input required" caption="지출일자" />
					</td>
				</tr>
				<tr>
					<th>분류항목<span class="require">*</span></th>
					<td>
						<lions:codeselect groupCode="6600" path="classItemCode" class="select required" caption="분류항목" />
					</td>
				</tr>
				<tr>
					<th>세부항목<span class="require">*</span></th>
					<td>
						<select id="detailItemCode" name="detailItemCode" class="select required" caption="세부항목" />
					</td>
				</tr>
				<tr>
					<th>금<span style="margin-left: 30px;" />액<span class="require">*</span></th>
					<td>
						<form:input path="amount" cssClass="input required" min="1" size="35" maxlength="35" caption="기준금액" />
					</td>
				</tr>
				<tr>
					<th>지출내용<span class="require">*</span></th>
					<td>
						<form:textarea path="desc" cssClass="textarea required" cols="43" rows="7" maxlength="4000" caption="지출내용" />
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
			<c:when test="${not empty MM3_50VO.idnNo }">
				<img title="수정" id="btnSave" src="/images/lionsclubs/btn/btn_edit.gif" class="pointer" />
			</c:when>
			<c:otherwise>
				<img title="입력" id="btnSave" src="/images/lionsclubs/btn/btn_input.gif" class="pointer" />
			</c:otherwise>
		</c:choose>
		<img title="닫기" id="btnClose" src="/images/lionsclubs/btn/btn_close.gif" onclick="closeWin();" class="pointer" />
	</div>
</form:form>
