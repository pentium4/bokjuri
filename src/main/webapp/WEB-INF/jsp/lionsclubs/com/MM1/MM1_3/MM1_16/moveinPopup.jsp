<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		$("#moveinDate").datepicker();
		$("#moveinDate").val(Date.today().toString("yyyy.MM.dd"));
		
		$("#memberName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				$("#memberSearch").trigger("click");		
			}
		});
		
		$("#memberName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 8 ) {
				$("#memberName").val("");
				$("#memberNo").val("");
			}
		});	
		
		$("#memberSearch").on("click", function(){
			var params = [];
			params.push({name: "name", value: $("#memberName").val()});	
			params.push({name: "authYn", value: "N"});
			
			new lions.popup({
				 url: '/common/member/memberSearchPopup.do'
				,data: params
				,name: "memberSearchPopup"
				,width: "1000"
				,height: "400"
				,oncomplate: function(r){
					var data = r.data;
					$("#memberName").val(data.name);
					$("#memberNo").val(data.memberno);
					$("#preOrganCode").val(data.sectorclubcode);
					$("#clubText").text(data.sectorclubcode.substring(0,3) + "-" + data.sectorclubcode.substring(3,6) + " " + data.sectorclubname + " -> " + "${organName}");
					
					/* title이 있는 모든곳에 tooltip 적용 */
					$("#clubText").tooltipster({
						 content: $("#clubText").text()
						,contentAsHTML: true
					});
				}
			}).open();
		});
		
		$("#btnSave").on("click", function(){
			if($("#memberNo").val().isEmpty()){
				alert("전입회원성명을 검색하여 입력해 주세요.");
				return false;
			}
			
			if(!$("form").valid()){
				return false;
			}
			
			if($("#organCode").val() == $("#preOrganCode").val()){
				alert("같은 클럽으로 전입이 불가능 합니다.\n다른 클럽을 선택해 주세요.");
				return false;			
			}
			
			var params = $("form").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM1/MM1_3/MM1_16/insertMoveinMember.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result != "1"){
						alert(data.result);
					} else {
						opener._search();
						closeWin();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
});
//-->
</script>

<form:form modelAttribute="MM1_16VO">
	<h3><div>전입회원 입력</div></h3>
	
	<div class="popup_bg">
		<table class="tblType2">
			<colgroup>
				<col width="180px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>전입회원성명<span class="require">*</span></th>
					<td>
						<input type="text" id="memberName" size="15" class="input" />
						<form:hidden path="memberNo" />
						<img id="memberSearch" alt="검색" src="/images/lionsclubs/btn/btn_post_search.gif" />
					</td>
				</tr>
				<tr>
					<th>현재클럽 -> 전입클럽</th>
					<td class="left">
						<span id="clubText" />
					</td>
				</tr>
				<tr>
					<th>전 입 일<span class="require">*</span></th>
					<td class="left">
						<form:input path="moveinDate" cssClass="input date required" caption="전입일" />
					</td>
				</tr>
			</tbody>
		</table>		
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<img id="btnSave" src="/images/lionsclubs/btn/btn_save.gif" class="pointer" />
		<img id="btnClose" src="/images/lionsclubs/btn/btn_close.gif" onclick="closeWin()" class="pointer" />
	</div>
	
	<form:hidden path="organCode"/>
	<form:hidden path="preOrganCode"/>
</form:form>
