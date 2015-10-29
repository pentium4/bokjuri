<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		$("#eventStartDate").datepicker();
		
		// 조직코드 세팅
		$("#organCode").organCode({
			 lvl: 3
			,fixVal: "${MM2_30VO.organCode}"
			,searchable: true
			,auth: false
		}, function(){
			$("#organCode").on("change", function(){
				var $organCode = $(this).val();
				$("#eventNameCode").option2Code({
				     groupCode: '3600' // 그룹코드
				    ,code: $organCode.substring(0, 3) + "000" // 코드
				    ,topLabel: "--전체--"
				    ,code1: "A,B"
				    ,fixVal: "${MM2_30VO.eventNameCode}" // 고정값
				    ,searchable: true
				});
			}).change();
		});
		
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM2_30VO.sessionYear}"	// 고정값
		});
		
		// 조회 버튼선택
		$("#search").on("click", function(){
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
		
		$(".eventMemberPopup").on("click", function(){
			var idnNo = $(this).prop("id");
			openPopup('<c:url value="/MM2/MM2_5/MM2_29/eventMemberPopup.do?idnNo='+ idnNo +'" />', 800, 550, 'eventMemberPopup');
		});
	
		$(".eventPhotoPopup").on("click", function(){
			$.viewThumbnailPopup({
				fileId : $(this).prop("id")
			});
		});
	});
});

function _search(){
	$("form").submit();
}
</script>

<form:form modelAttribute="MM2_30VO">
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
					<form:radiobutton path="order" value="1" label="기간" cssStyle="margin-left: 10px;" />
					<form:radiobutton path="order" value="2" label="행사명" cssStyle="margin-left: 10px;" />
				</td>
			</tr>
			<tr>
				<th>회기선택</th>
				<td>
					<form:select path="sessionYear" cssClass="select" />
					<form:input path="eventStartDate" cssClass="input" /> 
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
		<img title="검색" id="search" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" class="pointer authorization read" />
	</div>
	<div class="tblTitle Scroll_Title Height_0">
		<table class="tblType2_1" summary="행사입력표">
			<caption>행사입력</caption>
			<colgroup>
				<col width="180px" />
				<col width="180px" />
				<col width="110px" />
				<col width="150px" />
				<col width="*" />
				<col width="50px" />
				<col width="60px" />
			</colgroup>
			<thead>
				<tr>
					<th>조직명</th>
					<th>기간</th>
					<th>행사시간</th>
					<th>행사명</th>
					<th>행사내용 및 장소</th>
					<th>인원</th>
					<th>사진</th>
				</tr>
			</thead>
		</table>
	</div><!-- tblTitle -->
	
	<div id="Scroll_Area" class="Height_1">
		<table class="tblType2 Scroll_Table">
			<colgroup>
				<col width="180px" />
				<col width="180px" />
				<col width="110px" />
				<col width="150px" />
				<col width="*" />
				<col width="50px" />
				<col width="60px" />
			</colgroup>
			<tbody>
				<c:forEach items="${resultList }" var="list">
					<tr>
						<td title="${list.organName }">${list.organName }</td>
						<td>
							<form:radiobutton path="idnNo" cssClass="idnNo" value="${list.idnNo }" cssStyle="display:none;" />
							<fmt:parseDate var="eventStartDate" value="${list.eventStartDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
							~
							<fmt:parseDate var="eventEndDate" value="${list.eventEndDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${eventEndDate }" pattern="yyyy.MM.dd" />
						</td>
						<td>${list.eventStartTime } ~ ${list.eventEndTime }</td>
						<td class="left" title="${list.eventName }">${list.eventName }</td>
						<td class="left" title="${list.eventDesc }">${list.eventDesc }</td>
						<td class="right" title="${lions:newline(list.eventOrganNames) }"><a id="${list.idnNo }" class="eventMemberPopup" href="#">${list.memberNoCnt }</a></td>
						<td class="center">
							<c:if test="${not empty list.fileId }">
								<a id="${list.fileId }" class="eventPhotoPopup" href="#">
									☞(${list.fileCnt })
								</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div><!-- tblInner -->
	
	<div class="Scroll_Title Height_0">
		<table class="tblType2_1">
			<colgroup>
				<col width="180px" />
				<col width="180px" />
				<col width="110px" />
				<col width="150px" />
				<col width="*" />
				<col width="50px" />
				<col width="60px" />
			</colgroup>
			<tfoot>
				<tr>
					<th colspan="5">계</th>
					<th class="right"><fmt:formatNumber value="${total.memberNoCnt }" /></th>
					<th></th>
				</tr>
			</tfoot>
		</table>
	</div><!-- tblInner -->	
</div><!-- table -->
<!-- 본문 내용 끝 -->
<div id="jfileView">
	<span id="jfileViewload"></span>
</div>
</form:form>