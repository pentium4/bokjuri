package lionsclubs.com.MM3.MM3_3.MM3_12;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_12VO extends ComDefaultVO implements Serializable{
	/* search list */
	private String organCodeDst;
	private String organCode;
	private String organNmClub;
	private int totCnt;
	private int age1;
	private int age2;
	private int age3;
	private int age4;
	private int age5;
	private int age6;
	private int age7;
	private int ageCntSum;
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
	public int getAgeCntSum() {
		return ageCntSum;
	}
	public void setAgeCntSum(int ageCntSum) {
		this.ageCntSum = ageCntSum;
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
