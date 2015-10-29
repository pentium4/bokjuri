<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		/*
		 *	수정 버튼
		 */
		$("#button_update").on("click", function() {	
			$("#form_list").attr("action","/MM3/MM3_4/MM3_24/MM3_24_Modify.do");
			$("#form_list").submit();
		});
	});
});

/*
 * 회기선택!!!
 */
function goPrevYear(prevyear){
	$("#prevYear").val(Number(prevyear)-1);
	$("#thisYear").val(prevyear);
	$("#form_list").submit();
}
function goNextYear(nextyear){
	$("#prevYear").val(nextyear);
	$("#thisYear").val(Number(nextyear)+1);
	$("#form_list").submit();
}
</script>

<style>
#table-dollar1 tbody td, #table-dollar2 tbody td {height:32px;}
</style>	


<form:form id="form_list" modelAttribute="MM3_24VO">
<form:hidden path="thisYear"/>
<form:hidden path="prevYear"/>

<h3><div>환율(＄)관리 </div></h3>
<div class="table ">
	<div class="btnExchange">
		<!-- <input type="image" id="button_insert" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" /> -->
		<img id="button_update" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" class="pointer authorization write"/>
	</div>
	
<div id="Scroll_Area" class="Height_1">
	<div class="calendar">
		<a href="javascript:goPrevYear('${prevYear }');"><img src="/images/lionsclubs/sub/icon_pre.gif" alt="이전 년도" /></a>
		<strong class="year">${prevYear } ~ ${thisYear }</strong> 
		<a href="javascript:goNextYear('${thisYear }');"><img src="/images/lionsclubs/sub/icon_next.gif" alt="다음 년도" /></a>
	</div><!-- 달력 -->

<div class="clfix">
<div class="fL calTbl">
	<table id="table-dollar1" class="tblType2_1 Scroll_Table" style="border-left:1px solid #aaa;border-top:1px solid #aaa !important;">
	<caption>환율(＄)관리</caption>
	<colgroup>
		<col width="150px" />
		<col width="200px" />
		<col width="200px" />
	</colgroup>
	<thead>
	<tr>
		<th class="H50">월</th>
		<th class="H50">(＄)</th>
		<th class="H50">금액</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<th>7</th>
		<td>${resultList[0].dollar }</td>
		<td>${resultList[0].won }</td>
	</tr>
	<tr>
		<th>8</th>
		<td>${resultList[1].dollar }</td>
		<td>${resultList[1].won }</td>
	</tr>
	<tr>
		<th>9</th>
		<td>${resultList[2].dollar }</td>
		<td>${resultList[2].won }</td>
	</tr>

	<tr>
		<th>10</th>
		<td>${resultList[3].dollar }</td>
		<td>${resultList[3].won }</td>
	</tr>
	<tr>
		<th>11</th>
		<td>${resultList[4].dollar }</td>
		<td>${resultList[4].won }</td>
	</tr>
	<tr>
		<th>12</th>
		<td>${resultList[5].dollar }</td>
		<td>${resultList[5].won }</td>
	</tr>
	</tbody>
	</table>
</div><!-- calTbl -->

<div class="fR calTbl">
	<table id="table-dollar2" class="tblType2_1 Scroll_Table" style="border-left:1px solid #aaa;border-top:1px solid #aaa !important;">
	<caption>환율(＄)관리</caption>
	<colgroup>
		<col width="150px" />
		<col width="200px" />
		<col width="200px" />
	</colgroup>
	<thead>
	<tr>
		<th class="H50">월</th>
		<th class="H50">(＄)</th>
		<th class="H50">금액</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<th>1</th>
		<td>${resultList[6].dollar }</td>
		<td>${resultList[6].won }</td>
	</tr>
	<tr>
		<th>2</th>
		<td>${resultList[7].dollar }</td>
		<td>${resultList[7].won }</td>
	</tr>
	<tr>
		<th>3</th>
		<td>${resultList[8].dollar }</td>
		<td>${resultList[8].won }</td>
	</tr>

	<tr>
		<th>4</th>
		<td>${resultList[9].dollar }</td>
		<td>${resultList[9].won }</td>
	</tr>
	<tr>
		<th>5</th>
		<td>${resultList[10].dollar }</td>
		<td>${resultList[10].won }</td>
	</tr>
	<tr>
		<th>6</th>
		<td>${resultList[11].dollar }</td>
		<td>${resultList[11].won }</td>
	</tr>
	</tbody>
	</table>
</div><!-- calTbl -->
</div><!-- clfix -->
				</div><!-- Height_1 -->
			</div><!-- table -->

</form:form>