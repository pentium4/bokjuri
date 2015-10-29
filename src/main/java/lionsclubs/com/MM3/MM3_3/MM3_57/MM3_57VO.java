package lionsclubs.com.MM3.MM3_3.MM3_57;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_57VO extends ComDefaultVO implements Serializable{
	private String organCode;	/* 조직코드 */
	private String sessionYear;	/* 회기년도 */
	private String order = "1";	// 1: 클럽코드순 2: 정산년월순
	
	private String organName;	/* 조직명 */
	private String caYm;	/* 정산년월 */	
	private String confirmDate;	/* 정산일자 */
	private String confirmCount;	/* 정산카운트 */
	private String confirmLockDate;	/* 정산확정일자 */
	
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
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
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
	public String getConfirmLockDate() {
		return confirmLockDate;
	}
	public void setConfirmLockDate(String confirmLockDate) {
		this.confirmLockDate = confirmLockDate;
	}
}
