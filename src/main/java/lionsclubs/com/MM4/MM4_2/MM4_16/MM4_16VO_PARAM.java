package lionsclubs.com.MM4.MM4_2.MM4_16;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM4_16VO_PARAM extends ComDefaultVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orgCode;
	private String yearCode;
	private String lvl;
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
	}
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
	}
	public String[] getOutCode() {
		return outCode;
	}
	public void setOutCode(String[] outCode) {
		this.outCode = outCode;
	}

}
