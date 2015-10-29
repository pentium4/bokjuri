package lionsclubs.com.MM1.MM1_3.MM1_19;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM1_19VO extends ComDefaultVO implements Serializable {
	private String organCode;	/* 클럽코드 */
	private String sessionYear;	/* 회기선택 */
	private String order = "1";	/* 미처리순 : 1, 미승인순 : 2, 클럽순 : 3, 클럽명순 : 4 */
	private String organName;	/* 클럽명 */
	private String newTotalCnt;	/* 신입회원 입력 */
	private String newApproveCnt;	/* 신입회원 승인 */
	private String newTreatmentCnt;	/* 신입회원 처리 */
	private String newUnTreatmentCnt;	/* 신입회원 미처리 */
	private String retireTotalCnt;	/* 퇴회회원 입력 */
	private String retireApproveCnt;	/* 퇴회회원 승인 */
	private String retireTreatmentCnt;	/* 퇴회회원 처리 */
	private String retireUnTreatmentCnt;	/* 퇴회회원 미처리 */
	private String moveinTotalCnt;	/* 전입회원 입력 */
	private String moveinApproveCnt;	/* 전입회원 승인 */
	private String moveinTreatmentCnt;	/* 전입회원 처리 */
	private String moveinUnTreatmentCnt;	/* 전입회원 미처리 */
	private String reinductTotalCnt;	/* 재입회회원 입력 */
	private String reinductApproveCnt;	/* 재입회회원 승인 */
	private String reinductTreatmentCnt;	/* 재입회회원 처리 */
	private String reinductUnTreatmentCnt;	/* 재입회회원 미처리 */	
	private String totalUnTreatment;	/* 전체 미처리 */
	
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
	public String getNewTotalCnt() {
		return newTotalCnt;
	}
	public void setNewTotalCnt(String newTotalCnt) {
		this.newTotalCnt = newTotalCnt;
	}
	public String getNewApproveCnt() {
		return newApproveCnt;
	}
	public void setNewApproveCnt(String newApproveCnt) {
		this.newApproveCnt = newApproveCnt;
	}
	public String getNewTreatmentCnt() {
		return newTreatmentCnt;
	}
	public void setNewTreatmentCnt(String newTreatmentCnt) {
		this.newTreatmentCnt = newTreatmentCnt;
	}
	public String getNewUnTreatmentCnt() {
		return newUnTreatmentCnt;
	}
	public void setNewUnTreatmentCnt(String newUnTreatmentCnt) {
		this.newUnTreatmentCnt = newUnTreatmentCnt;
	}
	public String getRetireTotalCnt() {
		return retireTotalCnt;
	}
	public void setRetireTotalCnt(String retireTotalCnt) {
		this.retireTotalCnt = retireTotalCnt;
	}
	public String getRetireApproveCnt() {
		return retireApproveCnt;
	}
	public void setRetireApproveCnt(String retireApproveCnt) {
		this.retireApproveCnt = retireApproveCnt;
	}
	public String getRetireTreatmentCnt() {
		return retireTreatmentCnt;
	}
	public void setRetireTreatmentCnt(String retireTreatmentCnt) {
		this.retireTreatmentCnt = retireTreatmentCnt;
	}
	public String getRetireUnTreatmentCnt() {
		return retireUnTreatmentCnt;
	}
	public void setRetireUnTreatmentCnt(String retireUnTreatmentCnt) {
		this.retireUnTreatmentCnt = retireUnTreatmentCnt;
	}
	public String getMoveinTotalCnt() {
		return moveinTotalCnt;
	}
	public void setMoveinTotalCnt(String moveinTotalCnt) {
		this.moveinTotalCnt = moveinTotalCnt;
	}
	public String getMoveinApproveCnt() {
		return moveinApproveCnt;
	}
	public void setMoveinApproveCnt(String moveinApproveCnt) {
		this.moveinApproveCnt = moveinApproveCnt;
	}
	public String getMoveinTreatmentCnt() {
		return moveinTreatmentCnt;
	}
	public void setMoveinTreatmentCnt(String moveinTreatmentCnt) {
		this.moveinTreatmentCnt = moveinTreatmentCnt;
	}
	public String getMoveinUnTreatmentCnt() {
		return moveinUnTreatmentCnt;
	}
	public void setMoveinUnTreatmentCnt(String moveinUnTreatmentCnt) {
		this.moveinUnTreatmentCnt = moveinUnTreatmentCnt;
	}
	public String getReinductTotalCnt() {
		return reinductTotalCnt;
	}
	public void setReinductTotalCnt(String reinductTotalCnt) {
		this.reinductTotalCnt = reinductTotalCnt;
	}
	public String getReinductApproveCnt() {
		return reinductApproveCnt;
	}
	public void setReinductApproveCnt(String reinductApproveCnt) {
		this.reinductApproveCnt = reinductApproveCnt;
	}
	public String getReinductTreatmentCnt() {
		return reinductTreatmentCnt;
	}
	public void setReinductTreatmentCnt(String reinductTreatmentCnt) {
		this.reinductTreatmentCnt = reinductTreatmentCnt;
	}
	public String getReinductUnTreatmentCnt() {
		return reinductUnTreatmentCnt;
	}
	public void setReinductUnTreatmentCnt(String reinductUnTreatmentCnt) {
		this.reinductUnTreatmentCnt = reinductUnTreatmentCnt;
	}
	public String getTotalUnTreatment() {
		return totalUnTreatment;
	}
	public void setTotalUnTreatment(String totalUnTreatment) {
		this.totalUnTreatment = totalUnTreatment;
	}
}