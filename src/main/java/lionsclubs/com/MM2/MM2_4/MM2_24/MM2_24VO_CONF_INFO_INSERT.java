package lionsclubs.com.MM2.MM2_4.MM2_24;

import java.io.Serializable;

public class MM2_24VO_CONF_INFO_INSERT implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String insertYearCode;
	private String insertMonthCode;
	private String insertOrganCode;
	private String insertConfKindCode;
	private Integer insertConfIdnNo;
	private String insertConfDate;
	private String insertConfPlaceCode;
	private String insertConfTime;
	private String insertAttendPerson;
	private String insertConfDesc;
	private String memberNo;
	
	public String getInsertYearCode() {
		return insertYearCode;
	}
	public void setInsertYearCode(String insertYearCode) {
		this.insertYearCode = insertYearCode;
	}
	public String getInsertMonthCode() {
		return insertMonthCode;
	}
	public void setInsertMonthCode(String insertMonthCode) {
		this.insertMonthCode = insertMonthCode;
	}
	public String getInsertOrganCode() {
		return insertOrganCode;
	}
	public void setInsertOrganCode(String insertOrganCode) {
		this.insertOrganCode = insertOrganCode;
	}
	public String getInsertConfKindCode() {
		return insertConfKindCode;
	}
	public void setInsertConfKindCode(String insertConfKindCode) {
		this.insertConfKindCode = insertConfKindCode;
	}
	public Integer getInsertConfIdnNo() {
		return insertConfIdnNo;
	}
	public void setInsertConfIdnNo(Integer insertConfIdnNo) {
		this.insertConfIdnNo = insertConfIdnNo;
	}
	public String getInsertConfDate() {
		return insertConfDate;
	}
	public void setInsertConfDate(String insertConfDate) {
		this.insertConfDate = insertConfDate.replace(".", "");
	}
	public String getInsertConfPlaceCode() {
		return insertConfPlaceCode;
	}
	public void setInsertConfPlaceCode(String insertConfPlaceCode) {
		this.insertConfPlaceCode = insertConfPlaceCode;
	}
	public String getInsertConfTime() {
		return insertConfTime;
	}
	public void setInsertConfTime(String insertConfTime) {
		this.insertConfTime = insertConfTime;
	}
	public String getInsertAttendPerson() {
		return insertAttendPerson;
	}
	public void setInsertAttendPerson(String insertAttendPerson) {
		this.insertAttendPerson = insertAttendPerson;
	}
	public String getInsertConfDesc() {
		return insertConfDesc;
	}
	public void setInsertConfDesc(String insertConfDesc) {
		this.insertConfDesc = insertConfDesc;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	

}
