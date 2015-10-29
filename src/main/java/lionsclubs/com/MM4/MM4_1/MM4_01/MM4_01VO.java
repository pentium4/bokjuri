package lionsclubs.com.MM4.MM4_1.MM4_01;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM4_01VO extends ComDefaultVO implements Serializable{

	private String sessionYear;	/* 회기선택 */
	private String associationCode;	/* 소속연합회코드 */
	private String organCode;	/* 조직코드 */
	private String organOfficerMemberNo;	/* 지구총재 회원번호 */
	private String idnNo;
	private String firstAward;  /* 첫번째 대표수상 */
	private String secodeAward;  /* 두번째 대표수상 */
	private String complexInCnt;	/* 지구 회기시작시 인원 */
	private String complexOutCnt;	/* 지구 회기종료시 인원 */
	private String clubInCnt;	/* 클럽 회기시작시 인원 */
	private String clubOutCnt;	/* 클럽 회기시작시 인원 */
	private String associationSlogan;	/* 국제회장슬로건 */
	private String associationSloganEn;	/* 국제회장슬로건(영문) */
	private String slogan; /* 복합지구슬로건 */
	private String sloganEn; /* 복합지구슬로건(영문) */
	private String mainAction1; /* 주요활동1 */
	private String mainAction2; /* 주요활동2 */
	private String mainAction3; /* 주요활동3 */
	private String mainAction4; /*주요활동4  */
	private String mainAction5; /* 주요활동5 */
	private Date updateDate; /* 최신업데이트 */
	
	private String sPos2;	/* 지구직책	*/
	private String sOrganCode;	/* 출신지구	*/
	private String memberName;	/* 성명 */
	private String changeDate;	/* 조직책임자 변경날짜 */
	
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getAssociationCode() {
		return associationCode;
	}
	public void setAssociationCode(String associationCode) {
		this.associationCode = associationCode;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getOrganOfficerMemberNo() {
		return organOfficerMemberNo;
	}
	public void setOrganOfficerMemberNo(String organOfficerMemberNo) {
		this.organOfficerMemberNo = organOfficerMemberNo;
	}
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
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
	public String getComplexInCnt() {
		return complexInCnt;
	}
	public void setComplexInCnt(String complexInCnt) {
		this.complexInCnt = complexInCnt;
	}
	public String getComplexOutCnt() {
		return complexOutCnt;
	}
	public void setComplexOutCnt(String complexOutCnt) {
		this.complexOutCnt = complexOutCnt;
	}
	public String getClubInCnt() {
		return clubInCnt;
	}
	public void setClubInCnt(String clubInCnt) {
		this.clubInCnt = clubInCnt;
	}
	public String getClubOutCnt() {
		return clubOutCnt;
	}
	public void setClubOutCnt(String clubOutCnt) {
		this.clubOutCnt = clubOutCnt;
	}
	public String getAssociationSlogan() {
		return associationSlogan;
	}
	public void setAssociationSlogan(String associationSlogan) {
		this.associationSlogan = associationSlogan;
	}
	public String getAssociationSloganEn() {
		return associationSloganEn;
	}
	public void setAssociationSloganEn(String associationSloganEn) {
		this.associationSloganEn = associationSloganEn;
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
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getsPos2() {
		return sPos2;
	}
	public void setsPos2(String sPos2) {
		this.sPos2 = sPos2;
	}
	public String getsOrganCode() {
		return sOrganCode;
	}
	public void setsOrganCode(String sOrganCode) {
		this.sOrganCode = sOrganCode;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(String changeDate) {
		this.changeDate = changeDate;
	}
}
