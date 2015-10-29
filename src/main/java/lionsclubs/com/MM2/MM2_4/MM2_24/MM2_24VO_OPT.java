package lionsclubs.com.MM2.MM2_4.MM2_24;

import java.io.Serializable;
import egovframework.com.cmm.ComDefaultVO;

public class MM2_24VO_OPT extends ComDefaultVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String confIdnNo;
	private String confDate;
	public String getConfIdnNo() {
		return confIdnNo;
	}
	public void setConfIdnNo(String confIdnNo) {
		this.confIdnNo = confIdnNo;
	}
	public String getConfDate() {
		return confDate;
	}
	public void setConfDate(String confDate) {
		this.confDate = confDate;
	}

}
