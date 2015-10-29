<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal:"${MM2_24VO_PARAM.organCode }"
		});
		
		$("#yearCode").sessionYearCombo({
			 fixVal: "${MM2_24VO_PARAM.yearCode}"	// 고정값
			,top:false
		});
	
		$("#monthCode").monthCombo({
			 fixVal : "${MM2_24VO_PARAM.monthCode}"
			,top:false
		});
	
		if($("#confKindCode option").size() > 1) {
			if("${MM2_24VO_PARAM.confKindCode}" == ""){
			 	$("#confKindCode option:eq(1)").attr("selected", "selected");
			}else {
			 	$("#confKindCode").val("${MM2_24VO_PARAM.confKindCode}");
			}
		}
	
		$("#organCode").on("change", function(){
			$.saveOrganCode({
				organCode: $(this).val()
			});
			confIdnNo("");
		});
		
		$("#yearCode").on("change", function(){
			confIdnNo("");
		});
		
		$("#monthCode").on("change", function(){
			confIdnNo("");
		});
		
		$("#confKindCode").on("change", function(){
			confIdnNo("");
		});
	
		$(document).ajaxComplete(function(){
			if(!$("#organCode").val().isEmpty()
					&& $("#confIdnNo").val() == null){
				confIdnNo("${MM2_24VO_PARAM.confIdnNo}");	
			}
		});
	
		$("#confIdnNo").on("change", function(){
			$("#confPlaceCode").text("");
			$("#confTime").text("");
			$("#attendPerson").text("");
			$("#confDesc").text("");
			if ($("#button_update_info").length > 0) $("#button_update_info").hide();
			if ($("#button_delete_info").length > 0) $("#button_delete_info").hide();
			if($("#organCode").val() !="" && $("#yearCode").val() !="" && $("#monthCode").val() !="" && $("#confKindCode").val() != "" && $(this).val() != "") {
				var params = $("#form_list").serialize();
				$.ajax({
					type: "POST",
					async: false,
					url:  "/MM2/MM2_4/MM2_24/loadConferenceBasicInfo.do",
					data: params,
					dataType: 'json',
					success: function(data) {
						if(data.result){
							$("form").eq(0).submit();
						}
					},
					error:function(request,status,error){
						alert("잘못된 동작 입니다.");
					}
				});
			}
		});
		
		/* 로딩중 */
		$("#confIdnNo").css('visibility', 'hidden');
		$("#confIdnNo").before("<img class='confIdnNo_loading2' src='/images/lionsclubs/jssor/img/loading2.gif' alt='납부금 입력' class='pointer authorization write' />");
	});
});

function confIdnNo(fixVal){
	var obj = $("#confIdnNo");
	var _id = obj.prop("id");
	/* 로딩제거 */
	$("." + _id + "_loading2").remove();	
	/* 로딩중 */
	obj.css('visibility', 'hidden');
	obj.before("<img class='" + _id + "_loading2' src='/images/lionsclubs/jssor/img/loading2.gif' alt='납부금 입력' class='pointer authorization write' />");
	
	obj.empty();
	obj.append("<option value=''>--선택--</option>");	
	obj.val("");
	
	var params = $("#form_list").serializeArray();
	$.ajax({
		type: "POST",
		async: true,
		url:  "/MM2/MM2_4/MM2_24/loadConfIdnNo.do",
		data: params,
		dataType: 'json',
		success: function(data) {
			if(data.result){
				var total = data.data.length;
				
				$.each(data.data, function(index, object){
					var str = "<option value="+ object.confIdnNo +">" + object.confDate + "</option>";
					obj.append(str);
					
					if(index == total - 1){
						obj.css('visibility', 'visible');
						/* 로딩제거 */
						$("." + _id + "_loading2").remove();
						
						obj.val(fixVal);
						
						if(!fixVal.isEmpty()){
							if ($("#button_update_info").length > 0) $("#button_update_info").show();
							if ($("#button_delete_info").length > 0) $("#button_delete_info").show();					
						}
					}
				});
				
				if(total == 0){
					obj.css('visibility', 'visible');
					/* 로딩제거 */
					$("." + _id + "_loading2").remove();
				}
			}
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.");
		}
	});
}
</script>

<div class="table">
	<table class="tblType1" summary="행사정보">
		<caption>행사정보 </caption>
		<colgroup>
			<col width="75px" />
			<col width="380px" />
			<col width="75px" />
			<col width="119px" />
			<col width="50px" />
			<col width="75px" />
			<col width="75px" />
			<col width="*" />
		</colgroup>
		<tbody>
			<tr>
				<th>클럽코드</th>
				<td><form:select path="organCode" cssClass="select required" caption="클럽코드" /></td>
				<th>회기선택</th>
				<td><form:select path="yearCode" cssClass="select required" caption="회기선택" /></td>
				<th>월</th>
				<td colspan="3"><form:select path="monthCode" cssClass="select required" caption="월" /></td>
			</tr>
			<tr>
				<th>회의종류</th>
				<td><lions:codeselect path="confKindCode" cssClass="select required" caption="회의종류" groupCode="7580" onlyCodeName="true" /></td>
				<th>회의일자</th>
				<td colspan="5"><form:select path="confIdnNo" cssClass="select required" caption="회의일자" /></td>
			</tr>
			<tr>
				<th>회의장소</th>
				<td class="left">${MM2_24VO_PARAM.confInfo.confPlaceCode}</td>
				<th>회의시간</th>
				<td class="left">${MM2_24VO_PARAM.confInfo.confTime}</td>
				<th>인원</th>
				<td >${MM2_24VO_PARAM.confInfo.attendPerson}</td>
				<th>회의회차</th>
				<td class="left">${MM2_24VO_PARAM.confInfo.confDesc}</td>
			</tr>
		</tbody>
	</table>
</div><!-- table -->
