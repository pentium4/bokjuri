<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<form:form modelAttribute="MM5_03VO">


<h3><div>상근자급여기본 </div></h3>
<jsp:include page="/WEB-INF/jsp/lionsclubs/include/sub_profile.jsp" />

<div class="table">
<h4>급여 관리</h4>

<div class="tblTitle Scroll_Title Height_0">
	<table class="tblType2_1" summary="LCIF기금납부현황표">
	<caption>LCIF기금납부현황</caption>
	<colgroup>
		<col width="100px" />
		<col width="270px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="*" />
	</colgroup>
	<tr>
		<th>구분</th>
		<th>급여항목</th>
		<th>시작일자</th>
		<th>종료일자</th>
		<th>금액</th>
		<th>비고</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="270px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<td class="left">급여</td>
		<td class="left">기본급</td>
		<td>2011.07.01</td>
		<td>9999.12.31</td>
		<td class="right">2,000,000</td>
		<td class="left">정기 급여 인상</td>
	</tr>
	<tr>
		<td class="left">급여</td>
		<td class="left">기본급</td>
		<td>2011.07.01</td>
		<td>9999.12.31</td>
		<td class="right">2,000,000</td>
		<td class="left">정기 급여 인상</td>
	</tr>
	<tr>
		<td class="left">급여</td>
		<td class="left">기본급</td>
		<td>2011.07.01</td>
		<td>9999.12.31</td>
		<td class="right">2,000,000</td>
		<td class="left">정기 급여 인상</td>
	</tr>
	<tr>
		<td class="left">--</td>
		<td class="left">-</td>
		<td>-</td>
		<td>-</td>
		<td class="right">-</td>
		<td class="left">-</td>
	</tr>
	<tr>
		<td class="left">공제</td>
		<td class="left">국민연금</td>
		<td>2011.07.01</td>
		<td>9999.12.31</td>
		<td class="right">200,000</td>
		<td class="left">요율변동</td>
	</tr>
	<tr>
		<td class="left">공제</td>
		<td class="left">국민연금</td>
		<td>2011.07.01</td>
		<td>9999.12.31</td>
		<td class="right">200,000</td>
		<td class="left">요율변동</td>
	</tr>
	<tr>
		<td class="left">--</td>
		<td class="left">-</td>
		<td>-</td>
		<td>-</td>
		<td class="right">-</td>
		<td class="left">-</td>
	</tr>
	<tr>
		<td class="left">공제</td>
		<td class="left">국민연금</td>
		<td>2011.07.01</td>
		<td>9999.12.31</td>
		<td class="right">200,000</td>
		<td class="left">요율변동</td>
	</tr>
	<tr>
		<td class="left">공제</td>
		<td class="left">국민연금</td>
		<td>2011.07.01</td>
		<td>9999.12.31</td>
		<td class="right">200,000</td>
		<td class="left">요율변동</td>
	</tr>
	<tr>
		<td class="left">--</td>
		<td class="left">-</td>
		<td>-</td>
		<td>-</td>
		<td class="right">-</td>
		<td class="left">-</td>
	</tr>
	<tr>
		<td class="left">공제</td>
		<td class="left">국민연금</td>
		<td>2011.07.01</td>
		<td>9999.12.31</td>
		<td class="right">200,000</td>
		<td class="left">요율변동</td>
	</tr>
	<tr>
		<td class="left">공제</td>
		<td class="left">국민연금</td>
		<td>2011.07.01</td>
		<td>9999.12.31</td>
		<td class="right">200,000</td>
		<td class="left">요율변동</td>
	</tr>
	<tr>
		<td class="left">--</td>
		<td class="left">-</td>
		<td>-</td>
		<td>-</td>
		<td class="right">-</td>
		<td class="left">-</td>
	</tr>
	<tr>
		<td class="left">공제</td>
		<td class="left">국민연금</td>
		<td>2011.07.01</td>
		<td>9999.12.31</td>
		<td class="right">200,000</td>
		<td class="left">요율변동</td>
	</tr>
	<tr>
		<td class="left">공제</td>
		<td class="left">국민연금</td>
		<td>2011.07.01</td>
		<td>9999.12.31</td>
		<td class="right">200,000</td>
		<td class="left">요율변동</td>
	</tr>
	<tr>
		<td class="left">--</td>
		<td class="left">-</td>
		<td>-</td>
		<td>-</td>
		<td class="right">-</td>
		<td class="left">-</td>
	</tr>
	<tr>
		<td class="left">회사분</td>
		<td class="left">국민건강보험료 회사부담</td>
		<td>2011.07.01</td>
		<td>9999.12.31</td>
		<td class="right">200,000</td>
		<td class="left">요율변동</td>
	</tr>
	<tr>
		<td class="left">회사분</td>
		<td class="left">국민건강보험료 회사부담</td>
		<td>2011.07.01</td>
		<td>9999.12.31</td>
		<td class="right">200,000</td>
		<td class="left">요율변동</td>
	</tr>
	</tbody>
	</table>
				</div><!-- Height_1 -->
			</div><!-- table -->

</form:form>