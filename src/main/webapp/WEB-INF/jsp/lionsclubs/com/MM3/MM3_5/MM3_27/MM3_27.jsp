<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">

require(['init'], function () {
	$(document).ready(function () {
		$("#inputFirst").datepicker();	
		$("#inputSecond").datepicker();		
		$("#inputThird").datepicker();		
		$("#inputFourth").datepicker();		
		$("#inputFifth").datepicker();		
		$("#inputSixth").datepicker();		
		$("#inputSeventh").datepicker();	
		$("#inputEighth").datepicker();	
		$("#inputNineth").datepicker();		
		$("#inputTenth").datepicker();		
		$("#inputEleventh").datepicker();		
		$("#inputTwelveth").datepicker(); 	 
		
		$("#thisYear").sessionYearCombo({
			 fixVal: "${MM3_27VO_PARAM.thisYear}"	// 고정값
			,top:false
		});
	
		//조회 버튼선택
		$("#button_search").on("click", function(){
			$.saveOrganCode({
				organCode: $("#upperCode").val()
			});
			
			$("#form_list").submit();
		});
		
		//기관 클럽코드 세팅
		$("#upperCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM3_27VO_PARAM.upperCode}"
		});
			
		var tbl = $("#table_list tbody tr");
		tbl.bind("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			var index = $(this).index();
			var districtCode = $("input[name='districtCode']").eq(index).val();	
			var sessionYear = $("input[name='sessionYear']").eq(index).val();	
			var clubCode = $("input[name='clubCode']").eq(index).val();	
			var mm = $("input[name='mm']").eq(index).val();	
			var mday = $("input[name='mday']").eq(index).val();	
	
			var first    = $("input[name='first']").eq(index).val()		== "" ? "" : Date.parseExact($("input[name='first']").eq(index).val(), 'yyyyMMdd').toString('yyyy.MM.dd');
			var second   = $("input[name='second']").eq(index).val()	== "" ? "" : Date.parseExact($("input[name='second']").eq(index).val(), 'yyyyMMdd').toString('yyyy.MM.dd');
			var third    = $("input[name='third']").eq(index).val()		== "" ? "" : Date.parseExact($("input[name='third']").eq(index).val(), 'yyyyMMdd').toString('yyyy.MM.dd');
			var fourth   = $("input[name='fourth']").eq(index).val()	== "" ? "" : Date.parseExact($("input[name='fourth']").eq(index).val(), 'yyyyMMdd').toString('yyyy.MM.dd');
			var fifth    = $("input[name='fifth']").eq(index).val()		== "" ? "" : Date.parseExact($("input[name='fifth']").eq(index).val(), 'yyyyMMdd').toString('yyyy.MM.dd');
			var sixth    = $("input[name='sixth']").eq(index).val()		== "" ? "" : Date.parseExact($("input[name='sixth']").eq(index).val(), 'yyyyMMdd').toString('yyyy.MM.dd');
			var seventh  = $("input[name='seventh']").eq(index).val()	== "" ? "" : Date.parseExact($("input[name='seventh']").eq(index).val(), 'yyyyMMdd').toString('yyyy.MM.dd');
		    var eighth   = $("input[name='eighth']").eq(index).val()	== "" ? "" : Date.parseExact($("input[name='eighth']").eq(index).val(), 'yyyyMMdd').toString('yyyy.MM.dd');
		    var nineth   = $("input[name='nineth']").eq(index).val()	== "" ? "" : Date.parseExact($("input[name='nineth']").eq(index).val(), 'yyyyMMdd').toString('yyyy.MM.dd');
		    var tenth    = $("input[name='tenth']").eq(index).val()		== "" ? "" : Date.parseExact($("input[name='tenth']").eq(index).val(), 'yyyyMMdd').toString('yyyy.MM.dd');
		    var eleventh = $("input[name='eleventh']").eq(index).val()	== "" ? "" : Date.parseExact($("input[name='eleventh']").eq(index).val(), 'yyyyMMdd').toString('yyyy.MM.dd');
		    var twelveth = $("input[name='twelveth']").eq(index).val()	== "" ? "" : Date.parseExact($("input[name='twelveth']").eq(index).val(), 'yyyyMMdd').toString('yyyy.MM.dd');	  
	
			$("#inputDistrictCode").val(districtCode);
			$("#inputSessionYear").val(sessionYear);
			$("#inputClubCode").val(clubCode);
			
		    $("#inputFirst"   ).datepicker().val(first);
			$("#inputSecond"  ).datepicker().val(second);
			$("#inputThird"   ).datepicker().val(third);
			$("#inputFourth"  ).datepicker().val(fourth);
			$("#inputFifth"   ).datepicker().val(fifth);
			$("#inputSixth"   ).datepicker().val(sixth);
			$("#inputSeventh" ).datepicker().val(seventh);
			$("#inputEighth"  ).datepicker().val(eighth);
			$("#inputNineth"  ).datepicker().val(nineth);
			$("#inputTenth"   ).datepicker().val(tenth);
			$("#inputEleventh").datepicker().val(eleventh);
			$("#inputTwelveth").datepicker().val(twelveth);
			
			if(mday > 0){
				if(mm != 1) $("#inputFirst").datepicker( "option", "disabled", true );	
				if(mm != 2) $("#inputSecond").datepicker( "option", "disabled", true );	
				if(mm != 3) $("#inputThird").datepicker( "option", "disabled", true );	
				if(mm != 4) $("#inputFourth").datepicker( "option", "disabled", true );	
				if(mm != 5) $("#inputFifth").datepicker( "option", "disabled", true );	
				if(mm != 6) $("#inputSixth").datepicker( "option", "disabled", true );	
				if(mm != 7) $("#inputSeventh").datepicker( "option", "disabled", true );	
				if(mm != 8) $("#inputEighth").datepicker( "option", "disabled", true );	
				if(mm != 9) $("#inputNineth").datepicker( "option", "disabled", true );	
				if(mm != 10) $("#inputTenth").datepicker( "option", "disabled", true );	
				if(mm != 11) $("#inputEleventh").datepicker( "option", "disabled", true );	
				if(mm != 12) $("#inputTwelveth").datepicker( "option", "disabled", true );	
			}
			
		});	
		
		$("#button_update").bind("click", function() {
			var clubCode = $("#inputClubCode").val();
			
			if(clubCode == ""){
				alert("클럽을 선택해 주세요.");
				return;
			}
			
			$("#dialog-form-update").dialogPopup({
				 height: 350
				,width: 400
			});	
		});
		
		$("#codeUpdate").bind("click", function() {
			$("#formUpdate input:text").each(function(k, v){
				if(v.value == "____.__.__") {
					$(this).val("");
				}
			});
			
			var params = $("#formUpdate").serializeArray();
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/MM3/MM3_5/MM3_27/mergeData.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						$("#button_search").trigger("click");
					}else{
						alert(data.message);
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

</script>
<style>

</style>

<h3><div>클럽보고자료점수 <span class="date"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></span></div></h3>
<form:form id="form_list" modelAttribute="MM3_27VO_PARAM">
	<div class="table">
		<table class="tblType1" summary="클럽회지발간실적">
			<caption>클럽회지발간실적 입력</caption>
			<colgroup>
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="41%" />
			</colgroup>
			<tbody>
				<tr>
					<th>조직코드</th>
					<td colspan="3">
					<div class="fL">
						<form:select path="upperCode"/>
					</div>			
					</td>
					<th rowspan="2">정렬구분</th>
					<td rowspan="2" class="LH">
						<form:radiobutton path="order" value="1" label="클럽차타순" cssClass="ml10" />
						<form:radiobutton path="order" value="2" label="클럽가나다순" cssClass="ml10" />
						<form:radiobutton path="order" value="3" label="점수있는클럽조회" cssClass="ml10" />
					</td>
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td colspan="3">
						<form:select path="thisYear" cssClass="select" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	
	<div class="table">
		<h4>연말 보고자료 점수 부여</h4>
		<div class="btnBox">
			<img alt="조회"  id="button_search" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" class="pointer authorization read" />		
			<img alt="수정"  id="button_update" src="/images/lionsclubs/btn/btn_edit.gif" style="margin-top:2px" class="pointer authorization write" />		
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType1" summary="연말 보고자료 점수 부여표">
				<caption>연말 보고자료 점수 부여</caption>
				<colgroup>
					<col width="35px" />
					<col width="*" />
					<col width="50px" />
					<col width="50px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">No</th>
						<th rowspan="2">클럽명</th>
						<th colspan="2">적용</th>
						<th colspan="12" id =""><strong class="year">${MM3_27VO_PARAM.thisYear-1 } ~ ${MM3_27VO_PARAM.thisYear }</strong></th>
					</tr>
					<tr>
						<th>총점</th>
						<th>월기준</th>
						<th>7월</th>
						<th>8월</th>
						<th>9월</th>
						<th>10월</th>
						<th>11월</th>
						<th>12월</th>
						<th>1월</th>
						<th>2월</th>
						<th>3월</th>
						<th>4월</th>
						<th>5월</th>
						<th>6월</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table" id="table_list">
				<colgroup>
					<col width="35px" />
					<col width="*" />
					<col width="50px" />
					<col width="50px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
					<col width="60px" />
				</colgroup>
				<tbody>
					<c:forEach items="${MM3_27VO_PARAM.listData}" var="list" varStatus="status"> 
						<tr>
							<td class="right">
								${status.count }
								<input type="hidden" name="districtCode" value="<c:out value="${list.inputDistrictCode }" />" />
								<input type="hidden" name="sessionYear" value="<c:out value="${list.inputSessionYear }" />" />
								<input type="hidden" name="clubCode" value="<c:out value="${list.inputClubCode }" />" />
								<input type="hidden" name="first" value="<c:out value="${list.inputFirst }" />" />
								<input type="hidden" name="second" value="<c:out value="${list.inputSecond }" />" />
								<input type="hidden" name="third" value="<c:out value="${list.inputThird }" />" />
								<input type="hidden" name="fourth" value="<c:out value="${list.inputFourth }" />" />
								<input type="hidden" name="fifth" value="<c:out value="${list.inputFifth }" />" />
								<input type="hidden" name="sixth" value="<c:out value="${list.inputSixth }" />" />
								<input type="hidden" name="seventh" value="<c:out value="${list.inputSeventh }" />" />
								<input type="hidden" name="eighth" value="<c:out value="${list.inputEighth }" />" />
								<input type="hidden" name="nineth" value="<c:out value="${list.inputNineth }" />" />
								<input type="hidden" name="tenth" value="<c:out value="${list.inputTenth }" />" />
								<input type="hidden" name="eleventh" value="<c:out value="${list.inputEleventh }" />" />
								<input type="hidden" name="twelveth" value="<c:out value="${list.inputTwelveth }" />" />
								<input type="hidden" name="mm" value="<c:out value="${list.mm }" />" />
								<input type="hidden" name="mday" value="<c:out value="${list.mday }" />" />
							</td>
							<td class="left">${list.inputOrganName }</td>
							<td class="right">${list.inputTotalScore }</td>
							<td class="right">${list.inputStandScore }</td>
							
							<fmt:parseDate var ="seventh" value="${list.inputSeventh }" pattern ="yyyyMMdd"/>
							<td class="center" title="<fmt:formatDate value="${seventh }" pattern ="yyyy.MM.dd"/>">
								<fmt:formatDate value="${seventh }" pattern ="MM.dd"/>
							</td>
							<fmt:parseDate var ="eighth" value="${list.inputEighth }" pattern ="yyyyMMdd"/>
							<td class="center" title="<fmt:formatDate value="${eighth }" pattern ="yyyy.MM.dd"/>">
								<fmt:formatDate value="${eighth }" pattern ="MM.dd"/>
							</td>
							<fmt:parseDate var ="nineth" value="${list.inputNineth }" pattern ="yyyyMMdd"/>
							<td class="center" title="<fmt:formatDate value="${nineth }" pattern ="yyyy.MM.dd"/>">
								<fmt:formatDate value="${nineth }" pattern ="MM.dd"/>
							</td>
							<fmt:parseDate var ="tenth" value="${list.inputTenth }" pattern ="yyyyMMdd"/>
							<td class="center" title="<fmt:formatDate value="${tenth }" pattern ="yyyy.MM.dd"/>">
								<fmt:formatDate value="${tenth }" pattern ="MM.dd"/>
							</td>
							<fmt:parseDate var ="eleventh" value="${list.inputEleventh }" pattern ="yyyyMMdd"/>
							<td class="center" title="<fmt:formatDate value="${eleventh }" pattern ="yyyy.MM.dd"/>">
								<fmt:formatDate value="${eleventh }" pattern ="MM.dd"/>
							</td>
							<fmt:parseDate var ="twelveth" value="${list.inputTwelveth }" pattern ="yyyyMMdd"/>
							<td class="center" title="<fmt:formatDate value="${twelveth }" pattern ="yyyy.MM.dd"/>">
								<fmt:formatDate value="${twelveth }" pattern ="MM.dd"/>
							</td>
							
							<fmt:parseDate var ="first" value="${list.inputFirst }" pattern ="yyyyMMdd"/>
							<td class="center" title="<fmt:formatDate value="${first }" pattern ="yyyy.MM.dd"/>">
								<fmt:formatDate value="${first }" pattern ="MM.dd"/>
							</td>
							<fmt:parseDate var ="second" value="${list.inputSecond }" pattern ="yyyyMMdd"/>
							<td class="center" title="<fmt:formatDate value="${second }" pattern ="yyyy.MM.dd"/>">
								<fmt:formatDate value="${second }" pattern ="MM.dd"/>
							</td>
							<fmt:parseDate var ="third" value="${list.inputThird }" pattern ="yyyyMMdd"/>
							<td class="center" title="<fmt:formatDate value="${third }" pattern ="yyyy.MM.dd"/>">
								<fmt:formatDate value="${third }" pattern ="MM.dd"/>
							</td>
							<fmt:parseDate var ="fourth" value="${list.inputFourth }" pattern ="yyyyMMdd"/>
							<td class="center" title="<fmt:formatDate value="${fourth }" pattern ="yyyy.MM.dd"/>">
								<fmt:formatDate value="${fourth }" pattern ="MM.dd"/>
							</td>
							<fmt:parseDate var ="fifth" value="${list.inputFifth }" pattern ="yyyyMMdd"/>
							<td class="center" title="<fmt:formatDate value="${fifth }" pattern ="yyyy.MM.dd"/>">
								<fmt:formatDate value="${fifth }" pattern ="MM.dd"/>
							</td>
							<fmt:parseDate var ="sixth" value="${list.inputSixth }" pattern ="yyyyMMdd"/>
							<td class="center" title="<fmt:formatDate value="${sixth }" pattern ="yyyy.MM.dd"/>">
								<fmt:formatDate value="${sixth }" pattern ="MM.dd"/>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
</form:form>
<!-- Modal Popup -->  	
<div id="dialog-form-update" class="dialog" style="display: none;">
	<form:form id="formUpdate" modelAttribute="MM3_27VO_DATA" action="/MM3/MM3_5/MM3_27/MM3_27_Update.do">
		<form:hidden path="inputDistrictCode" />
		<form:hidden path="inputSessionYear" />
		<form:hidden path="inputClubCode" />
		
		<div id="popup">
			<h3><div>클럽보고자료점수입력</div></h3>
			<div class="popup_bg">
				<table class="tblType2" style="width:98%">
					<colgroup>
							<col width="35px" />
							<col width="120px" />
							<col width="35px" />
							<col width="120px" />
							<col />
					</colgroup>
					<thead>
						<tr>
							<th>월</th>
							<th>날짜</th>
							<th>월</th>
							<th>날짜</th>		
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>7월</th>
							<td>				
								<form:input path="inputSeventh" cssClass="input" size="20" style="width: 110px !important; -ms-ime-mode: disabled; "/>
							</td>
							<th>1월</th>
							<td>				
								<form:input path="inputFirst" cssClass="input" size="20" style="width: 110px !important; -ms-ime-mode: disabled; "/>
							</td>
						</tr>
						<tr>
							<th>8월</th>
							<td>				
								<form:input path="inputEighth" cssClass="input" size="20" style="width: 110px !important; -ms-ime-mode: disabled; "/>
							</td>
							<th>2월</th>
							<td>				
								<form:input path="inputSecond" cssClass="input" size="20" style="width: 110px !important; -ms-ime-mode: disabled; "/>
							</td>
						</tr>
						<tr>
							<th>9월</th>
							<td>				
								<form:input path="inputNineth" cssClass="input" size="20" style="width: 110px !important; -ms-ime-mode: disabled; "/>
							</td>
							<th>3월</th>
							<td>				
								<form:input path="inputThird" cssClass="input" size="20" style="width: 110px !important; -ms-ime-mode: disabled; "/>
							</td>
						</tr>
						<tr>
							<th>10월</th>
							<td>				
								<form:input path="inputTenth" cssClass="input" size="20" style="width: 110px !important; -ms-ime-mode: disabled; "/>
							</td>
							<th>4월</th>
							<td>				
								<form:input path="inputFourth" cssClass="input" size="20" style="width: 110px !important; -ms-ime-mode: disabled; "/>
							</td>
						</tr>
						<tr>
							<th>11월</th>
							<td>				
								<form:input path="inputEleventh" cssClass="input" size="20" style="width: 110px !important; -ms-ime-mode: disabled; "/>
							</td>
							<th>5월</th>
							<td>				
								<form:input path="inputFifth" cssClass="input" size="20" style="width: 110px !important; -ms-ime-mode: disabled; "/>
							</td>
						</tr>
						<tr>
							<th>12월</th>
							<td>				
								<form:input path="inputTwelveth" cssClass="input" size="20" style="width: 110px !important; -ms-ime-mode: disabled; "/>
							</td>
							<th>6월</th>
							<td>				
								<form:input path="inputSixth" cssClass="input" size="20" style="width: 110px !important; -ms-ime-mode: disabled; "/>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- popup_bg -->
			<div class="popupBtn">
				<img id="codeUpdate" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" style="width:57px" class="pointer" />
				<a class="dialogClose" ><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
			</div>
		</div>		
	</form:form>
</div>
<form name="form_delete" id="form_delete" >
<input type="hidden" name="clubCode"/>
<input type="hidden" name="sessionYear"/>
</form>

