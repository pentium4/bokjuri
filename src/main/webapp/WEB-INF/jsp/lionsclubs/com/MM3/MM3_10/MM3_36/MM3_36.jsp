<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<style>
.ui-tabs .ui-tabs-panel{
	padding: 0;
}

.ui-widget-content{
	border: 0;
}
</style>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#button_select").click(function() {
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
		
		$("#sessionYear").sessionYearCombo({
			 top: false
			,fixVal: "${MM3_36VO.sessionYear}"
		});
		
		$("#month").monthCombo({
			 top: false
			,fixVal: "${MM3_36VO.month}"
		});
		
		/*
		 * 코드 구하기
		 */
		$("#organCode").organCode({
			 lvl: 3
			,fixVal: "${MM3_36VO.organCode}"
			,searchable: true
		});		
		
		$("#excelDownload").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			$(window).unbind();
			$.download("/MM3/MM3_10/MM3_36/excelDownload.do", $("form").serialize());
		});
		
		$(".table").tabs({
			 active : $.cookie('mm336')
			,activate: function(event, ui){
				Scroll_Table1();
		    	Scroll_Actrion();
		        $.cookie('mm336', ui.newTab.index(),{
		            expires : 10
		        });
			}
		});
	
		Scroll_Table1();
		Scroll_Actrion();
	});
});

// 조회
function _search(){
	$("form").submit();
}
</script>

<form:form modelAttribute="MM3_36VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="수입 항목별 금액조회표">
			<caption>수입 항목별 금액조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="41%" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td colspan="3">
						<div class="fL">
							<form:select path="organCode" cssClass="select required" caption="클럽코드" />
						</div>
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td><form:select path="sessionYear" cssClass="select required" caption="회기선택" /></td>
					<th>선택월</th>
					<td><form:select path="month" cssClass="required" caption="선택월" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><div><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></div></h4>
		<div class="btnBox">
			<img id="button_select" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read"/>
			<img id="excelDownload" src="/images/lionsclubs/btn/btn_excel2.gif" style="margin-top:2px" alt="엑셀다운로드" class="pointer authorization read" />
		</div>
	
		<ul class="Height_0 mb10">
			<li><a href="#tabs-1">1.클럽별회원수-보고용</a></li>
			<li><a href="#tabs-2">2.봉사현황</a></li>
			<li><a href="#tabs-3">3.봉사내역</a></li>
			<li><a href="#tabs-4">4.월말보고집계표</a></li>
		</ul>
		
		<div id="tabs-1" class="Height_1">
			<table class="tblType2" summary="클럽별 회원수">
				<caption>클럽별 회원수</caption>
				<colgroup>
					<col width="*" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
				</colgroup>
				<thead>
					<tr>
						<th>클럽명</th>
						<th>${MM3_36VO.month eq '01' ? '12' : MM3_36VO.month - 1 }월말 회원수</th>
						<th>신입회원</th>
						<th>재입회원</th>
						<th>전입회원</th>
						<th>퇴회회원</th>
						<th>${MM3_36VO.month }월말 회원수</th>
						<th>순증가 회원수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${clubMemberShipList }" var="list" varStatus="status">
						<tr>
							<td title="${list.organName }">${list.organName }</td>
							<td class="center"><fmt:formatNumber value="${list.prevMemberCnt}" pattern="#,###" /></td>
							<td class="center"><fmt:formatNumber value="${list.newMemberCnt}" pattern="#,###" /></td>
							<td class="center"><fmt:formatNumber value="${list.reMemberCnt}" pattern="#,###" /></td>
							<td class="center"><fmt:formatNumber value="${list.movingMemberCnt}" pattern="#,###" /></td>
							<td class="center"><fmt:formatNumber value="${list.quitMemberCnt}" pattern="#,###" /></td>
							<td class="center"><fmt:formatNumber value="${list.currentMemberCnt}" pattern="#,###" /></td>
							<td class="center"><fmt:formatNumber value="${list.increaseMemberCnt}" pattern="#,###" /></td>
						</tr>
						<c:set var="sumPrevMemberCnt" value="${sumPrevMemberCnt + list.prevMemberCnt }" />
						<c:set var="sumNewMemberCnt" value="${sumNewMemberCnt + list.newMemberCnt }" />
						<c:set var="sumReMemberCnt" value="${sumReMemberCnt + list.reMemberCnt }" />
						<c:set var="sumMovingMemberCnt" value="${sumMovingMemberCnt + list.movingMemberCnt }" />
						<c:set var="sumQuitMemberCnt" value="${sumQuitMemberCnt + list.quitMemberCnt }" />
						<c:set var="sumCurrentMemberCnt" value="${sumCurrentMemberCnt + list.currentMemberCnt }" />
						<c:set var="sumIncreaseMemberCnt" value="${sumIncreaseMemberCnt + list.increaseMemberCnt }" />
						<c:if test="${status.last }">
							<tr>
								<th>합계</th>
								<th><fmt:formatNumber value="${sumPrevMemberCnt}" pattern="#,###" /></th>
								<th><fmt:formatNumber value="${sumNewMemberCnt}" pattern="#,###" /></th>
								<th><fmt:formatNumber value="${sumReMemberCnt}" pattern="#,###" /></th>
								<th><fmt:formatNumber value="${sumMovingMemberCnt}" pattern="#,###" /></th>
								<th><fmt:formatNumber value="${sumQuitMemberCnt}" pattern="#,###" /></th>
								<th><fmt:formatNumber value="${sumCurrentMemberCnt}" pattern="#,###" /></th>
								<th><fmt:formatNumber value="${sumIncreaseMemberCnt}" pattern="#,###" /></th>
							</tr>							
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			
			<table class="tblType2 mt20" style="width: 400px;">
				<colgroup>
					<col width="120px" />
					<col width="80px" />
					<col width="120px" />
					<col width="80px" />
				</colgroup>
				<tbody>
					<tr>
						<th>여성클럽수</th>
						<td class="center"><fmt:formatNumber value="${reportSummary.femaleClubCnt }" pattern="#,###" /></td>
						<th>회원수</th>
						<td class="center"><fmt:formatNumber value="${reportSummary.femaleMemberCnt }" pattern="#,###" /></td>
					</tr>
					<tr>
						<th>남성클럽수</th>
						<td class="center"><fmt:formatNumber value="${reportSummary.maleClubCnt }" pattern="#,###" /></td>
						<th>회원수</th>
						<td class="center"><fmt:formatNumber value="${reportSummary.maleMemberCnt }" pattern="#,###" /></td>
					</tr>
					<tr>
						<th rowspan="2">혼성클럽수</th>
						<td class="center" rowspan="2"><fmt:formatNumber value="${reportSummary.mixtrueClubCnt }" pattern="#,###" /></td>
						<th>여성</th>
						<td class="center" rowspan="2"><fmt:formatNumber value="${reportSummary.mixtrueMemberCnt }" pattern="#,###" /></td>
					</tr>
					<tr>
						<th>남성</th>
					</tr>
					<tr>
						<th>합 계</th>
						<td class="center"><fmt:formatNumber value="${reportSummary.femaleClubCnt + reportSummary.maleClubCnt + reportSummary.mixtrueClubCnt }" pattern="#,###" /></td>
						<th>합 계</th>
						<td class="center"><fmt:formatNumber value="${reportSummary.femaleMemberCnt + reportSummary.maleMemberCnt + reportSummary.mixtrueMemberCnt }" pattern="#,###" /></td>
					</tr>
				</tbody>
			</table>
			
			<h4>
				<div>
					<lions:organCodeToName organCode="${MM3_36VO.organCode }" nameKind="2" /> 레오클럽
				</div>
			</h4>
			<table class="tblType2" style="width: 560px;">
				<colgroup>
					<col width="200px" />
					<col width="80px" />
					<col width="200px" />
					<col width="80px" />
				</colgroup>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td style="border: 0; border-left: white 1px solid;"></td>
						<td style="border: 0;"></td>
						<td style="border: 0;" class="center">레오클럽 합계</td>
						<td style="border: 0;"></td>
					</tr>
				</tbody>
			</table>
			
			<div align="right" style="text-decoration: underline;">총합계 : <fmt:formatNumber value="${reportSummary.femaleMemberCnt + reportSummary.maleMemberCnt + reportSummary.mixtrueMemberCnt }" pattern="#,###" /> 명</div>
		</div>
		<div id="tabs-2" class="Height_1">
			<h4>
				<div>
					<fmt:parseDate var="date" value="${lions:calcYearMonth(MM3_36VO.sessionYear, MM3_36VO.month) }" pattern="yyyyMM" />
					<fmt:formatDate value="${date }" pattern="yyyy년 M월" />말 봉사실적현황
				</div>
			</h4>
			<table class="tblType2" summary="클럽 및 지구행사 입력 조회표">
				<caption>클럽 및 지구행사 입력</caption>
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="100px" />
					<col width="150px" />
					<col width="150px" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>봉사내용</th>
						<th>건수</th>
						<th>금액</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${serviceStatusList }" var="list" varStatus="status">
						<tr>
							<td class="center">${status.count }</td>
							<td>${list.detailItemName }</td>
							<td class="center"><fmt:formatNumber value="${list.cnt}" pattern="#,###" /></td>
							<td class="right"><fmt:formatNumber value="${list.amount}" pattern="#,###" /></td>
							<td></td>
						</tr>
						
						<c:set var="sumCnt" value="${sumCnt + list.cnt }" />
						<c:set var="sumAmount" value="${sumAmount + list.amount }" />
						
						<c:if test="${status.last }">
							<tr>
								<th class="center">계</th>
								<th></th>
								<th class="center"><fmt:formatNumber value="${sumCnt}" pattern="#,###" /></th>
								<th class="right"><fmt:formatNumber value="${sumAmount}" pattern="#,###" /></th>
								<th></th>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			<h4><div>LCIF기금 납부현황</div></h4>
			<table class="tblType2" summary="봉사현황">
				<caption>봉사현황</caption>
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="100px" />
					<col width="150px" />
					<col width="150px" />
				</colgroup>
				<thead>
					<tr>
						<th>NO.</th>
						<th>클럽명</th>
						<th>성명</th>
						<th>KRW</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${lcifStatusList }" var="list" varStatus="status">
						<tr>
							<td class="center">${status.count }</td>
							<td>${list.organName }</td>
							<td class="center">${list.name }</td>
							<td class="right"><fmt:formatNumber value="${list.payment}" pattern="#,###" /></td>
							<td class="right"><fmt:formatNumber value="${list.dollar}" pattern="#,###" /></td>
						</tr>
						
						<c:set var="sumPayment" value="${sumPayment + list.payment }" />
						<c:set var="sumDollar" value="${sumDollar + list.dollar }" />
						
						<c:if test="${status.last }">
							<tr>
								<th></th>
								<th></th>
								<th class="center">합계</th>
								<th class="right"><fmt:formatNumber value="${sumPayment}" pattern="#,###" /></th>
								<th class="right"><fmt:formatNumber value="${sumDollar}" pattern="#,###" /></th>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="tabs-3">
			<div class="tblTitle Scroll_Title Height_0">
				<table class="tblType2" summary="봉사내역">
					<caption>봉사내역</caption>
					<colgroup>
						<col width="60px" />
						<col width="150px" />
						<col width="150px" />
						<col width="*" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>클럽명</th>
							<th>봉사항목</th>
							<th>금액</th>
						</tr>
					</thead>
				</table>
			</div><!-- tblTitle -->
			<div class="Height_1">
				<table class="tblType2 Scroll_Table">
					<colgroup>
						<col width="60px" />
						<col width="150px" />
						<col width="150px" />
						<col width="*" />
					</colgroup>
					<tbody>
						<c:set var="count" value="1" />
						<c:forEach items="${serviceHistoryList }" var="list" varStatus="status">
							<tr>
								<c:if test="${not empty list.organName }">
									<td rowspan="${list.groupCnt }" class="center">${count }</td>
									<td title="${list.organName }" rowspan="${list.groupCnt }" class="center">${list.organName }</td>
									<c:set var="count" value="${count + 1 }" />
								</c:if>
								<td>${list.detailItemName }</td>
								<td class="right"><fmt:formatNumber value="${list.amount}" pattern="#,###" /></td>
							</tr>
							<c:set var="sumClubAmount" value="${sumClubAmount + list.amount }" />
						</c:forEach>
					</tbody>
				</table>
			</div><!-- Height_1 -->
			
			<div class="tblTitle Scroll_Title Height_0">
				<table class="tblType2" summary="합계">
					<caption>합계</caption>
					<colgroup>
						<col width="60px" />
						<col width="150px" />
						<col width="150px" />
						<col width="*" />
					</colgroup>
					<tfoot>
						<tr>
							<th colspan="3">합계</th>
							<th class="right"><fmt:formatNumber value="${sumClubAmount }" pattern="#,###" /></th>
						</tr>
					</tfoot>
				</table>
			</div><!-- tblTitle -->			
		</div>
		<div id="tabs-4" class="Height_1">
			<h4>
				<div>
					<fmt:parseDate var="date" value="${lions:calcYearMonth(MM3_36VO.sessionYear, MM3_36VO.month) }" pattern="yyyyMM" />
					<fmt:formatDate value="${date }" pattern="yyyy년 M월" /> 월말보고 집계표
				</div>
			</h4>
			
			<div class="center mb10" style="text-decoration: underline;">클럽수 증감 현황</div>
			<table class="tblType2" summary="클럽수 증감 현황">
				<caption>클럽수 증감 현황</caption>
				<colgroup>
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th><fmt:formatDate value="${reportSummary.prevEndDate }" pattern="yyyy년 M월 d일" /><br/>현재 클럽수</th>
						<th>신생클럽수</th>
						<th>취소클럽수</th>
						<th>증감</th>
						<th><fmt:formatDate value="${reportSummary.endDate }" pattern="yyyy년 M월 d일" /><br/>현재 클럽수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="center"><fmt:formatNumber value="${reportSummary.prevClubCnt }" pattern="#,###" /></td>
						<td class="center"><fmt:formatNumber value="${reportSummary.newClubCnt }" pattern="#,###" /></td>
						<td class="center"><fmt:formatNumber value="${reportSummary.abolishClubCnt }" pattern="#,###" /></td>
						<td class="center"><fmt:formatNumber value="${reportSummary.newClubCnt - reportSummary.abolishClubCnt }" pattern="#,###" /></td>
						<td class="center"><fmt:formatNumber value="${reportSummary.currentClubCnt }" pattern="#,###" /></td>
					</tr>
				</tbody>
			</table>
			
			<div class="center mT10 mb10" style="text-decoration: underline;">회원수 증감 현황</div>
			<table class="tblType2" summary="회원수 증감 현황">
				<caption>회원수 증감 현황</caption>
				<colgroup>
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th><fmt:formatDate value="${reportSummary.prevEndDate }" pattern="yyyy년 M월 d일" /><br/>현재 회원수</th>
						<th>신입회원수</th>
						<th>탈퇴회원수</th>
						<th>증감</th>
						<th><fmt:formatDate value="${reportSummary.endDate }" pattern="yyyy년 M월 d일" /><br/>현재 회원수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="center"><fmt:formatNumber value="${reportSummary.prevMemberCnt }" pattern="#,###" /></td>
						<td class="center"><fmt:formatNumber value="${reportSummary.newMemberCnt }" pattern="#,###" /></td>
						<td class="center"><fmt:formatNumber value="${reportSummary.quitMemberCnt }" pattern="#,###" /></td>
						<td class="center"><fmt:formatNumber value="${reportSummary.newMemberCnt - reportSummary.quitMemberCnt }" pattern="#,###" /></td>
						<td class="center"><fmt:formatNumber value="${reportSummary.currentMemberCnt }" pattern="#,###" /></td>
					</tr>
				</tbody>
			</table>				
			
			<div class="center mT10 mb10" style="text-decoration: underline;">레오 클럽수 및 회원수 현황</div>
			<table class="tblType2" summary="레오 클럽수 및 회원수 현황">
				<caption>레오 클럽수 및 회원수 현황</caption>
				<colgroup>
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">적요</th>
						<th rowspan="2"><fmt:formatDate value="${reportSummary.prevEndDate }" pattern="yyyy년 M월 d일" /><br/>현 재</th>
						<th>신생클럽수</th>
						<th>취소클럽수</th>
						<th rowspan="2">증 감</th>
						<th rowspan="2"><fmt:formatDate value="${reportSummary.endDate }" pattern="yyyy년 M월 d일" /><br/>현 재</th>
					</tr>
					<tr>
						<th>신생회원수</th>
						<th>탈퇴회원수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>클럽수</th>
						<td class="center"></td>
						<td class="center"></td>
						<td class="center"></td>
						<td class="center"></td>
						<td class="center"></td>
					</tr>
					<tr>
						<th>회원수</th>
						<td class="center"></td>
						<td class="center"></td>
						<td class="center"></td>
						<td class="center"></td>
						<td class="center"></td>
					</tr>
				</tbody>
			</table>
			
			<table class="tblType2 mT10" summary="클럽수" style="width: 600px;">
				<caption>클럽수</caption>
				<colgroup>
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
				</colgroup>
				<tbody>
					<tr>
						<th>여성클럽수</th>
						<td class="center"><fmt:formatNumber value="${reportSummary.femaleClubCnt }" pattern="#,###" /></td>
						<th>회원수</th>
						<td class="center"><fmt:formatNumber value="${reportSummary.femaleMemberCnt }" pattern="#,###" /></td>
					</tr>
					<tr>
						<th>남성클럽수</th>
						<td class="center"><fmt:formatNumber value="${reportSummary.maleClubCnt }" pattern="#,###" /></td>
						<th>회원수</th>
						<td class="center"><fmt:formatNumber value="${reportSummary.maleMemberCnt }" pattern="#,###" /></td>
					</tr>
					<tr>
						<th rowspan="2">혼성클럽수</th>
						<td class="center" rowspan="2"><fmt:formatNumber value="${reportSummary.mixtrueClubCnt }" pattern="#,###" /></td>
						<th>여성회원수</th>
						<td class="center" rowspan="2"><fmt:formatNumber value="${reportSummary.mixtrueMemberCnt }" pattern="#,###" /></td>
					</tr>
					<tr>
						<th>남성회원수</th>
					</tr>
					<tr>
						<th>합계</th>
						<td class="center"><fmt:formatNumber value="${reportSummary.femaleClubCnt + reportSummary.maleClubCnt + reportSummary.mixtrueClubCnt }" pattern="#,###" /></td>
						<th></th>
						<td class="center"><fmt:formatNumber value="${reportSummary.femaleMemberCnt + reportSummary.maleMemberCnt + reportSummary.mixtrueMemberCnt }" pattern="#,###" /></td>
					</tr>
				</tbody>
			</table>
			
			<div align="right" style="text-decoration: underline;">총합계 : <fmt:formatNumber value="${reportSummary.femaleMemberCnt + reportSummary.maleMemberCnt + reportSummary.mixtrueMemberCnt }" pattern="#,###" /> 명</div>
			
			<div class="center mT10 mb10" style="text-decoration: underline;">봉사금 현황</div>
			<table class="tblType2" summary="봉사금 현황">
				<caption>봉사금 현황</caption>
				<colgroup>
					<col width="300px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" style="background: yellow;" />
					<col width="*" style="background: yellow;" />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">봉사금액</th>
						<th colspan="2"><fmt:formatDate value="${reportSummary.prevEndDate }" pattern="yyyy년 M월" /> 봉사금액</th>
						<th colspan="2" style="background: yellow;">${MM3_36VO.sessionYear - 1 }년 7월 1일 ~ ${MM3_36VO.sessionYear }년 6월 30일까지</th>
					</tr>
					<tr>
						<th>건수</th>
						<th>금액</th>
						<th style="background: yellow;">건수</th>
						<th style="background: yellow;">금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${serviceStatusList }" var="list" varStatus="status">
						<tr>
							<td>${list.detailItemName }</td>
							<td class="center"><fmt:formatNumber value="${list.cnt}" pattern="#,###" /></td>
							<td class="center"><fmt:formatNumber value="${list.amount}" pattern="#,###" /></td>
							<td class="center"><fmt:formatNumber value="${list.sessionYearCnt}" pattern="#,###" /></td>
							<td class="center"><fmt:formatNumber value="${list.sessionYearAmount}" pattern="#,###" /></td>
						</tr>
						
						<c:set var="sumSessionYearCnt" value="${sumSessionYearCnt + list.sessionYearCnt }" />
						<c:set var="sumSessionYearAmount" value="${sumSessionYearAmount + list.sessionYearAmount }" />
						
						<c:if test="${status.last }">
							<tr>
								<th class="center">계</th>
								<th class="center"><fmt:formatNumber value="${sumCnt}" pattern="#,###" /></th>
								<th class="center"><fmt:formatNumber value="${sumAmount}" pattern="#,###" /></th>
								<th class="center" style="background: yellow;"><fmt:formatNumber value="${sumSessionYearCnt}" pattern="#,###" /></th>
								<th class="center" style="background: yellow;"><fmt:formatNumber value="${sumSessionYearAmount}" pattern="#,###" /></th>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="center mT10 mb10" style="text-decoration: underline;">L.C.I.F 기금현황</div>
			<table class="tblType2" summary="L.C.I.F 기금현황">
				<caption>L.C.I.F 기금현황</caption>
				<colgroup>
					<col width="300px" />
					<col width="150px" />
					<col width="150px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">봉사금액</th>
						<th colspan="3">기탁금액(환율:<fmt:formatNumber value="${objectRates }" pattern="#,###" />원)</th>
					</tr>
					<tr>
						<th>건수</th>
						<th>기탁금(US$)</th>
						<th>기탁금(원화표시)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>L.C.I.F 기금현황</th>
						<td class="center"><fmt:formatNumber value="${lcifStatusSummary.cnt }" pattern="#,###" /></td>
						<td class="center"><fmt:formatNumber value="${lcifStatusSummary.dollar }" pattern="#,###" /></td>
						<td class="center"><fmt:formatNumber value="${lcifStatusSummary.payment }" pattern="#,###" /></td>
					</tr>
				</tbody>
			</table>				
		</div>
	</div><!-- table -->
</form:form>