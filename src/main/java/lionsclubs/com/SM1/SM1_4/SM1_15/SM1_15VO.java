package lionsclubs.com.SM1.SM1_4.SM1_15;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class SM1_15VO extends ComDefaultVO implements Serializable {
	private String organCode;
	private String sessionYear;
	private String month;
	
	private String caYm;	/* 회기년월 */
	private String confirmDate;	/* 정산일 */
	private String confirmCount;	/* 정산횟수 */
	private String confirmYn;	/* 정산여부 */
	private String monthTotal;	/* 이월총잔액 */
	private String monthRemain;	/* 이월잔액 */
	private String depositTotal;	/* 이월정기예금 */
	private String notIncome1000Total;	/* 이월회비미수금 */
	private String notIncomeEtcTotal;	/* 이월기타미수금 */
	private String confirmLockYn;	/* 정산확정여부 */
	private String confirmLockDate;	/* 정산확정일 */
	private String insertDate;	/* 생성일자 */
	private String insertName;	/* 생성자 */
	private String updateDate;	/* 수정일자 */
	private String updateName;	/* 수정자 */	
	
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
	public String getConfirmDate() {
		return confirmDate;
	}
	public void setConfirmDate(String confirmDate) {
		this.confirmDate = confirmDate;
	}
	public String getConfirmCount() {
		return confirmCount;
	}
	public void setConfirmCount(String confirmCount) {
		this.confirmCount = confirmCount;
	}
	public String getConfirmYn() {
		return confirmYn;
	}
	public void setConfirmYn(String confirmYn) {
		this.confirmYn = confirmYn;
	}
	public String getMonthTotal() {
		return monthTotal;
	}
	public void setMonthTotal(String monthTotal) {
		this.monthTotal = monthTotal;
	}
	public String getMonthRemain() {
		return monthRemain;
	}
	public void setMonthRemain(String monthRemain) {
		this.monthRemain = monthRemain;
	}
	public String getDepositTotal() {
		return depositTotal;
	}
	public void setDepositTotal(String depositTotal) {
		this.depositTotal = depositTotal;
	}
	public String getNotIncome1000Total() {
		return notIncome1000Total;
	}
	public void setNotIncome1000Total(String notIncome1000Total) {
		this.notIncome1000Total = notIncome1000Total;
	}
	public String getNotIncomeEtcTotal() {
		return notIncomeEtcTotal;
	}
	public void setNotIncomeEtcTotal(String notIncomeEtcTotal) {
		this.notIncomeEtcTotal = notIncomeEtcTotal;
	}
	public String getConfirmLockYn() {
		return confirmLockYn;
	}
	public void setConfirmLockYn(String confirmLockYn) {
		this.confirmLockYn = confirmLockYn;
	}
	public String getConfirmLockDate() {
		return confirmLockDate;
	}
	public void setConfirmLockDate(String confirmLockDate) {
		this.confirmLockDate = confirmLockDate;
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

