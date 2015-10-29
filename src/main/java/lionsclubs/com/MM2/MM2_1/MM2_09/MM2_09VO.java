package lionsclubs.com.MM2.MM2_1.MM2_09;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_09VO extends ComDefaultVO implements Serializable{
	private String idnNo;	/* 입력번호 */
	private String memberNo;	/* 회원번호 */
	private String memberName;	/* 회원 */
	private String nessName;	/* 회원 */
	private String organCode;	/* 조직코드 */
	private String organName;	/* 조직 */
	private String signDate;	/* 입회일자 */
	private String sectorTitle;	/* 직책 */
	private String divisionSector;		/* 분과 */
	private String quitDate;	/* 퇴회 */
	private String quitCause;	/* 퇴회일자 */
	private String memberPictureFile;		/* 회원사진파일 */
	private String nessPictureFile;	/* 네스사진파일 */
    private Date insertDate;	/* 생성일자 */
    private String insertName;	/* 생성자 */
    private Date updateDate;	/* 수정일자 */
    private String updateName;	/* 수정자 */
    private String s1;	/* s1 */
    private String s2;	/* s2 */
    private String s3;	/* s3 */
    private String s4 = "1";	/* s4 */
    private String s5;	/* s5 */
    private String startDate;	/* 입회 시작일 */
    private String titleStartDate;	/* 직책 시작일 */
    private String retireDate;	/* 퇴직일 */    
    
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

	public String getNessName() {
		return nessName;
	}

	public void setNessName(String nessName) {
		this.nessName = nessName;
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

	public String getMemberPictureFile() {
		return memberPictureFile;
	}

	public void setMemberPictureFile(String memberPictureFile) {
		this.memberPictureFile = memberPictureFile;
	}

	public String getNessPictureFile() {
		return nessPictureFile;
	}

	public void setNessPictureFile(String nessPictureFile) {
		this.nessPictureFile = nessPictureFile;
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getTitleStartDate() {
		return titleStartDate;
	}

	public void setTitleStartDate(String titleStartDate) {
		this.titleStartDate = titleStartDate;
	}

	public String getRetireDate() {
		return retireDate;
	}

	public void setRetireDate(String retireDate) {
		this.retireDate = retireDate;
	}

	public String getSessionYear() {
		return sessionYear;
	}

	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
}
