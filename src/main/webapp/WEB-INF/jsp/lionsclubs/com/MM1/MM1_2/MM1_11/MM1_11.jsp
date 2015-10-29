<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<form:form modelAttribute="MM1_11VO">

<h3><div>경조금 부과 입력 </div></h3>

<div id="profile"></div>
<jsp:include page="/WEB-INF/jsp/lionsclubs/include/sub_profile.jsp" />

<div class="table">
<h4>지급 내역</h4>
	<div class="btnBox">
		<a href="../include/mm1_10popup.html" onclick="window.open(this.href,'popup','width=700,height=600'); return false;" title="새창">
		<input type="image" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" /></a>
		<input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" style="width:57px" />
	</div>

	<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="지급 내역표">
	<caption>지급 내역</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="300px" />
		<col width="120px" />
		<col width="120px" />
		<col width="120px" />
	</colgroup>
	<tr>
		<th>발생일자</th>
		<th>경조사유</th>
		<th>방문지역</th>
		<th>개인부담금</th>
		<th>클럽총부과금</th>
		<th>클럽부담금</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="300px" />
		<col width="120px" />
		<col width="120px" />
		<col width="120px" />
	</colgroup>
	<tbody>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	</tbody>
	</table>
	</div><!-- Height_1 -->
</div><!-- table -->

</form:form>