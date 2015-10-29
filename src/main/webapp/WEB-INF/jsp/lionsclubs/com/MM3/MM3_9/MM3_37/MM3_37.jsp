<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#eventDate").datepicker();
		
		//기관 클럽코드 세팅
		$("#districtCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal: "${MM3_37VO.districtCode}"
		},function(){
			$("#districtCode").on("change", function(){
				$("#eventCode").option2Code({
				     groupCode: '3600' // 그룹코드
				    ,code: $(this).val().substring(0, 3) + "000" // 코드
				    ,topLabel: "---선택---"
				    ,code1: "A,B"
				    ,fixVal: "${MM3_37VO.eventCode}" // 고정값
				});
			}).change();
		});
		
		var paramCount = 1;
		$("#districtCode, #eventDate, #eventCode").on("change", function(){
			$.saveOrganCode({
				 lvl: 3
				,organCode: $("#districtCode").val()
			});
			
			progressBar.start();
			var districtCode = "${param.districtCode}";
			var eventCode = "${param.eventCode}";
			var eventDate = "${param.eventDate}";
			var params;
			if(!districtCode.isEmpty()
					&& !eventCode.isEmpty()
					&& !eventDate.isEmpty()
					&& paramCount == 1){
				params = [];
				params.push({name: "districtCode", value: districtCode});
				params.push({name: "eventCode", value: eventCode});
				params.push({name: "eventDate", value: eventDate});
				
				paramCount = 2;
			} else  {
				params = $("form").serializeArray();
			}
			
			var $table = $(".tblType2 tbody");
			
			$.ajax({
				type: "POST",
	// 			async: false,			
				url:  '<c:url value="/MM3/MM3_9/MM3_37/listMerit.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						var objectBasicMerit = data.objectBasicMerit;
						
						if(objectBasicMerit != null){
							var eventDate = Date.parseExact(objectBasicMerit.eventDate, 'yyyyMMdd').toString("yyyy.MM.dd");
							
							$("#eventDate").val(eventDate);
							$("#eventPlace").val(objectBasicMerit.eventPlace);
							$("#eventDesc").val(objectBasicMerit.eventDesc);
						} else {
							$("#eventPlace").val("");
							$("#eventDesc").val("");
						}
						
						var total = data.resultList.length;
						var html = "";
						
						if(total > 0){
							$table.empty();
							$.each(data.resultList, function(index, object){
								html += "<tr data-clubcode='" + object.clubCode + "'>";
								html += "	<td class='center'>" + eval(index + 1) + "</td>";
								html += "	<td>" + object.clubName + "</td>";
								html += "	<td class='center'>" + object.clubPresidentName + "</td>";
								html += "	<td><input type='text' class='subjectiveScore input' value='" + object.subjectiveScore + "' size='13' /></td>";
								html += "	<td><input type='text' class='joinScore input' value='" + object.joinScore + "' size='13' /></td>";
								html += "	<td><input type='text' class='serviceScore input' value='" + object.serviceScore + "' size='13' /></td>";
								html += "	<td class='right totalScore'>" + comma(object.totalScore) + "</td>";
								html += "</tr>";
								
								if(index == total - 1){
									$table.append(html);
	
									Scroll_Actrion();
									Scroll_Table1();
									
									$(".subjectiveScore").maskMoney({precision:0}).numericOnly();
									$(".joinScore").maskMoney({precision:0}).numericOnly();
									$(".serviceScore").maskMoney({precision:0}).numericOnly();
	
									$(".subjectiveScore, .joinScore, .serviceScore").on("keyup", function(){
										var tr = $(this).closest("tr");
										var subjectiveScore = eval(tr.find(".subjectiveScore").val().isEmpty() ? 0 : tr.find(".subjectiveScore").val().replaceAll(",", ""));
										var joinScore = eval(tr.find(".joinScore").val().isEmpty() ? 0 : tr.find(".joinScore").val().replaceAll(",", ""));
										var serviceScore = eval(tr.find(".serviceScore").val().isEmpty() ? 0 : tr.find(".serviceScore").val().replaceAll(",", ""));
										tr.find(".totalScore").text(comma(subjectiveScore + joinScore + serviceScore));
									});
									
									progressBar.stop();
								}
							});						
						} else {
							progressBar.stop();
						}
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
	// 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});			
		});
		
		$("#btnSearch").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 3
				,organCode: $("#districtCode").val()
			});
			
			_search();
		});
		
		$("#btnSave").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			var params = $("form").serializeArray();
			
			$(".tblType2 tbody tr").each(function(index){
				var $this = $(this);
				var data = $this.data();
				
				params.push({name: "meritArray[" + index + "].districtCode", value: $("#districtCode").val()});
				params.push({name: "meritArray[" + index + "].eventCode", value: $("#eventCode").val()});
				params.push({name: "meritArray[" + index + "].eventDate", value: $("#eventDate").val()});
				params.push({name: "meritArray[" + index + "].clubCode", value: data.clubcode});
				params.push({name: "meritArray[" + index + "].subjectiveScore", value: $this.find(".subjectiveScore").val()});
				params.push({name: "meritArray[" + index + "].joinScore", value: $this.find(".joinScore").val()});
				params.push({name: "meritArray[" + index + "].serviceScore", value: $this.find(".serviceScore").val()});
			});
			
			$.ajax({
				type: "POST",
				async: false,			
				url:  '<c:url value="/MM3/MM3_9/MM3_37/saveMerit.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						alert("공적점수가 저장되었습니다.");
					} else {
						alert(data.result);	
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
	// 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});		
		});	
	});
});

function _search(){
	$("form").submit(); 
}
</script>
<form:form modelAttribute="MM3_37VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="400px" />
				<col width="100px" />
				<col width="130px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구선택<span class="require">*</span></th>
					<td><form:select path="districtCode" cssClass="select required" caption="지구선택" /></td>
					<th>행사일자<span class="require">*</span></th>
					<td><input type="text" id="eventDate" name="eventDate" class="input required date" caption="행사일자" /></td>
					<th>행사장소</th>
					<td><input type="text" id="eventPlace" name="eventPlace" class="input" style="width: 96%" /></td>
				</tr>
				<tr>
					<th>행사명<span class="require">*</span></th>
					<td><form:select path="eventCode" cssClass="select required" caption="행사명" /></td>
					<th>행사내용</th>
					<td colspan="3"><input type="text" id="eventDesc" name="eventDesc" class="input" style="width: 96%" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->

	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="btnSave" alt="저장" src="/images/lionsclubs/btn/btn_save.gif" style="margin-top:2px" class="pointer authorization write" />
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>클럽명</th>
						<th>회장명</th>
						<th>주관점수</th>
						<th>참가점수</th>
						<th>봉사금점수</th>
						<th>점수계</th>
					</tr>
				</thead>
			</table>
		</div>
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table">
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
				</colgroup>
				<tbody>
<%-- 					<c:forEach items="${resultList }" var="list" varStatus="status"> --%>
<%-- 						<tr data-clubcode="${list.clubCode }"> --%>
<%-- 							<td class="center">${status.count }</td> --%>
<%-- 							<td>${list.clubName }</td> --%>
<%-- 							<td class="center">${list.clubPresidentName }</td> --%>
<%-- 							<td><input type="text" class="subjectiveScore input" value="${list.subjectiveScore }" size="13" /></td> --%>
<%-- 							<td><input type="text" class="joinScore input" value="${list.joinScore }" size="13" /></td> --%>
<%-- 							<td><input type="text" class="serviceScore input" value="${list.serviceScore }" size="13" /></td> --%>
<!-- 							<td></td> -->
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
				</tbody>
			</table>
		</div>		
	</div><!-- table -->

</form:form>