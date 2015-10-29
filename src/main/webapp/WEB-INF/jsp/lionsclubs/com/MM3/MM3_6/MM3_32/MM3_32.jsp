<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_31VO.sessionYear}"	// 고정값
			,top: false
		});
		
		//기관 지구코드 세팅
		$("#organCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM3_31VO.organCode}"
		});
		
		$("#searchBtn").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 3
				,organCode: $("#organCode").val()
			});
			
			_search();
		});
		
	    $(".top img").lazyload({
	    	container: $("#Scroll_Area")
	    });
	});
});


function _search(){
	$("form").submit();
}
</script>
<form:form modelAttribute="MM3_31VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="지역구성사진조회표">
			<caption>지역구성사진조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>조직코드</th>
					<td colspan="5">
						<div class="fL">
							<form:select path="organCode" cssClass="select" />
						</div>
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td>
						<form:select path="sessionYear" cssClass="select" />
					</td>
					<th>지역</th>
					<td>
						<lions:codeselect groupCode="2620" path="searchArea" cssClass="select" top="false" />
					</td>
					<th>지대</th>
					<td>
						<lions:codeselect groupCode="2640" path="searchZone" cssClass="select" top="false" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img alt="조회" id="searchBtn" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
		</div>
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblPhoto">
				<tr>
					<td style="width: 20%;">
						<table class="tbl">
							<c:forEach var="list" items="${resultList }" varStatus="status">
								<c:if test="${list.appKindCode eq '1010' and list.appDescCode eq '3900' }">
									<tr>
										<td>
											<p class="photoBig">
												<img src="${ctx}/jfile/thumbPreview.do?fileId=${list.areaZoneMemberPictureFile}" />
											</p>
											<p class="txtBig">
												${list.area }
												${list.titleName }<br />
												${list.areaZoneName }<br />
												${list.clubName }<br />
												${list.areaZoneMobile }
											</p>
										</td>
									</tr>
								</c:if>
								<c:if test="${list.appKindCode eq '1010' and list.appDescCode eq '4400' }">
									<tr>
										<td>
											<p class="photoBig">
												<img src="${ctx}/jfile/thumbPreview.do?fileId=${list.areaZoneMemberPictureFile}" />
											</p>
											<p class="txtBig">
												${list.zone }
												${list.titleName }<br />
												${list.areaZoneName }<br />
												${list.clubName }<br />
												${list.areaZoneMobile }
											</p>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</td>
					<td class="top">
						<table class="tbl">
							<c:forEach var="list" items="${resultList }" varStatus="status">
								<c:if test="${list.appKindCode eq '1000' and list.appDescCode eq '1000' }">
									<tr>
										<td>
											<p class="txt bold">${list.titleName }</p>
											<p class="photo" style="width: 100px; height: 120px;">
												<img data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.areaZoneMemberPictureFile}" />
											</p>
											<p class="txt">
												${list.areaZoneName }<br />
												${list.clubName }<br />
												${list.areaZoneMobile }
											</p>
										</td>
										<td>
											<p class="txt bold">1부회장</p>
											<p class="photo" style="width: 100px; height: 120px;">
												<img data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.vMemberPictureFile}" />
											</p>
											<p class="txt">
												${list.vName }<br />
												${list.clubName }<br />
												${list.vMobile }
											</p>
										</td>
										<td>
											<p class="txt bold">총무</p>
											<p class="photo" style="width: 100px; height: 120px;">
												<img data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.mMemberPictureFile}" />
											</p>
											<p class="txt">
												${list.mName }<br />
												${list.clubName }<br />
												${list.mMobile }
											</p>
										</td>
										<td>
											<p class="txt bold">재무</p>
											<p class="photo" style="width: 100px; height: 120px;">
												<img data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.fMemberPictureFile}" />
											</p>
											<p class="txt">
												${list.fName }<br />
												${list.clubName }<br />
												${list.mMobile }
											</p>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</td>
				</tr>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
</form:form>