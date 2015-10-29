package lionsclubs.com.MM3.MM3_12.MM3_51;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_51VO extends ComDefaultVO implements Serializable{
	private String sessionYear;
	private String idnNo;	/* 번호 */
	private String organCode;	/* 조직코드 */
	private String order;
	
	private String kindCode;	/* 예금구분코드 */
	private String kindName;	/* 예금구분명 */
	private String startDate;	/* 예금시작일 */
	private String endDate;	/* 예금종료일 */
	private String amount;	/* 예금액 */
	private String expireAmount;	/* 만기금액 */
	private String financialIns;	/* 금융기관 */
	private String holder;	/* 예금주 */
	private String withdrawYn;	/* 출금여부 */
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
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getExpireAmount() {
		return expireAmount;
	}
	public void setExpireAmount(String expireAmount) {
		this.expireAmount = expireAmount;
	}
	public String getFinancialIns() {
		return financialIns;
	}
	public void setFinancialIns(String financialIns) {
		this.financialIns = financialIns;
	}
	public String getHolder() {
		return holder;
	}
	public void setHolder(String holder) {
		this.holder = holder;
	}
	public String getWithdrawYn() {
		return withdrawYn;
	}
	public void setWithdrawYn(String withdrawYn) {
		this.withdrawYn = withdrawYn;
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
