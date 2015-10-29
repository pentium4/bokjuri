<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#organCode").mask("a99-999");
		
		$("#del").on("click", function(){
			
			if(!confirm("조직을 삭제 하시겠습니까?")){
				return false;
			}
			
			var params = [];
			params.push({name: "organCode", value: "${result.organCode}"});
			
			$.ajax({
				type: "POST",
				async: false,
				url: '<c:url value="/SM1/SM1_2/SM1_04/organDelete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
	// 					alert('정상적으로 삭제 되었습니다.');
						goUrl('<c:url value="/SM1/SM1_2/SM1_04/SM1_04.do" />');
					}
					
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});	
		
		$("#hdel").on("click", function(){
			
			if(!confirm("조직변동이력을 삭제 하시겠습니까?")){
				return false;
			}
			
			var params = [];
			params.push({name: "idnNo", value: "${history.idnNo}"});
			params.push({name: "organCode", value: "${history.organCode}"});
			
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/SM1/SM1_2/SM1_04/organHistoryDelete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						_search();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});	
		
		$("#organCode, #koName").focus(function(){
			$(this).select();
		});
		
		$("#organCode, #koName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				var searchType = $(this).prop("id");
				if(searchType == "organCode"){
					var params = [];
					params.push({name:"organCode", value:$("#organCode").val()});
					organSearchPopup(params);	
				} else if(searchType == "koName"){
					var params = [];
					params.push({name:"koName", value:$("#koName").val()});
					organSearchPopup(params);	
				}
			}
		});
		
		var monthDueTooltip = "";
		var monthDue = '${memberDivisionMonthDueList}';
		var list = $.parseJSON(monthDue);
		$.each(list, function(index, object) {
			monthDueTooltip += object.codeName + " : " + payComma(object.monthDue) + "<br/>";
		});
		  
		$('.monthDue').tooltipster({
		     content: monthDueTooltip
		    ,contentAsHTML: true
		});
	});
});

// 조직검색
function organSearchPopup(settings){
	var params = "";
	if(settings != undefined){
		$.each(settings, function(index, object) {
		    if(index == 0){
		    	params += "?" + object.name + "=" + object.value;
		    } else {
		    	params += "&" + object.name + "=" + object.value;
		    }
		}); 	
	}
	
	openPopup("/SM1/SM1_2/SM1_04/organSearchPopup.do" + params, '700', '400', "organSearchPopup");	
}

function _organResult(value){
	$("#organCode").val($.url(value).param("organCode"));
	
	_search();
}

function _search(){
	$("form").submit();
}
</script>
<form:form modelAttribute="SM1_04VO" action="/SM1/SM1_2/SM1_04/SM1_04.do">
	<h3>
		<div>
			<lions:menutitle menuId="${param.menuId }" kind="title" />
			<span class="date"><fmt:formatDate value="${history.updateDate }" pattern="yyyy.MM.dd" /></span>
		</div>
	</h3>
	<div class="table">
		<table class="tblType1" summary="개인 기본사항 안내표">
		<caption>개인 기본사항</caption>
		<colgroup>
			<col width="105px" />
			<col width="90px" />
			<col width="32%" />
			<col width="90px" />
			<col width="*" />
			<col width="105px" />
		</colgroup>
		<tbody>
		<tr>
			<td rowspan="5" class="Profile_img">
				<img src="${ctx}/jfile/thumbPreview.do?fileId=${history.memberPictureFile}" />
			</td>
			<th>코드명</th>
			<td colspan="3">
				<div class="fL" style="padding-top:2px">
					<input type="text" id="organCode" name="organCode" size="50" class="input" value="${result.organCode }" />
				</div>
				
				<div class="fR">
					<c:choose>
						<c:when test="${not empty organCode.prevOrganCode }">
							<a href="#" onclick="goUrl('?organCode=${organCode.prevOrganCode }');" alt="이전 페이지" style="float: left;">
								<img src="/images/lionsclubs/sub/icon_pre2.gif" style="margin-right: 5px" />
							</a>
						</c:when>
						<c:otherwise>
							<img src="/images/lionsclubs/sub/icon_pre3.gif" alt="이전 페이지" style="margin-right: 5px;float: left;" />
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${not empty organCode.nextOrganCode }">
							<a href="#" onclick="goUrl('?organCode=${organCode.nextOrganCode }');" alt="다음 페이지" style="float: left;">
								<img src="/images/lionsclubs/sub/icon_next2.gif" />
							</a>
						</c:when>
						<c:otherwise>
							<img src="/images/lionsclubs/sub/icon_next3.gif" alt="후" style="float: left;" />
						</c:otherwise>
					</c:choose>
				
					<img src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px;vertical-align:top !important;margin-top:2px;margin-left:15px;" onclick="openPopup('/SM1/SM1_2/SM1_04/organPopup.do', '700', '480');" class="pointer authorization write"  />
					
					<img src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px;vertical-align:top !important;margin-top:2px;" onclick="openPopup('/SM1/SM1_2/SM1_04/organPopup.do?organCode=${result.organCode }', '700', '420');" class="pointer authorization write" />
					<c:if test="${organHistoryCount eq '0' }">
						<img id="del" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px;vertical-align:top !important;margin-top:2px;" class="pointer authorization write"  />
					</c:if>
				</div>		
				
			</td>
			<td rowspan="5" class="Profile_img">
				<img src="${ctx}/jfile/thumbPreview.do?fileId=${history.nessPictureFile}" />
			</td>
		</tr>
		<tr>
			<th>한 글 명</th>
			<td colspan="3">
				<input type="text" id="koName" name="koName" size="50" class="input" value="${result.koName }" />
			</td>
		</tr>
		<tr>
			<th>한글약어</th>
			<td>${result.koAbbr }</td>
			<th>한글약어(2)</th>
			<td>${result.koAbbr2 }</td>
		</tr>
		<tr>
			<th>한 자 명</span></th>
			<td colspan="3">${result.chinName }</td>
		</tr>
		<tr>
			<th>영 문 명</span></th>
			<td colspan="3">${result.enName }</td>
		</tr>
		</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img alt="추가" src="/images/lionsclubs/btn/btn_add.gif" style="width:57px;" onclick="openPopup('/SM1/SM1_2/SM1_04/organHistotyPopup.do?idnNo=${history.idnNo }&organCode=${result.organCode }&action=add', '800', '420', 'organHistotyPopup');" class="pointer authorization write" />
			
			<c:if test="${organHistoryCount > 0}">
				<img alt="수정" src="/images/lionsclubs/btn/btn_edit.gif" style="width:57px;" onclick="openPopup('/SM1/SM1_2/SM1_04/organHistotyPopup.do?idnNo=${history.idnNo }&action=update','800', '420', 'organHistotyPopup');" class="pointer authorization write" />
				<img id="hdel" alt="삭제" src="/images/lionsclubs/btn/btn_del.gif" style="width:57px;" class="pointer authorization write" />
			</c:if>
			<c:if test="${not empty organHistoryIdnNo.prevOrganHistoryIdnNo }">
				<img alt="이전" src="/images/lionsclubs/btn/btn_s_prev.gif" style="width:57px;" class="pointer authorization write" onclick="goUrl('/SM1/SM1_2/SM1_04/SM1_04.do?idnNo=${organHistoryIdnNo.prevOrganHistoryIdnNo }&organCode=${result.organCode }')" />
			</c:if>
			<c:if test="${not empty organHistoryIdnNo.nextOrganHistoryIdnNo }">
				<img alt="다음" src="/images/lionsclubs/btn/btn_s_next.gif" style="width:57px;" class="pointer authorization write" onclick="goUrl('/SM1/SM1_2/SM1_04/SM1_04.do?idnNo=${organHistoryIdnNo.nextOrganHistoryIdnNo }&organCode=${result.organCode }')" />
			</c:if>
		</div>
		<div class="Height_1">
		<table class="tblType2" summary="코드내용 표">
		<caption>코드내용</caption>
		<colgroup>
			<col width="90px" />
			<col width="250px" />
			<col width="250px" />
			<col width="90px" />
			<col width="*" />
		</colgroup>
		<thead>
		<tr>
			<th colspan="3" class="Gbg">조직변동 항목</th>
			<th colspan="2" class="Gbg">조직분기 및 합병</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<th>변동일자</th>
			<td colspan="2">
				<fmt:parseDate var="changeDate" value="${history.changeDate }" pattern="yyyyMMdd" />
				<fmt:formatDate value="${changeDate }" pattern="yyyy.MM.dd" />			
			</td>
			<th>분기조직</th>
			<td>${history.branchOrganCode }&nbsp;&nbsp;&nbsp;&nbsp;${history.branchOrganCodeName }</td>
		</tr>
		<tr>
			<th>변동코드</th>
			<td colspan="2">
				<div class="tdW20">${history.changeCode }</div>
				<div class="fL"><lions:codetolabel groupCode="7780" code="${history.changeCode }" /></div>
			</td>
			<th>분기일자</th>
			<td>
				<c:if test="${not empty history.changeCode }">
					<fmt:parseDate var="changeDate" value="${history.changeDate }" pattern="yyyyMMdd" />
					<fmt:formatDate value="${changeDate }" pattern="yyyy.MM.dd" />
				</c:if>			
			</td>
		</tr>
		<tr>
			<th colspan="3" class="Gbg">조직변동 내용</th>
			<th colspan="2" class="Gbg">회의 및 회비</th>
		</tr>
		<tr>
			<th>조직책임자</th>
			<td colspan="2"><div class="tdW20">${history.organOfficerMemberNo }</div><div class="fL">${history.organOfficerMemberName }</div></td>
			<th>월 회 비</th>
			<td class="monthDue">
				회원구분별 월회비
			</td>
		</tr>
		<tr>
			<th>책임자호칭</th>
			<td colspan="2">
				<div class="tdW20">${history.organOfficerMemberModelCode }</div>
				<div class="fL"><lions:codetolabel groupCode="7790" code="${history.organOfficerMemberModelCode }" /></div>
			</td>
			<th>이 사 회</th>
			<td>${result.executiveMeeting }</td>
		</tr>
		<tr>
			<th>책임자연대</th>
			<td colspan="2">
				<div class="tdW20">${history.officerSolidCode }</div>
				<div class="fL"><lions:codetolabel groupCode="7800" code="${history.officerSolidCode }" /></div>
			</td>
			<th>월 례 회</th>
			<td>${result.monthlyMeeting }</td>
		</tr>
		<tr>
			<th>조직등급</th>
			<td colspan="2">
				<div class="tdW20">${history.organRatingCode }</div>
				<div class="fL"><lions:codetolabel groupCode="7810" code="${history.organRatingCode }" /></div>
			</td>
			<th colspan="2" class="Gbg">조직설립</th>
		</tr>
		<tr>
			<th>조직구분</th>
			<td colspan="2">
				<div class="tdW20">${history.organDivisionCode }</div>
				<div class="fL"><lions:codetolabel groupCode="7820" code="${history.organDivisionCode }" /></div>
			</td>
			<th>조직총회</th>
			<td>
				<fmt:parseDate var="organMeeting" value="${result.organMeeting }" pattern="yyyyMMdd" />
				<fmt:formatDate value="${organMeeting }" pattern="yyyy.MM.dd" />
			</td>
		</tr>
		<tr>
			<th>상위조직</th>
			<td colspan="2">
				<div class="tdW20">${lions:formatOrganCode(history.upperOrganCode) }</div>
				<div class="fL">${history.upperOrganCodeName }</div>
			</td>
			<th>헌장의밤</th>
			<td>
				<fmt:parseDate var="spotNight" value="${result.spotNight }" pattern="yyyyMMdd" />
				<fmt:formatDate value="${spotNight }" pattern="yyyy.MM.dd" />
			</td>
		</tr>
		<tr>
			<th>출력순서</th>
			<td class="right">${history.printOrd1 }</td>
			<td class="right">${history.printOrd2 }</td>
			<th>등록번호</th>
			<td>${result.registerNo }</td>
		</tr>
		<tr>
			<th colspan="3" class="Gbg">조직폐지</th>
			<th colspan="2" class="Gbg">클럽 가이딩</th>
		</tr>
		<tr>
			<th>조직폐지</th>
			<td colspan="2">
				<fmt:parseDate var="organAbolishDate" value="${result.organAbolishDate }" pattern="yyyyMMdd" />
				<fmt:formatDate value="${organAbolishDate }" pattern="yyyy.MM.dd" />			
			</td>
			<th>가이딩클럽</th>
			<td>
				<div class="tdW20">${lions:formatOrganCode(result.guidingClubCode) }</div>
				<div class="fL">${result.guidingClubCodeName }</div>
			</td>
		</tr>
		<tr>
			<th>폐지사유</th>
			<td colspan="2"><div class="tdW20">${result.abolishReasonCode }</div><div class="fL"><lions:codetolabel groupCode="7830" code="${result.abolishReasonCode }" /></div></td>
			<th>가이딩회원</th>
			<td><div class="tdW20">${result.guidingMemberNo }</div><div class="fL">${result.guidingMemberName }</div></td>
		</tr>
		</tbody>
		</table>
	</div><!-- Height_1 -->
</div><!-- table -->
</form:form>
