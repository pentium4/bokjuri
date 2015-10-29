package lionsmobile.com.MM6.MM6_1.MM6_04;

import java.io.Serializable;

public class MM6_04VO_PARAM implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orgCode;
	private String yearCode;
	private String ageCode;
	private String menuName;
	
	
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
		this.setAgeCode(String.valueOf(Integer.parseInt(this.yearCode) - 1) + "-" + this.yearCode);
	}

	public String getAgeCode() {
		return ageCode;
	}
	public void setAgeCode(String ageCode) {
		this.ageCode = ageCode;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
}
