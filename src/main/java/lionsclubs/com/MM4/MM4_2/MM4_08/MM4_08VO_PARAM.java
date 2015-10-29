package lionsclubs.com.MM4.MM4_2.MM4_08;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM4_08VO_PARAM extends ComDefaultVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orgCode;
	private String orgName;
	private String yearCode;
	private String fromDate;
	private String toDate;
	private String baseDate;
	private String lvl;
	
	private int age1;
	private int age2;
	private int age3;
	private int age4;
	private int age5;
	private int age6;
	private int age7;
	private int sumMemCnt;
	private float ageAvg;
	
	private String orgMeeting;
	
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public String getYearCode() {
		return yearCode;
	}
	
	public void setYearCode(String yearCode) {
		this.yearCode = yearCode;
		this.fromDate = String.valueOf(Integer.parseInt(this.yearCode) - 1) + "0701";
		this.toDate = String.valueOf(Integer.parseInt(this.yearCode) - 0) + "0630";
		this.setBaseDate(String.valueOf(Integer.parseInt(this.yearCode) - 0) + "0101");
	}
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getBaseDate() {
		return baseDate;
	}
	public void setBaseDate(String baseDate) {
		this.baseDate = baseDate;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public int getAge1() {
		return age1;
	}
	public void setAge1(int age1) {
		this.age1 = age1;
	}
	public int getAge2() {
		return age2;
	}
	public void setAge2(int age2) {
		this.age2 = age2;
	}
	public int getAge3() {
		return age3;
	}
	public void setAge3(int age3) {
		this.age3 = age3;
	}
	public int getAge4() {
		return age4;
	}
	public void setAge4(int age4) {
		this.age4 = age4;
	}
	public int getAge5() {
		return age5;
	}
	public void setAge5(int age5) {
		this.age5 = age5;
	}
	public int getAge6() {
		return age6;
	}
	public void setAge6(int age6) {
		this.age6 = age6;
	}
	public int getAge7() {
		return age7;
	}
	public void setAge7(int age7) {
		this.age7 = age7;
	}
	public int getSumMemCnt() {
		return sumMemCnt;
	}
	public void setSumMemCnt(int sumMemCnt) {
		this.sumMemCnt = sumMemCnt;
	}
	public float getAgeAvg() {
		return ageAvg;
	}
	public void setAgeAvg(float ageAvg) {
		this.ageAvg = ageAvg;
	}
	public String getOrgMeeting() {
		return orgMeeting;
	}
	public void setOrgMeeting(String orgMeeting) {
		this.orgMeeting = orgMeeting;
	}
	
}
