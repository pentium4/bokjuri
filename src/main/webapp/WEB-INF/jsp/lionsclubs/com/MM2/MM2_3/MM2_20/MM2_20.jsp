<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">

require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#thisYear").sessionYearCombo({
			 fixVal: "${MM2_20VO.thisYear}"	// 고정값
			,top: false
		});
		
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM2_20VO.organCode}"
		});
		
		
		//글로벌 idnNo
		var _idnNo = null;
		var _classItemCode = null;
		var _detailItemCode = null;
		var _moneyIdnNo = null;
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
			_classItemCode = $(this).find("input:hidden[name=classItemCode]").eq(0).val();
			_detailItemCode = $(this).find("input:hidden[name=detailItemCode]").eq(0).val();
			_moneyIdnNo = $(this).find("input:hidden[name=moneyIdnNo]").eq(0).val();
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
			if(_idnNo.isEmpty()){
				alert("연간지출예산을 선택해 주세요.");
				return false;
			}
			
			if(_classItemCode == "1160" 
					&& !_moneyIdnNo.isEmpty()){
				alert("지구 약정금은 개인기록관리 > 개인 납부금 업무 > 약정금 등록/납부에서 수정 할 수 있습니다.");
				return false;
			}
			
			if(_classItemCode == "1040" 
					&& !_moneyIdnNo.isEmpty()){
				alert("지구 임원분담금은 개인기록관리 > 개인 납부금 업무 > 지구임원분담금 납부에서 수정 할 수 있습니다.");
				return false;
			}
			
			var url = "/MM2/MM2_3/MM2_20/MM2_20_Popup.do?idn=" + _idnNo;
			openPopup(url, '500', '300', 'MM2_20_Popup');
		});
		
		//입력 버튼 선택
		$("#insert").on("click", function(){
			var url = "/MM2/MM2_3/MM2_20/MM2_20_Popup1.do?organCode=" + $("#organCode").val()
					//+"&classItemCode=" + _classItemCode
					//+"&detailItemCode=" + _detailItemCode
					+"&thisYear=" + "${MM2_20VO.thisYear}";
			openPopup(url, '500', '300', 'MM2_20_Popup1');
		});
		
		//삭제 버튼 선택
		$("#hdel").bind("click", function(){
			if(_idnNo.isEmpty()){
				alert("연간지출예산을 선택해 주세요.");
				return false;
			}
			
			if(_classItemCode == "1160" 
					&& !_moneyIdnNo.isEmpty()){
				alert("지구 약정금은 개인기록관리 > 개인 납부금 업무 > 약정금 등록/납부에서 삭제 할 수 있습니다.");
				return false;
			}
			
			if(_classItemCode == "1040" 
					&& !_moneyIdnNo.isEmpty()){
				alert("지구 임원분담금은 개인기록관리 > 개인 납부금 업무 > 지구임원분담금 납부에서 삭제 할 수 있습니다.");
				return false;
			}
			
			if(!confirm("연간지출예산항목을 삭제 하시겠습니까?")){
				return false;
			}
			
			var params = [];
			params.push({name: "idnNo", value: _idnNo});
			
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/MM2/MM2_3/MM2_20/otherIncomeDelete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						//alert('정상적으로 삭제 되었습니다.');
						linkPage2(1);
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});	
		
		//전체조회 기본체크 처리
		if($("input:checkbox[name=s2]").is(":checked")==false) {
		 	$("input:checkbox[name=s1]").attr("checked", true);  
		}
	});
});

//링크페이지
function linkPage2(pageNum){
	$("#form_list").submit();
}

function fn_checkOrder(index) {
	if(index == 's1' && $("input:checkbox[name=s1]").is(":checked")){
		$("input:checkbox[name=s2]").attr("checked", false);

	}else if(index == 's2' && $("input:checkbox[name=s2]").is(":checked")){
		$("input:checkbox[name=s1]").attr("checked", false);

	}
}
</script>

<form:form id="form_list" modelAttribute="MM2_20VO">
<form:hidden path="memberNo"/>
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="연간지출예산 입력/조회표">
			<caption>연간지출예산 조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="380px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>클럽코드</th>
					<td>
					<div class="fL">
						<form:select path="organCode"/>
					</div>
					</td>
					<th rowspan="2">조회구분</th>
					<td rowspan="2" class="LH">
						<form:checkbox path="s1" value="1" onclick="javascript:fn_checkOrder('s1')" label="세부항목별" cssClass="ml10" /><br/>
						<form:checkbox path="s2" value="1" onclick="javascript:fn_checkOrder('s2')" label="금액순" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td>
						<form:select path="thisYear" cssClass="select" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->

	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img alt="조회"  id="search" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" class="pointer authorization read" />
			<img alt="입력"  id="insert" src="/images/lionsclubs/btn/btn_input.gif" style="margin-top:2px" onclick="return false;" class="pointer authorization write" />
			<c:if test="${fn:length(resultList) > 0 }">
				<img alt="수정"  id="update" src="/images/lionsclubs/btn/btn_edit.gif" style="margin-top:2px" onclick="return false;" class="pointer authorization write" />
				<img alt="삭제"  id="hdel" src="/images/lionsclubs/btn/btn_del.gif" style="margin-top:2px" onclick="return false;" class="pointer authorization write" />
			
			</c:if>		
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="연간 지출예산 입력 및 조회 안내표">
				<caption>지출예산 산출근거</caption>
				<colgroup>
					<col width="200px" />
					<col width="200px" />
					<col width="*" />
					<col width="80px" />
					<col width="120px" />
					<col width="120px" />
				</colgroup>
				<thead>
					<tr>
						<th>지출예산 분류항목</th>
						<th>지출예산 세부항목</th>
						<th>산출근거</th>
						<th>단위</th>
						<th>기준금액</th>
						<th>금액</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table" id = "table_sis">
				<colgroup>
					<col width="200px" />
					<col width="200px" />
					<col width="*" />
					<col width="80px" />
					<col width="120px" />
					<col width="120px" />
				</colgroup>
				<tbody>
					<c:set var="sumAmount" value="0" />
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<c:set var="fStyle" value="" />
						<c:choose>
							<c:when test="${list.classItemCode eq '1160' and not empty list.moneyIdnNo}">
								<c:set var="fStyle" value="color:blue" />
							</c:when>
							<c:when test="${list.classItemCode eq '1040' and not empty list.moneyIdnNo}">
								<c:set var="fStyle" value="color:green" />
							</c:when>
						</c:choose>
						<tr>
							<td class="left" style="${fStyle}" title="${list.classItemName }">${list.classItemName }</td>
							<td class="left" style="${fStyle}" title="${list.detailItemName }">${list.detailItemName }</td>
							<td class="left" style="${fStyle}" title="${lions:newline(list.inexDesc) }">${list.inexDesc }</td>
							<td class="right" style="${fStyle}">
								<fmt:formatNumber value="${list.unit }" pattern="#,###"/>
							</td>
							<td class="right" style="${fStyle}">
								<fmt:formatNumber value="${list.atandAmount }" pattern="#,###"/>
							</td>
							<td class="right" style="${fStyle}">
								<fmt:formatNumber value="${list.amount }" pattern="#,###"/>
							</td>
							<input type="hidden" name="idn" value="${list.idnNo }" />  
							<input type="hidden" name="classItemCode" value="${list.classItemCode }" />  
							<input type="hidden" name="detailItemCode" value="${list.detailItemCode }" />  
							<input type="hidden" name="moneyIdnNo" value="${list.moneyIdnNo }" />
						</tr>	
						<c:set var="sumAmount" value="${sumAmount + list.amount }" />
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1" summary="지출예산 산출근거 총계">
				<caption>지출예산 산출근거 총계</caption>
				<colgroup>
					<col width="200px" />
					<col width="200px" />
					<col width="*" />
					<col width="80px" />
					<col width="120px" />
					<col width="120px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="5">총계</th>
						<th class="right"><fmt:formatNumber><c:out value="${sumAmount}" /></fmt:formatNumber></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->		
	</div><!-- table -->
</form:form>