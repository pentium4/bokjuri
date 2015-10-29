package lionsclubs.com.MM2.MM2_1.MM2_02;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_02VO extends ComDefaultVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idnNo;       //번호
	private String organCode;//조직 코드
	private String sisterhoodDate;
	
	private String allianceKind;
	private String locationArea;
	private String event;
	private String score;
	private String insertDate;
	private String insertName;
	private String updateDate;
	private String updateName;
	
	private String allinceCode;
	private String rnum;
	private String termYear;
	private String order = "1";	
	private String orderSisterhoodDate;
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public int getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(int idnNo) {
		this.idnNo = idnNo;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getSisterhoodDate() {
		return sisterhoodDate;
	}
	public void setSisterhoodDate(String sisterhoodDate) {
		this.sisterhoodDate = sisterhoodDate;
	}
	public String getAllianceKind() {
		return allianceKind;
	}
	public void setAllianceKind(String allianceKind) {
		this.allianceKind = allianceKind;
	}
	public String getLocationArea() {
		return locationArea;
	}
	public void setLocationArea(String locationArea) {
		this.locationArea = locationArea;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getInsertName() {
		return insertName;
	}
	public void setInsertName(String insertName) {
		this.insertName = insertName;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateName() {
		return updateName;
	}
	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}
	public String getAllinceCode() {
		return allinceCode;
	}
	public void setAllinceCode(String allinceCode) {
		this.allinceCode = allinceCode;
	}
	public String getTermYear() {
		return termYear;
	}
	public void setTermYear(String termYear) {
		this.termYear = termYear;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getOrderSisterhoodDate() {
		return orderSisterhoodDate;
	}
	public void setOrderSisterhoodDate(String orderSisterhoodDate) {
		this.orderSisterhoodDate = orderSisterhoodDate;
	}

					
}
