<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM2_05VO.sessionYear}"	// 고정값
		});
	
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM2_05VO.organCode}"
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
			_search();
		});
		
		var tbl = $("#table_sis tbody tr");
		tbl.bind("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			$(this).find(".idnNo").prop("checked", true);
		});	
		
		$(".idnNo:checked").closest("tr").trigger("click");
		
		// 업데이트 버튼선택
		$("#update").on("click", function(){
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(idnNo.isEmpty()){
				alert("클럽포상을 선택해 주세요.");
				return false;
			}
			
			var url = "/MM2/MM2_1/MM2_05/MM2_05_Popup.do?idnNo=" + idnNo;
			openPopup(url, '500', '260', 'MM2_05_Popup');
		});
		
		// 입력 버튼 선택
		$("#insert").on("click", function(){
			var url = "/MM2/MM2_1/MM2_05/MM2_05_Popup.do?organCode=${MM2_05VO.organCode}";
			openPopup(url, '500', '260', 'MM2_05_Popup');
		});
		
		// 삭제 버튼 선택
		$("#hdel").bind("click", function(){
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(idnNo.isEmpty()){
				alert("클럽포상을 선택해 주세요.");
				return false;
			}
			
			if(!confirm("클럽포상건을 삭제 하시겠습니까?")){
				return false;
			}
			
			var params = [];
			params.push({name: "idnNo", value: idnNo});
			
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/MM2/MM2_1/MM2_05/awardDelete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
	// 					alert('정상적으로 삭제 되었습니다.');
						_search();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
});

//링크페이지
function _search(){
	$("#form_list").submit();
}

function fn_checkOrder(index) {
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

<form:form id="form_list" modelAttribute="MM2_05VO">
	<form:hidden path="memberNo"/>
	
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="클럽포상 입력/조회표">
			<caption>클럽포상 입력/조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="36%" />
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
					<form:checkbox path="s1" value="1" onclick="fn_checkOrder('s1')" label="포상일자" cssClass="ml10" />
					<form:checkbox path="s2" value="1" onclick="fn_checkOrder('s2')" label="포상종류" cssClass="ml10" />
					<form:checkbox path="s3" value="1" onclick="fn_checkOrder('s3')" label="포상수여자" cssClass="ml10" />
				</td>
			</tr>
			<tr>
				<th>회기선택</th>
				<td colspan="3">
					<form:select path="sessionYear" cssClass="select" />
				</td>
			</tr>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="search" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" alt="조회" class="pointer authorization read" />
			<img id="insert" src="/images/lionsclubs/btn/btn_input.gif" style="margin-top:2px" onclick="return false;" alt="입력" class="pointer authorization write" />
			<img id="update" src="/images/lionsclubs/btn/btn_edit.gif" style="margin-top:2px" onclick="return false;" alt="수정" class="pointer authorization write" />
			<img id="hdel" src="/images/lionsclubs/btn/btn_del.gif" style="margin-top:2px" onclick="return false;" alt="삭제" class="pointer authorization write" />
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="클럽포상 입력 및 조회 안내표">
				<caption>클럽포상 입력/조회</caption>
				<colgroup>
					<col width="120px" />
					<col width="150px" />
					<col width="200px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>포상일자</th>
						<th>포상구분</th>
						<th>포상종류</th>
						<th>포상수여자</th>
						<th>포상내용</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table" id = "table_sis">
				<colgroup>
					<col width="120px" />
					<col width="150px" />
					<col width="200px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td class="center">
								<form:radiobutton path="idnNo" cssClass="idnNo" value="${list.idnNo }" cssStyle="display: none;" />
								<fmt:parseDate var="awardDate" value="${list.awardDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${awardDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left" title="${list.kindName }">${list.kindName }</td>
							<td class="left" title="${list.awardKindName }">${list.awardKindName }</td>
							<td class="left" title="${list.awardGrantorName }">${list.awardGrantorName }</td>
							<td class="left" title="${list.awardDesc }">${list.awardDesc }</td>
						</tr>	
					</c:forEach>	
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
</form:form>