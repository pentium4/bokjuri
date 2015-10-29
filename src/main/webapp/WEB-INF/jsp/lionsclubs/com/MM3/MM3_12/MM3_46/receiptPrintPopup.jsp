<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
var contentBody  = "";
function noPrint(){ 
    contentBody = document.body.innerHTML; 
    document.body.innerHTML = printArea.innerHTML; 
}

function viewPrint(){ 
    document.body.innerHTML = contentBody; 
}

function lionsPrint() { 
    window.print(); 
}

window.onbeforeprint = noPrint; 
window.onafterprint = viewPrint; 	
</script>
<form:form id="form" modelAttribute="MM7_01VO">
	<h3 class="h3"><div>프린트 미리보기</div></h3>
	<div class="printBtnBox">
		<img id="btnPrint" src="/images/lionsclubs/btn/btn_print.gif" alt="인쇄" style="cursor: pointer;" onclick="lionsPrint();" />
	</div>
			
	<div id="printArea" style="height: 520px; overflow: auto; border: 1px #aaa solid;">
		<table width="670" border="0">
			<tr>
				<td>
					<table width="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#000000" bgcolor="#000000">
						<tbody>
							<tr>
								<td bgcolor="#FFFFFF">
									<table width="100%"  border="0" cellpadding="0" cellspacing="1">
										<colgroup>
											<col width="186px" />
											<col width="336px" />
											<col width="*" />
										</colgroup>
										<tdoby>
											<tr>
												<td height="58" colspan="3"><div align="center" style="font-size: 36px; font-weight: bold;">영 수 증 </div></td>
											</tr>
											<tr>
												<td height="47"><div align="center"><u><span style="font-size: 16px; font-weight: bold;">NO.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></u></div></td>
												<td colspan="2" valign="bottom" style="font-size: 24px;"><span style="margin-left: 20px;" />${fn:replace(fn:substring(result.clubCode, 3, 4), '0', '') }${fn:substring(result.clubCode, 4, 6) }. ${result.clubName }<span style="margin-left: 10px;" /> 귀하 </td>
											</tr>
											<tr>
												<td height="34">&nbsp;</td>
												<td valign="top"><hr></td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td height="34">
													<div align="center" style="font-size: 18px;">
														<div align="right">일금 :</div>
													</div>
												</td>
												<td colspan="2">
													<span style="font-size: 18px; font-weight: bold; margin-left: 20px;">
														<fmt:formatNumber var="payment" value="${result.payment }" pattern="####"/>
														${lions:convertHangul(payment) } 원 정 (<fmt:formatNumber value="${result.payment }" pattern="￦ #,###"/>)
													</span>
												</td>
											</tr>
											<tr>
												<td height="38">
													<div align="center" style="font-size: 18px;">
														<div align="right">내역 :</div>
													</div>
												</td>
												<td colspan="2">
													<span style="font-size: 18px; font-weight: bold; margin-left: 20px;">
														${result.detailItemName }
														<c:if test="${not empty result.paymentDollar }">
															(<fmt:formatNumber value="${result.paymentDollar }" pattern="$ #,###.##"/>)
														</c:if>
													</span>
												</td>
											</tr>
											<tr>
												<td height="34">&nbsp;</td>
												<td colspan="2">&nbsp;</td>
											</tr>
											<tr>
												<td height="34"><div align="center"></div></td>
												<td style="font-size: 18px;"><div align="center">상기 금액을 정히 영수하였습니다. </div></td>
												<td style="font-size: 18px;">&nbsp;</td>
											</tr>
											<tr>
												<td rowspan="5" align="left" valign="bottom">
													<div align="center"></div>
													<div align="center">
														<table width="100"  border="2" align="left" cellpadding="0" cellspacing="0" bordercolor="#000000" bgcolor="#000000">
															<tr>
																<td height="30" bgcolor="#FFFFFF"><div align="center"><strong>취급자인</strong></div></td>
															</tr>
															<tr>
																<td height="90" bgcolor="#FFFFFF" style="text-align: center;">
																	<img src="/images/lionsclubs/sign/sign3.gif" width="80" />
																</td>
															</tr>
														</table>
													</div>
												</td>
												<td height="36" style="font-size: 18px;">
													<div align="center">
														<fmt:parseDate var="paymentDate" value="${result.paymentDate }" pattern="yyyyMMdd" />
														<fmt:formatDate value="${paymentDate }" pattern="yyyy년 MM월 dd일" />
													</div>
												</td>
												<td height="36" style="font-size: 18px;">&nbsp;</td>
											</tr>
											<tr>
												<td colspan="2">&nbsp;</td>
											</tr>
											<tr>
												<td height="34" colspan="2"><span style="font-size: 24px; font-weight: bold;">${treasurer.districtName }</span></td>
											</tr>
											<tr>
												<td height="40">
													<span style="font-size: 18px; font-weight: bold;">재무총장 ${treasurer.name }</span>
												</td>
												<td><img src="/images/lionsclubs/sign/sign1.jpg" width="100" /></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
										</tdoby>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
	</div><!-- popup_bg -->
	
	<!-- Modal Popup -->  
	<div class="printPopupBtn">
		<a href="#" onclick="window.close()"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
</form:form>
