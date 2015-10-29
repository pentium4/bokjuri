<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_45VO.sessionYear}"	// 고정값
			,top:false
		});
		
		// 지구코드 세팅
		$("#organCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal: "${MM3_45VO.organCode}"
		},function(){
			// 지구코드 세팅
			$("#clubCode").organCode({
				 lvl: 4
				,searchable: true
				,top: "--전체--"
				,upperOrganCode: $("#organCode").val()
				,fixVal: "${MM3_45VO.clubCode}"
			});
		});
		
		$("#organCode").on("change", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 3
				,organCode: $(this).val()
			});
		
			// 지구코드 세팅
			$("#clubCode").organCode({
				 lvl: 4
				,searchable: true
				,top: "--전체--"
				,upperOrganCode: $(this).val()
			});
		});
		
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $(".tblType2 tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			$(this).find(".idnNo").prop("checked", true);
		});
		
		$(".idnNo:checked").closest("tr").trigger("click");
		
		$("#btnInsert").on("click", function(){
			openPopup('/MM3/MM3_12/MM3_45/impostPopup.do?sessionYear=${MM3_45VO.sessionYear}&organCode=${MM3_45VO.organCode}', '500', '500', 'impostPopup');	
		});

		$("#btnUpdate").on("click", function(){
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(idnNo.isEmpty()) {
				alert("수정할 항목을 선택해 주세요.");
				return false;
			}

			openPopup('/MM3/MM3_12/MM3_45/impostPopup.do?idnNo=' + idnNo, '500', '500', 'impostPopup');	
		});
		
		$("#btnDelete").on("click", function(){
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(idnNo.isEmpty()) {
				alert("삭제할 항목을 선택해 주세요.");
				return false;
			}
			
			if(!confirm('삭제하시겠습니까?')) {
				return false;
			}
			
			var params = [];
			params.push({name: "idnNo", value: idnNo});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM3/MM3_12/MM3_45/deleteImpost.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result) {
						_search();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					return false;
				}
			});			
		});
		
		$("#excelDownload").on("click", function(){
			$(window).unbind();
			$.download("/MM3/MM3_12/MM3_45/excelDownload.do?sessionYear=${MM3_45VO.sessionYear}&organCode=${MM3_45VO.organCode}");
		});
		
		$("#excelUpload").on("click", function(){
			openPopup("/MM3/MM3_12/MM3_45/excelUploadPopup.do?sessionYear=${MM3_45VO.sessionYear}&organCode=${MM3_45VO.organCode}", '600', '185', "excelUpload");
		});
		
		$("#btnSearch").on("click", function(){
			_search();
		});
	});
});

function _search(){
	$("#pageIndex").val(1);
	$("form").submit();
}

function _pagingFixSearch(){
	$("form").submit();
}
</script>

<form:form modelAttribute="MM3_45VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="400px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td>
						<form:select path="organCode"/>
					</td>
					<th>회기선택</th>
					<td>
						<form:select path="sessionYear" />
					</td>
				</tr>
				<tr>
					<th>클럽명</th>
					<td colspan="3"><form:select path="clubCode"/></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img alt="조회" id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
			<img alt="입력" id="btnInsert" src="/images/lionsclubs/btn/btn_input.gif" class="pointer authorization write" />
			<img alt="수정" id="btnUpdate" src="/images/lionsclubs/btn/btn_edit.gif" class="pointer authorization write" />
			<img alt="삭제" id="btnDelete" src="/images/lionsclubs/btn/btn_del.gif" class="pointer authorization write" />
			<img alt="엑셀폼받기" id="excelDownload" src="/images/lionsclubs/btn/btn_excel3.gif" class="pointer authorization read" />
			<img alt="엑셀올리기" id="excelUpload" src="/images/lionsclubs/btn/btn_excel.gif" class="pointer authorization read" />
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="250px" />
					<col width="120px" />
					<col width="150px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>클럽명</th>
						<th>수입분류항목</th>
						<th>수입세부항목</th>
						<th>부과일자</th>
						<th>부과금</th>
						<th>참고사항</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table">
				<colgroup>
					<col width="250px" />
					<col width="120px" />
					<col width="150px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<c:set var="fStyle" value="" />
						<c:choose>
							<c:when test="${list.dollarKind eq '$'}">
								<c:set var="fStyle" value="color:green" />
							</c:when>
						</c:choose>
						<tr>
							<td style="${fStyle}" class="left">
								${list.clubName }
								<form:radiobutton path="idnNo" cssClass="idnNo" value="${list.idnNo }" cssStyle="display: none" />
							</td>
							<td style="${fStyle}" class="left" title="${list.classItemName }">${list.classItemName }</td>
							<td style="${fStyle}" class="left" title="${list.detailItemName }">${list.detailItemName }</td>
							<td style="${fStyle}" class="center">
								<fmt:parseDate var="genDate" value="${list.genDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
							</td>
							<fmt:formatNumber var="impostDollar" value="${list.impostDollar }" pattern="$ #,###.##"/>
							<td style="${fStyle}" class="right" title="${impostDollar }">
								<fmt:formatNumber value="${list.impost }" pattern="#,###"/>
							</td>
							<td style="${fStyle}" class="left" title="${lions:newline(list.reference) }">${list.reference }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="250px" />
					<col width="120px" />
					<col width="150px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="4">부과금 총계</th>
						<th class="right">
							<fmt:formatNumber value="${sum.impost }" pattern="#,###"/>
						</th>
						<th></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->
		
		<div class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
		</div>
	</div><!-- table -->
</form:form>
