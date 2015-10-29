package lionsclubs.com.MM2.MM2_2.MM2_14;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_14VOINEX extends ComDefaultVO implements Serializable{
	private int idnNo;
	private String caYm;
	private String organCode;
	private String inexCode;
	private String inexDate;
	private String classItemCode;
	private String detailItemCode;
	private String amount;
	private int moneyIdnNo;			/* 수입/지출 테이블에 - MONEY 테이블의 idnNo값이 들어간다 */
	private String inexDesc;
	private String incomeInsert;
	
	private String unit;
	private String atandAmount;	
	
	private Date insertDate;	/* 생성일자 */
    private String insertName;	/* 생성자 */
    private Date updateDate;	/* 수정일자 */
    private String updateName;	/* 수정자 */
	
	
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
	public int getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(int idnNo) {
		this.idnNo = idnNo;
	}
	public String getCaYm() {
		return caYm;
	}
	public void setCaYm(String caYm) {
		this.caYm = caYm;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getInexCode() {
		return inexCode;
	}
	public void setInexCode(String inexCode) {
		this.inexCode = inexCode;
	}
	public String getInexDate() {
		return inexDate;
	}
	public void setInexDate(String inexDate) {
		if (inexDate == null || inexDate.trim().equals("")) {
			
		}else{
			inexDate = inexDate.replaceAll("\\.", "");
		}
		this.inexDate = inexDate;
	}
	
	public String getIncomeInsert() {
		return incomeInsert;
	}
	public void setIncomeInsert(String incomeInsert) {
		if (incomeInsert == null || incomeInsert.trim().equals("")) {
			
		}else{
			incomeInsert = incomeInsert.replaceAll("\\.", "");
		}
		this.incomeInsert = incomeInsert;
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
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getInexDesc() {
		return inexDesc;
	}
	public void setInexDesc(String inexDesc) {
		this.inexDesc = inexDesc;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public String getInsertName() {
		return insertName;
	}
	public void setInsertName(String insertName) {
		this.insertName = insertName;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateName() {
		return updateName;
	}
	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}
	public int getMoneyIdnNo() {
		return moneyIdnNo;
	}
	public void setMoneyIdnNo(int moneyIdnNo) {
		this.moneyIdnNo = moneyIdnNo;
	}
	
	
	
	
}
