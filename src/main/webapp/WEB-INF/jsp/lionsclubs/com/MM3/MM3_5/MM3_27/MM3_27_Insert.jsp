<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#thisYear").sessionYearCombo({
			fixVal: "${MM3_27VO.thisYear}"	// 고정값
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
			,fixVal: "${MM3_27VO.upperCode}"
		});
		
		$("#upperCode").on("change", function(){
			$("#form_list").submit();		
		});
	
		/* $("#form_list").submit(); */
		//글로벌 idnNo
		var _idnNo = null;
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		
		/* var tbl = $("#table_body tbody tr");
		var _updateClub = {};
		tbl.bind("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			var index = $(this).index();
			
			var organCode = $("input:hidden[name=organCode]").eq(index).val();
			var area = $("input[name=area]").eq(index).val();
			var zone = $("input[name=zone]").eq(index).val();
			var uniqs = $("input[name=uniqs]").eq(index).val();
			_updateClub.organCode = organCode;
			_updateClub.area = area;
			_updateClub.zone = zone;
			_updateClub.uniqs = uniqs;		
		}); */
		
	
		/* $("#button_return").bind("click", function() {	
			$("#form_list").attr("action","/MM3/MM3_5/MM3_27/MM3_27.do");
			$("#form_list").submit();
		}); */
		
		
		$("#button_insert").click(function() {
	// 	alert("pass");
			var params = $("#form_list").serializeArray();
			
			$(".clubCode").each(function(i){
				
					var clubCode = $(this).val();
					var upperOrganCode = $(".upperCode").eq(i).val();
					var monthScore = $(".monthScore").eq(i).val();
					var jul = $(".jul").eq(i).val();
					var aug = $(".aug").eq(i).val();
					var sep = $(".sep").eq(i).val();
					var oct = $(".oct").eq(i).val();
					var nov = $(".nov").eq(i).val();
					var dec = $(".dec").eq(i).val();
					var jan = $(".jan").eq(i).val();
					var feb = $(".feb").eq(i).val();
					var mar = $(".mar").eq(i).val();
					var apr = $(".apr").eq(i).val();
					var may = $(".may").eq(i).val();
					var jun = $(".jun").eq(i).val();
					
					
					params.push({name:"sessionYmArray["+i+"].upperCode", value: upperOrganCode});
					params.push({name:"sessionYmArray["+i+"].clubCode", value: clubCode});
					params.push({name:"sessionYmArray["+i+"].monthScore", value: monthScore});
					params.push({name:"sessionYmArray["+i+"].jul", value: jul});
					params.push({name:"sessionYmArray["+i+"].aug", value: aug});
					params.push({name:"sessionYmArray["+i+"].sep", value: sep});
					params.push({name:"sessionYmArray["+i+"].oct", value: oct});
					params.push({name:"sessionYmArray["+i+"].nov", value: nov});
					params.push({name:"sessionYmArray["+i+"].dec", value: dec});
					params.push({name:"sessionYmArray["+i+"].jan", value: jan});				
					params.push({name:"sessionYmArray["+i+"].feb", value: feb});
					params.push({name:"sessionYmArray["+i+"].mar", value: mar});
					params.push({name:"sessionYmArray["+i+"].apr", value: apr});
					params.push({name:"sessionYmArray["+i+"].may", value: may});
					params.push({name:"sessionYmArray["+i+"].jun", value: jun});
				
			});
			
			$.ajax({
				type: "POST",
				async: false,			
				url:  '<c:url value="/MM3/MM3_5/MM3_27/MM3_27_InsertReport.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){ 						
					
						$("#form_list").attr("action","/MM3/MM3_5/MM3_27/MM3_27.do");
						$("#form_list").submit();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			 
		});
		//전체조회 기본체크 처리
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


<h3><div>클럽보고자료점수 <span class="date"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></span></div></h3>
<form:form id="form_list" modelAttribute="MM3_27VO" >
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
				<form:radiobutton path="order" value="1"/>&nbsp;클럽차타순&nbsp;&nbsp;&nbsp;
				<form:radiobutton path="order" value="2"/>&nbsp;클럽가나다순&nbsp;&nbsp;<br/>
				<form:radiobutton path="order" value="3"/>&nbsp;점수있는클럽조회&nbsp;&nbsp;				
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
</div><!-- table -->


<div class="table">

<h4>연말 보고자료 점수 부여
	<div class="dateBox">
		
	</div>
</h4>

	<div class="btnBox">
		<img title="조회"  id="search" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" class="pointer" />
		<input type="image" id="button_insert" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" /></a>
		<!-- <input type="image" id="button_return" src="/images/lionsclubs/btn/btn_del.gif" alt="돌아가기" style="width:57px" /> -->
	</div>

<div class="tblTitle Scroll_Title Height_0">
	<table class="tblType2" summary="연말 보고자료 점수 부여표">
	<caption>연말 보고자료 점수 부여</caption>
	<colgroup>
		<col width="25px" />
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
		<th colspan="12" id =""><strong class="year">${thisYear -1 } ~ ${thisYear }</strong></th>
	</tr>
	<tr>
		<th>점수</th>
		<th>월기준</th>
		<th>7</th>
		<th>8</th>
		<th>9</th>
		<th>10</th>
		<th>11</th>
		<th>12</th>
		<th>1</th>
		<th>2</th>
		<th>3</th>
		<th>4</th>
		<th>5</th>
		<th>6</th>
	</tr>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table" id = "table_report">
	<colgroup>
		<col width="25px" />
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
	<c:forEach items="${resultList}" var="list" varStatus="status"> 
	<tr>
		<td>${list.rnum }</td>
		<td class="left">${list.organName }</td>
		<td class="center">${list.totalScore }</td>
		<td class="center"><form:input path="standScore" cssClass="input standScore" size="6" value="${list.monthScore }"/></td>		
		<input type="hidden" name="upperOrganCode" class="upperOrganCode" value="${list.upperOrganCode }" /> 		
		<input type="hidden" name="clubCode" class="clubCode" value="${list.clubCode }" /> 		
		<td class="center"><form:input path="jul" cssClass="input jul" size="6" value="${list.jul }"/></td>
		<td class="center"><form:input path="aug" cssClass="input aug" size="6" value="${list.aug }"/></td>
		<td class="center"><form:input path="sep" cssClass="input sep" size="6" value="${list.sep }"/></td>
		<td class="center"><form:input path="oct" cssClass="input oct" size="6" value="${list.oct }"/></td>
		<td class="center"><form:input path="nov" cssClass="input nov" size="6" value="${list.nov }"/></td>
		<td class="center"><form:input path="dec" cssClass="input dec" size="6" value="${list.dec }"/></td>
		<td class="center"><form:input path="jan" cssClass="input jan" size="6" value="${list.jan }"/></td>
		<td class="center"><form:input path="feb" cssClass="input feb" size="6" value="${list.feb}"/></td>
		<td class="center"><form:input path="mar" cssClass="input mar" size="6" value="${list.mar }"/></td>
		<td class="center"><form:input path="apr" cssClass="input apr" size="6" value="${list.apr }"/></td>
		<td class="center"><form:input path="may" cssClass="input may" size="6" value="${list.may }"/></td>
		<td class="center"><form:input path="jun" cssClass="input jun" size="6" value="${list.jun }"/></td>
		
	<%-- 	
		<td><fmt:parseDate var ="jul" value="${resultlist.jul }" pattern ="MMdd"/>
		<fmt:formatDate value="${jul }" pattern ="MM.dd"/></td>
		<td><fmt:parseDate var ="aug" value="${resultlist.aug }" pattern ="MMdd"/>
		<fmt:formatDate value="${aug }" pattern ="MM.dd"/></td>
		<td><fmt:parseDate var ="sep" value="${resultlist.sep }" pattern ="MMdd"/>
		<fmt:formatDate value="${sep }" pattern ="MM.dd"/></td>
		<td><fmt:parseDate var ="oct" value="${resultlist.oct }" pattern ="MMdd"/>
		<fmt:formatDate value="${oct }" pattern ="MM.dd"/></td>
		<td><fmt:parseDate var ="nov" value="${resultlist.nov }" pattern ="MMdd"/>
		<fmt:formatDate value="${nov }" pattern ="MM.dd"/></td>
		<td><fmt:parseDate var ="dec" value="${resultlist.dec }" pattern ="MMdd"/>
		<fmt:formatDate value="${dec }" pattern ="MM.dd"/></td>
		<td><fmt:parseDate var ="jan" value="${resultlist.jan }" pattern ="MMdd"/>
		<fmt:formatDate value="${jan }" pattern ="MM.dd"/></td>
		<td><fmt:parseDate var ="feb" value="${resultlist.feb }" pattern ="MMdd"/>
		<fmt:formatDate value="${feb }" pattern ="MM.dd"/></td>
		<td><fmt:parseDate var ="mar" value="${resultlist.mar }" pattern ="MMdd"/>
		<fmt:formatDate value="${mar }" pattern ="MM.dd"/></td>
		<td><fmt:parseDate var ="apr" value="${resultlist.apr }" pattern ="MMdd"/>
		<fmt:formatDate value="${apr }" pattern ="MM.dd"/></td>
		<td><fmt:parseDate var ="may" value="${resultlist.may }" pattern ="MMdd"/>
		<fmt:formatDate value="${may }" pattern ="MM.dd"/></td>
		<td><fmt:parseDate var ="jun" value="${resultlist.jun }" pattern ="MMdd"/>
		<fmt:formatDate value="${jun }" pattern ="MM.dd"/></td> --%>
		
	</tr>
	</c:forEach>
	
	</tbody>
	</table>
				</div><!-- Height_1 -->
			</div><!-- table -->

</form:form>
