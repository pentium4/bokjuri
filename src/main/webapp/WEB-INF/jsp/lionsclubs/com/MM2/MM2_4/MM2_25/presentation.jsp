<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
<!--
// require(['init'], function () {
	$(document).ready(function () {
		$(".attachfile").on("click", function(){
			openPopup("/jfile/filedownloadPopup.do?fileId=" + $(this).prop("id") , "700", "300", "attachfile");
		});
	});
// });
//-->
</script>
<style>
<!--
.attachfile {
	vertical-align: middle;
}

.attachfile img{
	height: 50px;
	float: left;
	margin: 10px 0 0 70px;
	padding: 0;
}
-->
</style>
<div class="deck-container">
	<c:forEach var="list" items="${resultList }" varStatus="status">
	    <!-- Begin slides -->
		<section class="slide table" id="${status.count }">
			<table>
				<colgroup>
					<col width="250px" />
					<col width="*" />
					<col width="250px" />
					<col width="250px" />
				</colgroup>
				<tr class="Height_0">
					<td colspan="4">
						<div style="float: left; margin-left: 20px; font-size: 30px;">
							<span class="deck-status-current"></span> / <span class="deck-status-total"></span>
						</div>
						<span style="font-size: 60px;">총 무 보 고</span>
						<div style="float: right; margin-right: 20px; font-size: 30px;">
							<lions:codetolabel groupCode="7580" code="${list.inputConfKindCode }" />
						</div>
					</td>
				</tr>
				<tr class="Height_0">
					<td>행사일자</td>
					<td class="left">${list.inputEventDate }</td>
					<td>첨부파일</td>
					<td class="left">
						<a id="${list.inputFileId }" href="#" class="attachfile">
							<img src="/images/lionsclubs/btn/icon_file.gif" class="pointer authorization write" title="첨부파일" />(${list.fileCnt })
						</a>
					</td>
				</tr>
				<tr class="Height_0">
					<td>행<span style="margin-left: 20px"></span>사<span style="margin-left: 20px"></span>명</td>
					<td class="left" colspan="3">${list.inputEventName }</td>
				</tr>
				<tr class="Height_0">
					<td>장<span style="margin-left: 79px"></span>소</td>
					<td class="left" colspan="3">${list.inputLocation }</td>
				</tr>
				<tr class="Height_0">
					<td>주<span style="margin-left: 79px"></span>관</td>
					<td class="left" colspan="3">${list.inputSubject }</td>
				</tr>
				<tr>
					<td style="vertical-align: middle;">행사내용</td>
					<td colspan="3">
						<div class="left Height_1 cscroll" style="overflow-y: auto;">${lions:newline(list.inputEventDesc) }</div>
					</td>
				</tr>
			</table>
	    </section>	
	</c:forEach>

    <!-- deck.navigation snippet -->
    <div aria-role="navigation">
		<a href="#" class="deck-prev-link" title="이전">&#8592;</a>
		<a href="#" class="deck-next-link" title="다음">&#8594;</a>
    </div>
</div>
<!-- Initialize the deck -->
