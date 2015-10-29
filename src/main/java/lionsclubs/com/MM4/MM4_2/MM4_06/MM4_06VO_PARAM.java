package lionsclubs.com.MM4.MM4_2.MM4_06;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM4_06VO_PARAM extends ComDefaultVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orgCode;
	private String yearCode;
	private String prevYear;
	private String fromMMdd;
	private String toMMdd;
	private String term1;
	private String term2;
	private String term3;
	private String term4;
	private String term5;
	private String lvl;
	private String fromDate1;
	private String fromDate2;
	private String fromDate3;
	private String fromDate4;
	private String fromDate5;
	private String toDate1;
	private String toDate2;
	private String toDate3;
	private String toDate4;
	private String toDate5;

	
	
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
		this.prevYear = String.valueOf(Integer.parseInt(this.yearCode) - 1);
		this.term1 = String.valueOf(Integer.parseInt(this.yearCode) - 1) + "~" + this.yearCode;
		this.term2 = String.valueOf(Integer.parseInt(this.yearCode) - 2) + "~" + String.valueOf(Integer.parseInt(this.yearCode) - 1);
		this.term3 = String.valueOf(Integer.parseInt(this.yearCode) - 3) + "~" + String.valueOf(Integer.parseInt(this.yearCode) - 2);
		this.term4 = String.valueOf(Integer.parseInt(this.yearCode) - 4) + "~" + String.valueOf(Integer.parseInt(this.yearCode) - 3);
		this.term5 = String.valueOf(Integer.parseInt(this.yearCode) - 5) + "~" + String.valueOf(Integer.parseInt(this.yearCode) - 4);
		
		
		this.fromDate1 = String.valueOf(Integer.parseInt(this.yearCode) - 1) + "0701";
		this.fromDate2 = String.valueOf(Integer.parseInt(this.yearCode) - 2) + "0701";
		this.fromDate3 = String.valueOf(Integer.parseInt(this.yearCode) - 3) + "0701";
		this.fromDate4 = String.valueOf(Integer.parseInt(this.yearCode) - 4) + "0701";
		this.fromDate5 = String.valueOf(Integer.parseInt(this.yearCode) - 5) + "0701";
		this.toDate1   = String.valueOf(Integer.parseInt(this.yearCode) - 0) + "0630";
		this.toDate2   = String.valueOf(Integer.parseInt(this.yearCode) - 1) + "0630";
		this.toDate3   = String.valueOf(Integer.parseInt(this.yearCode) - 2) + "0630";
		this.toDate4   = String.valueOf(Integer.parseInt(this.yearCode) - 3) + "0630";
		this.toDate5   = String.valueOf(Integer.parseInt(this.yearCode) - 4) + "0630";
	}
	public String getTerm1() {
		return term1;
	}
	public void setTerm1(String term1) {
		this.term1 = term1;
	}
	public String getTerm2() {
		return term2;
	}
	public void setTerm2(String term2) {
		this.term2 = term2;
	}
	public String getTerm3() {
		return term3;
	}
	public void setTerm3(String term3) {
		this.term3 = term3;
	}
	public String getTerm4() {
		return term4;
	}
	public void setTerm4(String term4) {
		this.term4 = term4;
	}
	public String getTerm5() {
		return term5;
	}
	public void setTerm5(String term5) {
		this.term5 = term5;
	}
	public String getPrevYear() {
		return prevYear;
	}
	public void setPrevYear(String prevYear) {
		this.prevYear = prevYear;
	}
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
	}
	public String getFromMMdd() {
		return fromMMdd;
	}
	public void setFromMMdd(String fromMMdd) {
		this.fromMMdd = fromMMdd;
	}
	public String getToMMdd() {
		return toMMdd;
	}
	public void setToMMdd(String toMMdd) {
		this.toMMdd = toMMdd;
	}
	
	public String getFromDate1() {
		return fromDate1;
	}
	public void setFromDate1(String fromDate1) {
		this.fromDate1 = fromDate1;
	}
	public String getFromDate2() {
		return fromDate2;
	}
	public void setFromDate2(String fromDate2) {
		this.fromDate2 = fromDate2;
	}
	public String getFromDate3() {
		return fromDate3;
	}
	public void setFromDate3(String fromDate3) {
		this.fromDate3 = fromDate3;
	}
	public String getFromDate4() {
		return fromDate4;
	}
	public void setFromDate4(String fromDate4) {
		this.fromDate4 = fromDate4;
	}
	public String getFromDate5() {
		return fromDate5;
	}
	public void setFromDate5(String fromDate5) {
		this.fromDate5 = fromDate5;
	}
	public String getToDate1() {
		return toDate1;
	}
	public void setToDate1(String toDate1) {
		this.toDate1 = toDate1;
	}
	public String getToDate2() {
		return toDate2;
	}
	public void setToDate2(String toDate2) {
		this.toDate2 = toDate2;
	}
	public String getToDate3() {
		return toDate3;
	}
	public void setToDate3(String toDate3) {
		this.toDate3 = toDate3;
	}
	public String getToDate4() {
		return toDate4;
	}
	public void setToDate4(String toDate4) {
		this.toDate4 = toDate4;
	}
	public String getToDate5() {
		return toDate5;
	}
	public void setToDate5(String toDate5) {
		this.toDate5 = toDate5;
	}
}
