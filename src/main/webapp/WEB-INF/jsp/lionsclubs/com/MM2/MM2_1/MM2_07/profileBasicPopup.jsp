<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script>
function goPrevMember(){
	$("#memberNo").val("");
	goUrl('?rnum=${profileInfo.rnum - 1 }');
}
function goNextMember(){
	$("#memberNo").val("");
	goUrl('?rnum=${profileInfo.rnum + 1 }');
}

</script>

<!-- form:form id="MM1_01VO" modelAttribute="MM1_01VO" onsubmit="return false;"-->

<form:form id="form_list" modelAttribute="MM1_01VO" onsubmit="return false;">
<div id="profile">
<h3><div>개인 기본사항</div></h3>

<div class="table0 mT5">
	<table class="tblType1" summary="개인 기본사항 안내표">
	<caption>개인 기본사항</caption>
	<colgroup>
		<col width="92px" />
		<col width="90px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<td rowspan="5" class="Profile_img">
			<c:choose>
				<c:when test="${empty profileInfo.memberNo }">
					<img id="memberPictureFileImg" alt="본인 사진" src="/images/lionsclubs/mobile/photo.gif">
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${empty profileInfo.memberPictureFile }">
							<img alt="본인 사진" src="/images/lionsclubs/mobile/photo.gif">
						</c:when>
						<c:otherwise>
							<img alt="본인 사진" src="${ctx}/jfile/preview.do?fileId=${profileInfo.memberPictureFile} " />
						</c:otherwise>
					</c:choose>						
				</c:otherwise>
			</c:choose>	
		</td>
		<th>회원번호</th>
		<td>
			<div class="fL">
				<!-- form:select path="recommMemberNo" items="${memberList }" itemLabel="memberName" itemValue="memberNo" /-->
				<input type="text" id="memberNo" value="${profileInfo.memberNo }" class="input" onclick="return false;" style="margin-top:1px;" />
			</div>
		</td>
	</tr>
	<tr>
		<th>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</th>
		<td>
			<div class="fL">
				<a href="#" onclick="memberPopup" title="새창">
					<input type="text" id="name" value="${profileInfo.name }" class="input" onclick="return false;" style="margin-top:2px;" />
				</a>
			</div> 
			<c:if test="${not empty profileInfo.officerSolidCode}">
				<div class="pregident">
					<lions:codetolabel groupCode="7800" code="${profileInfo.officerSolidCode }" />
					${profileInfo.districtTitle }
				</div>
			</c:if>
		</td>
	</tr>
	<tr>
		<th>한자/영문</th>
		<td>${profileInfo.chinName } /${profileInfo.engName }</td>
	</tr>
	<tr>
		<th>소속클럽</th>
		<td>${profileInfo.sectorClub }</td>
	</tr>
	<tr>
		<th>클럽/지구</th>
		<td><span class="Green">${profileInfo.clubTitle}/${profileInfo.districtOrganName}</span></td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->

<div class="popupBtn">
	<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
</div>

</div><!-- profile -->

</form:form>



