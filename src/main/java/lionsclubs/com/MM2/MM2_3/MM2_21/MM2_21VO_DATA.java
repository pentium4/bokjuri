package lionsclubs.com.MM2.MM2_3.MM2_21;

import java.io.Serializable;

public class MM2_21VO_DATA implements Serializable{
	private static final long serialVersionUID = 1L;
	private String classItemCodeA;
	private String detailItemCodeA;
	private Long budgetAmountA;
	private Long realAmountA;
	private String classItemNameA;
	private String detailItemNameA;
	private Long subtractAmountA;
	private String moneyIdnNoA;
	private String classItemCodeB;
	private String detailItemCodeB;
	private Long budgetAmountB;
	private Long realAmountB;
	private String classItemNameB;
	private String detailItemNameB;
	private Long subtractAmountB;
	private String moneyIdnNoB;
	
	public MM2_21VO_DATA() {
		super();
		this.setBudgetAmountA(0L);
		this.setBudgetAmountB(0L);
		this.setRealAmountA(0L);
		this.setRealAmountB(0L);		
		this.setSubtractAmountA(0L);
		this.setSubtractAmountB(0L);
	}

	public String getClassItemCodeA() {
		return classItemCodeA;
	}

	public void setClassItemCodeA(String classItemCodeA) {
		this.classItemCodeA = classItemCodeA;
	}

	public String getDetailItemCodeA() {
		return detailItemCodeA;
	}

	public void setDetailItemCodeA(String detailItemCodeA) {
		this.detailItemCodeA = detailItemCodeA;
	}

	public Long getBudgetAmountA() {
		return budgetAmountA;
	}

	public void setBudgetAmountA(Long budgetAmountA) {
		this.budgetAmountA = budgetAmountA;
	}

	public Long getRealAmountA() {
		return realAmountA;
	}

	public void setRealAmountA(Long realAmountA) {
		this.realAmountA = realAmountA;
	}

	public String getClassItemNameA() {
		return classItemNameA;
	}

	public void setClassItemNameA(String classItemNameA) {
		this.classItemNameA = classItemNameA;
	}

	public String getDetailItemNameA() {
		return detailItemNameA;
	}

	public void setDetailItemNameA(String detailItemNameA) {
		this.detailItemNameA = detailItemNameA;
	}

	public Long getSubtractAmountA() {
		return subtractAmountA;
	}

	public void setSubtractAmountA(Long subtractAmountA) {
		this.subtractAmountA = subtractAmountA;
	}

	public String getMoneyIdnNoA() {
		return moneyIdnNoA;
	}

	public void setMoneyIdnNoA(String moneyIdnNoA) {
		this.moneyIdnNoA = moneyIdnNoA;
	}

	public String getClassItemCodeB() {
		return classItemCodeB;
	}

	public void setClassItemCodeB(String classItemCodeB) {
		this.classItemCodeB = classItemCodeB;
	}

	public String getDetailItemCodeB() {
		return detailItemCodeB;
	}

	public void setDetailItemCodeB(String detailItemCodeB) {
		this.detailItemCodeB = detailItemCodeB;
	}

	public Long getBudgetAmountB() {
		return budgetAmountB;
	}

	public void setBudgetAmountB(Long budgetAmountB) {
		this.budgetAmountB = budgetAmountB;
	}

	public Long getRealAmountB() {
		return realAmountB;
	}

	public void setRealAmountB(Long realAmountB) {
		this.realAmountB = realAmountB;
	}

	public String getClassItemNameB() {
		return classItemNameB;
	}

	public void setClassItemNameB(String classItemNameB) {
		this.classItemNameB = classItemNameB;
	}

	public String getDetailItemNameB() {
		return detailItemNameB;
	}

	public void setDetailItemNameB(String detailItemNameB) {
		this.detailItemNameB = detailItemNameB;
	}

	public Long getSubtractAmountB() {
		return subtractAmountB;
	}

	public void setSubtractAmountB(Long subtractAmountB) {
		this.subtractAmountB = subtractAmountB;
	}

	public String getMoneyIdnNoB() {
		return moneyIdnNoB;
	}

	public void setMoneyIdnNoB(String moneyIdnNoB) {
		this.moneyIdnNoB = moneyIdnNoB;
	}
}

