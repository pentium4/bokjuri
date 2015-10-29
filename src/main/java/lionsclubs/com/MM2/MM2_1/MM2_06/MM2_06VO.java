package lionsclubs.com.MM2.MM2_1.MM2_06;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_06VO extends ComDefaultVO implements Serializable{
	
	private String idnNo;		/* 입력번호 */
	private String organCode;	/* 조직코드 */
	private String organName;	/* 조직 */
	private String genDate;		/* 발생일자 */
	private String classItemCode;	/* 분류항목코드 */
	private String classItemName;	/* 분류항목명 */
	private String detailItemCode;	/* 세부항목코드 */
	private String detailItemName;	/* 세부항목그룹코드 */
	
	private int impost;
	private int paymentSum;
	private int personalImpost;	/* 개인부과금 */
	private int personalImpostSum;
	private int clubImpost;	/* 클럽부과금 */
	private int clubSum;	/* 클럽총부과금 */
	private String reference;	/* 참고사항 */
	
	private String memberNo;	/* 회원번호 */
	private String memberName;	/* 회원 */
    private String targetMemberNo;	/* 지급처 */
    private String targetMemberName;	/* 지급처 */
    
    private Date insertDate;	/* 생성일자 */
    private String insertName;	/* 생성자 */
    private Date updateDate;	/* 수정일자 */
    private String updateName;	/* 수정자 */
    private String s1 = "1";	/* s1 */
    private String s2;	/* s2 */
    private String s3;	/* s3 */
    private String outDate;	/* 퇴회일자 */
    
	/*
	 * search
	 */
	private String sessionYear;

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

	public String getOrganName() {
		return organName;
	}

	public void setOrganName(String organName) {
		this.organName = organName;
	}

	public String getGenDate() {
		return genDate;
	}

	public void setGenDate(String genDate) {
		this.genDate = genDate;
	}

	public String getClassItemCode() {
		return classItemCode;
	}

	public void setClassItemCode(String classItemCode) {
		this.classItemCode = classItemCode;
	}

	public String getClassItemName() {
		return classItemName;
	}

	public void setClassItemName(String classItemName) {
		this.classItemName = classItemName;
	}

	public String getDetailItemCode() {
		return detailItemCode;
	}

	public void setDetailItemCode(String detailItemCode) {
		this.detailItemCode = detailItemCode;
	}

	public String getDetailItemName() {
		return detailItemName;
	}

	public void setDetailItemName(String detailItemName) {
		this.detailItemName = detailItemName;
	}

	public int getImpost() {
		return impost;
	}

	public void setImpost(int impost) {
		this.impost = impost;
	}

	public int getPaymentSum() {
		return paymentSum;
	}

	public void setPaymentSum(int paymentSum) {
		this.paymentSum = paymentSum;
	}

	public int getPersonalImpost() {
		return personalImpost;
	}

	public void setPersonalImpost(int personalImpost) {
		this.personalImpost = personalImpost;
	}

	public int getPersonalImpostSum() {
		return personalImpostSum;
	}

	public void setPersonalImpostSum(int personalImpostSum) {
		this.personalImpostSum = personalImpostSum;
	}

	public int getClubImpost() {
		return clubImpost;
	}

	public void setClubImpost(int clubImpost) {
		this.clubImpost = clubImpost;
	}

	public int getClubSum() {
		return clubSum;
	}

	public void setClubSum(int clubSum) {
		this.clubSum = clubSum;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
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

	public String getTargetMemberNo() {
		return targetMemberNo;
	}

	public void setTargetMemberNo(String targetMemberNo) {
		this.targetMemberNo = targetMemberNo;
	}

	public String getTargetMemberName() {
		return targetMemberName;
	}

	public void setTargetMemberName(String targetMemberName) {
		this.targetMemberName = targetMemberName;
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

	public String getOutDate() {
		return outDate;
	}

	public void setOutDate(String outDate) {
		this.outDate = outDate;
	}

	public String getSessionYear() {
		return sessionYear;
	}

	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
}
