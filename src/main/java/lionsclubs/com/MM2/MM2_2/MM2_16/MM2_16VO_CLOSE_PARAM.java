package lionsclubs.com.MM2.MM2_2.MM2_16;

import java.io.Serializable;
import egovframework.com.cmm.ComDefaultVO;

public class MM2_16VO_CLOSE_PARAM extends ComDefaultVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String organCode;
	private String startDate;
	private String endDate;
	
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
}
