package lionsclubs.com.MM2.MM2_2.MM2_34;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_34VO extends ComDefaultVO implements Serializable{
	private String organCode;	/* 조직코드 */
	private String sessionYear;
	private String month;

	private String detailItemName;	/* 세부항목명 */
    private String plusItemCode;	/*  */
    
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDetailItemName() {
		return detailItemName;
	}
	public void setDetailItemName(String detailItemName) {
		this.detailItemName = detailItemName;
	}
	public String getPlusItemCode() {
		return plusItemCode;
	}
	public void setPlusItemCode(String plusItemCode) {
		this.plusItemCode = plusItemCode;
	}
}
