package lionsclubs.com.MM2.MM2_2.MM2_15;

import java.io.Serializable;
import egovframework.com.cmm.ComDefaultVO;

public class MM2_15VO_CLOSE_PARAM extends ComDefaultVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String organCode;
	private String strDate;
	
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getStrDate() {
		return strDate;
	}
	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}
}
