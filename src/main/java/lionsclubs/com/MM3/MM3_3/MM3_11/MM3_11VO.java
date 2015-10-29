package lionsclubs.com.MM3.MM3_3.MM3_11;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_11VO extends ComDefaultVO implements Serializable{
	/* search list */
	private String organCodeDst;
	private String organCode;
	private String organNmClub;
	private int totCnt;
	private int year1To3;
	private int year1To5;
	private int year1To8;
	private int year1To10;
	private int year1To15;
	private int year1To20;
	private int year20More;
	private int yearCntSum;
	private float avg;
	private String organMeeting;
	
	/*searchOption*/
	private String orgCode;
	private String prevYear;
	private String thisYear;
	public String getOrganCodeDst() {
		return organCodeDst;
	}
	public void setOrganCodeDst(String organCodeDst) {
		this.organCodeDst = organCodeDst;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getOrganNmClub() {
		return organNmClub;
	}
	public void setOrganNmClub(String organNmClub) {
		this.organNmClub = organNmClub;
	}
	public int getTotCnt() {
		return totCnt;
	}
	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}
	public int getYear1To3() {
		return year1To3;
	}
	public void setYear1To3(int year1To3) {
		this.year1To3 = year1To3;
	}
	
	public int getYear1To5() {
		return year1To5;
	}
	public void setYear1To5(int year1To5) {
		this.year1To5 = year1To5;
	}
	public int getYear1To8() {
		return year1To8;
	}
	public void setYear1To8(int year1To8) {
		this.year1To8 = year1To8;
	}
	public int getYear1To10() {
		return year1To10;
	}
	public void setYear1To10(int year1To10) {
		this.year1To10 = year1To10;
	}
	public int getYear1To15() {
		return year1To15;
	}
	public void setYear1To15(int year1To15) {
		this.year1To15 = year1To15;
	}
	public int getYear1To20() {
		return year1To20;
	}
	public void setYear1To20(int year1To20) {
		this.year1To20 = year1To20;
	}
	public int getYear20More() {
		return year20More;
	}
	public void setYear20More(int year20More) {
		this.year20More = year20More;
	}
	public int getYearCntSum() {
		return yearCntSum;
	}
	public void setYearCntSum(int yearCntSum) {
		this.yearCntSum = yearCntSum;
	}
	public float getAvg() {
		return avg;
	}
	public void setAvg(float avg) {
		this.avg = avg;
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
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
		this.prevYear = String.valueOf(Integer.parseInt(this.thisYear) - 1);
	}
	public String getOrganMeeting() {
		return organMeeting;
	}
	public void setOrganMeeting(String organMeeting) {
		this.organMeeting = organMeeting;
	}
	
	
	
}
