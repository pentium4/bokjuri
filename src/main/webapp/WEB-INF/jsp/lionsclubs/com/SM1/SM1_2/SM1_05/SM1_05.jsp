<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#organCode").mask("a99-999");
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		$("#organCode, #koName").bind("keypress", function(e){
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
		
		
		var _idnNo = null;
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $("#form .tblType2 tbody tr");
		tbl.bind("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			_idnNo = $(this).find("#idnNo").val();
		});
		
		$("#update").on("click", function(){
			if(_idnNo == null){
				alert("조직변동이력을 선택해 주세요.");
				return false;
			}
					
			var url = "/SM1/SM1_2/SM1_04/organHistotyPopup.do?idnNo=" + _idnNo + "&action=update";
			openPopup(url, '800', '400', 'organHistotyPopup');
		});
		
		
		$("#hdel").bind("click", function(){
			if(_idnNo == null){
				alert("조직변동이력을 선택해 주세요.");
				return false;
			}
			
			if(!confirm("조직변동이력을 삭제 하시겠습니까?")){
				return false;
			}
			
			var params = [];
			params.push({name: "idnNo", value: _idnNo});
			params.push({name: "organCode", value: "${SM1_05VO.organCode}"});
			
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
	});
});

//조직검색
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

function _search(){
	$("form").submit();
}

function _organResult(value){
	$("#organCode").val($.url(value).param("organCode"));
	
	_search();
}
</script>

<style>
<!--
.tblType2 tbody tr{
	cursor: pointer;
}
-->
</style>

<form:form id="form" modelAttribute="SM1_05VO" action="/SM1/SM1_2/SM1_05/SM1_05.do">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="150px" />
				<col width="100px" />
		        <col width="*" />
				<col width="100px" />
		        <col width="160px" />
				<col width="100px" />
				<col width="120px" />
			</colgroup>
			<tbody>
				<tr>
					<th>조직코드</th>
					<td colspan="3">
						<div class="fL" style="padding-top:2px;">
							<input type="text" id="organCode" name="organCode" size="40" class="input" value="${result.organCode }" />
						</div>
						
						<div class="fR mr20">
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
						</div>
					</td>
					<th>조직등급</th>
					<td colspan="3">
						${history.organRatingCode } <lions:codetolabel groupCode="7810" code="${history.organRatingCode }" />
					</td>
				</tr>
				<tr>
					<th>한 글 명</th>
					<td colspan="3">
						<input type="text" id="koName" size="40" class="input" value="${result.koName }" />
					</td>
					<th>상위조직</th>
					<td colspan="3">
						${lions:formatOrganCode(history.upperOrganCode) } ${history.upperOrganCodeName }
					</td>
				</tr>
				<tr>
					<th>한글약어</th>
					<td>${result.koAbbr }</td>
					<th>한글약어(2)</th>
					<td>${result.koAbbr2 }</td>
					<th>클럽구성</th>
					<td colspan="3"><lions:codetolabel groupCode="7820" code="${history.organDivisionCode }" /></td>
				</tr>
				<tr>
					<th>한 자 명</th>
					<td colspan="3">${result.chinName }</td>
					<th>조직총회</th>
					<td colspan="3">
						<fmt:parseDate var="organMeeting" value="${result.organMeeting }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${organMeeting }" pattern="yyyy.MM.dd" />	
					</td>
				</tr>
				<tr>
					<th>영 문 명</th>
					<td colspan="3">${result.enName }</td>
					<th>현장의 밤</th>
					<td colspan="3">
						<fmt:parseDate var="spotNight" value="${result.spotNight }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${spotNight }" pattern="yyyy.MM.dd" />
					</td>
				</tr>
				<tr>
					<th>책 임 자</th>
					<td colspan="3">${history.organOfficerMemberName }</td>
					<th>이사회</th>
					<td title="${result.executiveMeeting }">${result.executiveMeeting }</td>
					<th>출력순(1)</th>
					<td class="right">${history.printOrd1 }</td>
				</tr>
				 <tr>
					<th>책임자호칭</th>
					<td><lions:codetolabel groupCode="7790" code="${history.organOfficerMemberModelCode }" /></td>
					<th>등록번호</th>
					<td>${result.registerNo }</td>
					<th>월 례 회</th>
					<td title="${result.monthlyMeeting }">${result.monthlyMeeting }</td>
					<th>출력순(2)</th>
					<td class="right">${history.printOrd2 }</td>
				</tr>
				<tr>
					<th>조직연대</th>
					<td><lions:codetolabel groupCode="7800" code="${history.officerSolidCode }" /></td>
					<th>스폰클럽</th>
					<td>${result.guidingClubCodeName }</td>
					<th>폐지일자</th>
					<td>
						<fmt:parseDate var="organAbolishDate" value="${result.organAbolishDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${organAbolishDate }" pattern="yyyy.MM.dd" />	
					</td>
					<th>폐지사유</th>
					<td><lions:codetolabel groupCode="7830" code="${result.abolishReasonCode }" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">	
		<div class="btnBox">
			<img src="/images/lionsclubs/btn/btn_add.gif" alt="추가" class="pointer authorization write" onclick="openPopup('/SM1/SM1_2/SM1_04/organHistotyPopup.do?organCode=${result.organCode }&action=add', '800', '400', 'organHistotyPopup');" />
			<c:if test="${organHistoryCount > 0 }">
				<img id="update" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" class="pointer authorization write" style="width:57px" />
				<img id="hdel" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" class="pointer authorization write" style="width:57px" />
			</c:if>
		</div>
	
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2" summary="조직 변동 이력 사항 표">
				<caption>조직 변동 이력 사항</caption>
				<colgroup>
					<col width="100px" />
					<col width="250px" />
					<col width="100px" />
					<col width="*" />
					<col width="100px" />
					<col width="250px" />
				</colgroup>
				<thead>
					<tr>
						<th>시작일</th>
						<th>현조직 명칭</th>
						<th>책임자</th>
						<th>변동 사유</th>
						<th>상위조직</th>
						<th>상위 명칭</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table">
				<colgroup>
					<col width="100px" />
					<col width="250px" />
					<col width="100px" />
					<col width="*" />
					<col width="100px" />
					<col width="250px" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${organHistoryList }">
						<tr>
							<td class="center">
								<a href="/SM1/SM1_2/SM1_04/SM1_04.do?menuId=465&idnNo=${list.idnNo }&organCode=${list.organCode }">
									<fmt:parseDate var="changeDate" value="${list.changeDate }" pattern="yyyyMMdd" />
									<fmt:formatDate value="${changeDate }" pattern="yyyy.MM.dd" />
									<input type="hidden" id="idnNo" value="${list.idnNo }" />
								</a>
							</td>
							<td>${result.koName }</td>
							<td class="center">
								${list.organOfficerMemberName }
								(<lions:codetolabel groupCode="7800" code="${list.officerSolidCode }" />)
							</td>
							<td>
								<lions:codetolabel groupCode="7780" code="${list.changeCode }" />
							</td>
							<td class="center">${lions:formatOrganCode(list.upperOrganCode) }</td>
							<td>${list.upperOrganCodeName }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
</form:form>