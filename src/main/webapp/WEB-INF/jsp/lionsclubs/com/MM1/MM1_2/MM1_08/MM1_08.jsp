<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<%@ page import="java.util.*, java.util.Calendar,  java.util.Date, java.text.SimpleDateFormat"%>
<jsp:useBean id="now" class="java.util.Date" />
	
<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		$("#sessionYear").sessionYearCombo({
			 top: false
			,fixVal: "${MM1_08VO.sessionYear}"
		});
		
		$("#sessionYear").on("change", function(){
			$("#form_list").submit();	
		});
		
		$('.paymentDetail').tooltipster({
		     content: '납부내역 불러오는중...'
		    ,contentAsHTML: true
		    ,trigger: "click"
		    ,position: "right"
		    ,functionBefore: function(origin, continueTooltip) {
		        // we'll make this function asynchronous and allow the tooltip to go ahead and show the loading notification while fetching our data
		        continueTooltip();
		        
		        // next, we want to check if our data has already been cached
		        if (origin.data('ajax') !== 'cached') {
		        	var tr = $(this).closest("tr");
		        	var data = tr.data();
		    		var params = [];
		    		params.push({name: "memberNo", value: "${MM1_08VO.memberNo}"});
		    		params.push({name: "caYm", value: data.caym});
		    		
		    		$.ajax({
		    			type: "POST",
		    			url: '<c:url value="/MM1/MM1_2/MM1_08/listPayment.do" />',
		    			data: params,
		    			dataType: 'json',
		    			success: function(data) {
		    				var html = "";
		    				if(data.result){
		    					html += "<table class='tblType2'>";
		    					html += "	<thead>";
		    					html += "		<tr>";
		    					html += "			<th>납부일자</th>";
		    					html += "			<th>납부금</th>";
		    					html += "			<th>결손</th>";
		    					html += "		</tr>";
		    					html += "	</thead>";
		    					html += "	<tbody>";
		    					
		    					$.each(data.resultList, function(index, object){
									var paymentDate = object.paymentDate == null ? '' : Date.parseExact(object.paymentDate, 'yyyyMMdd').toString('yyyy.MM.dd');
									var paymentDefect = object.paymentDefect == "Y" ? "○" : "";
									
		   							html += "	<tr>";
		   							html += "		<td>" + paymentDate + "</td>";
		   							html += "		<td class='right'>" + comma(Math.round(object.payment)) + "</td>";
		   							html += "		<td>" + paymentDefect + "</td>";
		   							html += "	</tr>";
		    					});
		    					
		    					if(data.resultList.length == 0){
		   							html += "	<tr>";
		   							html += "		<td colspan='3'>납부내역이 없습니다.</td>";
		   							html += "	</tr>";
		    					}
		    					
		    					html += "	</tbody>";
		    					html += "</table>";
		    					// update our tooltip content with our returned data and cache it
			                    origin.tooltipster('content', html).data('ajax', 'cached');
		    				}
		    			},
		    			error:function(request,status,error){
		    				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    			}
		    		});	        	
		        }
		    }
		});
	});
});
//-->
</script>
<form:form id="form_list" modelAttribute="MM1_08VO" action="/MM1/MM1_2/MM1_08/MM1_08.do">
	<h3><div>회비납부현황 </div></h3>
	<jsp:include page="/WEB-INF/jsp/lionsclubs/include/sub_profile.jsp" />
	
	<div class="table" style="padding:0px; margin-left:20px; margin-right:20px;" >
		<h4>월회비 납부내용
			<em style="position:absolute;top:1px;">
				<table class="tblCal2">
					<tr>
						<td>
							회기선택 :
							<form:select path="sessionYear" cssClass="select" />
						</td>
					</tr>
				</table>
			</em>
		</h4>
		
		<div id="Scroll_Area" class="clfix Height_1">
			<div class="fL w33">
				<div class="tblTitle">
					<table class="tblType2_1" summary="월회비 납부안내 표" style="border-bottom:1px solid #aaa;">
						<caption>월회비 납부내용</caption>
						<colgroup>
							<col width="40px" />
							<col width="100px" />
							<col width="100px" />
							<col width="*" />
						</colgroup>
						<tr>
							<th colspan="4" class="Gbg">${MM1_08VO.sessionYear - 1} - ${MM1_08VO.sessionYear}</th>
						</tr>
						<tr>
							<th>월</th>
							<th>부과금</th>
							<th>납부금</th>
							<th>결손금</th>
						</tr>
					</table>
				</div>
				<table class="tblType2_1 Scroll_Table" style="border-top:1px solid #aaa;">
					<colgroup>
						<col width="40px" />
						<col width="100px" />
						<col width="100px" />
						<col width="*" />
					</colgroup>
					<tbody>
						<c:forEach items="${resultList}" var="list" varStatus="status">
							<tr data-caym="${list.caYm }">
								<th>
									<fmt:parseDate var="caYm" value="${list.caYm }" pattern="yyyyMM" />
									<fmt:formatDate value="${caYm }" pattern="M" />
								</th>
								<td class="right paymentDetail pointer">
									<fmt:formatNumber value="${list.impost }" pattern="#,###" />
								</td>
								<td class="right paymentDetail pointer">
									<fmt:formatNumber value="${list.payment }" pattern="#,###" />
								</td>
								<td class="right paymentDetail pointer">
									<fmt:formatNumber value="${list.paymentDefect }" pattern="#,###" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div><!-- fL -->
			
			<div class="fL w32" style="padding:0 9px">
				<div class="tblTitle">
					<table class="tblType2_1" summary="월회비 납부안내 표" style="border-left:1px solid #aaa;border-bottom:1px solid #aaa;">
						<caption>월회비 납부내용</caption>
						<colgroup>
							<col width="40px" />
							<col width="100px" />
							<col width="100px" />
							<col width="*" />
						</colgroup>
						<tr>
							<th colspan="4" class="Gbg">${MM1_08VO.sessionYear - 2} - ${MM1_08VO.sessionYear - 1}</th>
						</tr>
						<tr>
							<th>월</th>
							<th>부과금</th>
							<th>납부금</th>
							<th>결손금</th>
						</tr>
					</table>
				</div>
				<table class="tblType2_1 Scroll_Table" style="border-left:1px solid #aaa;border-top:1px solid #aaa;">
					<colgroup>
						<col width="40px" />
						<col width="100px" />
						<col width="100px" />
						<col width="*" />
					</colgroup>
					<tbody>
						<c:forEach items="${oneYearAgoList}" var="list" varStatus="status">
							<tr data-caym="${list.caYm }">
								<th>
									<fmt:parseDate var="caYm" value="${list.caYm }" pattern="yyyyMM" />
									<fmt:formatDate value="${caYm }" pattern="M" />
								</th>
								<td class="right paymentDetail pointer">
									<fmt:formatNumber value="${list.impost }" pattern="#,###" />
								</td>
								<td class="right paymentDetail pointer">
									<fmt:formatNumber value="${list.payment }" pattern="#,###" />
								</td>
								<td class="right paymentDetail pointer">
									<fmt:formatNumber value="${list.paymentDefect }" pattern="#,###" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div><!-- fR -->
			
			<div class="fL w33">
				<div class="tblTitle">
					<table class="tblType2_1" summary="월회비 납부안내 표" style="border-left:1px solid #aaa;border-bottom:1px solid #aaa;">
						<caption>월회비 납부내용</caption>
						<colgroup>
							<col width="40px" />
							<col width="100px" />
							<col width="100px" />
							<col width="*" />
						</colgroup>
						<tr>
							<th colspan="4" class="Gbg">${MM1_08VO.sessionYear - 3} - ${MM1_08VO.sessionYear - 2}</th>
						</tr>
						<tr>
							<th>월</th>
							<th>부과금</th>
							<th>납부금</th>
							<th>결손금</th>
						</tr>
					</table>
				</div>
				<table class="tblType2_1 Scroll_Table" style="border-left:1px solid #aaa;border-top:1px solid #aaa;">
					<colgroup>
							<col width="40px" />
							<col width="100px" />
							<col width="100px" />
							<col width="*" />
						</colgroup>
					<tbody>
						<c:forEach items="${twoYearAgoList}" var="list" varStatus="status">
							<tr data-caym="${list.caYm }">
								<th>
									<fmt:parseDate var="caYm" value="${list.caYm }" pattern="yyyyMM" />
									<fmt:formatDate value="${caYm }" pattern="M" />
								</th>
								<td class="right paymentDetail pointer">
									<fmt:formatNumber value="${list.impost }" pattern="#,###" />
								</td>
								<td class="right paymentDetail pointer">
									<fmt:formatNumber value="${list.payment }" pattern="#,###" />
								</td>
								<td class="right paymentDetail pointer">
									<fmt:formatNumber value="${list.paymentDefect }" pattern="#,###" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div><!-- fR -->
		</div>
	</div><!-- Height_1 -->
</form:form>