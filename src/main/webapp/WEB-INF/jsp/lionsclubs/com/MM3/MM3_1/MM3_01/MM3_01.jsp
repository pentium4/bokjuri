<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_01VO.sessionYear}"	// 고정값
			,top: false
		});
		
		$("#searchBtn").on("click", function(){
			_search();
		});
		
	    $("img").lazyload({
	    	container: $(".tblPhoto2")
	    });
	});
});

function _search(){
	$("#idnNo").val("");
	$("form").submit();
}

function linkHistory(idnNo){
	$("#idnNo").val(idnNo);
	$("form").submit();
}
</script>
<style>
<!--
.tblPhoto2 div{
	float: left;
	margin: 5px 15px 0 10px;
	width: 100px;
}
-->
</style>
<form:form modelAttribute="MM3_01VO">
<form:hidden path="idnNo"/>
<h3>
	<div>
		<lions:menutitle menuId="${param.menuId }" kind="title" />
		<span class="date">
			<fmt:formatDate value="${baseInfo.updateDate }" pattern="yyyy.MM.dd" />
		</span>
	</div>
</h3>
<jsp:include page="/WEB-INF/jsp/lionsclubs/include/districtprofile/districtProfile.jsp" />

<div class="table">
	<h4>
		지구기본
		<em style="position:absolute;top:1px;">
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
				<col width="110px" />
				<col width="60px" />
				<col width="70px" />
				<col width="60px" />
				<col width="70px" />
				<col width="60px" />
				<col width="70px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th class="right">국제협회장<br />슬로건</th>
					<td colspan="6" style="height:57px">
						${lions:newline(baseInfo.associationSlogan)}<br />
						${lions:newline(baseInfo.associationSloganEn)}					
					</td>
					<td rowspan="12" class="innerTbl" style="width:50%">
						<div class="tblPhoto2">
							<c:forEach items="${districtMemberList }" var="list">
								<div>
									<p class="photo" style="width: 100px; height: 120px;">
										<img data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.memberPictureFile}" title="${list.districtTitle }" />
									</p>
									<p class="txt ellipsis">
										${list.districtTitle }
									</p>
									<p class="txt ellipsis">
										<c:if test="${not empty list.dismissalDate }">
											<strong class="Red">(해임)</strong>
										</c:if>
										<c:choose>
											<c:when test="${list.retireYn eq 'Y' }">
												<strong class="Blue">${list.name }</strong>
											</c:when>
											<c:otherwise>${list.name }</c:otherwise>
										</c:choose>
									</p>									
								</div>
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<th class="right LH">총재<br />슬로건</th>
					<td colspan="6" style="height:57px" class="LH">
						${lions:newline(baseInfo.slogan)}<br />
						${lions:newline(baseInfo.sloganEn)}
					</td>
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
					<td class="right"><fmt:formatNumber value="${baseInfo.districtInCnt }" /></td>
					<th>퇴임</th>
					<td class="right"><fmt:formatNumber value="${baseInfo.districtOutCnt }" /></td>
					<th>증감</th>
					<td class="right"><fmt:formatNumber value="${baseInfo.districtOutCnt - baseInfo.districtInCnt }" /></td>
				</tr>
				<tr>
					<th rowspan="2">대표수상</th>
					<td colspan="6">${baseInfo.firstAward }</td>
				</tr>
				<tr>
					<td colspan="6">${baseInfo.secodeAward }</td>
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