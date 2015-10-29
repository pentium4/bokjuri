package lionsclubs.com.MM4.MM4_2.MM4_07;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM4_07VO_PARAM extends ComDefaultVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orgCode;
	private String yearCode;
	private String prevYear;
	private String lvl;
	private String fromDate;
	private String toDate;
	private String[] outCode;
	
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
		
		this.setFromDate(String.valueOf(Integer.parseInt(this.yearCode) - 1) + "0701");
		this.setToDate(String.valueOf(Integer.parseInt(this.yearCode) - 0) + "0630");
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
	public String[] getOutCode() {
		return outCode;
	}
	public void setOutCode(String[] outCode) {
		this.outCode = outCode;
	}
}
