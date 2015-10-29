<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		// 조직코드 세팅
		$("#organCode").organCode({
			 fixVal: "${MM2_31VO.organCode}"
			,searchable: true
		}, function(){
			$("#organCode").on("change", function(){
				var $organCode = $(this).val();
				$("#eventNameCode").option2Code({
				     groupCode: '3600' // 그룹코드
				    ,code: $organCode.substring(0, 3) + "000" // 코드
				    ,topLabel: "--전체--"
				    ,code1: "A,B"
				    ,fixVal: "${MM2_31VO.eventNameCode}" // 고정값
				    ,searchable: true
				});
			}).change();
		});
		
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM2_31VO.sessionYear}"	// 고정값
		});
		
		$(".eventMemberPopup").on("click", function(){
			var idnNo = $(this).prop("id");
			openPopup('<c:url value="/MM2/MM2_5/MM2_29/eventMemberPopup.do?idnNo='+ idnNo +'" />', 800, 550, 'eventMemberPopup');
		});	
		
		// 조회 버튼선택
		$("#search").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				organCode: $("#organCode").val()
			});
			
			_search();
		});
		
		$('.tblPhoto .eventMemberPopup').each(function(){
			$(this).tooltipster({
			     content: $(this).html()
			    ,contentAsHTML: true
			});    
		});
		
		$(".photoView").on("click", function(){
			var data = $(this).data();
			
			$.viewThumbnailPopup({
				fileId : data.fileid
			});
		});
		
	    $("img").lazyload({
	    	container: $("#Scroll_Area")
	    });	
	});
});

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
	float: left;
 	margin: 0 0 0 12px;
	width: 200px;
	height: 250px;
}
-->
</style>

<form:form modelAttribute="MM2_31VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="클럽/지구행사 입력표">
			<caption>클럽/지구행사 입력</caption>
			<colgroup>
				<col width="100px" />
				<col width="500px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>조직코드</th>
					<td>
						<form:select path="organCode" cssClass="select" />
					</td>
					<th>조회순서</th>
					<td>
						<form:radiobutton path="searchKind" value="s1" label="기간" cssStyle="margin-left: 10px;" />
						<form:radiobutton path="searchKind" value="s2" label="행사명" cssStyle="margin-left: 10px;" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td>
						<form:select path="sessionYear" cssClass="select" /> 
					</td>
					<th>행사명</th>
					<td>
						<form:select path="eventNameCode" cssClass="select" />
					</td>					
				</tr>
			</tbody>
		</table>
	</div><!-- table -->

	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		
		<div class="btnBox">
			<img id="search" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read" />
		</div>
			
		<div id="Scroll_Area" class="Height_1 mT0">
			<div class="tblPhoto">
				<c:forEach var="list" items="${resultList }">
					<div>
						<p class="photo mb10" style="width: 100px; height: 120px;">
							<c:choose>
								<c:when test="${not empty list.fileId }">
									<img class="pointer photoView" alt="행사 사진" data-fileid="${list.fileId }" data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.fileId}&fileSeq=${list.fileSeq}" height="120px" width="100px" />
								</c:when>
								<c:otherwise>
									<img alt="행사 사진" data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.fileId}&fileSeq=${list.fileSeq}" height="120px" width="100px" />	
								</c:otherwise>
							</c:choose>
						</p>
						
						<span id="${list.idnNo }" class="center txt eventMemberPopup pointer">
							<p class="txt ellipsis">${list.organName }</p>
							<p class="txt ellipsis">${list.eventName }</p>
							<p class="txt ellipsis">${list.eventDesc }</p>
							<p class="txt ellipsis">
								<fmt:parseDate var="eventStartDate" value="${list.eventStartDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
								~
								<fmt:parseDate var="eventEndDate" value="${list.eventEndDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${eventEndDate }" pattern="yyyy.MM.dd" />						
							</p>
						</span>
					</div>
				</c:forEach>
			</div>
		</div>
	</div><!-- table -->
</form:form>