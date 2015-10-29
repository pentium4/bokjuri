package lionsclubs.com.MM2.MM2_2.MM2_17;

import java.io.Serializable;

public class MM2_17VO_PARAM implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String organCode;	/* 조직코드 */
	private String sessionYear;	/* 회기년도 */
	private String month;	/* 선택월   */
	private String caYm;
	private String insertId;	/* 입력자 회원번호 */
	private String updateId;	/* 수정자 회원번호 */
	private String confirmYn;
	
	private Long monthTotal; // 잔액
	private Long monthRemain;	// 잔액
	private Long depositTotal;	// 정기예금
	private Long notIncome1000Total;	// 회비미수금
	private Long notIncomeEtcTotal;	// 기타미수금
	
	private String yearCode;
	private String monthCode;
	private String confKindCode;
	private String confIdnNo;	
	
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getCaYm() {
		return caYm;
	}
	public void setCaYm(String caYm) {
		this.caYm = caYm;
	}
	public String getInsertId() {
		return insertId;
	}
	public void setInsertId(String insertId) {
		this.insertId = insertId;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	public String getConfirmYn() {
		return confirmYn;
	}
	public void setConfirmYn(String confirmYn) {
		this.confirmYn = confirmYn;
	}
	public Long getMonthTotal() {
		return monthTotal;
	}
	public void setMonthTotal(Long monthTotal) {
		this.monthTotal = monthTotal;
	}
	public Long getMonthRemain() {
		return monthRemain;
	}
	public void setMonthRemain(Long monthRemain) {
		this.monthRemain = monthRemain;
	}
	public Long getDepositTotal() {
		return depositTotal;
	}
	public void setDepositTotal(Long depositTotal) {
		this.depositTotal = depositTotal;
	}
	public Long getNotIncome1000Total() {
		return notIncome1000Total;
	}
	public void setNotIncome1000Total(Long notIncome1000Total) {
		this.notIncome1000Total = notIncome1000Total;
	}
	public Long getNotIncomeEtcTotal() {
		return notIncomeEtcTotal;
	}
	public void setNotIncomeEtcTotal(Long notIncomeEtcTotal) {
		this.notIncomeEtcTotal = notIncomeEtcTotal;
	}
	public String getYearCode() {
		return yearCode;
	}
	public void setYearCode(String yearCode) {
		this.yearCode = yearCode;
	}
	public String getMonthCode() {
		return monthCode;
	}
	public void setMonthCode(String monthCode) {
		this.monthCode = monthCode;
	}
	public String getConfKindCode() {
		return confKindCode;
	}
	public void setConfKindCode(String confKindCode) {
		this.confKindCode = confKindCode;
	}
	public String getConfIdnNo() {
		return confIdnNo;
	}
	public void setConfIdnNo(String confIdnNo) {
		this.confIdnNo = confIdnNo;
	}
}
