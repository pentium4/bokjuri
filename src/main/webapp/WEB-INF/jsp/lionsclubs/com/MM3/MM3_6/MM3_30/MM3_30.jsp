<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_30VO.sessionYear}"	// 고정값
			,top: false
		});
		
		// 조회 버튼선택
		$("#search").on("click", function(){
			_search();
		});
		
		// 기관 클럽코드 세팅
		$("#upperCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM3_30VO.upperCode}"
		});
		
		var tbl = $("#form_list .tblType2_1 tbody tr");
		tbl.bind("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			var index = $(this).index();
			var clubCode = $(".clubCode").eq(index).val();
			$("#formUpdate #organCode").val(clubCode);
		});
		
		$("#button_update").bind("click", function() {
			var organCode = $("#formUpdate #organCode").val();		
			if(organCode.isEmpty()){
				alert("클럽을 선택해 주세요.");
				return;
			}
			
			var params = $("#formUpdate").serializeArray();
			params.push({name:"clubCode", value:$("#organCode").val()});
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/MM3/MM3_6/MM3_30/detail.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						var detail = data.detail;
						if(detail != null){
					 		$("#formUpdate #thisArea").val(detail.thisArea);
					 		$("#formUpdate #thisZone").val(detail.thisZone);
					 		$("#formUpdate #uniqueness").val(detail.uniqueness);
					 		$("#formUpdate #organCode").val(detail.organCode);
						}
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
			$("#dialog-form-update").dialogPopup({
				 height: 250
				,width: 350
			});	
		});
		
		$("#codeUpdate").bind("click", function() {
			if(!$("#formUpdate").valid()){
				return false;
			}
			
			var params = $("#formUpdate").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/MM3/MM3_6/MM3_30/MM3_30_Update.do" />',
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
		
		//전체조회 기본체크 처리
		if($("input:checkbox[name=s2]").is(":checked")==false 
				&& $("input:checkbox[name=s3]").is(":checked")==false) {
			$("input:checkbox[name=s1]").attr("checked", true);  
		}
		
		$("#thisArea").numericOnly();
		$("#thisZone").numericOnly();
	});
});

function _search(){
	$("#form_list").submit();
}

</script>

<h3><div>지역지대입력 <span class="date"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></span></div></h3>
<form:form id="form_list" modelAttribute="MM3_30VO" action="/MM3/MM3_6/MM3_30/MM3_30.do">
	<div class="table">
		<table class="tblType1" summary="지역/지대 입력">
			<caption>지역지대 입력</caption>
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
					<th>조직코드</th>
					<td colspan="3">
						<div class="fL">
							<form:select path="upperCode" cssClass="select" />
						</div>			
					</td>
					<th rowspan="2">정렬구분</th>
					<td rowspan="2" class="LH">
						<form:radiobutton path="order" value="1" label="클럽 생성일순" />
						<form:radiobutton path="order" value="2" label="클럽 가나다순" /><br/>
						<form:radiobutton path="order" value="3" label="지역순" />				
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td colspan="3">
						<form:select path="sessionYear" cssClass="select" />
					</td>
					
				</tr>
			</tbody>
		</table>
	</div><!-- table -->

	<div class="table">
		<h4>클럽 지역지대 연결</h4>
	    <div class="btnBox">
		    <img alt="조회"  id="search" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" class="pointer authorization read" />
			<img alt="수정" id="button_update" src="/images/lionsclubs/btn/btn_edit.gif" style="margin-top:2px" onclick="return false;" class="pointer authorization write" />
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2" summary="클럽 지역지대 연결표">
				<caption>클럽 지역지대 연결</caption>
				<colgroup>
					<col width="100px" />
					<col width="200px" />
					<col width="100px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">클럽코드</th>
						<th rowspan="2">클럽명칭</th>
						<th rowspan="2">클럽생성일</th>
						<th colspan="2">전회기</th>
						<th colspan="2">현회기</th>
						<th rowspan="2">특이사항</th>
					</tr>
					<tr>
						<th>지역</th>
						<th>지대</th>
						<th>지역</th>
						<th>지대</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table" id="table_body">
				<colgroup>
					<col width="100px" />
					<col width="200px" />
					<col width="100px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList }" varStatus="status">
						<tr>
							<td>
								${lions:formatOrganCode(list.organCode)}
								<input type="hidden" id="clubCode" class="clubCode" value="${list.organCode }" />
							</td>	
							<td class="left">${list.organName}</td>
							<td>
								<fmt:parseDate var="soptNight" value="${list.soptNight}" pattern="yyyyMMdd" />
								<fmt:formatDate value="${soptNight }" pattern="yyyy.MM.dd" />
							</td>
							<td class="center">${list.prevArea }</td>
							<td class="center">${list.prevZone }</td>
							<td class="center">${list.thisArea }</td>	
							<td class="center">${list.thisZone }</td>
							<td class="left">${list.uniqueness }</td>	
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
</form:form>
<!-- Modal Popup -->  	
<div id="dialog-form-update" class="dialog" style="display: none;">
	<form:form id="formUpdate" modelAttribute="MM3_30VO" action="/MM3/MM3_6/MM3_30/MM3_30_Update.do">
		<div id="popup">
			<h3><div>클럽회지발간실적입력</div></h3>
			<div class="popup_bg">
				<table class="tblType2" style="width:98%">
					<colgroup>
						<col width="70px" />
						<col width="110px" />
					</colgroup>
					<thead>
						<tr>
							<th>제목</th>
							<th>내용</th>	
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>지역<span class="require">*</span></th>
							<td>
								<lions:codeselect groupCode="2620" path="thisArea" cssClass="select required" caption="지역" />
							</td>
						</tr>
						<tr>
							<th>지대<span class="require">*</span></th>
							<td>
								<lions:codeselect groupCode="2640" path="thisZone" cssClass="select required" caption="지대" />
							</td>
						</tr>
						<tr>
							<th>특이사항</th>
							<td>				
								<form:input path="uniqueness" cssClass="input" size="20"  maxlength="20" style="width: 200px !important;"/>
							</td>
						</tr>
						<form:hidden path="organCode" />
						<form:hidden path="sessionYear" />
					</tbody>
				</table>
			</div><!-- popup_bg -->
			<div class="popupBtn">
				<img id="codeUpdate" src="/images/lionsclubs/btn/btn_edit.gif" class="pointer" />
				<img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" class="dialogClose pointer" />
			</div>
		</div>		
	</form:form>
</div>