package lionsclubs.com.MM1.MM1_1.MM1_03;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM1_03VO extends ComDefaultVO implements Serializable{

	private static final long serialVersionUID = 1L;
	private String memberNo;
	private String organClub;	/* 소속클럽 */
	
	private String idnNo;
	private String startDate;
	private String endDate;
	private String appKindCode;
	private String appKindName;
	private String organCode;		/* 조직코드 */
	private String organName;
	private String appSectorCode;
	private String appSectorName;	/* 선임소속 명 */
	private String appDescCode;
	private String appDesc;	/* 선임직책설명 */
	private String appDescName;
	private String insertDate;
	private String insertName;
	private String updateDate;
	private String updateName;
	
	private String koAbbr2;
	private String upperOrganCodeName;
	private String upperOrganCode;
	private String kindFlag;
	private String expulsionFlag;
	/*
	 * 회기검색
	 */
	private String prevYear;
	private String thisYear;
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getOrganClub() {
		return organClub;
	}
	public void setOrganClub(String organClub) {
		this.organClub = organClub;
	}
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
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
	public String getAppKindCode() {
		return appKindCode;
	}
	public void setAppKindCode(String appKindCode) {
		this.appKindCode = appKindCode;
	}
	public String getAppKindName() {
		return appKindName;
	}
	public void setAppKindName(String appKindName) {
		this.appKindName = appKindName;
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
	public String getAppSectorCode() {
		return appSectorCode;
	}
	public void setAppSectorCode(String appSectorCode) {
		this.appSectorCode = appSectorCode;
	}
	public String getAppSectorName() {
		return appSectorName;
	}
	public void setAppSectorName(String appSectorName) {
		this.appSectorName = appSectorName;
	}
	public String getAppDescCode() {
		return appDescCode;
	}
	public void setAppDescCode(String appDescCode) {
		this.appDescCode = appDescCode;
	}
	public String getAppDesc() {
		return appDesc;
	}
	public void setAppDesc(String appDesc) {
		this.appDesc = appDesc;
	}
	public String getAppDescName() {
		return appDescName;
	}
	public void setAppDescName(String appDescName) {
		this.appDescName = appDescName;
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
	public String getKoAbbr2() {
		return koAbbr2;
	}
	public void setKoAbbr2(String koAbbr2) {
		this.koAbbr2 = koAbbr2;
	}
	public String getUpperOrganCodeName() {
		return upperOrganCodeName;
	}
	public void setUpperOrganCodeName(String upperOrganCodeName) {
		this.upperOrganCodeName = upperOrganCodeName;
	}
	public String getUpperOrganCode() {
		return upperOrganCode;
	}
	public void setUpperOrganCode(String upperOrganCode) {
		this.upperOrganCode = upperOrganCode;
	}
	public String getKindFlag() {
		return kindFlag;
	}
	public void setKindFlag(String kindFlag) {
		this.kindFlag = kindFlag;
	}
	public String getExpulsionFlag() {
		return expulsionFlag;
	}
	public void setExpulsionFlag(String expulsionFlag) {
		this.expulsionFlag = expulsionFlag;
	}
	public String getPrevYear() {
		return prevYear;
	}
	public void setPrevYear(String prevYear) {
		this.prevYear = prevYear;
	}
	public String getThisYear() {
		return thisYear;
	}
	public void setThisYear(String thisYear) {
		this.thisYear = thisYear;
	}
}
