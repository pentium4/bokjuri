package lionsclubs.com.MM2.MM2_1.MM2_05;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_05VO extends ComDefaultVO implements Serializable{
	private String idnNo;	/* 입력번호 */
	private String memberNo;	/* 회원번호 */
	private String memberName;	/* 회원 */
	private String organCode;	/* 조직코드 */
	private String organName;	/* 조직코드 */
	private String awardDate;	/* 수상일자 */
	private String kindCode;	/* 구분코드 */
	private String awardGrantorCode;	/* 포상부여자코드 */
	private String awardKindCode;	/* 포상종류코드 */
	private String kindName;	/* 구분 */
	private String awardGrantorName;	/* 포상수여자 */
	private String awardKindName;	/* 포상종류 */
	private String awardDesc;	/* 포상내용 */
    private Date insertDate;	/* 생성일자 */
    private String insertName;	/* 생성자 */
    private Date updateDate;	/* 수정일자 */
    private String updateName;	/* 수정자 */
    private String s1 = "1";	/* s1 */
    private String s2;	/* s2 */
    private String s3;	/* s3 */
    
    private String educationCodeCondition;
	/*
	 * search
	 */
	private String sessionYear;
	
	
	public String getEducationCodeCondition() {
		return educationCodeCondition;
	}
	public void setEducationCodeCondition(String educationCodeCondition) {
		this.educationCodeCondition = educationCodeCondition;
	}
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
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
	}
	public String getAwardDate() {
		return awardDate;
	}
	public void setAwardDate(String awardDate) {
		this.awardDate = awardDate;
	}
	public String getKindCode() {
		return kindCode;
	}
	public void setKindCode(String kindCode) {
		this.kindCode = kindCode;
	}
	public String getAwardGrantorCode() {
		return awardGrantorCode;
	}
	public void setAwardGrantorCode(String awardGrantorCode) {
		this.awardGrantorCode = awardGrantorCode;
	}
	public String getAwardKindCode() {
		return awardKindCode;
	}
	public void setAwardKindCode(String awardKindCode) {
		this.awardKindCode = awardKindCode;
	}
	public String getAwardDesc() {
		return awardDesc;
	}
	public void setAwardDesc(String awardDesc) {
		this.awardDesc = awardDesc;
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
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
	public String getAwardGrantorName() {
		return awardGrantorName;
	}
	public void setAwardGrantorName(String awardGrantorName) {
		this.awardGrantorName = awardGrantorName;
	}
	public String getAwardKindName() {
		return awardKindName;
	}
	public void setAwardKindName(String awardKindName) {
		this.awardKindName = awardKindName;
	}
	
	
}
