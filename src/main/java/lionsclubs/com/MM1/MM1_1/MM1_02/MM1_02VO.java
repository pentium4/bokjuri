package lionsclubs.com.MM1.MM1_1.MM1_02;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM1_02VO extends ComDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/*
	 * 개인기념일 관리
	 */
	private int idnNo;
	private String memberNo;
	private String anniversaryDay;
	private String pmKind;			/* 음력 : M, 양력 : P */
	private String pmKindName;
	private String kindCode;
	private String kindName;
	private String message;
	private String time;
	private String dayAgo;
	private String number;
	
	private String insertName;
	private String updateName;
	private String insertDate;
	private String updateDate;
	private String menuId;
	
	
	
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
	public int getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(int idnNo) {
		this.idnNo = idnNo;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getInsertName() {
		return insertName;
	}
	public void setInsertName(String insertName) {
		this.insertName = insertName;
	}
	public String getUpdateName() {
		return updateName;
	}
	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getAnniversaryDay() {
		return anniversaryDay;
	}
	public void setAnniversaryDay(String anniversaryDay) {
		if (anniversaryDay == null || anniversaryDay.trim().equals("")) {
			
		}else{
			anniversaryDay = anniversaryDay.replaceAll("\\.", "");
		}
		this.anniversaryDay = anniversaryDay;
	}	
	public String getPmKind() {
		return pmKind;
	}
	public void setPmKind(String pmKind) {
		this.pmKind = pmKind;
	}
	
	public String getPmKindName() {
		return pmKindName;
	}
	public void setPmKindName(String pmKindName) {
		this.pmKindName = pmKindName;
	}
	public String getKindCode() {
		return kindCode;
	}
	public void setKindCode(String kindCode) {
		this.kindCode = kindCode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDayAgo() {
		return dayAgo;
	}
	public void setDayAgo(String dayAgo) {
		this.dayAgo = dayAgo;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	
	
	

}
