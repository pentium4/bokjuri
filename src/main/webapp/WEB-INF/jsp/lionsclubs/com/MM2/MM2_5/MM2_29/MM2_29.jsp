<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		// 조직코드 세팅
		$("#organCode").organCode({
			 fixVal: "${MM2_29VO.organCode}"
			,searchable: true
		}, function(){
			$("#organCode").on("change", function(){
				var $organCode = $(this).val();
				$("#eventNameCode").option2Code({
				     groupCode: '3600' // 그룹코드
				    ,code: $organCode.substring(0, 3) + "000" // 코드
				    ,topLabel: "--전체--"
				    ,code1: "A,B"
				    ,fixVal: "${MM2_29VO.eventNameCode}" // 고정값
				    ,searchable: true
				});
			}).change();
		});
		
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM2_29VO.sessionYear}"	// 고정값
		});
		
		// 조회 버튼선택
		$("#search").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				organCode: $("#organCode").val()
			});
			
			_search();
		});
	
		/* 
			테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $(".tblType2 tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			$(this).find(".idnNo").prop("checked", true);
	 		if($(this).find(".finishYn").val() == "Y"){
	 			$("#eventMemberAdd").hide();	
	 		} else {
	 			$("#eventMemberAdd").show();
	 		}
			
		});
		
		$(".idnNo:checked").closest("tr").trigger("click");
		
		$("#add").on("click", function(){
			openPopup('<c:url value="/MM2/MM2_5/MM2_29/inputEventPopup.do?organCode=${MM2_29VO.organCode}" />', 800, 550, 'inputEventPopup');
		});
	
		$("#update").on("click", function(){
			var idnNo = $(".idnNo:checked");
			if(idnNo.length == 0){
				alert("수정할 행사를 선택해 주세요.");
				return false;
			}
			
			openPopup('<c:url value="/MM2/MM2_5/MM2_29/updateEventPopup.do?idnNo='+ idnNo.val() +'" />', 800, 550, 'updateEventPopup');
		});
		
		$("#eventMemberAdd").on("click", function(){
			var idnNo = $(".idnNo:checked");
			if(idnNo.length == 0){
				alert("행사인원추가할 행사를 선택해 주세요.");
				return false;
			}
			
			openPopup('<c:url value="/MM2/MM2_5/MM2_29/eventMemberAddPopup.do?idnNo='+ idnNo.val() +'" />', 800, 550, 'eventMemberAddPopup');
		});
		
		$(".eventMemberPopup").on("click", function(){
			var idnNo = $(this).prop("id");
			openPopup('<c:url value="/MM2/MM2_5/MM2_29/eventMemberPopup.do?idnNo='+ idnNo +'" />', 800, 550, 'eventMemberPopup');
		});
	
		$(".eventPhotoPopup").on("click", function(){
			$.viewThumbnailPopup({
				fileId : $(this).prop("id")
			});
		});
		
		$("#delete").on("click", function(){
			var idnNo = $(".idnNo:checked");
			if(idnNo.length == 0){
				alert("삭제할 행사를 선택해 주세요.");
				return false;
			}
			
			if(!confirm("주최,주관,참여 및 개인 봉사활동에 기록된 내용이 삭제됩니다.\n삭제하시겠습니까?")){
				return false;
			}
			
			var params = [];
			params.push({name:"idnNo", value:idnNo.val()});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM2/MM2_5/MM2_29/delete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						_search();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});		
		});
	});
});

function _search(){
	$("form").submit();
}
</script>
	
<form:form modelAttribute="MM2_29VO">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<table class="tblType1" summary="클럽/지구행사 입력표">
		<caption>클럽/지구행사 입력</caption>
		<colgroup>
			<col width="100px" />
			<col width="380px" />
			<col width="100px" />
			<col width="*" />
		</colgroup>
		<tbody>
			<tr>
				<th>조직코드</th>
				<td>
					<form:select path="organCode" cssClass="select" />
				</td>
				<th>조회순서</th>
				<td>
					<form:radiobutton path="searchKind" value="s1" label="기간" cssStyle="margin-left: 10px;" />
					<form:radiobutton path="searchKind" value="s2" label="행사명" cssStyle="margin-left: 10px;" />
				</td>
			</tr>
			<tr>
				<th>회기선택</th>
				<td>
					<form:select path="sessionYear" cssClass="select" /> 
				</td>
				<th>행사명</th>
				<td>
					<form:select path="eventNameCode" cssClass="select" />
				</td>
			</tr>
		</tbody>
	</table>
</div><!-- table -->

<div class="table">
	<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	<div class="btnBox">
		<img title="검색" id="search" 	src="/images/lionsclubs/btn/btn_search.gif"	style="margin-top:2px" onclick="return false;" class="pointer authorization read"  />
		<img id="add" src="/images/lionsclubs/btn/btn_input.gif" class="pointer authorization write" />
		<img id="update" src="/images/lionsclubs/btn/btn_edit.gif" class="pointer authorization write" />
		<img id="eventMemberAdd" src="/images/lionsclubs/btn/btn_eventMemberAdd.gif" class="pointer authorization write" />
		<img id="delete" src="/images/lionsclubs/btn/btn_del.gif" class="pointer authorization write" />
	</div>
	<div class="tblTitle Scroll_Title Height_0">
		<table class="tblType2_1" summary="행사입력표">
			<caption>행사입력</caption>
			<colgroup>
				<col width="180px" />
				<col width="110px" />
				<col width="100px" />
				<col width="150px" />
				<col width="*" />
				<col width="50px" />
				<col width="50px" />
				<col width="60px" />
				<col width="80px" />
				<col width="60px" />
			</colgroup>
			<thead>
				<tr>
					<th>기간</th>
					<th>행사시간</th>
					<th>구분</th>
					<th>행사명</th>
					<th>행사내용 및 장소</th>
					<th>인원</th>
					<th>시간</th>
					<th>점수(M)</th>
					<th>마감여부</th>
					<th>사진</th>
				</tr>
			</thead>
		</table>
	</div><!-- tblTitle -->
	
	<div id="Scroll_Area" class="Height_1">
		<table class="tblType2 Scroll_Table">
			<colgroup>
				<col width="180px" />
				<col width="110px" />
				<col width="100px" />
				<col width="150px" />
				<col width="*" />
				<col width="50px" />
				<col width="50px" />
				<col width="60px" />
				<col width="80px" />
				<col width="60px" />
			</colgroup>
			<tbody>
				<c:forEach items="${resultList }" var="list">
					<tr>
						<td>
							<form:radiobutton path="idnNo" cssClass="idnNo" value="${list.idnNo }" cssStyle="display:none;" />
							<fmt:parseDate var="eventStartDate" value="${list.eventStartDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
							~
							<fmt:parseDate var="eventEndDate" value="${list.eventEndDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${eventEndDate }" pattern="yyyy.MM.dd" />
						</td>
						<td>${list.eventStartTime } ~ ${list.eventEndTime }</td>
						<td title="${lions:newline(list.eventOrganNames) }">${list.kindName }</td>
						<td class="left" title="${list.eventName }">${list.eventName }</td>
						<td class="left" title="${lions:newline(list.eventDesc) }">${list.eventDesc }</td>
						<td class="right" title="${lions:newline(list.eventOrganNames) }"><a id="${list.idnNo }" class="eventMemberPopup" href="#"><fmt:formatNumber value="${list.memberNoCnt }" pattern="#,###" /></a></td>
						<td class="right" title="${lions:newline(list.eventOrganNames) }"><a id="${list.idnNo }" class="eventMemberPopup" href="#"><fmt:formatNumber value="${list.time }" pattern="#,###.##" /></a></td>
						<td class="right" title="${lions:newline(list.eventOrganNames) }"><a id="${list.idnNo }" class="eventMemberPopup" href="#"><fmt:formatNumber value="${list.score }" pattern="#,###.##" /></a></td>
						<td class="center">
							${list.finishYn }
							<input type="hidden" class="finishYn" value="${list.finishYn }" />
						</td>
						<td class="center">
							<c:if test="${not empty list.fileId }">
								<a id="${list.fileId }" class="eventPhotoPopup" href="#">
									☞(${list.fileCnt })
								</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div><!-- tblInner -->
	
	<div class="Scroll_Title Height_0">
		<table class="tblType2_1">
			<colgroup>
				<col width="180px" />
				<col width="110px" />
				<col width="100px" />
				<col width="150px" />
				<col width="*" />
				<col width="50px" />
				<col width="50px" />
				<col width="60px" />
				<col width="80px" />
				<col width="60px" />
			</colgroup>
			<tfoot>
				<tr>
					<th colspan="5">계</th>
					<th class="right"><fmt:formatNumber value="${total.memberNoCnt }" pattern="#,###" /></th>
					<th class="right"><fmt:formatNumber value="${total.time }" pattern="#,###.##" /></th>
					<th class="right"><fmt:formatNumber value="${total.score }" pattern="#,###.## " /></th>
					<th></th>
					<th></th>
				</tr>
			</tfoot>
		</table>
	</div><!-- tblInner -->	
</div><!-- table -->
<!-- 본문 내용 끝 -->
</form:form>