<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("${message}&nbsp;");
		
		$("#orgCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal: "${vo.orgCode}"
		});	
		
		$("#orgCode").on("change", function(){
			$.saveOrganCode({
				  lvl:3
			     ,organCode: $(this).val()
			});
		});
		
		
		$("#thisYear").sessionYearCombo({
			  fixVal: "${vo.thisYear}"  // 고정값
			  ,top:false
		});
		
		$("#form_list").submit(function() {
			if($("#orgCode").val()=="" || $("#orgCode").val()==null){
				return false;
			}
		});
		
		$("#btnSearch").bind("click", function(){
			checkFormSubmit();
		});
		
		var checkFormSubmit =  function(){
			if($("#orgCode").val()=="" || $("#orgCode").val()==null){
				alert("조직을 선택하세요");
				return false;
			}else{
				$("#form_list").submit();
			}		
		};
	});
});
</script>
<form:form id="form_list"  modelAttribute="MM3_09VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="클럽별인원현황">
			<caption>클럽별 인원현황</caption>
			<colgroup>
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
			<tr>
				<th>선택조직</th>
				<td><form:select path="orgCode" /></td>
			</tr>
			<tr>
				<th>회기선택</th>
				<td><form:select path="thisYear" /></td>
			</tr>
			</tbody>
		</table>
	</div>
	<div class="table" style="margin-bottom:15px !important;">
		<h4>클럽별인원현황</h4>
		<div class="btnBox">
				<img id="btnSearch" alt="조회" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" class="pointer authorization read" />
		</div>
		<div class="tblTitle mT5 Scroll_Title Height_0">
			<table class="tblType2_1" summary="클럽별인원현황표">
				<caption>클럽별인원현황</caption>
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="111px" />
					<col width="80px" />
					<col width="70px" />
					<col width="70px" />
					<col width="70px" />
					<col width="70px" />
					<col width="70px" />
				</colgroup>
				<thead>
					<th>No</th>
					<th>클럽명</th>
					<th>조직총회일</th>
					<th>회장</th>
					<th>총원</th>
					<th>증감목표</th>
					<th>입회</th>
					<th>퇴회</th>
					<th>증감</th>
					<%-- <th>폐회일자</th> --%>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="111px" />
					<col width="80px" />
					<col width="70px" />
					<col width="70px" />
					<col width="70px" />
					<col width="70px" />
					<col width="70px" />
				</colgroup>
				<thead>
					<th style="display:none;"></th>
					<th style="display:none;"></th>
					<th style="display:none;"></th>
					<th style="display:none;"></th>
					<th style="display:none;"></th>
					<th style="display:none;"></th>
					<th style="display:none;"></th>
					<th style="display:none;"></th>
					<th style="display:none;"></th>
				</thead>
				<tbody>
					<c:set value="0" var="tot1"/>
					<c:set value="0" var="tot2"/>
					<c:set value="0" var="tot3"/>
					<c:set value="0" var="tot4"/>
					<c:set value="0" var="tmem"/>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td class="left" title="${fn:substring(list.organCodeClub, 0, 3)}-${fn:substring(list.organCodeClub, 3, 8)}">${list.organNmClub }</td>
							<td>
								<fmt:parseDate value="${list.organMeeting}" var="dateFmt" pattern="yyyyMMdd"/>
								<fmt:formatDate value="${dateFmt}" pattern="yyyy.MM.dd"/>
							</td>
							<td class="center">${list.memberNm }</td>
							<td class="right"><fmt:formatNumber value="${list.totCnt}" /></td>
							<td class="right">${list.targetMember }</td>							
							<td class="right"><fmt:formatNumber value="${list.regCnt}" /></td>
							<td class="right"><fmt:formatNumber value="${list.outCnt}" /></td>
							<td class="right"><fmt:formatNumber value="${list.resultCnt}" /></td>
							<%-- <td class="center">
								<fmt:parseDate value="${list.organAbolishDate}" var="dateFmt" pattern="yyyyMMdd"/>
								<fmt:formatDate value="${dateFmt}" pattern="yyyy.MM.dd"/>
							</td>--%>
							<c:set value="${tot1 + list.totCnt}" var="tot1"/>
							<c:set value="${tot2 + list.regCnt}" var="tot2"/>
							<c:set value="${tot3 + list.outCnt}" var="tot3"/>
							<c:set value="${tot4 + list.resultCnt}" var="tot4"/>
							<c:set value="${tmem + list.targetMember }" var="tmem"/>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		<div class="Scroll_Title Height_0 ">
			<table class="tblType2_1">
				<colgroup>
					<col width="*" />
					<col width="70px" />
					<col width="70px" />
					<col width="70px" />
					<col width="70px" />
					<col width="70px" />
				</colgroup>
				<tfoot>	
				<tr>
					<th>계</th>
					<th class="right"><fmt:formatNumber value="${tot1}" /></th>
					<th class="right"><fmt:formatNumber value="${tmem}" /></th>
					<th class="right"><fmt:formatNumber value="${tot2}" /></th>
					<th class="right"><fmt:formatNumber value="${tot3}" /></th>
					<th class="right"><fmt:formatNumber value="${tot4}" /></th>
				</tr>
				</tfoot>
			</table>
		</div>
	</div><!-- table -->
</form:form>