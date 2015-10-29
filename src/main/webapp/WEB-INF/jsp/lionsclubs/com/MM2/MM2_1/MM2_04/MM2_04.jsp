<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM2_04VO.sessionYear}"	// 고정값
		});
	
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM2_04VO.organCode}"
		});
		
		//글로벌 idnNo
		var _idnNo = null;
		
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $("#table_sis tbody tr");
		tbl.bind("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			var idnno = $(this).find("input:hidden[name=idn]").eq(0).val();
			
			_idnNo = idnno;// $(this).find("#idnNo").val();
			//alert(_idnNo);
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
	});
});

//링크페이지
function linkPage2(pageNum){
	//("#pageIndex").val(pageNum);
	//alert(pageNum);
	$("#form_list").submit();
}

function fn_checkOrder(index) {
	//alert(index+'::'+$("input:checkbox[name=s2]").val()+'::'+$("input:checkbox[name=s2]").is(":checked"));
	if(index == 's1' && $("input:checkbox[name=s1]").is(":checked")){
		$("input:checkbox[name=s4]").attr("checked", false);
		$("input:checkbox[name=s5]").attr("checked", false);

	}else if(index == 's4' && $("input:checkbox[name=s4]").is(":checked")){
		$("input:checkbox[name=s1]").attr("checked", false);
		$("input:checkbox[name=s5]").attr("checked", false);

	}else if(index == 's5' && $("input:checkbox[name=s5]").is(":checked")){
		$("input:checkbox[name=s1]").attr("checked", false);
		$("input:checkbox[name=s4]").attr("checked", false);
	}
}


//-->
</script>

<form:form id="form_list" modelAttribute="MM2_04VO">
	<input type="hidden" id="memberNo" value="${result.memberNo }" />
	
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="경력(교육/상벌)">
			<caption>경력(교육/상벌)</caption>
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
						<div class="fL">
							<form:select path="organCode" cssClass="select" />
						</div>
					</td>
					<th>조회순서</th>
					<td>
						<form:checkbox path="s1" value="1" onclick="javascript:fn_checkOrder('s1')" label="성명" cssClass="ml10" />
						<form:checkbox path="s5" value="1" onclick="javascript:fn_checkOrder('s5')" label="발생일자순" cssClass="ml10"  />
						<form:checkbox path="s4" value="1" onclick="javascript:fn_checkOrder('s4')" label="구분순" cssClass="ml10"  />
					</td>
				</tr>
				
				<tr>
					<th>회기선택</th>
					<td colspan="3">
						<form:select path="sessionYear" cssClass="select" />
					</td>
					<th>조회구분</th>
					<td>
						<form:checkbox path="s3" value="1" onclick="javascript:fn_checkOrder('s3')" label="퇴회자제외" cssClass="ml10" />
						<span style="margin-left:6px;"/><lions:codeselect path="kindCodeCondition" groupCode="3110" topLabel="-- 전체 --" cssClass="ml10" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4> 
			<lions:menutitle menuId="${param.menuId }" kind="subtitle" />
			<em style="position:absolute;top:1px;">
				<table class="tblCal2">
					<tbody>
						<tr>
							<td>*파란색은 퇴회자*
							</td>
						</tr>
					</tbody>
				</table>
			</em>
		</h4>
	
		<div class="btnBox">
			<img id="searchBtn" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" alt="조회" class="pointer authorization read" />
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="경력(교육/상벌)">
				<caption>경력(교육/상벌)</caption>
				<colgroup>
					<col width="100px" />
					<col width="80px" />
					<col width="200px" />
					<col width="80px" />
					<col width="100px" />
					<col width="160px" />
					<col width="*" />
				</colgroup>
				<tr>
					<th>회원번호</th>
					<th>성명</th>
					<th>기간</th>
					<th>교육주관</th>
					<th>구분</th>
					<th>교육 및 상벌항목</th>
					<th>교육 및 상벌내용</th>
				</tr>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="100px" />
					<col width="80px" />
					<col width="200px" />
					<col width="80px" />
					<col width="100px" />
					<col width="160px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td class="center">${list.memberNo }</td>
							<td class="center">
								<c:choose>
									<c:when test="${list.isOutMember eq 'Y' }">
										<strong class="Blue">
											${list.memberName }
										</strong>
									</c:when>
									<c:otherwise>
										${list.memberName }
									</c:otherwise>
								</c:choose>
							</td>
							<td class="center">
								<fmt:parseDate var="startDate" value="${list.sanctionStartDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${startDate }" pattern="yyyy.MM.dd" />
								~
								<fmt:parseDate var="endDate" value="${list.sanctionEndDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${endDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left" title="${list.educationName }">${list.educationName }</td>
							<td class="center" title="${list.kindName }">${list.kindName }</td>
							<td class="left" title="${list.itemName }">${list.itemName }</td>
							<td class="left" title="${list.desc }">${list.desc }</td>
							<input type="hidden" name="idn" value="${list.idnNo }" />  
							<input type="hidden" name="ecode" value="${list.educationCode }" />
							<input type="hidden" name="kcode" value="${list.kindCode }" />
							<input type="hidden" name="icode" value="${list.itemCode }" />
						</tr>	
					</c:forEach>	
				</tbody>
			</table>
		</div>
		<!-- //Contents_Table_area -->
	</div>
</form:form>