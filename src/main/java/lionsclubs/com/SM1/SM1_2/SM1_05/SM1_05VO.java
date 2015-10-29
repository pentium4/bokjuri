package lionsclubs.com.SM1.SM1_2.SM1_05;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class SM1_05VO extends ComDefaultVO implements Serializable {
	private String idnNo;	/* 번호 */	
	private String organCode;	/* 조직코드 */
	private String koName;	/* 한글명 */
	private String koAbbr;	/* 한글약어 */
	private String koAbbr2;	/* 한글약어(2) */
	private String chinName;	/* 한자명 */
	private String enName;	/* 영문명 */
	private String changeDate;	/* 변경일자 */
	private String changeCode;	/* 변경코드 */
	private String organOfficerMemberNo;	/* 조직책임자 회원번호 */
	private String organOfficerMemberName;	/* 조직책임자명 */
	private String organOfficerMemberModelCode;	/* 조직책임자 호칭 */
	private String officerTitleCode;	/* 책임자호칭 코드 */
	private String officerSolidCode;	/* 책임자연대 코드 */
	private String organRatingCode;	/* 조직등급 코드 */
	private String organDivisionCode;	/* 조직구분 코드 */
	private String upperOrganCode;	/* 상위조직 코드 */
	private String upperOrganCodeName;	/* 상위조직 코드명 */
	private String printOrd1;	/* 출력순서1 */
	private String printOrd2;	/* 출력순서2 */
	private String organAbolishDate;	/* 조직폐지일자 */
	private String abolishReasonCode;	/* 폐지사유코드 */
	private String branchOrganCode;	/* 분기조직코드 */
	private String branchOrganCodeName;	/* 분기조직코드 */
	private String organDate;	/* 분기일자 */
	private String monthDue;	/* 월회비 */
	private String area;	/* 도농 */
	private String executiveMeeting;	/* 이사회 */
	private String monthlyMeeting;	/* 월례회 */
	private String organMeeting;	/* 조직총회 */
	private String spotNight;	/* 현장의밤 */
	private String registerNo;	/* 등록번호 */
	private String guidingClubCode;	/* 가이딩클럽 코드 */
	private String guidingMemberNo;	/* 가이딩회원 회원번호 */
	private Date insertDate;	/* 생성일자 */
	private String insertName;	/* 생성자 */
	private Date updateDate;	/* 수정일자 */
	private String updateName;	/* 수정자 */
	
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
	public String getKoName() {
		return koName;
	}
	public void setKoName(String koName) {
		this.koName = koName;
	}
	public String getKoAbbr() {
		return koAbbr;
	}
	public void setKoAbbr(String koAbbr) {
		this.koAbbr = koAbbr;
	}
	public String getKoAbbr2() {
		return koAbbr2;
	}
	public void setKoAbbr2(String koAbbr2) {
		this.koAbbr2 = koAbbr2;
	}
	public String getChinName() {
		return chinName;
	}
	public void setChinName(String chinName) {
		this.chinName = chinName;
	}
	public String getEnName() {
		return enName;
	}
	public void setEnName(String enName) {
		this.enName = enName;
	}
	public String getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(String changeDate) {
		this.changeDate = changeDate;
	}
	public String getChangeCode() {
		return changeCode;
	}
	public void setChangeCode(String changeCode) {
		this.changeCode = changeCode;
	}
	public String getOrganOfficerMemberNo() {
		return organOfficerMemberNo;
	}
	public void setOrganOfficerMemberNo(String organOfficerMemberNo) {
		this.organOfficerMemberNo = organOfficerMemberNo;
	}
	public String getOrganOfficerMemberName() {
		return organOfficerMemberName;
	}
	public void setOrganOfficerMemberName(String organOfficerMemberName) {
		this.organOfficerMemberName = organOfficerMemberName;
	}
	public String getOrganOfficerMemberModelCode() {
		return organOfficerMemberModelCode;
	}
	public void setOrganOfficerMemberModelCode(String organOfficerMemberModelCode) {
		this.organOfficerMemberModelCode = organOfficerMemberModelCode;
	}
	public String getOfficerTitleCode() {
		return officerTitleCode;
	}
	public void setOfficerTitleCode(String officerTitleCode) {
		this.officerTitleCode = officerTitleCode;
	}
	public String getOfficerSolidCode() {
		return officerSolidCode;
	}
	public void setOfficerSolidCode(String officerSolidCode) {
		this.officerSolidCode = officerSolidCode;
	}
	public String getOrganRatingCode() {
		return organRatingCode;
	}
	public void setOrganRatingCode(String organRatingCode) {
		this.organRatingCode = organRatingCode;
	}
	public String getOrganDivisionCode() {
		return organDivisionCode;
	}
	public void setOrganDivisionCode(String organDivisionCode) {
		this.organDivisionCode = organDivisionCode;
	}
	public String getUpperOrganCode() {
		return upperOrganCode;
	}
	public void setUpperOrganCode(String upperOrganCode) {
		this.upperOrganCode = upperOrganCode;
	}
	public String getUpperOrganCodeName() {
		return upperOrganCodeName;
	}
	public void setUpperOrganCodeName(String upperOrganCodeName) {
		this.upperOrganCodeName = upperOrganCodeName;
	}
	public String getPrintOrd1() {
		return printOrd1;
	}
	public void setPrintOrd1(String printOrd1) {
		this.printOrd1 = printOrd1;
	}
	public String getPrintOrd2() {
		return printOrd2;
	}
	public void setPrintOrd2(String printOrd2) {
		this.printOrd2 = printOrd2;
	}
	public String getOrganAbolishDate() {
		return organAbolishDate;
	}
	public void setOrganAbolishDate(String organAbolishDate) {
		this.organAbolishDate = organAbolishDate;
	}
	public String getAbolishReasonCode() {
		return abolishReasonCode;
	}
	public void setAbolishReasonCode(String abolishReasonCode) {
		this.abolishReasonCode = abolishReasonCode;
	}
	public String getBranchOrganCode() {
		return branchOrganCode;
	}
	public void setBranchOrganCode(String branchOrganCode) {
		this.branchOrganCode = branchOrganCode;
	}
	public String getBranchOrganCodeName() {
		return branchOrganCodeName;
	}
	public void setBranchOrganCodeName(String branchOrganCodeName) {
		this.branchOrganCodeName = branchOrganCodeName;
	}
	public String getOrganDate() {
		return organDate;
	}
	public void setOrganDate(String organDate) {
		this.organDate = organDate;
	}
	public String getMonthDue() {
		return monthDue;
	}
	public void setMonthDue(String monthDue) {
		this.monthDue = monthDue;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getExecutiveMeeting() {
		return executiveMeeting;
	}
	public void setExecutiveMeeting(String executiveMeeting) {
		this.executiveMeeting = executiveMeeting;
	}
	public String getMonthlyMeeting() {
		return monthlyMeeting;
	}
	public void setMonthlyMeeting(String monthlyMeeting) {
		this.monthlyMeeting = monthlyMeeting;
	}
	public String getOrganMeeting() {
		return organMeeting;
	}
	public void setOrganMeeting(String organMeeting) {
		this.organMeeting = organMeeting;
	}
	public String getSpotNight() {
		return spotNight;
	}
	public void setSpotNight(String spotNight) {
		this.spotNight = spotNight;
	}
	public String getRegisterNo() {
		return registerNo;
	}
	public void setRegisterNo(String registerNo) {
		this.registerNo = registerNo;
	}
	public String getGuidingClubCode() {
		return guidingClubCode;
	}
	public void setGuidingClubCode(String guidingClubCode) {
		this.guidingClubCode = guidingClubCode;
	}
	public String getGuidingMemberNo() {
		return guidingMemberNo;
	}
	public void setGuidingMemberNo(String guidingMemberNo) {
		this.guidingMemberNo = guidingMemberNo;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public String getInsertName() {
		return insertName;
	}
	public void setInsertName(String insertName) {
		this.insertName = insertName;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateName() {
		return updateName;
	}
	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}
}
