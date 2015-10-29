package lionsclubs.com.MM2.MM2_3.MM2_22;

import java.io.Serializable;

public class MM2_22VO_DATA implements Serializable{
	private static final long serialVersionUID = 1L;
	private String classItemCode;
	private String detailItemCode;
	private Long budgetAmount;
	private Long realAmount;
	private String classItemName;
	private String detailItemName;
	private Long subtractAmount;
	private String moneyIdnNo;
	
	public MM2_22VO_DATA() {
		super();
		this.setBudgetAmount(0L);
		this.setBudgetAmount(0L);
		this.setRealAmount(0L);
	}

	public String getClassItemCode() {
		return classItemCode;
	}

	public void setClassItemCode(String classItemCode) {
		this.classItemCode = classItemCode;
	}

	public String getDetailItemCode() {
		return detailItemCode;
	}

	public void setDetailItemCode(String detailItemCode) {
		this.detailItemCode = detailItemCode;
	}

	public Long getBudgetAmount() {
		return budgetAmount;
	}

	public void setBudgetAmount(Long budgetAmount) {
		this.budgetAmount = budgetAmount;
	}

	public Long getRealAmount() {
		return realAmount;
	}

	public void setRealAmount(Long realAmount) {
		this.realAmount = realAmount;
	}

	public String getClassItemName() {
		return classItemName;
	}

	public void setClassItemName(String classItemName) {
		this.classItemName = classItemName;
	}

	public String getDetailItemName() {
		return detailItemName;
	}

	public void setDetailItemName(String detailItemName) {
		this.detailItemName = detailItemName;
	}

	public Long getSubtractAmount() {
		return subtractAmount;
	}

	public void setSubtractAmount(Long subtractAmount) {
		this.subtractAmount = subtractAmount;
	}

	public String getMoneyIdnNo() {
		return moneyIdnNo;
	}

	public void setMoneyIdnNo(String moneyIdnNo) {
		this.moneyIdnNo = moneyIdnNo;
	}
}

