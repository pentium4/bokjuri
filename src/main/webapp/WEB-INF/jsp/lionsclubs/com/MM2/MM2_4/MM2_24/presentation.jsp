<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
$(document).ready(function () {
	$(".attachfile").on("click", function(){
		openPopup("/jfile/filedownloadPopup.do?fileId=" + $(this).prop("id") , "700", "300", "attachfile");
	});
	
	$(window).resize(function(){
		resize();
	});
	
	$(window).load(function(){
		resize();
	});	
});

function resize(){
	$('.Height_1').each(function(){
		if($(this).hasVerticalScrollbar()){
			$(this).closest('.table').find('.Scroll_Title').css('margin-right', '17px');
		} else {
			$(this).closest('.table').find('.Scroll_Title').css('margin-right', '0');
		}
	});
}
</script>
<style>
<!--
.attachfile {
	vertical-align: middle;
}

.attachfile img{
	height: 50px;
	float: left;
	margin: 10px 0 0 10px;
	padding: 0;
}
-->
</style>
<div class="deck-container">
	<section class="slide table">
		<div class="tblTitle Scroll_Title Height_0">
			<table>
				<colgroup>
					<col width="120px" />
					<col width="*" />
					<col width="230px" />
					<col width="230px" />
					<col width="130px" />
				</colgroup>
				<thead>
					<tr>
						<th>순서</th>
						<th>진행순서 내용</th>
						<th colspan="2">진행자</th>
						<th>파일</th>
					</tr>
				</thead>
			</table>
		</div>
		<div class="left Height_1" style="overflow-y: scroll;">
			<table class="Scroll_Table">
				<colgroup>
					<col width="120px" />
					<col width="*" />
					<col width="230px" />
					<col width="230px" />
					<col width="130px" />
				</colgroup>		
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td class="center">${status.count }</td>
							<td class="left"><c:out value="${list.inputProcessOrdDesc }" /></td>
							<td><c:out value="${list.inputHost1 }" /></td>
							<td><c:out value="${list.inputHost2 }" /></td>
							<td class="center">
								<a id="${list.inputFileId }" href="#" class="attachfile">
									<img src="/images/lionsclubs/btn/icon_file.gif" class="pointer authorization write" title="첨부파일" />(${list.fileCnt })
								</a>							
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
</div>
<!-- Initialize the deck -->
