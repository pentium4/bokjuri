package lionsclubs.com.MM3.MM3_10.MM3_58;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_58VO extends ComDefaultVO implements Serializable{
	private String organCode;	/* 조직코드 */
	private String sessionYear;	/* 회기년도 */
	private String month;	/* 월 */
	
	private String enName;
	private String registerNo;
	private String payment;
	private String paymentDollar;
	private String memberEngName;
	
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
	public String getEnName() {
		return enName;
	}
	public void setEnName(String enName) {
		this.enName = enName;
	}
	public String getRegisterNo() {
		return registerNo;
	}
	public void setRegisterNo(String registerNo) {
		this.registerNo = registerNo;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getPaymentDollar() {
		return paymentDollar;
	}
	public void setPaymentDollar(String paymentDollar) {
		this.paymentDollar = paymentDollar;
	}
	public String getMemberEngName() {
		return memberEngName;
	}
	public void setMemberEngName(String memberEngName) {
		this.memberEngName = memberEngName;
	}
}
