package lionsclubs.com.MM3.MM3_1.MM3_01;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_01VO extends ComDefaultVO implements Serializable{

	private String sessionYear;	/* 회기선택 */
	private String associationCode;	/* 소속연합회코드 */
	private String organCode;	/* 조직코드 */
	private String organOfficerMemberNo;	/* 지구총재 회원번호 */
	private String firstAward;  /* 첫번째 대표수상 */
	private String secodeAward;  /* 두번째 대표수상 */
	private String districtInCnt;	/* 지구 회기시작시 인원 */
	private String districtOutCnt;	/* 지구 회기종료시 인원 */
	private String clubInCnt;	/* 클럽 회기시작시 인원 */
	private String clubOutCnt;	/* 클럽 회기시작시 인원 */
	private String associationSlogan;	/* 국제회장슬로건 */
	private String associationSloganEn;	/* 국제회장슬로건(영문) */
	private String slogan; /* 회장슬로건 */
	private String sloganEn; /* 회장슬로건(영문) */
	private String mainAction1; /* 주요활동1 */
	private String mainAction2; /* 주요활동2 */
	private String mainAction3; /* 주요활동3 */
	private String mainAction4; /*주요활동4  */
	private String mainAction5; /* 주요활동5 */
	private Date updateDate; /* 최신업데이트 날짜 */
	
	private String idnNo;	/* 변경이력 번호 */
	private String changeDate;	/* 조직책임자 변경날짜 */
	
	private String name;	/* 성명 */
	private String districtTitle;	/* 지구직책 */
	private String memberPictureFile;	/* 회원사진파일 */
	private String clubName;	/* 클럽명 */
	private String retireYn;	/* 퇴회구분 */
	private String retireDate;	/* 퇴회일자 */
	private String dismissalDate;	/* 해임날짜 */
	
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

	public String getDistrictInCnt() {
		return districtInCnt;
	}

	public void setDistrictInCnt(String districtInCnt) {
		this.districtInCnt = districtInCnt;
	}

	public String getDistrictOutCnt() {
		return districtOutCnt;
	}

	public void setDistrictOutCnt(String districtOutCnt) {
		this.districtOutCnt = districtOutCnt;
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

	public String getIdnNo() {
		return idnNo;
	}

	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}

	public String getChangeDate() {
		return changeDate;
	}

	public void setChangeDate(String changeDate) {
		this.changeDate = changeDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDistrictTitle() {
		return districtTitle;
	}

	public void setDistrictTitle(String districtTitle) {
		this.districtTitle = districtTitle;
	}

	public String getMemberPictureFile() {
		return memberPictureFile;
	}

	public void setMemberPictureFile(String memberPictureFile) {
		this.memberPictureFile = memberPictureFile;
	}

	public String getClubName() {
		return clubName;
	}

	public void setClubName(String clubName) {
		this.clubName = clubName;
	}

	public String getRetireYn() {
		return retireYn;
	}

	public void setRetireYn(String retireYn) {
		this.retireYn = retireYn;
	}

	public String getRetireDate() {
		return retireDate;
	}

	public void setRetireDate(String retireDate) {
		this.retireDate = retireDate;
	}

	public String getDismissalDate() {
		return dismissalDate;
	}

	public void setDismissalDate(String dismissalDate) {
		this.dismissalDate = dismissalDate;
	}
}
