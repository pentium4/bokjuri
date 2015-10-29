<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		/*
		 * $는 무조건 1 셋팅!!!
		 */
		$("input:text[name=dollarArray]").attr("readonly", true).css("background-color","#E0FFE0");
			
		/*
		 *	수정 버튼
		 */
		$("#button_save").on("click", function() {		
			var params = $("#formUpdate").serializeArray();
			var icheck = 0;
			$("input:text").each(function(index){
				if($(this).val() != null) icheck++;
			});
			
			
			if(icheck > 0) {
				//params.push({name: "startYear", value: "${startYear}"});
				//params.push({name: "nextYear", value: "${nextYear}"});
					
				$.ajax({
					type: "POST",
					async: false,
					url: '<c:url value="/MM3/MM3_4/MM3_24/MM3_24_Update.do" />',
			 		data: params,
					dataType: 'json',
					success: function(data) {
						if(data.result){
							$("#formUpdate").attr("action","/MM3/MM3_4/MM3_24/MM3_24.do");
							$("#formUpdate").submit();
						}
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"status:"+status+"\n"+"error:"+error);
					}
				});	
			
			}else{
				alert("내용을 입력해주세요.");
				return false;
			}  /* icheck */	
		});
	});
});
</script>	

<style>
#table-dollar1 tbody td, #table-dollar2 tbody td {height:32px;}
</style>	

<form:form id="formUpdate" modelAttribute="MM3_24VO">
<form:hidden path="thisYear"/>
<form:hidden path="prevYear"/>
<h3><div>환율(＄)관리 </div></h3>
<div class="table ">
	<div class="btnExchange">
		<input type="image" id="button_save" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" style="width:57px" />
	</div>
	
	<div id="Scroll_Area" class="Height_1">
		<div class="calendar">
			<strong class="year">${prevYear } ~ ${thisYear }</strong> 
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
					<td><input type="text" class="input" size="25" id="dollar_${resultList[0].orders }" name="dollarArray" value="${resultList[0].dollar }" /></td>
					<td><input type="text" class="input" size="25" id="won_${resultList[0].orders }" name="wonArray" value="${resultList[0].won }" /></td>
					<input type="hidden" name="ordersArray" value="${resultList[0].orders }" />
				</tr>
				<tr>
					<th>8</th>
					<td><input type="text" class="input" size="25" id="dollar_${resultList[1].orders }" name="dollarArray" value="${resultList[1].dollar }" /></td>
					<td><input type="text" class="input" size="25" id="won_${resultList[1].orders }" name="wonArray" value="${resultList[1].won }" /></td>
					<input type="hidden" name="ordersArray" value="${resultList[1].orders }" />
				</tr>
				<tr>
					<th>9</th>
					<td><input type="text" class="input" size="25" id="dollar_${resultList[2].orders }" name="dollarArray" value="${resultList[2].dollar }" /></td>
					<td><input type="text" class="input" size="25" id="won_${resultList[2].orders }" name="wonArray" value="${resultList[2].won }" /></td>
					<input type="hidden" name="ordersArray" value="${resultList[2].orders }" />
				</tr>
			
				<tr>
					<th>10</th>
					<td><input type="text" class="input" size="25" id="dollar_${resultList[3].orders }" name="dollarArray" value="${resultList[3].dollar }" /></td>
					<td><input type="text" class="input" size="25" id="won_${resultList[3].orders }" name="wonArray" value="${resultList[3].won }" /></td>
					<input type="hidden" name="ordersArray" value="${resultList[3].orders }" />
				</tr>
				<tr>
					<th>11</th>
					<td><input type="text" class="input" size="25" id="dollar_${resultList[4].orders }" name="dollarArray" value="${resultList[4].dollar }" /></td>
					<td><input type="text" class="input" size="25" id="won_${resultList[4].orders }" name="wonArray" value="${resultList[4].won }" /></td>
					<input type="hidden" name="ordersArray" value="${resultList[4].orders }" />
				</tr>
				<tr>
					<th>12</th>
					<td><input type="text" class="input" size="25" id="dollar_${resultList[5].orders }" name="dollarArray" value="${resultList[5].dollar }" /></td>
					<td><input type="text" class="input" size="25" id="won_${resultList[5].orders }" name="wonArray" value="${resultList[5].won }" /></td>
					<input type="hidden" name="ordersArray" value="${resultList[5].orders }" />
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
							<td><input type="text" class="input" size="25" id="dollar_${resultList[6].orders }" name="dollarArray" value="${resultList[6].dollar }" /></td>
							<td><input type="text" class="input" size="25" id="won_${resultList[6].orders }" name="wonArray" value="${resultList[6].won }" /></td>
							<input type="hidden" name="ordersArray" value="${resultList[6].orders }" />
						</tr>
						<tr>
							<th>2</th>
							<td><input type="text" class="input" size="25" id="dollar_${resultList[7].orders }" name="dollarArray" value="${resultList[7].dollar }" /></td>
							<td><input type="text" class="input" size="25" id="won_${resultList[7].orders }" name="wonArray" value="${resultList[7].won }" /></td>
							<input type="hidden" name="ordersArray" value="${resultList[7].orders }" />
						</tr>
						<tr>
							<th>3</th>
							<td><input type="text" class="input" size="25" id="dollar_${resultList[8].orders }" name="dollarArray" value="${resultList[8].dollar }" /></td>
							<td><input type="text" class="input" size="25" id="won_${resultList[8].orders }" name="wonArray" value="${resultList[8].won }" /></td>
							<input type="hidden" name="ordersArray" value="${resultList[8].orders }" />
						</tr>
					
						<tr>
							<th>4</th>
							<td><input type="text" class="input" size="25" id="dollar_${resultList[9].orders }" name="dollarArray" value="${resultList[9].dollar }" /></td>
							<td><input type="text" class="input" size="25" id="won_${resultList[9].orders }" name="wonArray" value="${resultList[9].won }" /></td>
							<input type="hidden" name="ordersArray" value="${resultList[9].orders }" />
						</tr>
						<tr>
							<th>5</th>
							<td><input type="text" class="input" size="25" id="dollar_${resultList[10].orders }" name="dollarArray" value="${resultList[10].dollar }" /></td>
							<td><input type="text" class="input" size="25" id="won_${resultList[10].orders }" name="wonArray" value="${resultList[10].won }" /></td>
							<input type="hidden" name="ordersArray" value="${resultList[10].orders }" />
						</tr>
						<tr>
							<th>6</th>
							<td><input type="text" class="input" size="25" id="dollar_${resultList[11].orders }" name="dollarArray" value="${resultList[11].dollar }" /></td>
							<td><input type="text" class="input" size="25" id="won_${resultList[11].orders }" name="wonArray" value="${resultList[11].won }" /></td>
							<input type="hidden" name="ordersArray" value="${resultList[11].orders }" />
						</tr>
					</tbody>
				</table>
			</div><!-- calTbl -->
		</div><!-- clfix -->
	</div><!-- Height_1 -->
</div><!-- table -->
</form:form>