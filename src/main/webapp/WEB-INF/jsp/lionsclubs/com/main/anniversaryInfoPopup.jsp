<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
function closeWin(){
	if(document) {
		self.close();
	}
}
</script>	


<h3 style="width:98%;"><div>${MainParamVO.codeName } 조회</div></h3>
<div class="popup_bg">
	<div class="tblTitle Scroll_Title">
	<table class="tblType2">
	<colgroup>
		<col width="90px" />
		<col width="100px" />
		<col width="80px" />
		<col width="*" />
	</colgroup>
		<tr>
			<th>성명</th>
			<th>기념일자</th>
			<th>양/음력</th>
			<th>내용</th>
		</tr>
		</table>
	</div><!-- tblTitle -->
	<div style="overflow-y:auto;height:380px;">
		<table class="tblType2_1 Scroll_Table" >
			<colgroup>
				<col width="90px" />
				<col width="100px" />
				<col width="80px" />
				<col width="*" />
			</colgroup>
			<tbody>
			<c:forEach items="${anniversaryInfo}" var="list" varStatus="status">
					
				<tr>
					<td>${list.memberName }</td>
					<td>${list.anniversaryDay}</td>
					<td>${list.pmKindName}</td>
					<td class="left">${list.message }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div><!-- tblTitle -->

	<div class="popupBtn">
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>

<!-- <h5><div>해당자료가 조회되었습니다.</div></h5> -->
</div><!-- popup -->





