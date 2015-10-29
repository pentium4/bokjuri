<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#thisYear").sessionYearCombo({
			fixVal: "${MM3_29VO.thisYear}"	// 고정값
			,top:false
		});
	
		//조회 버튼선택
		$("#search").on("click", function(){
			$.saveOrganCode({
			     organCode: $("#upperCode").val()
			});
			
			$("#form_list").submit();
		});
		
		//기관 클럽코드 세팅
		$("#upperCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM3_29VO.upperCode}"
		});
	});
});
</script>


<h3><div>클럽봉사실적조회 <span class="date"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></span></div></h3>
<form:form id = "form_list" modelAttribute="MM3_29VO">
<div class="table">
	<table class="tblType1" summary="클럽 봉사실적 조회표">
	<caption>클럽 봉사실적 조회</caption>
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
			<form:select path="upperCode" cssClass="select" />
		</div>			
		</td>
		<th rowspan="2">정렬구분</th>
		<td rowspan="2" class="LH">
			<form:radiobutton path="order" value="1" label="클럽차타순" cssClass="ml10" />
			<form:radiobutton path="order" value="2" label="클럽실적순" cssClass="ml10" />
			<form:radiobutton path="order" value="3" label="회원증감순" cssClass="ml10" /><br/>
			<form:radiobutton path="order" value="4" label="클럽탄생순" cssClass="ml10" />	
			<form:radiobutton path="order" value="5" label="주관클럽순" cssClass="ml10" />
			<form:radiobutton path="order" value="6" label="봉사금액순" cssClass="ml10" />					
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
<h4>클럽 봉사실적 조회
	<div class="btnBox">
		<img alt="조회"  id="search" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" class="pointer" />
	</div>
</h4>

<div class="Height_1" style="overflow:auto;">
	<table class="tblType2_1 Scroll_Table" summary="클럽 봉사실적 조회">
	<caption>클럽 봉사실적 조회</caption>
	<colgroup>
		<col width="50px" />
		<col width="*" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
	</colgroup>
	<thead>
	<tr>
		<th>No</th>
		<th>클럽명</th>
		<th>총원</th>
		<th>총점</th>
		<th>회원증감</th>
		<th>클럽탄생</th>
		<th>주관클럽</th>
		<th>봉사금액</th>
		<th>기타점수</th>
		<th>기타점수</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="list" items="${resultList }" varStatus="status">
	<tr>
		<td>${list.rnum }</td>
		<td class="left">${list.organName }</td>
		<td class="right">${list.totMem }</td>
		<td class="right">${list.totalScore }</td>
		<td class="right">${list.memIn}</td>
		<td class="right">${list.birthScore }</td>
		<td class="right">${list.subjectScore }</td>
		<td class="right">${list.amountScore }</td>
		<td class="right">0</td>
		<td class="right">0</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
				</div><!-- Height_1 -->
			</div><!-- table -->

</form:form>