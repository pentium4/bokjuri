package lionsclubs.com.MM3.MM3_11.MM3_42;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_42VO extends ComDefaultVO implements Serializable{
	private String sessionYear;	/* 회기년도 */
	private String organCode;	/* 조직코드 */
	private String accountKind;	/* 회계구분 : 1000 - 일반회계, 1010 - 특별회계, 1020 - 기타 */
	
	private String incomeType;
	private String incomeClassItemCode;
	private String incomeDetailItemCode;
	private String incomeDetailItemName;
	private String incomeBudgetAmount;
	private String incomeRealAmount;
	private String incomeBal;
	private String expendType;
	private String expendClassItemCode;
	private String expendDetailItemCode;
	private String expendDetailItemName;
	private String expendBudgetAmount;
	private String expendRealAmount;
	private String expendBal;
	
	private String prevSessionYearAmount;	/* 전년도이월금 */
	private String confirmDate;	/* 정산일 */
	private String confirmYn;	/* 정산여부 */
	private String confirmLockDate;	/* 정산확정일 */
	private String confirmLockYn;	/* 정산확정여부 */
	private String confirmCount;	/* 정산횟수 */
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
	public String getAccountKind() {
		return accountKind;
	}
	public void setAccountKind(String accountKind) {
		this.accountKind = accountKind;
	}
	public String getIncomeType() {
		return incomeType;
	}
	public void setIncomeType(String incomeType) {
		this.incomeType = incomeType;
	}
	public String getIncomeClassItemCode() {
		return incomeClassItemCode;
	}
	public void setIncomeClassItemCode(String incomeClassItemCode) {
		this.incomeClassItemCode = incomeClassItemCode;
	}
	public String getIncomeDetailItemCode() {
		return incomeDetailItemCode;
	}
	public void setIncomeDetailItemCode(String incomeDetailItemCode) {
		this.incomeDetailItemCode = incomeDetailItemCode;
	}
	public String getIncomeDetailItemName() {
		return incomeDetailItemName;
	}
	public void setIncomeDetailItemName(String incomeDetailItemName) {
		this.incomeDetailItemName = incomeDetailItemName;
	}
	public String getIncomeBudgetAmount() {
		return incomeBudgetAmount;
	}
	public void setIncomeBudgetAmount(String incomeBudgetAmount) {
		this.incomeBudgetAmount = incomeBudgetAmount;
	}
	public String getIncomeRealAmount() {
		return incomeRealAmount;
	}
	public void setIncomeRealAmount(String incomeRealAmount) {
		this.incomeRealAmount = incomeRealAmount;
	}
	public String getIncomeBal() {
		return incomeBal;
	}
	public void setIncomeBal(String incomeBal) {
		this.incomeBal = incomeBal;
	}
	public String getExpendType() {
		return expendType;
	}
	public void setExpendType(String expendType) {
		this.expendType = expendType;
	}
	public String getExpendClassItemCode() {
		return expendClassItemCode;
	}
	public void setExpendClassItemCode(String expendClassItemCode) {
		this.expendClassItemCode = expendClassItemCode;
	}
	public String getExpendDetailItemCode() {
		return expendDetailItemCode;
	}
	public void setExpendDetailItemCode(String expendDetailItemCode) {
		this.expendDetailItemCode = expendDetailItemCode;
	}
	public String getExpendDetailItemName() {
		return expendDetailItemName;
	}
	public void setExpendDetailItemName(String expendDetailItemName) {
		this.expendDetailItemName = expendDetailItemName;
	}
	public String getExpendBudgetAmount() {
		return expendBudgetAmount;
	}
	public void setExpendBudgetAmount(String expendBudgetAmount) {
		this.expendBudgetAmount = expendBudgetAmount;
	}
	public String getExpendRealAmount() {
		return expendRealAmount;
	}
	public void setExpendRealAmount(String expendRealAmount) {
		this.expendRealAmount = expendRealAmount;
	}
	public String getExpendBal() {
		return expendBal;
	}
	public void setExpendBal(String expendBal) {
		this.expendBal = expendBal;
	}
	public String getPrevSessionYearAmount() {
		return prevSessionYearAmount;
	}
	public void setPrevSessionYearAmount(String prevSessionYearAmount) {
		this.prevSessionYearAmount = prevSessionYearAmount;
	}
	public String getConfirmDate() {
		return confirmDate;
	}
	public void setConfirmDate(String confirmDate) {
		this.confirmDate = confirmDate;
	}
	public String getConfirmYn() {
		return confirmYn;
	}
	public void setConfirmYn(String confirmYn) {
		this.confirmYn = confirmYn;
	}
	public String getConfirmLockDate() {
		return confirmLockDate;
	}
	public void setConfirmLockDate(String confirmLockDate) {
		this.confirmLockDate = confirmLockDate;
	}
	public String getConfirmLockYn() {
		return confirmLockYn;
	}
	public void setConfirmLockYn(String confirmLockYn) {
		this.confirmLockYn = confirmLockYn;
	}
	public String getConfirmCount() {
		return confirmCount;
	}
	public void setConfirmCount(String confirmCount) {
		this.confirmCount = confirmCount;
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
