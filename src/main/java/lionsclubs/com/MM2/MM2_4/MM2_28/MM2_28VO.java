package lionsclubs.com.MM2.MM2_4.MM2_28;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_28VO extends ComDefaultVO implements Serializable{
	private String organCode;
	private String sessionYear;
	private String month;
	private String classItemCode;
	private String detailItemName;
	private String plusItemCode;
	private String defectGubun;	// 결손구분	- 1 : 월회비, 2 : 클럽결손금, 3 : 약정금/임원분담금, 4 : 전체
	private String debtKind;	// 미수금구분 - 1 : 회비미수금, 2 : 기타미수금
	
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
	public String getClassItemCode() {
		return classItemCode;
	}
	public void setClassItemCode(String classItemCode) {
		this.classItemCode = classItemCode;
	}
	public String getDetailItemName() {
		return detailItemName;
	}
	public void setDetailItemName(String detailItemName) {
		this.detailItemName = detailItemName;
	}
	public String getPlusItemCode() {
		return plusItemCode;
	}
	public void setPlusItemCode(String plusItemCode) {
		this.plusItemCode = plusItemCode;
	}
	public String getDefectGubun() {
		return defectGubun;
	}
	public void setDefectGubun(String defectGubun) {
		this.defectGubun = defectGubun;
	}
	public String getDebtKind() {
		return debtKind;
	}
	public void setDebtKind(String debtKind) {
		this.debtKind = debtKind;
	}
}
