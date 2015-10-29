<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#inexDate").datepicker();
		$("#amount").maskMoney({precision:0}).numericOnly();
		
		$("#classItemCode").on("change", function(){
			$("#detailItemCode").option1Code({
			     groupCode: '6000' // 그룹코드
			    ,code: $(this).val() // 코드
			    ,topLabel: "--선택--"
			    ,fixVal: "${MM2_15VO.detailItemCode}" // 고정값
			});
			
			
		}).change();
	
		$("#classItemCode").on("change", function(){
			if($(this).val() == "1040"){
				$("#servicePerformance").show();
			} else {
				$("#servicePerformanceCode").val("");
				$("#servicePerformance").hide();
			}
			
			if($(this).val() == "1070"){
				$("#deliveryMember").show();
			} else {
				$("#deliveryMemberNo").val("");
				$("#deliveryMemberName").val("");
				$("#deliveryMember").hide();
			}
		}).change();
		
		/*
		 *	수정
		 */
		$("#button_save").click(function() {
			if(!$("form").valid()){
				return false;
			}
			
			var params = $("#form_insert").serializeArray();
			var url = '<c:url value="/MM2/MM2_2/MM2_15/otherIncomeUpdate.do" />';
			if("${MM2_15VO.idnNo}".isEmpty()){
				url = '<c:url value="/MM2/MM2_2/MM2_15/otherIncomeInsert.do" />';
			}
			
			$.ajax({
				 type: "POST"
				,async: false
				,url: url
				,data: params
				,dataType: 'json'
				,success: function(data) {
					if(data.result == "CONFIRM") {
						alert('해당 회기의 월정산이 확정되어 수정할 수 없습니다.');
					}else if(data.result){
						//alert('정상적으로 수정 되었습니다.');
						opener._search();
						closeWin();
					}
				}
				,error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		// 조직책임자
		$("#deliveryMemberName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				organOfficerMemberPopup();
			}
		});	
		
		// 조직책임자
		$("#deliveryMemberName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 8 ) {
				$("#deliveryMemberName").val("");
				$("#deliveryMemberNo").val("");
			}
		});		
	});
});

function organOfficerMemberPopup(){
	var deliveryMemberName = $("#deliveryMemberName").val();
	var params = [];
	params.push({name: "name", value: deliveryMemberName});
	  
	new lions.popup({
		 url: '/common/member/memberSearchPopup.do'
		,data: params
		,name: "memberSearchPopup"
		,width: "1000"
		,height: "400"		
		,oncomplate: function(r){
			var data = r.data;
			$("#deliveryMemberName").val(data.name);
			$("#deliveryMemberNo").val(data.memberno);
		}
	}).open();	
}
</script>	

<form:form id="form_insert" modelAttribute="MM2_15VO" >
	<h3 style="width:98%;">
		<div>
			지출입력
			<c:choose>
				<c:when test="${empty MM2_15VO.idnNo }">입력</c:when>
				<c:otherwise>수정</c:otherwise>
			</c:choose>					
		</div>
	</h3>
	<div class="popup_bg">
		<table class="tblType2" style="width:98%">
			<colgroup>
				<col width="100px" />
				<col />
			</colgroup>
			
			<tbody>
				<tr>
					<th>지출일자<span class="require">*</span></th>
					<td>
						<form:input path="inexDate" cssClass="input required" caption="지출일자" />
					</td>
				</tr>
				<tr>
					<th>분류항목<span class="require">*</span></th>
					<td>
						<form:select path="classItemCode" cssClass="required select" caption="분류항목">
							<form:option value="">--선택--</form:option>
							<c:forEach items="${codeList}" var="list" varStatus="status">
								<c:if test="${list.code3 ne 'D' }">
									<form:option value="${list.code}">${list.codeName }</form:option>
								</c:if>
							</c:forEach>
						</form:select>
					</td>
				</tr>
				<tr>
					<th>세부항목<span class="require">*</span></th>
					<td>
						<form:select path="detailItemCode" cssClass="select required" caption="세부항목" />
					</td>
				</tr>
				<tr id="deliveryMember" style="display: none;">
					<th>지출전달회원</th>
					<td>
						<form:input path="deliveryMemberName" cssClass="input" size="20" />
						<form:hidden path="deliveryMemberNo"/>
						<img title="검색" src="/images/lionsclubs/btn/btn_post_search.gif" style="margin-top:2px" onclick="organOfficerMemberPopup();" class="pointer" />
					</td>
				</tr>
				<tr id="servicePerformance" style="display: none;">
					<th>봉사실적항목</th>
					<td>
						<lions:codeselect groupCode="6110" path="servicePerformanceCode" cssClass="select" />
					</td>
				</tr>				
				<tr>
					<th>금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액<span class="require">*</span></th>
					<td>
						<form:input path="amount" cssClass="input required" size="35" maxlength="35" min="1" style="text-align:right" caption="지출내용" />
					</td>
				</tr>
				<tr>
					<th>지출내용<span class="require">*</span></th>
					<td>
						<form:textarea path="inexDesc" cssClass="textarea required" cols="40" rows="5" caption="치출내용" maxlength="4000" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<c:choose>
			<c:when test="${empty MM2_15VO.idnNo }">
				<img id="button_save" src="/images/lionsclubs/btn/btn_input.gif" title="입력" style="width:57px" class="pointer" />		
			</c:when>
			<c:otherwise>
				<img id="button_save" src="/images/lionsclubs/btn/btn_edit.gif" title="수정" style="width:57px" class="pointer" />	
			</c:otherwise>
		</c:choose>
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
	<form:hidden path="organCode" />
	<form:hidden path="idnNo" />
</form:form>
