package lionsclubs.com.MM4.MM4_1.MM4_02;

import java.io.Serializable;

public class MM4_02VO_PARAM implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orgCode;
	private String yearCode;
	private String lvl;
	private String ageCode;

	
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
		setAgeCode(String.valueOf(Integer.parseInt(this.yearCode) - 1) + "-" + String.valueOf(Integer.parseInt(this.yearCode) - 0));
	}
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
	}
	public String getAgeCode() {
		return ageCode;
	}
	public void setAgeCode(String ageCode) {
		this.ageCode = ageCode;
	}
}
