package lionsclubs.com.MM2.MM2_4.MM2_24;

import java.io.Serializable;

public class MM2_24VO_CONF_INFO_UPDATE implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String updateYearCode;
	private String updateMonthCode;
	private String updateOrganCode;
	private String updateConfKindCode;
	private Integer updateConfIdnNo;
	private String updateConfDate;
	private String updateConfPlaceCode;
	private String updateConfTime;
	private String updateAttendPerson;
	private String updateConfDesc;
	private String memberNo;
	
	public String getUpdateYearCode() {
		return updateYearCode;
	}
	public void setUpdateYearCode(String updateYearCode) {
		this.updateYearCode = updateYearCode;
	}
	public String getUpdateMonthCode() {
		return updateMonthCode;
	}
	public void setUpdateMonthCode(String updateMonthCode) {
		this.updateMonthCode = updateMonthCode;
	}
	public String getUpdateOrganCode() {
		return updateOrganCode;
	}
	public void setUpdateOrganCode(String updateOrganCode) {
		this.updateOrganCode = updateOrganCode;
	}
	public String getUpdateConfKindCode() {
		return updateConfKindCode;
	}
	public void setUpdateConfKindCode(String updateConfKindCode) {
		this.updateConfKindCode = updateConfKindCode;
	}
	public Integer getUpdateConfIdnNo() {
		return updateConfIdnNo;
	}
	public void setUpdateConfIdnNo(Integer updateConfIdnNo) {
		this.updateConfIdnNo = updateConfIdnNo;
	}
	public String getUpdateConfDate() {
		return updateConfDate;
	}
	public void setUpdateConfDate(String updateConfDate) {
		this.updateConfDate = updateConfDate.replace(".", "");
	}
	public String getUpdateConfPlaceCode() {
		return updateConfPlaceCode;
	}
	public void setUpdateConfPlaceCode(String updateConfPlaceCode) {
		this.updateConfPlaceCode = updateConfPlaceCode;
	}
	public String getUpdateConfTime() {
		return updateConfTime;
	}
	public void setUpdateConfTime(String updateConfTime) {
		this.updateConfTime = updateConfTime;
	}
	public String getUpdateAttendPerson() {
		return updateAttendPerson;
	}
	public void setUpdateAttendPerson(String updateAttendPerson) {
		this.updateAttendPerson = updateAttendPerson;
	}
	public String getUpdateConfDesc() {
		return updateConfDesc;
	}
	public void setUpdateConfDesc(String updateConfDesc) {
		this.updateConfDesc = updateConfDesc;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	

}
