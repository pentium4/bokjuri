<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<style>
<!--
.ui-widget-header {
    background: none;
}

.ui-datepicker-title {
	color: #000000;
}
-->
</style>

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
	    $("#datepicker").datepicker({
	         changeMonth: false
	        ,changeYear: false
		});
	    
		$('.tblPhoto .eventMemberPopup').each(function(){
			$(this).tooltipster({
			     content: $(this).html()
			    ,contentAsHTML: true
			});
		});
		
		var $tabs = $(".primary").tabs({
			activate: function(event, ui){
				$("img").lazyload();
			}
		});
		
		$(".photoView").on("click", function(){
			var data = $(this).data();
			
			$.viewThumbnailPopup({
				fileId : data.fileid
			});
		});
		
		
		$(".more").on("click", function(){
			var active = $tabs.tabs('option', 'active'); 
			if(active == 0){
				location.href = "/home/355d/photo/photo3.do";
			} else if(active == 1){
				location.href = "/home/355d/photo/photo1.do";
			} else if(active == 2){
				location.href = "/home/355d/photo/photo4.do";
			} else if(active == 3){
				location.href = "/home/355d/photo/photo2.do";
			}
		});
	});
});
</script>

<div class="primary">
	<ul>
		<li><a href="#tabs-1">지구행사</a></li>
		<li><a href="#tabs-2">지구행사사진</a></li>
		<li><a href="#tabs-3">클럽행사</a></li>
		<li><a href="#tabs-4">클럽행사사진</a></li>
		<li style="float: right; margin-top: 7px;" class="more pointer"><img src="/images/lionsclubs/more.gif" /></li>
	</ul>

	<div id="tabs-1">
		<table class="tblType">
			<colgroup>
				<col width="150px" />
				<col width="90px" />
				<col width="180px" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th>기간</th>
					<th>행사시간</th>
					<th>행사명</th>
					<th>행사내용 및 장소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listPhoto3 }" var="list">
					<tr>
						<td>
							<fmt:parseDate var="eventStartDate" value="${list.eventStartDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
							~
							<fmt:parseDate var="eventEndDate" value="${list.eventEndDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${eventEndDate }" pattern="yyyy.MM.dd" />
						</td>
						<td>${list.eventStartTime } ~ ${list.eventEndTime }</td>
						<td class="left" title="${list.eventName }">${list.eventName }</td>
						<td class="left" title="${lions:newline(list.eventDesc) }">${list.eventDesc }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div id="tabs-2">
		<div class="tblPhoto">
		<c:forEach var="list" items="${listPhoto1 }">
			<div>
				<p class="photo mb10">
					<c:choose>
						<c:when test="${not empty list.fileId }">
							<img class="pointer photoView" alt="행사 사진" data-fileid="${list.fileId }" data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.fileId}&fileSeq=${list.fileSeq}" height="77px" width="115px" />
						</c:when>
						<c:otherwise>
							<img alt="행사 사진" data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.fileId}&fileSeq=${list.fileSeq}" height="77px" width="115px" />	
						</c:otherwise>
					</c:choose>
				</p>
				
				<span id="${list.idnNo }" class="center txt eventMemberPopup pointer">
					<p class="txt ellipsis">${list.organName }</p>
					<p class="txt ellipsis">${list.eventName }</p>
					<p class="txt ellipsis">${list.eventDesc }</p>
					<p class="txt ellipsis">
						<fmt:parseDate var="eventStartDate" value="${list.eventStartDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
						~
						<fmt:parseDate var="eventEndDate" value="${list.eventEndDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${eventEndDate }" pattern="yyyy.MM.dd" />						
					</p>
				</span>
			</div>
		</c:forEach>
		</div>	
	</div>

	<div id="tabs-3">
		<table class="tblType">
			<colgroup>
				<col width="150px" />
				<col width="175px" />
				<col width="100px" />
				<col width="130px" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th>클럽명</th>
					<th>기간</th>
					<th>행사시간</th>
					<th>행사명</th>
					<th>행사내용 및 장소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listClubEvent }" var="list">
					<tr>
						<td title="${list.organName }">${list.organName }</td>
						<td>
							<fmt:parseDate var="eventStartDate" value="${list.eventStartDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
							~
							<fmt:parseDate var="eventEndDate" value="${list.eventEndDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${eventEndDate }" pattern="yyyy.MM.dd" />
						</td>
						<td>${list.eventStartTime } ~ ${list.eventEndTime }</td>
						<td class="left" title="${list.eventName }">${list.eventName }</td>
						<td class="left" title="${lions:newline(list.eventDesc) }">${list.eventDesc }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>	
	</div>

	<div id="tabs-4">
		<div class="tblPhoto">
		<c:forEach var="list" items="${listClubEventPhoto }">
			<div>
				<p class="photo mb10">
					<c:choose>
						<c:when test="${not empty list.fileId }">
							<img class="pointer photoView" alt="행사 사진" data-fileid="${list.fileId }" data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.fileId}&fileSeq=${list.fileSeq}" height="77px" width="115px" />
						</c:when>
						<c:otherwise>
							<img alt="행사 사진" src="/images/lionsclubs/mobile/photo.gif" height="77px" width="115px" />	
						</c:otherwise>
					</c:choose>
				</p>
				
				<span id="${list.idnNo }" class="center txt eventMemberPopup pointer">
					<p class="txt ellipsis">${list.organName }</p>
					<p class="txt ellipsis">${list.eventName }</p>
					<p class="txt ellipsis">${list.eventDesc }</p>
					<p class="txt ellipsis">
						<fmt:parseDate var="eventStartDate" value="${list.eventStartDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
						~
						<fmt:parseDate var="eventEndDate" value="${list.eventEndDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${eventEndDate }" pattern="yyyy.MM.dd" />						
					</p>
				</span>
			</div>
		</c:forEach>
		</div>	
	</div>	
</div>

<div class="secondary">
	<div class="promo">
		<div style="text-align: center;">
			<img src="/jfile/thumbPreview.do?fileId=${governorsPictureFile}" width="150" height="150" />
		</div>
		
		<div id="datepicker" style="margin-top: 10px;"></div>
		
		<select size="1" onchange="if(this.value!='')window.open(this.value,'tst')" style="width:160; margin-top: 10px;">
			<option value="">-- 클럽카페 안내 --</option>
			<option value="http://cafe.daum.net/uslion">01. 울산</option>
			<option value="http://cafe.daum.net/uljoolc">02. 울주</option>
			<!--<option value="">03. 양산</option>-->
			<option value="">04. 동울산</option>">05. 울산중앙</option>
			<option value="http://cafe.daum.net/namulju">06. 남울주</option>
			<option value="http://cafe.daum.net/saeulsanlioneclub">07. 새울산</option>
			<option value="http://cafe.daum.net/ska11">08. 남울산</option>
			<!--<option value="">09. 웅상</option>
			<option value="">10. 태화</option>
			<option value="">11. 무룡</option>
			<option value="">12. 무궁화</option>
			<option value="">13. 처용</option>
			<option value="">14. 학성</option>-->
			<option value="http://cafe.daum.net/lsb11">15. 서울산</option>
			<option value="http://cafe.daum.net/bulsanlc">16. 북울산</option>
			<option value="http://cafe.daum.net/ulsanulgi">17. 울기</option>
			<option value="http://cafe.daum.net/moonsoolc">18. 문수</option>
			<!--<option value="">19. 천성</option>
			<option value="">20. 서울주</option>-->
			<option value="http://cafe.daum.net/sblions">21. 울산서부</option>
			<option value="http://cafe.daum.net/ulsanjlc">22. 울산제일</option>
			<option value="http://cafe.daum.net/tongdolions">23. 통도</option>
			<option value="http://cafe.daum.net/baekyanglions">24. 백양</option>
			<!--<option value="">25. 함월</option>-->
			<option value="http://cafe.daum.net/EonyangLionsClub ">26. 언양</option>
			<option value="http://cafe.daum.net/julsan">27. 중울산</option>
			<!--<option value="">28. 일송</option>-->
			<option value="http://cafe.daum.net/santus65">29. 이화</option>
			<!--<option value="">30. 울산동해</option>-->
			<option value="http://cafe.daum.net/gold-dragon">31. 황룡</option>
			<!--<option value="">32. 울산삼일</option>-->
                        <option value="http://cafe.daum.net/ulsanchungyongclub">33. 울산청룡</option>
                        <!--<option value="">34. 울산남산</option>
			<option value="">35. 울산중부</option>
			<option value="">36. 대왕</option>-->
			<option value="http://cafe.daum.net/kuslc">37. 광울산</option>
			<option value="http://cafe.daum.net/dong.dae">38. 울산동대</option>
			<!--<option value="">39. 신울산</option>
			<option value="">40. 태극</option>-->
			<option value="http://cafe.daum.net/HANULLIONS">41. 한울</option>
			<option value="http://cafe.daum.net/edc05">42. 동백</option>
			<option value="http://cafe.daum.net/gerenfkdldhstm">43. 백두</option>
			<!--<option value="">44. 백합</option>-->
			<option value="http://cafe.naver.com/mulgeum">45. 물금</option>
			<!--<option value="">46. 백호</option>-->
			<option value="http://cafe.daum.net/roselions">47. 울산장미</option>
			<option value="http://cafe.daum.net/WESERVE">48. 울산홍익</option>
			<!--<option value="">49. 울산샛별</option>
			<option value="">50. 울산오성</option>
			<option value="">51. 양산이팝</option>
			<option value="">52. 울산삼산</option>
			<option value="">53. 울산간절곶</option>
			<option value="">54. 웅상철쭉</option>
			<option value="">55. 울산매화</option>-->
			<option value="http://cafe.daum.net/usym815">56. 울산여명</option>
			<!--<option value="">57. 울산수정</option>
			<option value="">58. 울산목련</option>
			<option value="">59. 울산태양</option>-->
			<option value="http://cafe.daum.net/DongEuiMJF">60. 울산동의MJF</option>
			<option value="http://cafe.daum.net/ulsandongin">61. 울산동인</option>
			<!--<option value="">62. 울산강남</option>
			<option value="">63. 양산원효</option>
			<option value="">64. 울산목화</option>-->
			<option value="http://cafe.daum.net/ulsantnfus">65. 울산수련</option>
                        <!--<option value="">66. 울산솔잎</option>
                        <option value="">67. 울산원</option>
			<option value="">68. 울산해송</option>
			<option value="">69. 울산고헌</option>
			<option value="">70. 울산미소</option>
			<option value="">71. 울산설록</option>-->
			<option value="http://cafe.daum.net/newyangsanlions">72. 신양산</option>
			<option value="http://cafe.daum.net/cj-lc">73. 울산천지</option>
			<!--<option value="">74. 울산천자봉</option>
			<option value="">75. 울산 M.J.F</option>-->
			<option value="http://cafe.daum.net/gumgang76">76. 울산금강</option>
			<!--<option value="">77. 울산보리</option>-->
			<option value="http://cafe.daum.net/울산수선화">78. 울산수선화</option>
			<!--<option value="">79. 중울주</option>
			<option value="">80. 울산하나</option>-->
			<option value="http://cafe.daum.net/071130">81. 울산유수</option>
			<option value="http://cafe.daum.net/ckalsfo">82. 울산달해</option>
			<option value="http://cafe.daum.net/ulsanwonhwalions ">83. 울산원화</option>
			<!--<option value="">84. 울산민들레</option>
			<option value="">85. 울산리더스</option>
			<option value="">86. 웅상우불</option>
			<option value="">87. 울산화랑</option>-->
			<option value="http://cafe.daum.net/samsinclub">88. 울산삼신</option>
			<!--<option value="">89. 울산청림</option>
			<option value="">90. 울산POC</option>-->
			<option value="http://cafe.daum.net/choung.sol.lions">91. 울산청솔</option>
			<!--<option value="">92. 울산비전</option>
			<option value="">93. 울산백록</option>
			<option value="">94. 울산송학</option>-->
			<option value="http://cafe.naver.com/taehwariverlions">95.울산태화강</option>
			<!--<option value="">96.울산무지개</option>-->
		</select>		
	</div>
</div>