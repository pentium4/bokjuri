package lionsclubs.com.MM4.MM4_2.MM4_05;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM4_05VO_PARAM extends ComDefaultVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orgCode;
	private String yearCode;
	private String month;
	private String fromDate;
	private String toDate;
	private String preYearLastDate;
	private String lvl;

	
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
		this.preYearLastDate = String.valueOf(Integer.parseInt(this.yearCode) - 1) + "0630";
		this.fromDate = String.valueOf(Integer.parseInt(this.yearCode) - 1) + "0701";
	}
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
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
	public String getPreYearLastDate() {
		return preYearLastDate;
	}
	public void setPreYearLastDate(String preYearLastDate) {
		this.preYearLastDate = preYearLastDate;
	}
}
