<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		$("#startYearMonth").monthpicker();		
		$("#endYearMonth").monthpicker();
		
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal: "${MM3_54VO.organCode}"
		});
		
		//조회 버튼선택
		$("#btnSearch").on("click", function(){
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
		
		$("#excelDownload").on("click", function() {
			var startYearMonth = $("#startYearMonth").val();
			var endYearMonth = $("#endYearMonth").val();
			$(window).unbind();
			$.download("/MM3/MM3_13/MM3_54/excelDownload.do?organCode=${MM3_54VO.organCode}&startYearMonth=" + startYearMonth + "&endYearMonth=" + endYearMonth);
		});
		
		$("#excelUpload").on("click", function() {
			openPopup("/MM3/MM3_13/MM3_54/excelUploadPopup.do?organCode=${MM3_54VO.organCode}", '600', '185', "excelUpload");
		});		
		
		// 스크롤 이동 처리
		$('.Scroll_Title').on( 'scroll', function() {
			$('.Height_1').scrollLeft( $(this).scrollLeft() );
			$('.Scroll_Title').scrollLeft( $(this).scrollLeft() );
		});
		
		$('.Height_1').on('scroll', function() {
			$('.Height_1').scrollTop( $(this).scrollTop());
		});
		
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/
		var tbl = $("#fix .Scroll_Table tbody tr");
		tbl.find("td:not(:first)").on("click", function(){
			var $tr = $(this).closest("tr");
			var trClass = $tr.prop("class");
			
			var checked = $("." + trClass).find(".chk").is(":checked");
			$("." + trClass).find(".chk").prop("checked", !checked);
			$("." + trClass).find(".chk").trigger("change");
			
			fillChecked();
		});

		var tbl = $("#content .Scroll_Table tbody tr");
		tbl.find("td").on("click", function(){
			var $tr = $(this).closest("tr");
			var trClass = $tr.prop("class");
			
			var checked = $("." + trClass).find(".chk").is(":checked");
			$("." + trClass).find(".chk").prop("checked", !checked);
			$("." + trClass).find(".chk").trigger("change");
			
			fillChecked();
		});

		$(".chk").on("click", function(){
			fillChecked();
		});
		
		$("#chkAll").on("click", function(){
			$(".chk").prop("checked", $(this).is(":checked"));
			fillChecked();
		});
		
		$(".chk").on("change", function(){
			var total = $(".chk").length;
			var checkLen = $(".chk:checked").length;
			if(total == checkLen){
				$("#chkAll").prop("checked", true);
			} else {
				$("#chkAll").prop("checked", false);
			}
		}).change();
		
		$("#btnDelete").on("click", function(){
			if($(".chk:checked").length == 0){
				alert("삭제할 항목을 선택해 주세요.");
				return false;
			}
			
			if(!confirm('삭제하시겠습니까?')) {
				return false;
			}		
			
			var params = $("form").serializeArray();
			
			$(".chk:checked").each(function(index){
				var data = $(this).data();
				params.push({name: "deleteArray[" + index + "].organCode", value: "${MM3_54VO.organCode}"});
				params.push({name: "deleteArray[" + index + "].memberNo", value: data.memberno});
				params.push({name: "deleteArray[" + index + "].paymentYearMonth", value: data.paymentyearmonth});
				params.push({name: "deleteArray[" + index + "].paymentKindCode", value: data.paymentkindcode});
			});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM3/MM3_13/MM3_54/deleteSecretary.do" />',
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

function fillChecked(){
	$(".chk").each(function(){
		var $tr = $(this).closest("tr");
		var trClass = $tr.prop("class");
		
		if($(this).is(":checked")){
			$("." + trClass).css("background-color","#E0FFE0");	
		} else {
			$("." + trClass).css("background-color","#ffffff");
		}
	});
}

//링크페이지
function _search(){
	$("#form_list").submit();
}
</script>
<style>
tbody tr{
	cursor: pointer;
}
#fix{
	float: left;
	width: 435px;
}

#content{
	margin-left: 440px;
}
</style>
<form:form id="form_list" modelAttribute="MM3_54VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="380px" />
				<col width="100px" />
				<col width="200px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td><form:select path="organCode" /></td>
					<th>조회순서</th>
					<td colspan="3">
						<form:radiobutton path="ord" value="1" label="직책순" cssClass="ml10" />
						<form:radiobutton path="ord" value="2" label="회번순" cssClass="ml10" />
						<form:radiobutton path="ord" value="3" label="성명순" cssClass="ml10" />
						<form:radiobutton path="ord" value="4" label="구분순" cssClass="ml10" />
						<form:radiobutton path="ord" value="5" label="지급월순" cssClass="ml10" />
					</td> 
				</tr>
				<tr>
					<th>조회기간</th>
					<td>
						<form:input path="startYearMonth" cssClass="input" /> ~ <form:input path="endYearMonth" cssClass="input" />
					</td>
					<th>급여구분</th>
					<td>
						<lions:codeselect groupCode="8600" path="paymentKindCode" topLabel="--전체--" />
					</td>
					<th>성명</th>
					<td>
						<form:select path="memberNo">
			    	  		<form:option value='' label="--전체--" />
				      		<form:options items="${listMemberNo}" itemValue="memberNo" itemLabel="memberName"/>
						</form:select>
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->

	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img alt="조회" id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
			<img alt="삭제" id="btnDelete" src="/images/lionsclubs/btn/btn_del.gif" class="pointer authorization write" />
			<img alt="엑셀폼받기" id="excelDownload" src="/images/lionsclubs/btn/btn_excel3.gif" class="pointer authorization read" />
			<img alt="엑셀올리기" id="excelUpload" src="/images/lionsclubs/btn/btn_excel.gif" class="pointer authorization read" />
		</div>
	
		<div id="fix">	
			<div class="tblTitle Scroll_Title">
				<table class="tblType2_1">
					<colgroup>
						<col width="30px" />
						<col width="80px" />
						<col width="90px" />
						<col width="80px" />
						<col width="150px" />
					</colgroup>
					<thead>
						<tr>
							<th><input id="chkAll" type="checkbox" /></th>
							<th>지급월</th>
							<th>급여구분</th>
							<th>성명</th>
							<th>직책</th>
						</tr>
					</thead>
				</table>
			</div>
			
			<div class="Height_1" style="overflow: hidden;">
				<table class="tblType2_1 Scroll_Table">
					<colgroup>
						<col width="30px" />
						<col width="80px" />
						<col width="90px" />
						<col width="80px" />
						<col width="150px" />
					</colgroup>
					<tbody>
						<c:forEach items="${resultList}" var="list" varStatus="status">
							<tr class="${status.count }">
								<td class="center"><input type="checkbox" class="chk" data-memberno="${list.memberNo }" data-paymentyearmonth="${list.paymentYearMonth }" data-paymentkindcode="${list.paymentKindCode }" /></td>
								<td class="center">
									<fmt:parseDate var="paymentYearMonth" value="${list.paymentYearMonth }" pattern="yyyyMM" />
									<fmt:formatDate value="${paymentYearMonth }" pattern="yyyy.MM" />
								</td>
								<td class="center">${list.paymentKindName }</td>
								<td class="center">${list.memberName }</td>
								<td class="left" title="${list.sectorTitle }">${list.sectorTitle }</td>
							</tr>
						</c:forEach>				
					</tbody>
				</table>
			</div>
		
			<div class="Scroll_Title">
				<table class="tblType2_1">
					<colgroup>
						<col width="30px" />
						<col width="80px" />
						<col width="90px" />
						<col width="80px" />
						<col width="150px" />
					</colgroup>
					<tfoot>	
						<tr>
							<th colspan="5">총계</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<div id="content">		
			<div class="tblTitle Height_0 Scroll_Title widthLong" style="overflow-x: hidden;">
				<table class="tblType2_1">
					<colgroup>
						<c:forEach items="${headList}">
							<col width="100px" />
						</c:forEach>
					</colgroup>
					<thead>
						<tr>
							<c:forEach items="${headList}" var="list" varStatus="status">
								<th>${list.paymentItemName}</th>
							</c:forEach>
						</tr>
					</thead>
				</table>
			</div><!-- tblTitle -->
			
			<div id="Scroll_Area" class="Height_1">
				<table class="tblType2_1 Scroll_Table">
					<colgroup>
						<c:forEach items="${headList}">
							<col width="100px" />
						</c:forEach>
					</colgroup>
					<tbody>
						<c:forEach items="${resultList}" var="list" varStatus="status">
							<tr class="${status.count }">
								<c:forEach items="${headList}" var="headList" varStatus="status">
									<td class="right">
										<fmt:formatNumber value="${list[headList.plusItemCode] }" pattern="#,###"/>
									</td>
								</c:forEach>
							</tr>
						</c:forEach>				
					</tbody>
				</table>
			</div><!-- Height_1 -->
			
			<div id="ftScroll" class="Scroll_Title Height_0 widthLong" style="overflow-x: auto;">
				<table class="tblType2_1">
					<colgroup>
						<c:forEach items="${headList}">
							<col width="100px" />
						</c:forEach>
					</colgroup>
					<tfoot>	
						<tr>
							<c:forEach items="${headList}" var="list" varStatus="status">
								<th class="right">
									<fmt:formatNumber value="${sum[list.plusItemCode] }" pattern="#,###"/>
								</th>
							</c:forEach>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div><!-- table -->
</form:form>