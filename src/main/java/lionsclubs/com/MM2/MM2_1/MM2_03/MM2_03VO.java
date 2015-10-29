package lionsclubs.com.MM2.MM2_1.MM2_03;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_03VO extends ComDefaultVO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String memberNo;	/* 회원번호 */
	private String memberName;	/* 성명 */
	private String startDate;	/* 시작기간 */
	private String endDate;	/* 종료기간 */
	private String appKindName;	/* 선임구분 */
	private String organName;	/* 소속클럽 */
	private String appSectorName;	/* 선임소속 */
	private String appDescName;	/* 선임직책및내용 */
	private String quitDate;	/* 퇴회일자 */	
	
	/*
	 * search
	 */
	private String sessionYear;	/* 현재회기 */
	private String organCode;	/* 조직코드 */
    private String s1;	/* 성명순 */
    private String s5 = "1";	/* 발생일자순 */
    private String s3;	/* 퇴회자제외여부 */
    private String s4;	/* 선임구분순 */
    
	private String isQuitMember;	 /* 퇴회자제외 여부 */
	private String appKindCodeCondition;	/* 선임구분 */
	
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
	public String getAppKindName() {
		return appKindName;
	}
	public void setAppKindName(String appKindName) {
		this.appKindName = appKindName;
	}
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
	}
	public String getAppSectorName() {
		return appSectorName;
	}
	public void setAppSectorName(String appSectorName) {
		this.appSectorName = appSectorName;
	}
	public String getAppDescName() {
		return appDescName;
	}
	public void setAppDescName(String appDescName) {
		this.appDescName = appDescName;
	}
	public String getQuitDate() {
		return quitDate;
	}
	public void setQuitDate(String quitDate) {
		this.quitDate = quitDate;
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
	public String getS1() {
		return s1;
	}
	public void setS1(String s1) {
		this.s1 = s1;
	}
	public String getS5() {
		return s5;
	}
	public void setS5(String s5) {
		this.s5 = s5;
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
	public String getIsQuitMember() {
		return isQuitMember;
	}
	public void setIsQuitMember(String isQuitMember) {
		this.isQuitMember = isQuitMember;
	}
	public String getAppKindCodeCondition() {
		return appKindCodeCondition;
	}
	public void setAppKindCodeCondition(String appKindCodeCondition) {
		this.appKindCodeCondition = appKindCodeCondition;
	}
}
