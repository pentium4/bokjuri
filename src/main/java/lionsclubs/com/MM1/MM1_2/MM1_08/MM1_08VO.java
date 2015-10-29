package lionsclubs.com.MM1.MM1_2.MM1_08;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM1_08VO extends ComDefaultVO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String sessionYear; /* 회기년도 */
	private String caYm; /* 회기년월 */
	private String memberNo; /* 회원번호 */
	private String impost;	/* 부과금 */
	private String payment;	/* 납부금 */
	private String paymentDate;	/* 납부일자 */
	private String paymentDefect;	/* 결손금 */
	
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getCaYm() {
		return caYm;
	}
	public void setCaYm(String caYm) {
		this.caYm = caYm;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getImpost() {
		return impost;
	}
	public void setImpost(String impost) {
		this.impost = impost;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getPaymentDefect() {
		return paymentDefect;
	}
	public void setPaymentDefect(String paymentDefect) {
		this.paymentDefect = paymentDefect;
	}
}
