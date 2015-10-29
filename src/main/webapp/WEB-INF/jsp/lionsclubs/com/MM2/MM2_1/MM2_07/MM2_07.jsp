<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM2_07VO.sessionYear}"	// 고정값
		});
	
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM2_07VO.organCode}"
		});
		
		//조회 버튼선택
		$("#searchBtn").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 4
				,organCode: $("#organCode").val()
			});
		
			_search();
		});
	});
});

// 조회
function _search(){
	$("#form_list").submit();
}

function fn_checkOrder(index) {
	//alert(index+'::'+$("input:checkbox[name=s2]").val()+'::'+$("input:checkbox[name=s2]").is(":checked"));
	if(index == 's1' && $("input:checkbox[name=s1]").is(":checked")){
		$("input:checkbox[name=s2]").attr("checked", false);
		$("input:checkbox[name=s3]").attr("checked", false);
		$("input:checkbox[name=s5]").attr("checked", false);
		$("input:checkbox[name=s6]").attr("checked", false);
		$("input:checkbox[name=s7]").attr("checked", false);

	}else if(index == 's2' && $("input:checkbox[name=s2]").is(":checked")){
		$("input:checkbox[name=s1]").attr("checked", false);
		$("input:checkbox[name=s3]").attr("checked", false);
		$("input:checkbox[name=s5]").attr("checked", false);
		$("input:checkbox[name=s6]").attr("checked", false);
		$("input:checkbox[name=s7]").attr("checked", false);
	}else if(index == 's3' && $("input:checkbox[name=s3]").is(":checked")){
		$("input:checkbox[name=s1]").attr("checked", false);
		$("input:checkbox[name=s2]").attr("checked", false);
		$("input:checkbox[name=s5]").attr("checked", false);
		$("input:checkbox[name=s6]").attr("checked", false);
		$("input:checkbox[name=s7]").attr("checked", false);
	}else if(index == 's4' && $("input:checkbox[name=s4]").is(":checked")){
		$("input:checkbox[name=s8]").attr("checked", false);
	}else if(index == 's5' && $("input:checkbox[name=s5]").is(":checked")){
		$("input:checkbox[name=s1]").attr("checked", false);
		$("input:checkbox[name=s2]").attr("checked", false);
		$("input:checkbox[name=s3]").attr("checked", false);
		$("input:checkbox[name=s6]").attr("checked", false);
		$("input:checkbox[name=s7]").attr("checked", false);
	}else if(index == 's6' && $("input:checkbox[name=s6]").is(":checked")){
		$("input:checkbox[name=s1]").attr("checked", false);
		$("input:checkbox[name=s2]").attr("checked", false);
		$("input:checkbox[name=s3]").attr("checked", false);
		$("input:checkbox[name=s5]").attr("checked", false);
		$("input:checkbox[name=s7]").attr("checked", false);
	}else if(index == 's7' && $("input:checkbox[name=s7]").is(":checked")){
		$("input:checkbox[name=s1]").attr("checked", false);
		$("input:checkbox[name=s2]").attr("checked", false);
		$("input:checkbox[name=s3]").attr("checked", false);
		$("input:checkbox[name=s5]").attr("checked", false);
		$("input:checkbox[name=s6]").attr("checked", false);
	}else if(index == 's8' && $("input:checkbox[name=s8]").is(":checked")){
		$("input:checkbox[name=s4]").attr("checked", false);
	}
}

//회원검색
function memberProfilePopup(memberNo){
	openPopup("/MM2/MM2_1/MM2_07/profileBasicPopup.do?memberNo=" + memberNo, '530', '230');	
}
</script>

<form:form id="form_list" modelAttribute="MM2_07VO">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<table class="tblType1" summary="클럽인원 조회">
		<caption>클럽인원 조회</caption>
		<colgroup>
			<col width="70px" />
			<col width="380px" />
			<col width="70px" />
			<col width="300px" />
			<col width="70px" />
			<col width="*" />
		</colgroup>
		<tbody>
			<tr>
				<th>클럽코드</th>
				<td>
					<div class="fL"><form:select path="organCode" cssClass="select" /></div>
				</td>
				<th rowspan="2">조회순서</th>
				<td rowspan="2" class="LH">
					<form:checkbox path="s1" value="1" onclick="fn_checkOrder('s1')" label="회원번호" cssStyle="margin-left:10px" />
					<form:checkbox path="s2" value="1" onclick="fn_checkOrder('s2')" label="직책순" cssStyle="margin-left:10px" /><br/>
					<form:checkbox path="s5" value="1" onclick="fn_checkOrder('s5')" label="성명순" cssStyle="margin-left:10px" />
					<form:checkbox path="s6" value="1" onclick="fn_checkOrder('s6')" label="입회일자순" cssStyle="margin-left:24px" />
					<form:checkbox path="s7" value="1" onclick="fn_checkOrder('s7')" label="행사참여순" cssStyle="margin-left:10px" />
				</td>
				<th rowspan="2">조회구분</th>
				<td rowspan="2" class="LH">
					<form:checkbox path="s4" value="1" onclick="fn_checkOrder('s4')" label="현회원" cssStyle="margin-left:10px" /><br/>
					<form:checkbox path="s8" value="1" onclick="fn_checkOrder('s8')" label="퇴회자" cssStyle="margin-left:10px" />
				</td>
			</tr>
			<tr>
				<th>회기선택</th>
				<td>
					<form:select path="sessionYear" cssClass="select" />
				</td>
			</tr>
		</tbody>
	</table>
</div><!-- table -->

<div class="table">
	<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>

	<div class="btnBox">
		<img id="searchBtn" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" alt="조회" class="pointer authorization read" />
	</div>
	<div class="tblTitle Scroll_Title Height_0">
		<table class="tblType2_1" summary="클럽인원 조회 안내표">
			<caption>클럽인원 조회</caption>
			<colgroup>
				<col width="80px" />
				<col width="80px" />
				<col width="100px" />
				<col width="200px" />
				<col width="130px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th>회원번호</th>
					<th>성 명</th>
					<th>입회일자</th>
					<th>직 책</th>
					<th>행사참여율</th>
					<th>퇴회일자</th>
					<th>퇴회사유</th>
				</tr>
			</thead>
		</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
		<table class="tblType2_1 Scroll_Table">
			<colgroup>
				<col width="80px" />
				<col width="80px" />
				<col width="100px" />
				<col width="200px" />
				<col width="130px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<tr>
						<td class="center">${list.memberNo }</td>
						<td class="center">
							<a href="#" onclick="memberProfilePopup('${list.memberNo }')" title="새창">
								<c:choose>
									<c:when test="${not empty list.quitDate }">
										<strong class="Blue">${list.memberName }</strong>
									</c:when>
									<c:otherwise>${list.memberName }</c:otherwise>
								</c:choose>
							</a>
						</td>
						<td class="center">
							<fmt:parseDate var="signDate" value="${list.signDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${signDate }" pattern="yyyy.MM.dd" />
						</td>
						
						<c:set var="sectorTitle" value="" />
						<c:choose>
							<c:when test="${not empty list.sectorTitle }">
								<c:set var="sectorTitle">${list.sectorTitle}</c:set>
							</c:when>
							<c:otherwise>
								<c:set var="sectorTitle" value="회원" />
							</c:otherwise>
						</c:choose>
						<td class="left" title="${sectorTitle }">
							<c:choose>
								<c:when test="${not empty list.sectorTitle }">
									${list.sectorTitle}
								</c:when>
								<c:otherwise>
									<c:set var="sectorTitle" value="회원" />
								</c:otherwise>
							</c:choose>
						</td>
						
						<c:set var="divisionSector" value="" />
						<c:choose>
							<c:when test="${not empty list.divisionSector }">
								<fmt:parseDate var="startDate" value="${list.startDate }" pattern="yyyyMMdd" />
								<c:set var="divisionSector">${list.divisionSector}(<fmt:formatDate value="${startDate }" pattern="yyyy.MM.dd" />)</c:set>
							</c:when>
						</c:choose>						
						<td class="center">
							<c:if test="${not empty list.eventAttend }">
								<fmt:formatNumber value="${list.eventAttend }" pattern="#.##" />%(${list.attend } / ${list.total })
							</c:if>
						</td>
						<td class="center">
							<fmt:parseDate var="quitDate" value="${list.quitDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${quitDate }" pattern="yyyy.MM.dd" />
						</td>
						<td class="left">${list.quitCause }</td>
					</tr>	
				</c:forEach>	
			</tbody>
		</table>

	</div>
	<!-- //Contents_Table_area -->
</div>

</form:form>