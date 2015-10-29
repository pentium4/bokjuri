package lionsclubs.com.MM3.MM3_5.MM3_26;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_26VO extends ComDefaultVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String thisYear;
	private String organCode;
	private String organName;
	private String districtEventName;
	private String subjectCodeName;
	private String takeDate;
	private String location;
	private String clubCode;
	private String subjectScore;
	private String amountScore;
	private String totalScore;
	private String entryScore;
	
	public String getThisYear() {
		return thisYear;
	}
	public void setThisYear(String thisYear) {
		this.thisYear = thisYear;
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
	public String getDistrictEventName() {
		return districtEventName;
	}
	public void setDistrictEventName(String districtEventName) {
		this.districtEventName = districtEventName;
	}
	public String getSubjectCodeName() {
		return subjectCodeName;
	}
	public void setSubjectCodeName(String subjectCodeName) {
		this.subjectCodeName = subjectCodeName;
	}
	public String getTakeDate() {
		return takeDate;
	}
	public void setTakeDate(String takeDate) {
		this.takeDate = takeDate;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getClubCode() {
		return clubCode;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getSubjectScore() {
		return subjectScore;
	}
	public void setSubjectScore(String subjectScore) {
		this.subjectScore = subjectScore;
	}
	public String getAmountScore() {
		return amountScore;
	}
	public void setAmountScore(String amountScore) {
		this.amountScore = amountScore;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	public String getEntryScore() {
		return entryScore;
	}
	public void setEntryScore(String entryScore) {
		this.entryScore = entryScore;
	}
	
}
