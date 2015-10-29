package lionsclubs.com.main;

import java.io.Serializable;


public class AnniversaryInfoDataVO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String anniversaryDay;
	private String pmKindName;
	private String message;
	private String memberName;
	
	public String getAnniversaryDay() {
		return anniversaryDay;
	}
	public void setAnniversaryDay(String anniversaryDay) {
		this.anniversaryDay = anniversaryDay;
	}
	public String getPmKindName() {
		return pmKindName;
	}
	public void setPmKindName(String pmKindName) {
		this.pmKindName = pmKindName;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
}
