<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM4_01VO.sessionYear}"	// 고정값
			,top: false
		});
		
		$("#searchBtn").on("click", function(){
			_search();
		});
	});
});

function _search(value){
	$("form").submit();
}

function linkHistory(idnNo){
	$("#idnNo").val(idnNo);
	$("form").submit();
}
//-->
</script>

<form:form modelAttribute="MM4_01VO">
	<h3>
		<div>
			<lions:menutitle menuId="${param.menuId }" kind="title" />
			<span class="date">
				<fmt:formatDate value="${baseInfo.updateDate }" pattern="yyyy.MM.dd" />
			</span>
		</div>
	</h3>
	<jsp:include page="/WEB-INF/jsp/lionsclubs/include/complexprofile/complexProfile.jsp" />
	<div class="table">
		<h4>
			지구기본
			<em style="position:absolute;top:1px;padding-left:20px;">
				회기선택 : <form:select path="sessionYear" cssClass="select" />
				<c:forEach items="${officerChangeHistoryList}" var="list" varStatus="status">
					<a href="#" onclick="linkHistory('${list.idnNo}')" style="${baseInfo.idnNo eq list.idnNo ? 'color:#009cff;' : '' }">
						<fmt:parseDate var="changeDate" value="${list.changeDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${changeDate }" pattern="yyyy.MM.dd" />								
					</a>
				</c:forEach>
			</em>	
		</h4>
		
		<div class="btnBox">
			<img alt="조회" id="searchBtn" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" class="pointer authorization read" />
		</div>
		
		<div class="Height_1">
			<table class="tblType2" summary="회원기본사항 안내표">
				<caption>회원기본사항</caption>
				<colgroup>
					<col width="90px" />
					<col width="60px" />
					<col width="70px" />
					<col width="60px" />
					<col width="70px" />
					<col width="60px" />
					<col width="70px" />
					<col width="*" />
					<col width="60px" />
				</colgroup>
				<tbody>
					<tr>
						<th colspan="7">국제협회장 및 복합지구 슬로건</th>
						<th class="center">복합지구 임원</th>
					</tr>
					<tr>
						<th class="right">국제협회장<br />슬로건</th>
						<td colspan="6" style="height:57px">
						<div style="overflow-x:auto;">
							${baseInfo.associationSlogan} <!-- ${lions:newline(baseInfo.associationSlogan)}  --><br />
							${baseInfo.associationSloganEn} <!-- ${lions:newline(baseInfo.associationSloganEn)} -->
						</div>					
						</td>
						<td rowspan="10" class="innerTbl wMM1">
							<div class="innerBox">
								<div class="tblTitle Scroll_Title mT0">
									<table>
										<colgroup>
											<col width="200px" />
											<col width="*" />
											<col width="100px" />
										</colgroup>
										<thead>
											<tr>
												<th class="bT0">직책</th>
												<th class="bT0">소속</th>
												<th class="bT0 bR0">성명</th>
											</tr>
										</thead>
									</table>
								</div><!-- InnerTitle -->
								<div class="Inner2">
									<table class="Scroll_Table">
										<colgroup>
											<col width="200px" />
											<col width="*" />
											<col width="100px" />
										</colgroup>
										<tbody>
											<c:forEach items="${complexList}" var="list" varStatus="status">
												<tr>
													<td>${list.sPos2 }</td>
													<td>${list.sOrganCode }</td>
													<td class="center">${list.memberName }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div><!-- Inner -->
							</div><!-- InnerBox -->
						</td>
					</tr>
					<tr>
						<th class="right" style="height:74px;">복합지구<br />슬로건</th>
						<td colspan="6">
						<div style="overflow-x:auto;">
							${baseInfo.slogan} <!-- ${lions:newline(baseInfo.slogan)} --><br />
							${baseInfo.sloganEn} <!-- ${lions:newline(baseInfo.sloganEn)} -->
						</div>
						</td>
					</tr>
					<tr>
						<th colspan="7" style="height:24px">클럽 및 회원 증감</th>
					</tr>
					<tr>
						<th>클럽증감</th>
						<th>취임</th>
						<td class="right"><fmt:formatNumber value="${baseInfo.clubInCnt }" /></td>
						<th>퇴임</th>
						<td class="right"><fmt:formatNumber value="${baseInfo.clubOutCnt }" /></td>
						<th>증감</th>
						<td class="right"><fmt:formatNumber value="${baseInfo.clubOutCnt - baseInfo.clubInCnt }" /></td>
					</tr>
					<tr>
						<th>회원증감</th>
						<th>취임</th>
						<td class="right"><fmt:formatNumber value="${baseInfo.complexInCnt }" /></td>
						<th>퇴임</th>
						<td class="right"><fmt:formatNumber value="${baseInfo.complexOutCnt }" /></td>
						<th>증감</th>
						<td class="right"><fmt:formatNumber value="${baseInfo.complexOutCnt - baseInfo.complexInCnt }" /></td>
					</tr>
					<tr>
						<th colspan="7">주요 활동 내용</th>
					</tr>
					<tr>
						<td colspan="7">${baseInfo.mainAction1 }</td>
					</tr>
					<tr>
						<td colspan="7">${baseInfo.mainAction2 }</td>
					</tr>
					<tr>
						<td colspan="7">${baseInfo.mainAction3 }</td>
					</tr>
					<tr>
						<td colspan="7">${baseInfo.mainAction4 }</td>
					</tr>
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
</form:form>
