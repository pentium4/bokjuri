<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		$("#button_select").click(function() {
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 4
				,organCode: $("#organCode").val()
			});
		
			$("#form_list").submit();
		});
		
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM2_11VO.sessionYear}"
		});
		
		$("#month").monthCombo({
			 fixVal : "${MM2_11VO.month}"
		});
		
		/*
		 * 코드 구하기
		 */
		$("#organCode").organCode({
			 lvl:4
			,fixVal:"${MM2_11VO.organCode}"
			,searchable: true
		});
		
		$("#organCode").on("change", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 4
				,organCode: $(this).val()
			});
		});
		
		$("#classItemCode").on("change", function(){
			$("#detailItemCode").option1Code({
				 groupCode: '4100' // 그룹코드
				,code: $(this).val() // 코드
				,fixVal: "${MM2_11VO.detailItemCode}" // 고정값
				,topLabel: '--전체--' // 상단명(상단명을 정하지 않으면 나타나지 않음)
				,searchable: false // 검색콤보박스 true/false
			 }); 	
		}).change();
		
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
		    		params.push({name: "idnNo", value: data.idnno});
		    		params.push({name: "paymentCount", value: data.paymentcount});
		    		
		    		$.ajax({
		    			type: "POST",
		    			url: '<c:url value="/MM1/MM1_2/MM1_09/listPayment.do" />',
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
									
		   							html += "	<tr data-paymentcount=" + object.paymentCount + ">";
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
</script>

<form:form id="form_list" modelAttribute="MM2_11VO" action="/MM2/MM2_2/MM2_11/MM2_11.do">
	<h3><div>회비 및 납부금 조회</div></h3>
	<div class="table">
		<table class="tblType1" summary="회비 및 납부금 조회표">
			<caption>회비 및 납부금 조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="150px" />
				<col width="80px" />
				<col width="150px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>클럽코드</th>
					<td colspan="3">
						<div class="fL">
							<form:select path="organCode" cssClass="select" />
						</div>
					</td>
					<th>조회순서</th>
					<td>
						<form:checkbox path="orderGenDate" value="1" label="부과일순" cssClass="ml10" />
						<form:checkbox path="orderName" value="1" label="성명순" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td>
						<form:select path="sessionYear" cssClass="select" />
					</td>
					<th>선택월</th>
					<td>
						<form:select path="month" cssClass="select"/>
					</td>
					<th>조회구분</th>
					<td>
						<form:checkbox id="fullPayment" path="fullPayment" value="1" label="완납" cssClass="ml10" />
						<form:checkbox id="defaultPayment" path="defaultPayment" value="1" label="미납" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>수입분류항목</th>
					<td colspan="3">
						<lions:codeselect path="classItemCode" groupCode="4100" />
					</td>
					<th>수입세부항목</th>
					<td>
						<form:select path="detailItemCode" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4>회비 및 납부금 조회</h4>
		<div class="btnBox">
			<img id="button_select" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read"/>
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="납부금 안내표">
				<caption>납부금</caption>
				<colgroup>
					<col width="80px" />
					<col width="60px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="70px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>회원번호</th>
						<th>성 명</th>
						<th>부과일자</th>
						<th>수입분류항목</th>
						<th>수입세부항목</th>
						<th>부과금</th>
						<th>납부금</th>
						<th>결손금</th>
						<th>미수금</th>
						<th colspan="2">참고사항</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table">
				<colgroup>
					<col width="80px" />
					<col width="60px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="70px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<c:set var="fStyle" value="" />
						<c:choose>
							<c:when test="${list.classItemCode eq '1030'}">
								<c:set var="fStyle" value="color:blue" />
							</c:when>
							<c:when test="${list.classItemCode eq '1040'}">
								<c:set var="fStyle" value="color:green" />
							</c:when>
						</c:choose>
						<tr data-idnno="${list.idnNo }" data-paymentcount="${list.paymentCount }" data-classitemcode="${list.classItemCode }">
							<td class="center" style="${fStyle}">${list.memberNo }</td>
							<td class="center" style="${fStyle}">${list.name }</td>
							<td class="center" style="${fStyle}">
								<fmt:parseDate var="genDate" value="${list.genDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
							</td>
							<td title="${list.classItemName }" style="${fStyle}">${list.classItemName }</td>
							<td title="${list.detailItemName }" style="${fStyle}">${list.detailItemName }</td>
							<td class="right paymentDetail pointer" style="${fStyle}"><fmt:formatNumber value="${list.impost }" /></td>
							<td class="right paymentDetail pointer" style="${fStyle}"><fmt:formatNumber value="${list.payment }" /></td>
							<td class="right paymentDetail pointer" style="${fStyle}"><fmt:formatNumber value="${list.paymentDefect }" /></td>
							<td class="right paymentDetail pointer" style="${fStyle}">
								<fmt:formatNumber value="${list.balance }" />
							</td>
							<td colspan="2" style="${fStyle}">${list.reference }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1" summary="납부금 안내표">
				<caption>납부금</caption>
				<colgroup>
					<col width="80px" />
					<col width="60px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="70px" />
					<col width="*" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="5">회기 누계</th>
						<th class="right">
							<fmt:formatNumber><c:out value="${sum.impost}" /></fmt:formatNumber>
						</th>
						<th class="right">
							<fmt:formatNumber><c:out value="${sum.payment}" /></fmt:formatNumber>
						</th>
						<th class="right">
							<fmt:formatNumber><c:out value="${sum.paymentDefect}" /></fmt:formatNumber>
						</th>
						<th class="right">
							<fmt:formatNumber><c:out value="${sum.balance}" /></fmt:formatNumber>
						</th>
						<th>정산일자</th>
						<th>
							<fmt:parseDate var="cdate" value="${cDate}" pattern="yyyyMMdd" />
							<fmt:formatDate value="${cdate }" pattern="yyyy.MM.dd" />
						</th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->
	</div><!-- table -->	
	<!-- 본문 내용 끝 -->
</form:form>
