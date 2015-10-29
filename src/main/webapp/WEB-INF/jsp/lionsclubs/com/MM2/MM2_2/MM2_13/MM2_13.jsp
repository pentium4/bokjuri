<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#thisYear").sessionYearCombo({
			fixVal: "${MM2_13VO.thisYear}"	// 고정값
			,top:false
		});
	
		$("#thisMonth").monthCombo({
			fixVal: "${MM2_13VO.thisMonth}"	// 고정값
		});
		
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM2_13VO.organCode}"
		});
			
		//글로벌 idnNo
		var _idnNo = null;
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		//var tbl = $("#form_list.tblType2 tbody tr");
		var tbl = $("#table_sis tbody tr");
		tbl.bind("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			var idnno = $(this).find("input:hidden[name=idn]").eq(0).val();
			
			_idnNo = idnno;// $(this).find("#idnNo").val();
			//alert(_idnNo);
		});
		
		//조회 버튼선택
		$("#search").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 4
				,organCode: $("#organCode").val()
			});
			
			linkPage2(1);
		});
		
		//업데이트 버튼선택
		$("#update").on("click", function(){
			
			if(_idnNo == null){
				alert("기타수입을 선택해 주세요.");
				return false;
			}
					
			var url = "/MM2/MM2_2/MM2_13/MM2_13_Popup.do?idn=" + _idnNo
					+ "&organCode=${MM2_13VO.organCode}"
					+ "&thisYear=" + $("#thisYear").val()
					+ "&thisMonth=" + $("#thisMonth").val()
					;
			openPopup(url, '500', '260', 'MM2_13_Popup');
		});
		
		//입력 버튼 선택
		$("#insert").on("click", function(){
			
			var url = "/MM2/MM2_2/MM2_13/MM2_13_Popup1.do?organCode=${MM2_13VO.organCode}"
						+ "&thisYear=" + $("#thisYear").val()
						+ "&thisMonth=" + $("#thisMonth").val()
						;
			openPopup(url, '500', '260', 'MM2_13_Popup1');
		});
		
		//삭제 버튼 선택
		$("#hdel").bind("click", function(){
			
			if(_idnNo == null){
				alert("기타수입을 선택해 주세요.");
				return false;
			}
			
			if(!confirm("기타수입항목을 삭제 하시겠습니까?")){
				return false;
			}
			
			var params = [];
			params.push({name: "idnNo", value: _idnNo});
			params.push({name: "organCode", value: "${MM2_13VO.organCode}"});
			params.push({name: "thisYear" , value: $("#thisYear").val()});
			params.push({name: "thisMonth" , value: $("#thisMonth").val()});
	
			
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/MM2/MM2_2/MM2_13/otherIncomeDelete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result=="DATANOTFOUND"){
						if(confirm('해당 자료가 존재하지 않아서 삭제할 수 없습니다.\n이미 삭제된 자료일 수 있습니다.\n\n자료를 다시 조회하시겠습니까?\n')){
							linkPage2(1);	
						}
					}else if(data.result=="CONFIRM") {
						alert('해당 회기의 월정산이 확정되어 삭제할 수 없습니다.');
					}else if(data.result){
						//alert('정상적으로 삭제 되었습니다.');
						linkPage2(1);
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
			
		});		
		
		$("input:checkbox[name='s1']").on("click", function(){
			var checkedVal =$(this).val();
			$("input:checkbox[name='s1']").each(function(){
				$(this).prop("checked",(checkedVal == $(this).val()));								
			});
		});
	});
});

//링크페이지
function linkPage2(pageNum){
	//("#pageIndex").val(pageNum);
	//alert(pageNum);
	$("#form_list").submit();
}
</script>

<form:form id="form_list" modelAttribute="MM2_13VO">
	<input type="hidden" id="memberNo" value="${result.memberNo }" />
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="기타수입 입력/조회표">
			<caption>기타수입 입력 및 조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="140px" />
				<col width="100px" />
				<col width="140px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tr>
				<th>클럽코드</th>
				<td colspan="3">
				<div class="fL">
					<form:select path="organCode"/>
				</div>
				</td>
				<th rowspan="2">조회구분</th>
				<td rowspan="2" class="LH">
					&nbsp;&nbsp;<input type="checkbox" name="s1" id="orderOpt1" value="1" <c:if test="${MM2_13VO.s1 == '1' }">checked="checked"</c:if> /><label for="orderOpt1">&nbsp;수입일자순</label>&nbsp;&nbsp;<span style="margin-left:30px;"/>
					&nbsp;&nbsp;<input type="checkbox" name="s1" id="orderOpt2" value="2" <c:if test="${MM2_13VO.s1 == '2' }">checked="checked"</c:if> /><label for="orderOpt2">&nbsp;수입세부항목별</label><br />
					&nbsp;&nbsp;<input type="checkbox" name="s1" id="orderOpt3" value="3" <c:if test="${MM2_13VO.s1 == '3' }">checked="checked"</c:if>/><label for="orderOpt3">&nbsp;입력일자순</label>
				</td>
			</tr>
			<tr>
				<th>회기선택</th>
				<td>
					<form:select path="thisYear" cssClass="select" />
				</td>
				<th>선택월</th>
				<td>
					<strong class="month">
						<form:select path="thisMonth" cssClass="select" />
					</strong> 
				</td>
			</tr>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="search" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" alt="조회" class="pointer authorization read" />
			<img id="insert" src="/images/lionsclubs/btn/btn_input.gif" style="margin-top:2px" onclick="return false;" alt="입력" class="pointer authorization write" />
			<c:if test="${fn:length(resultList) > 0 }">
				<img id="update" src="/images/lionsclubs/btn/btn_edit.gif" style="margin-top:2px" onclick="return false;" alt="수정" class="pointer authorization write" />
				<img id="hdel" src="/images/lionsclubs/btn/btn_del.gif" style="margin-top:2px" onclick="return false;" alt="삭제" class="pointer authorization write" />
			</c:if>
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="기타수입 입력 및 조회 안내표">
				<caption>기타수입 입력 및 조회</caption>
				<colgroup>
					<col width="120px" />
					<col width="180px" />
					<col width="180px" />
					<col width="150px" />
					<col width="*" />
					<col width="120px" />
				</colgroup>
				<thead>
					<tr>
						<th>수입일자</th>
						<th>수입분류항목</th>
						<th>수입세부항목</th>
						<th>금액</th>
						<th>수입내용(참고사항)</th>
						<th>입력일자</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table" id = "table_sis">
				<colgroup>
					<col width="120px" />
					<col width="180px" />
					<col width="180px" />
					<col width="150px" />
					<col width="*" />
					<col width="120px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td class="center">
								<fmt:parseDate var="inexDate" value="${list.inexDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${inexDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left" title="${list.classItemName }">${list.classItemName }</td>
							<td class="left" title="${list.detailItemName }">${list.detailItemName }</td>
							<td class="right">
								
								<fmt:formatNumber value="${list.amount }" pattern="#,###"/>
							</td>
							<td class="left" title="${list.inexDesc }">${list.inexDesc }</td>
							<td class="center">
								<fmt:parseDate var="incomeInsertDate" value="${list.incomeInsertDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${incomeInsertDate }" pattern="yyyy.MM.dd" />
							</td>
							<input type="hidden" name="idn" value="${list.idnNo }" />  
							<input type="hidden" name="classItemCode" value="${list.classItemCode }" />  
							<input type="hidden" name="detailItemCode" value="${list.detailItemCode }" />  
						</tr>	
					</c:forEach>	
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1" summary="기타수입 입력 및 조회 안내표">
				<caption>기타수입 입력 및 조회</caption>
				<colgroup>
					<col width="120px" />
					<col width="180px" />
					<col width="180px" />
					<col width="150px" />
					<col width="*" />
					<col width="120px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="3">수입 항목별 누계</th>
						<th class="right">
							<fmt:formatNumber value="${paymentSum.amount }" pattern="#,###"/>
						</th>
						<th class="center">정산일자</th>
						<th class="center">
							<c:if test="${not empty paymentDate }">
								<fmt:parseDate var="payDate" value="${paymentDate.confirmDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${payDate }" pattern="yyyy.MM.dd" />
							</c:if>
						</th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->		
	</div><!-- table -->
</form:form>