<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#thisYear").sessionYearCombo({
			fixVal: "${MM2_23VO.thisYear}"	// 고정값
			,top:false
		});
	
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM2_23VO.organCode}"
		});
		
		//조회 버튼선택
		$("#search").on("click", function(){
			var thisYear = $("#thisYear").val();
			
			if(thisYear == ""){
				alert("회기별 조회만 가능합니다.");
				$("#thisYear").focus();
				return false;
			}
			
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 4
				,organCode: $("#organCode").val()
			});
			
			linkPage2(1);
		});
		
		$("input:checkbox[name='s1']").on("click", function(){
			var checkedVal =$(this).val();
			$("input:checkbox[name='s1']").each(function(){
				$(this).prop("checked",(checkedVal == $(this).val()));								
			});
		});
	});
});

//링크페이지
function linkPage2(pageNum){
	$("#form_list").submit();
}

function fn_checkOrder(index) {
	//alert(index+'::'+$("input:checkbox[name=s2]").val()+'::'+$("input:checkbox[name=s2]").is(":checked"));
	if(index == 's1' && $("input:checkbox[name=s1]").is(":checked")){
		$("input:checkbox[name=s2]").attr("checked", false);

	}else if(index == 's2' && $("input:checkbox[name=s2]").is(":checked")){
		$("input:checkbox[name=s1]").attr("checked", false);

	}
}
</script>

<form:form id="form_list" modelAttribute="MM2_23VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="지출예산 실적 조회표">
			<caption>지출예산 실적 조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="380px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>클럽코드</th>
					<td>
						<div class="fL">
							<form:select path="organCode"/>
						</div>
					</td>
					<th rowspan="2">조회구분</th>
					<td rowspan="2" class="LH">
						<form:checkbox path="s1" value="1" label="지출세부항목별" cssClass="ml10" /><br/>
						<form:checkbox path="s1" value="2" label="증감순" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td>
						<form:select path="thisYear" cssClass="select" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->

	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img alt="조회"  id="search" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" class="pointer authorization read" />
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="지출예산실적 조회 안내표">
				<caption>지출예산 및 결산현황</caption>
				<colgroup>
					<col width="150px" />
					<col width="*" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
				</colgroup>
				<thead>
					<tr>
						<th>지출분류항목</th>
						<th>지출세부항목</th>
						<th>예산금액</th>
						<th>결산금액</th>
						<th>증감</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table" id = "table_sis">
				<colgroup>
					<col width="150px" />
					<col width="*" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
				</colgroup>
				<tbody>
					<c:forEach items="${dataList}" var="list" varStatus="status">
						<c:set var="fStyle" value="" />
						<c:choose>
							<c:when test="${list.classItemCode eq '1160' and not empty list.moneyIdnNo}">
								<c:set var="fStyle" value="color:blue" />
							</c:when>
							<c:when test="${list.classItemCode eq '1040' and not empty list.moneyIdnNo}">
								<c:set var="fStyle" value="color:green" />
							</c:when>
							<c:when test="${list.classItemCode eq '1110' and not empty list.moneyIdnNo}">
								<c:set var="fStyle" value="color:#FF00FF" />
							</c:when>
						</c:choose>				
						<tr>
							<td class="left" style="${fStyle}" title="${list.classItemName }">${list.classItemName }</td>
							<td class="left" style="${fStyle}" title="${list.detailItemName }">${list.detailItemName }</td>
							<td class="right" style="${fStyle}">
								<fmt:formatNumber value="${list.budgetAmount }" pattern="#,###"/>
							</td>
							<td class="right" style="${fStyle}">
								<fmt:formatNumber value="${list.realAmount }" pattern="#,###"/>
							</td>
							<td class="right" style="${fStyle}">
								<fmt:formatNumber value="${list.subtractAmount }" pattern="#,###"/>
							</td>
						</tr>	
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1" summary="지출예산실적 조회 안내표 총계">
				<caption>지출예산 및 결산현황 총계</caption>
				<colgroup>
					<col width="150px" />
					<col width="*" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="2">총계</th>
						<th class="right">
							<fmt:formatNumber value="${dataListSum.budgetAmount }" pattern="#,###"/>
						</th>
						<th class="right">
							<fmt:formatNumber value="${dataListSum.realAmount }" pattern="#,###"/>
						</th>
						<th class="right">
							<fmt:formatNumber value="${dataListSum.subtractAmount }" pattern="#,###"/>
						</th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->		
	</div><!-- table -->
</form:form>