package lionsclubs.com.MM2.MM2_1.MM2_01;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_01VO extends ComDefaultVO implements Serializable{

	private static final long serialVersionUID = 1L;
	private String idnNo;       //번호
	private String organCode;//조직 코드
	private String sisterhoodDate;
	private String memberNo;
	private String memberName;
	
	private String allianceKind;
	private String locationArea;
	private String event;
	private String score;
	private String insertDate;
	private String insertName;
	private String updateDate;
	private String updateName;
	
	private String allinceCode;
	private String rnum;
	private String termYear;
	private String order = "1";	
	private String orderSisterhoodDate;
	private String firstAward;		/*첫번째 대표수상*/
	private String secodeAward;		/*두번째 대표수상*/
	private String startCnt;		/*회기시작시 인원*/
	private String endCnt;		/*회기종료시 인원*/
	private String subCnt;	/*회기낸 증감인원*/
	private String area;		 /* 지역번호 */
	private String zone;	 /* 지대번호 */
	private String tel; /* 전화 */
	private String hp; /* HP번호 */
	private String fax; /* 팩스 */
	private String email; /* 이메일 */
	private String slogan; /* 회장슬로건 */
	private String sloganEn; /* 회장슬로건(영문) */
	private String executiveMeet; /* 이사회 */
	private String monthlyMeet; /* 월례회 */
	private String mainAction1; /* 주요활동1 */
	private String mainAction2; /* mainAction2 */
	private String mainAction3; /* mainAction3 */
	private String mainAction4; /* mainAction4 */
	private String mainAction5; /* mainAction5 */
	private String targetMember;	/* 목표회원수 */
	private String sessionYear; /* 회기년 */
	private String guidingOrgan; /* 가이딩한 클럽코드*/
	private String guidingOrganName; /* 가이딩한 클럽명*/
	private String guidingOrganMeeting; /* 가이딩한 클럽의 조직총회 */
	private String changeDate; /* 가이딩한 클럽의 창설일 */
	private String registOrgan; /*가이딩한 클럽의 창설일 당시 가이딩 회원의 소속클럽 */
	private String guidingMember; /* 가이딩 회원번호 */
	private String guidingMemberName; /* 가이딩 회원성명 */
	private String organOfficerMemberNo; /* 조직책임자 회원번호 */

	/* 클럽조직 구성 */
	private String clubTitleName;	/* 클럽직책명 */
	private String districtTitleName;	/* 지구직책명 */
	private String quitDate;	/* 퇴회일자 */
	
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getSisterhoodDate() {
		return sisterhoodDate;
	}
	public void setSisterhoodDate(String sisterhoodDate) {
		this.sisterhoodDate = sisterhoodDate;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getAllianceKind() {
		return allianceKind;
	}
	public void setAllianceKind(String allianceKind) {
		this.allianceKind = allianceKind;
	}
	public String getLocationArea() {
		return locationArea;
	}
	public void setLocationArea(String locationArea) {
		this.locationArea = locationArea;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getInsertName() {
		return insertName;
	}
	public void setInsertName(String insertName) {
		this.insertName = insertName;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateName() {
		return updateName;
	}
	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}
	public String getAllinceCode() {
		return allinceCode;
	}
	public void setAllinceCode(String allinceCode) {
		this.allinceCode = allinceCode;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getTermYear() {
		return termYear;
	}
	public void setTermYear(String termYear) {
		this.termYear = termYear;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getOrderSisterhoodDate() {
		return orderSisterhoodDate;
	}
	public void setOrderSisterhoodDate(String orderSisterhoodDate) {
		this.orderSisterhoodDate = orderSisterhoodDate;
	}
	public String getFirstAward() {
		return firstAward;
	}
	public void setFirstAward(String firstAward) {
		this.firstAward = firstAward;
	}
	public String getSecodeAward() {
		return secodeAward;
	}
	public void setSecodeAward(String secodeAward) {
		this.secodeAward = secodeAward;
	}
	public String getStartCnt() {
		return startCnt;
	}
	public void setStartCnt(String startCnt) {
		this.startCnt = startCnt;
	}
	public String getEndCnt() {
		return endCnt;
	}
	public void setEndCnt(String endCnt) {
		this.endCnt = endCnt;
	}
	public String getSubCnt() {
		return subCnt;
	}
	public void setSubCnt(String subCnt) {
		this.subCnt = subCnt;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSlogan() {
		return slogan;
	}
	public void setSlogan(String slogan) {
		this.slogan = slogan;
	}
	public String getSloganEn() {
		return sloganEn;
	}
	public void setSloganEn(String sloganEn) {
		this.sloganEn = sloganEn;
	}
	public String getExecutiveMeet() {
		return executiveMeet;
	}
	public void setExecutiveMeet(String executiveMeet) {
		this.executiveMeet = executiveMeet;
	}
	public String getMonthlyMeet() {
		return monthlyMeet;
	}
	public void setMonthlyMeet(String monthlyMeet) {
		this.monthlyMeet = monthlyMeet;
	}
	public String getMainAction1() {
		return mainAction1;
	}
	public void setMainAction1(String mainAction1) {
		this.mainAction1 = mainAction1;
	}
	public String getMainAction2() {
		return mainAction2;
	}
	public void setMainAction2(String mainAction2) {
		this.mainAction2 = mainAction2;
	}
	public String getMainAction3() {
		return mainAction3;
	}
	public void setMainAction3(String mainAction3) {
		this.mainAction3 = mainAction3;
	}
	public String getMainAction4() {
		return mainAction4;
	}
	public void setMainAction4(String mainAction4) {
		this.mainAction4 = mainAction4;
	}
	public String getMainAction5() {
		return mainAction5;
	}
	public void setMainAction5(String mainAction5) {
		this.mainAction5 = mainAction5;
	}
	public String getTargetMember() {
		return targetMember;
	}
	public void setTargetMember(String targetMember) {
		this.targetMember = targetMember;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getGuidingOrgan() {
		return guidingOrgan;
	}
	public void setGuidingOrgan(String guidingOrgan) {
		this.guidingOrgan = guidingOrgan;
	}
	public String getGuidingOrganName() {
		return guidingOrganName;
	}
	public void setGuidingOrganName(String guidingOrganName) {
		this.guidingOrganName = guidingOrganName;
	}
	public String getGuidingOrganMeeting() {
		return guidingOrganMeeting;
	}
	public void setGuidingOrganMeeting(String guidingOrganMeeting) {
		this.guidingOrganMeeting = guidingOrganMeeting;
	}
	public String getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(String changeDate) {
		this.changeDate = changeDate;
	}
	public String getRegistOrgan() {
		return registOrgan;
	}
	public void setRegistOrgan(String registOrgan) {
		this.registOrgan = registOrgan;
	}
	public String getGuidingMember() {
		return guidingMember;
	}
	public void setGuidingMember(String guidingMember) {
		this.guidingMember = guidingMember;
	}
	public String getGuidingMemberName() {
		return guidingMemberName;
	}
	public void setGuidingMemberName(String guidingMemberName) {
		this.guidingMemberName = guidingMemberName;
	}
	public String getOrganOfficerMemberNo() {
		return organOfficerMemberNo;
	}
	public void setOrganOfficerMemberNo(String organOfficerMemberNo) {
		this.organOfficerMemberNo = organOfficerMemberNo;
	}
	public String getClubTitleName() {
		return clubTitleName;
	}
	public void setClubTitleName(String clubTitleName) {
		this.clubTitleName = clubTitleName;
	}
	public String getDistrictTitleName() {
		return districtTitleName;
	}
	public void setDistrictTitleName(String districtTitleName) {
		this.districtTitleName = districtTitleName;
	}
	public String getQuitDate() {
		return quitDate;
	}
	public void setQuitDate(String quitDate) {
		this.quitDate = quitDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
