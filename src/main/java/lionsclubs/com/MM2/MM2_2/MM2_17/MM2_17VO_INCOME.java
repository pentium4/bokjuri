package lionsclubs.com.MM2.MM2_2.MM2_17;

import java.io.Serializable;

public class MM2_17VO_INCOME implements Serializable{
	/**
	 * 수입항목 
	 */
	private static final long serialVersionUID = 1L;
	private String  classItemCode; 
	private Long amountSum; 
	private String  classItemCodeName;
	
	public String getClassItemCode() {
		return classItemCode;
	}
	public void setClassItemCode(String classItemCode) {
		this.classItemCode = classItemCode;
	}
	public Long getAmountSum() {
		return amountSum;
	}
	public void setAmountSum(Long amountSum) {
		this.amountSum = amountSum;
	}
	public String getClassItemCodeName() {
		return classItemCodeName;
	}
	public void setClassItemCodeName(String classItemCodeName) {
		this.classItemCodeName = classItemCodeName;
	} 
}
