<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#thisYear").sessionYearCombo({
			fixVal: "${MM3_28VO.thisYear}"	// 고정값
		});
	
		$("#thisYear").on("change", function(){
			$("#form_list").submit();		
		});
		//조회 버튼선택
		$("#search").on("click", function(){
			
			linkPage2(1);
			
		});
		
		//기관 클럽코드 세팅
		$("#upperCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM3_28VO.upperCode}"
		});
		
		$("#upperCode").on("change", function(){
			$("#form_list").submit();		
		});
	
		/* $("#form_list").submit(); */
		//글로벌 idnNo
		var _idnNo = null;
	
		
		$("#button_return").bind("click", function() {	
			$("#form_list").attr("action","/MM3/MM3_5/MM3_28/MM3_28.do");
			$("#form_list").submit();
		});
		
		
		$("#button_insert").click(function() {
	// 	alert("pass");
			var params = $("#form_list").serializeArray();
			
			$(".clubCode").each(function(i){
				
					var clubCode = $(this).val();
					var upperOrganCode = $(".upperOrganCode").eq(i).val();
					var standScore = $(".standScore").eq(i).val();
					var first = $(".first").eq(i).val();
					var second = $(".second").eq(i).val();
					var third = $(".third").eq(i).val();
					var fourth = $(".fourth").eq(i).val();
					var fifth = $(".fifth").eq(i).val();
					var sixth = $(".sixth").eq(i).val();
					var seventh = $(".seventh").eq(i).val();
					var eighth = $(".eighth").eq(i).val();
					var nineth = $(".nineth").eq(i).val();
					var tenth = $(".tenth").eq(i).val();
					var eleventh = $(".eleventh").eq(i).val();
					var twelveth = $(".twelveth").eq(i).val();
					
					params.push({name:"researchArray["+i+"].upperOrganCode", value: upperOrganCode});
					params.push({name:"researchArray["+i+"].clubCode", value: clubCode});
					params.push({name:"researchArray["+i+"].standScore", value: standScore});
					params.push({name:"researchArray["+i+"].first", value: first});
					params.push({name:"researchArray["+i+"].second", value: second});
					params.push({name:"researchArray["+i+"].third", value: third});
					params.push({name:"researchArray["+i+"].fourth", value: fourth});
					params.push({name:"researchArray["+i+"].fifth", value: fifth});
					params.push({name:"researchArray["+i+"].sixth", value: sixth});
					params.push({name:"researchArray["+i+"].seventh", value: seventh});				
					params.push({name:"researchArray["+i+"].eighth", value: eighth});
					params.push({name:"researchArray["+i+"].nineth", value: nineth});
					params.push({name:"researchArray["+i+"].tenth", value: tenth});
					params.push({name:"researchArray["+i+"].eleventh", value: eleventh});
					params.push({name:"researchArray["+i+"].twelveth", value: twelveth});
				
				
			});
			
	//  		$.each(_updateClub, function(key, value){
	//  			alert(value);
	// //  			params.push({name:key, value: value});
	// 		});
	// //  		alert("pass");
	//  		alert(params);
			$.ajax({
				type: "POST",
				async: false,			
				url:  '<c:url value="/MM3/MM3_5/MM3_28/MM3_28_InsertReport.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
	 						
						$("#form_list").attr("action","/MM3/MM3_5/MM3_28/MM3_28.do");
						$("#form_list").submit();
	// 					$("#form_list").submit();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			 
		});
		
		// 전체조회 기본체크 처리
		if($("input:checkbox[name=s2]").is(":checked") == false
			&& $("input:checkbox[name=s3]").is(":checked") == false
		) {
			$("input:checkbox[name=s1]").attr("checked", true);  
		}
	});
});

function linkPage2(pageNum){
	$("#form_list").submit();
}
</script>
<form:form id="form_list" modelAttribute="MM3_28VO">

<h3><div>클럽회지발간실적  <span class="date"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></span></div></h3>

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
				<form:radiobutton path="order" value="1"/>&nbsp;클럽차타순&nbsp;&nbsp;&nbsp;<br/>
				<form:radiobutton path="order" value="2"/>&nbsp;클럽가나다순&nbsp;&nbsp;
				
			</td>
			
		</td>
	</tr>
	<tr>
		<th>회기선택</th>
		<td colspan="2">
			<form:select path="thisYear" cssClass="select" />
		</td>
		
	</tr>
	</tbody>
	</table>
</div>

<div class="table">
<h4>클럽회지 발간실적
	
</h4>
	<div class="btnBox">
	<img title="조회"  id="search" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" class="pointer" />
	<img title="저장"  id="button_insert" src="/images/lionsclubs/btn/btn_save.gif" style="margin-top:2px" onclick="return false;" class="pointer" />	
	<!-- <img title="돌아가기"  id="button_return" src="/images/lionsclubs/btn/btn_edit.gif" style="margin-top:2px" onclick="return false;" class="pointer" />			 -->
	</div>
</div>
<div class="tblTitle Scroll_Title Height_0">
	<table class="tblType2_1" summary="클럽/지구행사 점수표">
	<caption>클럽/지구행사 점수</caption>
	<colgroup>
		<col width="50px" />
		<col width="*" />
		<col width="80px" />
		<col width="80px" />
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
	<tr>
		<th rowspan="2">No</th>
		<th rowspan="2">클럽명</th>
		<th rowspan="2">총점</th>
		<th rowspan="2">기준</th>
		<th colspan="12">회지 발간회차 및 일자</th>
	</tr>
	<tr>
		<th>1회</th>
		<th>2회</th>
		<th>3회</th>
		<th>4회</th>
		<th>5회</th>
		<th>6회</th>
		<th>7회</th>
		<th>8회</th>
		<th>9회</th>
		<th>10회</th>
		<th>11회</th>
		<th>12회</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="50px" />
		<col width="*" />
		<col width="80px" />
		<col width="80px" />
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
	<c:forEach var="list" items="${resultList }" varStatus="status">
	<tr>
		<td>${list.rnum }</td>
		<td class="left">${list.organName }</td>
		<td class="right">${list.totalScore }</td>
		<input type="hidden" name="upperOrganCode" class="upperOrganCode" value="${list.upperOrganCode }" /> 		
		<input type="hidden" name="clubCode" class="clubCode" value="${list.clubCode }" /> 
		<td class="center">${list.standScore }</td>
		<input type="hidden" name="standScore" class="standScore" value="${list.standScore }" /> 
		<td class="center"><form:input path="first" cssClass="input first" size="6" value="${list.first }"/></td>
		<td class="center"><form:input path="second" cssClass="input second" size="6" value="${list.second }"/></td>
		<td class="center"><form:input path="third" cssClass="input third" size="6" value="${list.third }"/></td>
		<td class="center"><form:input path="fourth" cssClass="input fourth" size="6" value="${list.fourth }"/></td>
		<td class="center"><form:input path="fifth" cssClass="input fifth" size="6" value="${list.fifth }"/></td>
		<td class="center"><form:input path="sixth" cssClass="input sixth" size="6" value="${list.sixth }"/></td>
		<td class="center"><form:input path="seventh" cssClass="input seventh" size="6" value="${list.seventh }"/></td>
		<td class="center"><form:input path="eighth" cssClass="input eighth" size="6" value="${list.eighth}"/></td>
		<td class="center"><form:input path="nineth" cssClass="input nineth" size="6" value="${list.nineth }"/></td>
		<td class="center"><form:input path="tenth" cssClass="input tenth" size="6" value="${list.tenth }"/></td>
		<td class="center"><form:input path="eleventh" cssClass="input eleventh" size="6" value="${list.eleventh }"/></td>
		<td class="center"><form:input path="twelveth" cssClass="input twelveth" size="6" value="${list.twelveth }"/></td>
		
	</tr>
	</c:forEach>	
	</tbody>
	</table>
	</div><!-- Height_1 -->
</div><!-- table -->


</form:form>