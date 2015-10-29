package lionsclubs.com.MM3.MM3_12.MM3_48;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_48VO extends ComDefaultVO implements Serializable{
	private String sessionYear;	/* 회기년도 */
	private String organCode;	/* 조직코드 */
	private String order = "1";	/* 조회구분 : 1-세부항목별, 2-금액순 */
	
	private String idnNo;	/* 번호 */
	private String divisionCode;	/* 예산/실적 구분 코드 : 1020 - 예산, 1030 - 실적 */
	private String incomeDate;	/* 수입일자 */
	private String classItemCode;	/* 수입예산 분류항목 코드 */
	private String classItemName;	/* 수입예산 분류항목명 */
	private String detailItemCode;	/* 수입예산 세부항목 코드 */
	private String detailItemName;	/* 수입예산 세부항목명 */
	private String desc;	/* 산출근거 */
	private String unit; /* 금액 */
	private String atandAmount; /* 기준금액 */
	private String amount; /* 금액 */
	private String insertDate;	/* 생성일자 */
	private String insertName;	/* 생성자 */
	private String updateDate;	/* 수정일자 */
	private String updateName;	/* 수정자 */
	
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getDivisionCode() {
		return divisionCode;
	}
	public void setDivisionCode(String divisionCode) {
		this.divisionCode = divisionCode;
	}
	public String getIncomeDate() {
		return incomeDate;
	}
	public void setIncomeDate(String incomeDate) {
		this.incomeDate = incomeDate;
	}
	public String getClassItemCode() {
		return classItemCode;
	}
	public void setClassItemCode(String classItemCode) {
		this.classItemCode = classItemCode;
	}
	public String getClassItemName() {
		return classItemName;
	}
	public void setClassItemName(String classItemName) {
		this.classItemName = classItemName;
	}
	public String getDetailItemCode() {
		return detailItemCode;
	}
	public void setDetailItemCode(String detailItemCode) {
		this.detailItemCode = detailItemCode;
	}
	public String getDetailItemName() {
		return detailItemName;
	}
	public void setDetailItemName(String detailItemName) {
		this.detailItemName = detailItemName;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getAtandAmount() {
		return atandAmount;
	}
	public void setAtandAmount(String atandAmount) {
		this.atandAmount = atandAmount;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
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
}
