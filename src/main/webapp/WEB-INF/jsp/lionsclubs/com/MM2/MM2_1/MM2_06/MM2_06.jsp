<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM2_06VO.sessionYear}"	// 고정값
		});
	
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM2_06VO.organCode}"
		});
		 
		//글로벌 idnNo
		var _idnNo = null;
		
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $("#table_sis tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			var idnno = $(this).find("input:hidden[name=idn]").eq(0).val();
			
			_idnNo = idnno;// $(this).find("#idnNo").val();
		});
		
		//조회 버튼선택
		$("#searchBtn").on("click", function(){
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
			
		
		 	//사용자 클럽코드 세팅
		  if($("#organCode option:selected").prev().val() == undefined){
			  $("#prev img").hide();
			  $("#prev_h").show();
		  } else {
			  $("#prev img").show();
			  $("#prev_h").hide();
		  }
		  
		  if($("#organCode option:selected").next().val() == undefined){
			  $("#next img").hide();
			  $("#next_h").show();
		  } else {
			  $("#next img").show();
			  $("#next_h").hide();
		  }	  
		
		  //전체조회 기본체크 처리
		  if($("input:checkbox[name=s2]").is(":checked")==false && $("input:checkbox[name=s3]").is(":checked")==false) {
			  $("input:checkbox[name=s1]").attr("checked", true);  
		  }
	});
});

//링크페이지
function linkPage2(pageNum){
	$("#form_list").submit();
}

function goPrevClub(clubCode){
	var prevVal = $("#organCode option:selected").prev().val();
	//alert($("#s1").val()+'::'+$("input:checkbox[name=s1]").val());
	$("#organCode").val(prevVal);
	$("#form_list").submit();
}
function goNextClub(clubCode){
	var nextVal = $("#organCode option:selected").next().val();
	$("#organCode").val(nextVal);
	$("#form_list").submit();
}

function fn_checkOrder(index) {
	//alert(index+'::'+$("input:checkbox[name=s2]").val()+'::'+$("input:checkbox[name=s2]").is(":checked"));
	if(index == 's1' && $("input:checkbox[name=s1]").is(":checked")){
		$("input:checkbox[name=s2]").attr("checked", false);
		$("input:checkbox[name=s3]").attr("checked", false);

	}else if(index == 's2' && $("input:checkbox[name=s2]").is(":checked")){
		$("input:checkbox[name=s1]").attr("checked", false);
		$("input:checkbox[name=s3]").attr("checked", false);

	}else if(index == 's3' && $("input:checkbox[name=s3]").is(":checked")){
		$("input:checkbox[name=s1]").attr("checked", false);
		$("input:checkbox[name=s2]").attr("checked", false);
	}
}
//-->
</script>

<form:form id="form_list" modelAttribute="MM2_06VO">
	<input type="hidden" id="memberNo" value="${result.memberNo }" />
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="클럽경조사 조회">
			<caption>클럽경조사 조회</caption>
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
					<th>클럽코드</th>
					<td colspan="3">
						<div class="fL"><form:select path="organCode"/></div>
					</td>
					<th rowspan="2">조회구분</th>
					<td rowspan="2" class="LH">
						
						<form:checkbox path="s1" value="1" onclick="javascript:fn_checkOrder('s1')" label="성명순" cssClass="ml10" />
						<form:checkbox path="s2" value="1" onclick="javascript:fn_checkOrder('s2')" label="발생일자순" cssClass="ml10" />
						<form:checkbox path="s3" value="1" onclick="javascript:fn_checkOrder('s3')" label="경조사유별" cssClass="ml10" />
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
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="searchBtn" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" alt="조회" class="pointer authorization read" />
		</div>
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="클럽경조사 조회 안내표">
				<caption>클럽경조사 조회</caption>
				<colgroup>
					<col width="80px" />
					<col width="100px" />
					<col width="140px" />
					<col width="*" />
					<col width="120px" />
					<col width="120px" />
				</colgroup>
				<thead>
					<tr>
						<th>성 명</th>
						<th>발생일자</th>
						<th>경조사유</th>
						<th>방문지역</th> 
						<th>클럽부담</th>
						<th>퇴회</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="80px" />
					<col width="100px" />
					<col width="140px" />
					<col width="*" />
					<col width="120px" />
					<col width="120px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td class="center">${list.targetMemberName }</td>
							<td class="center">
								<fmt:parseDate var="genDate" value="${list.genDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left">${list.detailItemName }</td>
							<td class="left">${list.reference }</td>
							<td class="right">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.clubImpost }" />
							</td>
							<td class="left">
								<fmt:parseDate var="outDate" value="${list.outDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${outDate }" pattern="yyyy.MM.dd" />
							</td>
						</tr>	
					</c:forEach>	
				</tbody>
			</table>
		</div>
		
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1" summary="클럽경조사 조회 안내표">
				<caption>클럽경조사 조회</caption>
				<colgroup>
					<col width="80px" />
					<col width="100px" />
					<col width="140px" />
					<col width="*" />
					<col width="120px" />
					<col width="120px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="4">선택항목 누계</th>
						<th class="right">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${paymentSum.clubSum }" />
						</th>
						<th></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->		
	</div>
</form:form>