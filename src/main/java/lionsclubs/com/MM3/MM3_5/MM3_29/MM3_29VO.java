package lionsclubs.com.MM3.MM3_5.MM3_29;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_29VO extends ComDefaultVO implements Serializable{

	private String thisYear;
	private String prevYear;
	private String s1;
	private String s2;
	private String s3;
	private String s4;
	private String s5;
	private String s6;
	private String upperCode;
	private String order ="1";
	public String getThisYear() {
		return thisYear;
	}
	public void setThisYear(String thisYear) {
		this.thisYear = thisYear;
		this.prevYear = String.valueOf(Integer.parseInt(this.thisYear) - 1);
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
	public String getS6() {
		return s6;
	}
	public void setS6(String s6) {
		this.s6 = s6;
	}
	public String getUpperCode() {
		return upperCode;
	}
	public void setUpperCode(String upperCode) {
		this.upperCode = upperCode;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	
	private String organCode;
	private String organName;
	private String subjectScore;
	private String amountScore;
	private String birthScore;
	private String totMem;
	private String resultCnt;
	private String memIn;
	private String totalScore;
	
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
	public String getBirthScore() {
		return birthScore;
	}
	public void setBirthScore(String birthScore) {
		this.birthScore = birthScore;
	}
	public String getPrevYear() {
		return prevYear;
	}
	public void setPrevYear(String prevYear) {
		this.prevYear = prevYear;
	}
	public String getTotMem() {
		return totMem;
	}
	public void setTotMem(String totMem) {
		this.totMem = totMem;
	}
	public String getResultCnt() {
		return resultCnt;
	}
	public void setResultCnt(String resultCnt) {
		this.resultCnt = resultCnt;
	}
	public String getMemIn() {
		return memIn;
	}
	public void setMemIn(String memIn) {
		this.memIn = memIn;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	
	
}
