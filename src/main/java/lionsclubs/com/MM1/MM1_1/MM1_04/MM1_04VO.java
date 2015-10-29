package lionsclubs.com.MM1.MM1_1.MM1_04;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM1_04VO extends ComDefaultVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String idnNo;
	private String memberNo;
	private String sanctionStartDate;
	private String sanctionEndDate;
	private String educationCode;
	private String educationName;
	private String kindCode;
	private String kindName;
	private String itemCode;
	private String itemName;
	private String awardGrantorCode;
	private String awardGrantorName;
	private String desc;
	
	private String insertName;
	private String updateName;
	private String insertDate;
	private String updateDate;
	private String menuId;
	
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getSanctionStartDate() {
		return sanctionStartDate;
	}
	public void setSanctionStartDate(String sanctionStartDate) {
		this.sanctionStartDate = sanctionStartDate;
	}
	public String getSanctionEndDate() {
		return sanctionEndDate;
	}
	public void setSanctionEndDate(String sanctionEndDate) {
		this.sanctionEndDate = sanctionEndDate;
	}
	public String getEducationCode() {
		return educationCode;
	}
	public void setEducationCode(String educationCode) {
		this.educationCode = educationCode;
	}
	public String getEducationName() {
		return educationName;
	}
	public void setEducationName(String educationName) {
		this.educationName = educationName;
	}
	public String getKindCode() {
		return kindCode;
	}
	public void setKindCode(String kindCode) {
		this.kindCode = kindCode;
	}
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getAwardGrantorCode() {
		return awardGrantorCode;
	}
	public void setAwardGrantorCode(String awardGrantorCode) {
		this.awardGrantorCode = awardGrantorCode;
	}
	public String getAwardGrantorName() {
		return awardGrantorName;
	}
	public void setAwardGrantorName(String awardGrantorName) {
		this.awardGrantorName = awardGrantorName;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
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
}
