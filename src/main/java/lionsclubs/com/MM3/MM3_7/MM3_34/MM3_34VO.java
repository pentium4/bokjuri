package lionsclubs.com.MM3.MM3_7.MM3_34;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_34VO extends ComDefaultVO implements Serializable{
	private String organCode;	/* 조직코드 */
	private String sessionYear;
	
	private String clubName;	/* 클럽명 */
	private String positionName;	/* 직책 */
	private String impostMemberCount;
	private String impost;	/* 임원분담금 */
	private String paymentMemberCount;
	private String payment;	/* 납부금 */
	private String paymentBalanceMemberCount;
	private String balance;	/* 미수금 */
	private String paymentDefectMemberCount;
	private String paymentDefect;	/* 결손금 */
	
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
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public String getImpostMemberCount() {
		return impostMemberCount;
	}
	public void setImpostMemberCount(String impostMemberCount) {
		this.impostMemberCount = impostMemberCount;
	}
	public String getImpost() {
		return impost;
	}
	public void setImpost(String impost) {
		this.impost = impost;
	}
	public String getPaymentMemberCount() {
		return paymentMemberCount;
	}
	public void setPaymentMemberCount(String paymentMemberCount) {
		this.paymentMemberCount = paymentMemberCount;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getPaymentBalanceMemberCount() {
		return paymentBalanceMemberCount;
	}
	public void setPaymentBalanceMemberCount(String paymentBalanceMemberCount) {
		this.paymentBalanceMemberCount = paymentBalanceMemberCount;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;
	}
	public String getPaymentDefectMemberCount() {
		return paymentDefectMemberCount;
	}
	public void setPaymentDefectMemberCount(String paymentDefectMemberCount) {
		this.paymentDefectMemberCount = paymentDefectMemberCount;
	}
	public String getPaymentDefect() {
		return paymentDefect;
	}
	public void setPaymentDefect(String paymentDefect) {
		this.paymentDefect = paymentDefect;
	}	
}
