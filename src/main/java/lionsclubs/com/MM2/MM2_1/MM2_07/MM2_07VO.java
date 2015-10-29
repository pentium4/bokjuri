package lionsclubs.com.MM2.MM2_1.MM2_07;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_07VO extends ComDefaultVO implements Serializable{
	private String idnNo;	/* 입력번호 */
	private String memberNo;	/* 회원번호 */
	private String memberName;	/* 회원 */
	private String organName;	/* 조직 */
	private String signDate;	/* 입회일자 */
	private String sectorTitle;	/* 직책 */
	private String divisionSector;		/* 분과 */
	private String eventAttend;	/* 행사참여 */
	private String attend;	/* 행사참여수 */
	private String total;	/* 행사참여 전체수 */
	private String quitDate;	/* 퇴회 */
	private String quitCause;	/* 퇴회일자 */
	private String visitArea;	/* 참고사항 */
	private String withdrawYn;	/* 퇴회제외여부 */
    private Date insertDate;	/* 생성일자 */
    private String insertName;	/* 생성자 */
    private Date updateDate;	/* 수정일자 */
    private String updateName;	/* 수정자 */
    private String appDescCode;
    private String s1;	/* s1 */
    private String s2 = "1";	/* s2 */
    private String s3;	/* s3 */
    private String s4;	/* s4 */
    private String s5;	/* s5 */
    private String s6;	/* s6 */
    private String s7;	/* s7 */
    private String s8;	/* s8 */
    private String startDate;	/* s7 */
    private String endDate;	/* s8 */
    
	/*
	 * search
	 */
	private String sessionYear;
	private String organCode;	/* 조직코드 */
	
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
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
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
	}
	public String getSignDate() {
		return signDate;
	}
	public void setSignDate(String signDate) {
		this.signDate = signDate;
	}
	public String getSectorTitle() {
		return sectorTitle;
	}
	public void setSectorTitle(String sectorTitle) {
		this.sectorTitle = sectorTitle;
	}
	public String getDivisionSector() {
		return divisionSector;
	}
	public void setDivisionSector(String divisionSector) {
		this.divisionSector = divisionSector;
	}
	public String getEventAttend() {
		return eventAttend;
	}
	public void setEventAttend(String eventAttend) {
		this.eventAttend = eventAttend;
	}
	public String getAttend() {
		return attend;
	}
	public void setAttend(String attend) {
		this.attend = attend;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getQuitDate() {
		return quitDate;
	}
	public void setQuitDate(String quitDate) {
		this.quitDate = quitDate;
	}
	public String getQuitCause() {
		return quitCause;
	}
	public void setQuitCause(String quitCause) {
		this.quitCause = quitCause;
	}
	public String getVisitArea() {
		return visitArea;
	}
	public void setVisitArea(String visitArea) {
		this.visitArea = visitArea;
	}
	public String getWithdrawYn() {
		return withdrawYn;
	}
	public void setWithdrawYn(String withdrawYn) {
		this.withdrawYn = withdrawYn;
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
	public String getAppDescCode() {
		return appDescCode;
	}
	public void setAppDescCode(String appDescCode) {
		this.appDescCode = appDescCode;
	}
	public String getS1() {
		return s1;
	}
	public void setS1(String s1) {
		this.s1 = s1;
	}
	public String getS2() {
		return s2;
	}
	public void setS2(String s2) {
		this.s2 = s2;
	}
	public String getS3() {
		return s3;
	}
	public void setS3(String s3) {
		this.s3 = s3;
	}
	public String getS4() {
		return s4;
	}
	public void setS4(String s4) {
		this.s4 = s4;
	}
	public String getS5() {
		return s5;
	}
	public void setS5(String s5) {
		this.s5 = s5;
	}
	public String getS6() {
		return s6;
	}
	public void setS6(String s6) {
		this.s6 = s6;
	}
	public String getS7() {
		return s7;
	}
	public void setS7(String s7) {
		this.s7 = s7;
	}
	public String getS8() {
		return s8;
	}
	public void setS8(String s8) {
		this.s8 = s8;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
}
