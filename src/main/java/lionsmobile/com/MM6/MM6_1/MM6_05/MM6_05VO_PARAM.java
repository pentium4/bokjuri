package lionsmobile.com.MM6.MM6_1.MM6_05;

import java.io.Serializable;

public class MM6_05VO_PARAM implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orgCode;
	private String yearCode;
	private String fromDate;
	private String toDate;
	private String districtCode;
	
	
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
		this.setFromDate(String.valueOf(Integer.parseInt(this.yearCode) - 1) + "0701");
		this.setToDate(String.valueOf(Integer.parseInt(this.yearCode) - 0) + "0630");
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
	public String getDistrictCode() {
		return districtCode;
	}
	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}
}
