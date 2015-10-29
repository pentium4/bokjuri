<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>국제라이온스협의 업무통합관리시스템</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(0,0,0)">
	
	<h2 class="blind">스킵네비게이션</h2>
	<jsp:include page="../include/top_skipnavi.jsp" />
	
	<h2 class="blind">탑메뉴</h2>
	<jsp:include page="../include/top_menu1.jsp" />
	
	<!-- Wrap_Area -->
	<div id="Wrap">
		<!-- LNB_Area -->
		<jsp:include page="../include/submenu011.jsp" />
		<!-- //LNB_Area -->
		
		<!-- Contents_Table_area -->
		<div id="Contetns_Area">
			<div id="position">
			<h2 class="blind">메뉴 경로</h2>
			<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>개인 기본사항</span></p>
			</div>
			
			<h3><div>개인기본사항 </div></h3>
			<div class="table">
			<table class="tblType1" summary="개인 기본사항 안내표">
			<caption>개인 기본사항</caption>
			<colgroup>
				<col width="92px" />
				<col width="90px" />
				<col width="32%" />
				<col width="90px" />
				<col width="*" />
				<col width="92px" />
			</colgroup>
			<tbody>
			<tr>
				<td rowspan="5" class="Profile_img"><img src="http://lunagravity.dothome.co.kr/lions/images/default/p1376.jpg" alt="본인 사진" /></td>
				<th>회원번호</th>
				<td><div class="fL">12345678</div>
					<div class="fR mr20">
						<a href="/" title="이전 페이지" ><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a>
						<a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a>
					</div>
				</td>
				<th>구&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;분</th>
				<td>
					<div class="fL">평생회원</div>
					<div class="fR">
						<a href="../include/mm1_profile.html" onclick="window.open(this.href,'popup','width=700,height=300'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px;vertical-align:top !important;margin-top:2px;" /></a>
						<a href="../include/mm1_profile2.html" onclick="window.open(this.href,'popup','width=700,height=300'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px;vertical-align:top !important;margin-top:2px;" /></a>
					</div>
				</td>
				<td rowspan="5" class="Profile_img"><img src="http://lunagravity.dothome.co.kr/lions/images/default/p940.jpg" alt="배우자 사진" /></td>
			</tr>
			<tr>
				<th>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</th>
				<td>
					<div class="fL">
						<a href="../include/mm1_1popup2.html" onclick="window.open(this.href,'popup','width=1000,height=400'); return false;" title="새창"><strong>홍길동</strong></a>
					</div>
					<div class="pregident">12대총재</div>
				</td>
				<th>생년월일</th>
				<td><a href="../include/birth_popup.html" onclick="window.open(this.href,'birthday','width=700,height=490'); return false;" title="새창">1960.05.01</a>&nbsp;&nbsp;&nbsp;(40세)</td>
			</tr>
			<tr>
				<th>한자/영문</th>
				<td>洪吉童 / Hong Gil-Dong</td>
				<th>입회일자</th>
				<td>2008.06.03&nbsp;&nbsp;&nbsp;(5년2월)</td>
			</tr>
			<tr>
				<th>소속클럽</th>
				<td>5D0067 울산원클럽</td>
				<th>입회구분</th>
				<td><span class="Blue">2010.08.01&nbsp;&nbsp;&nbsp;(재입회)</span></td>
			</tr>
			<tr>
				<th>클럽/지구</th>
				<td><span class="Green">회원/제1부총재</span></td>
				<th>퇴회일자</th>
				<td><span class="Red">2012.10.13&nbsp;&nbsp;&nbsp;(자퇴)</span></td>
			</tr>
			</tbody>
			</table>
		</div><!-- table -->
			
			<div class="table">
				<h4>회원기본</h4>
				<div class="btnBox">
					<a href="../include/mm1_1popup.html" onclick="window.open(this.href,'popup','width=1000,height=350'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" /></a>
					<input type="image" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" style="width:57px" />
				</div>
				<div class="Height_1">
					<table class="tblType2">
						<colgroup>
							<col width="90px" />
							<col width="*" />
							<col width="90px" />
							<col width="*" />
							<col width="90px" />
							<col width="150px" />
							<col width="90px" />
							<col width="150px" />
						</colgroup>
						<tbody>
							<tr>
								<th>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
								<td colspan="5">울산광역시 남구 삼산동 182-1번지 아데라움아파트 108동 804호</td>
								<th>우편번호</th>
								<td>808-602</td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td>010-333-3333</td>
								<th>직장전화</th>
								<td>052-280-2345</td>
								<th>클럽직책</th>
								<td colspan="3">회원 2012.07.01</td>
							</tr>
							<tr>
								<th>자택전화</th>
								<td>052-280-1234</td>
								<th>팩스번호</th>
								<td>052-280-2345</td>
								<th>분과소속</th>
								<td>회원확장분과</td>
								<th>지구조직</th>
								<td>1지역 1지대</td>
							</tr>
							<tr>
								<th>메일주소</th>
								<td>administrator@naver.com</td>
								<th>HP/Gmail</th>
								<td>admin@gmail.com</td>
								<th>지구직책</th>
								<td colspan="3">제1부총재</td>
							</tr>
							<tr>
								<th>업종분류</th>
								<td colspan="3">음식서비스업</td>
								<th>결혼여부</th>
								<td>기혼</td>
								<th>배우자성명</th>
								<td>황보길순자</td>
							</tr>
							<tr>
								<th>업&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</th>
								<td colspan="3">한식점업</td> 
								<th>본인가족</th>
								<td>2남 1녀</td>
								<th>자　녀</th>
								<td>2남 1녀</td>
							</tr>
							<tr>
								<th>업체직책</th>
								<td>대표이사</td>
								<th>업 체 명</th>
								<td>맛있는한식집</td>
								<td colspan="4" rowspan="7" class="innerTbl">
									<div class="center">추천회원(12명)</div>
									<div class="tblTitle Scroll_Title">
										<table>
											<colgroup>
												<col width="90px" />
												<col width="90px" />
												<col width="100px" />
												<col width="125px" />
												<col width="70px" />
												<col width="40px" />
											</colgroup>
											<tr>
												<th>회원번호</th>
												<th>성명</th>
												<th>입회일자</th>
												<th>입회클럽</th>
												<th>관계</th>
												<th>활동</th>
											</tr>
										</table>
									</div>
									<div class="Inner">
										<table class="Scroll_Table">
											<colgroup>
												<col width="90px" />
												<col width="90px" />
												<col width="100px" />
												<col width="125px" />
												<col width="70px" />
												<col width="40px" />
											</colgroup>
											<tr>
												<td>12345678</td>
												<td>박성일</td>
												<td>2007.09.10</td>
												<td>입회클럽</td>
												<td>지인</td>
												<td>ㅇ</td>
											</tr>
											<tr>
												<td>12345678</td>
												<td>박성일</td>
												<td>2007.09.10</td>
												<td>입회클럽</td>
												<td>지인</td>
												<td>ㅇ</td>
											</tr>
											<tr>
												<td>12345678</td>
												<td>박성일</td>
												<td>2007.09.10</td>
												<td>입회클럽</td>
												<td>지인</td>
												<td>ㅇ</td>
											</tr>
											<tr>
												<td>12345678</td>
												<td>박성일</td>
												<td>2007.09.10</td>
												<td>입회클럽</td>
												<td>지인</td>
												<td>ㅇ</td>
											</tr>
											<tr>
												<td>12345678</td>
												<td>박성일</td>
												<td>2007.09.10</td>
												<td>입회클럽</td>
												<td>지인</td>
												<td>ㅇ</td>
											</tr>
											<tr>
												<td>12345678</td>
												<td>박성일</td>
												<td>2007.09.10</td>
												<td>입회클럽</td>
												<td>지인</td>
												<td>ㅇ</td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
							<tr>
								<th>업체주소</th>
								<td colspan="3">울산광역시 중구 태화동 478-2번지</td>
							</tr>
							<tr>
								<th>최종학력</th>
								<td>대학교</td>
								<th>출신학교</th>
								<td>한국대학교</td>
							</tr>
							<tr>
								<th>전공과목</th>
								<td colspan="3">기계공학</td>
							</tr>
							<tr>
								<th>병력관계</th>
								<td>육군/현역필</td>
								<th>혈액형</th>
								<td>A</td>
							</tr>
							<tr>
							<th>취미활동</th>
							<td>골프</td>
							<th>신장</th>
							<td>165cm</td>
							</tr>
							<tr>
								<th>추천자</th>
								<td>김유신</td>
								<th>관계</th>
								<td>친구</td>
							</tr>
						</tbody>
					</table>
				</div><!-- Height_1 -->
			</div><!-- table -->
			<h5><div>해당자료가 조회되었습니다.</div></h5>
		</div>
		<!-- //Contents_Table_area -->
	</div>
	<!-- Wrap_Area -->
</body>
</html>
