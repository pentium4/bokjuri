package lionsclubs.com.MM4.MM4_2.MM4_10;

import java.io.Serializable;

public class MM4_10VO_ORG implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String orgCode		;
	private String orgName		;
	private String orgMeeting	;
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getOrgMeeting() {
		return orgMeeting;
	}
	public void setOrgMeeting(String orgMeeting) {
		this.orgMeeting = orgMeeting;
	}
}
