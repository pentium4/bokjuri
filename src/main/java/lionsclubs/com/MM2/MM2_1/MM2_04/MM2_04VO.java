package lionsclubs.com.MM2.MM2_1.MM2_04;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_04VO extends ComDefaultVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String idnNo;	/* 입력번호 */
	private String memberNo;	/* 회원번호 */
	private String memberName;	/* 회원 */
	private String sanctionStartDate;		/* 시작일자 */
	private String sanctionEndDate;		/* 종료일자 */
	private String educationCode;	/* 교육코드 */
	private String educationName;	/* 교육명 */
	private String kindCode;	/* 분류코드 */
	private String kindName;	/* 분류 */
	private String itemCode;	/* 아이템코드 */
	private String itemName;	/* 아이템내용 */
	private String desc;	/* 내용 */
	
	private String organCode;	/* 조직코드 */
	private String organName;	/* 조직명 */
	
    private Date insertDate;	/* 생성일자 */
    private String insertName;	/* 생성자 */
    private Date updateDate;	/* 수정일자 */
    private String updateName;	/* 수정자 */
    private String s1;	/* s1 */
    private String s2;	/* s2 */
    private String s3;	/* s3 */
    private String s4;	/* s4 */
    private String s5;	/* s5 */
	private String educationCodeCondition;	/* s2-교육코드 */
	private String kindCodeCondition;	/* s2-구분코드 */
	private String appKindCode;	/* 가입상태 */
	private String isOutMember;	 /* 퇴회여부 */
	
	/*
	 * search
	 */
	private String sessionYear;
	private String prevYear;
	
	
	public String getKindCodeCondition() {
		return kindCodeCondition;
	}
	public void setKindCodeCondition(String kindCodeCondition) {
		this.kindCodeCondition = kindCodeCondition;
	}
	public String getIsOutMember() {
		return isOutMember;
	}
	public void setIsOutMember(String isOutMember) {
		this.isOutMember = isOutMember;
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
	public String getSanctionStartDate() {
		return sanctionStartDate;
	}
	public void setSanctionStartDate(String sanctionStartDate) {
		this.sanctionStartDate = sanctionStartDate;
	}
	public String getSanctionEndDate() {
		return sanctionEndDate;
	}
	public void setSanctionEndDate(String sanctionEndDate) {
		this.sanctionEndDate = sanctionEndDate;
	}
	public String getEducationCode() {
		return educationCode;
	}
	public void setEducationCode(String educationCode) {
		this.educationCode = educationCode;
	}
	public String getEducationName() {
		return educationName;
	}
	public void setEducationName(String educationName) {
		this.educationName = educationName;
	}
	public String getKindCode() {
		return kindCode;
	}
	public void setKindCode(String kindCode) {
		this.kindCode = kindCode;
	}
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
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
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getPrevYear() {
		return prevYear;
	}
	public void setPrevYear(String prevYear) {
		this.prevYear = prevYear;
	}
	public String getEducationCodeCondition() {
		return educationCodeCondition;
	}
	public void setEducationCodeCondition(String educationCodeCondition) {
		this.educationCodeCondition = educationCodeCondition;
	}
	public String getAppKindCode() {
		return appKindCode;
	}
	public void setAppKindCode(String appKindCode) {
		this.appKindCode = appKindCode;
	}
	

}
