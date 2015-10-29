<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		$("#organCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM3_05VO.organCode}"
		});
		
		$("#organCode").on("change", function(){
			$.saveOrganCode({
				 lvl:3
				,organCode: $(this).val()
			});
		});
		
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_05VO.sessionYear}"  
			,top:false
		});
		
		//체크박스 클릭시 하나만 선택가능하게  
		$("input[name='orderBy']:checkbox").on("click", function(){
			$("input[name='orderBy']:checkbox").prop("checked", false);
			$(this).prop("checked", true);
		});
		
		$("#btnSearch").on("click", function(){
			$.saveOrganCode({
				 lvl:3
				,organCode: $("#organCode").val()
			});
			
			_search();
		});
		
	    $("img").lazyload({
	    	container: $("#Scroll_Area")
	    });
	});
});

//조회
function _search(){
	$("form").submit();
}
</script>
<style>
<!--
#Scroll_Area{
	height: 400px;
}
.tblPhoto div{
	width: 130px;
	float: left;
	margin-left: 12px;
}
-->
</style>
<form:form id="form_list" modelAttribute="MM3_05VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="지구기본사항입력표">
			<caption>회장/지구임원사진</caption>
			<colgroup>
				<col width="75px" />
				<col width="400px" />
				<col width="75px" />
				<col width="300px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>선택조직</th>
					<td><form:select path="organCode" /></td>
					<th>조회순서</th>
					<td style="font-size:12px;letter-spacing:-1px">
						<form:radiobutton path="order" value="1" label="클럽순" cssClass="ml10" />
						<form:radiobutton path="order" value="2" label="직책순" cssClass="ml10" />
						<form:radiobutton path="order" value="3" label="생년월일순" cssClass="ml10" /><br/>
						<form:radiobutton path="order" value="4" label="성명순" cssClass="ml10" />
						<form:radiobutton path="order" value="5" label="입회일자순" cssClass="ml10" />
					</td>
					<td style="font-size:12px;letter-spacing:-1px">
						<form:checkbox path="outRemove" value="1" label="퇴직제외" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td><form:select path="sessionYear" /></td>
					<th>지구직책</th>
					<td class="LH" colspan="2">
						<lions:codeselect path="selDstTitleCd" groupCode="2760" id ="selectOrganTitleCdDstCurrVal" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4>회장/지구임원사진</h4>
		<div class="btnBox">
			<img id="btnSearch" alt="조회" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
		</div>
		
		<div id="Scroll_Area" class="Height_1 mT0">
			<div class="tblPhoto">
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<div>
						<p class="photo" style="width: 100px; height: 120px;">
							<img data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.memberPictureFile}" />
						</p>
						<p class="txt ellipsis">${list.appDescNm }</p>
						<p class="txt ellipsis">${list.organNm }</p>
						<p class="txt ellipsis">
							<c:if test="${not empty list.dismissalDate }">
								<strong class="Red">(해임)</strong>
							</c:if>
							<c:choose>
								<c:when test="${list.outYN eq 'Y' }">
									<strong class="Blue">${list.name }</strong>
								</c:when>
								<c:otherwise>${list.name }</c:otherwise>
							</c:choose>
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</form:form>