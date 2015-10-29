<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
<!--
$(document).ready(function () {
	$(".attachfile").on("click", function(){
		openPopup("/jfile/filedownloadPopup.do?fileId=" + $(this).prop("id") , "700", "300", "attachfile");
	});
});
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
	margin: 10px 0 0 0;
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
				</colgroup>
				<tr class="Height_0">
					<td colspan="2">
						<div style="float: left; margin-left: 20px; font-size: 30px;">
							<span class="deck-status-current"></span> / <span class="deck-status-total"></span>
						</div>
						<span style="font-size: 60px;">심 의 안 건</span>
						<div style="float: right; margin-right: 20px; font-size: 30px;">
							<lions:codetolabel groupCode="7580" code="${list.inputConfKindCode }" />
						</div>
					</td>
				</tr>
				<tr class="Height_0">
					<td>첨부파일</td>
					<td class="left">
						<a id="${list.inputFileId }" href="#" class="attachfile">
							<img src="/images/lionsclubs/btn/icon_file.gif" class="pointer authorization write" title="첨부파일" />(${list.fileCnt })
						</a>
					</td>
				</tr>
				<tr class="Height_0">
					<td style="vertical-align: middle;">안건내용</td>
					<td class="left">
						<div class="left cscroll" style="height: 300px;overflow-y: auto;">
							${lions:newline(list.inputAgendaDesc) }
						</div>
					</td>
				</tr>				
				<tr class="Height_0">
					<td>찬성인원</td>
					<td class="left">${list.inputApprovalPerson }</td>
				</tr>
				<tr>
					<td style="vertical-align: middle;">심의내용</td>
					<td class="left">
						<div class="left Height_1 cscroll" style="overflow-y: auto;">${lions:newline(list.inputDeliberationDesc) }</div>
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
