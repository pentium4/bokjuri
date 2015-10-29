package lionsclubs.com.MM3.MM3_12.MM3_53;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_53VO extends ComDefaultVO implements Serializable{
	private String organCode;	/* 조직코드 */
	private String sessionYear;
	private String month;
	
	private String detailItemName;
	private String clubName;
	private String plusItemCode;
	
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
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getPlusItemCode() {
		return plusItemCode;
	}
	public void setPlusItemCode(String plusItemCode) {
		this.plusItemCode = plusItemCode;
	}
}
