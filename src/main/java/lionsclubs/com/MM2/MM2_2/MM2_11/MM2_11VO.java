package lionsclubs.com.MM2.MM2_2.MM2_11;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_11VO extends ComDefaultVO implements Serializable{
	private String organCode;
	private String sessionYear;
	private String month;
	private String orderGenDate = "1";	/* 부과일순 */
	private String orderName = "1";	/* 이름순 */
	private String fullPayment = "1"; /* 완납 */
	private String defaultPayment ="1"; /* 미납 */
	
	private String idnNo;
	private String memberNo;
	private String name;
	private String paymentCount;
	private String genDate;
	private String classItemCode;
	private String detailItemCode;
	private String classItemName;
	private String detailItemName;
	private String impost;
	private String payment;
	private String paymentDefect;
	private String balance;
	private String reference;
	
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
	public String getOrderGenDate() {
		return orderGenDate;
	}
	public void setOrderGenDate(String orderGenDate) {
		this.orderGenDate = orderGenDate;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getFullPayment() {
		return fullPayment;
	}
	public void setFullPayment(String fullPayment) {
		this.fullPayment = fullPayment;
	}
	public String getDefaultPayment() {
		return defaultPayment;
	}
	public void setDefaultPayment(String defaultPayment) {
		this.defaultPayment = defaultPayment;
	}
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPaymentCount() {
		return paymentCount;
	}
	public void setPaymentCount(String paymentCount) {
		this.paymentCount = paymentCount;
	}
	public String getGenDate() {
		return genDate;
	}
	public void setGenDate(String genDate) {
		this.genDate = genDate;
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
	public String getPaymentDefect() {
		return paymentDefect;
	}
	public void setPaymentDefect(String paymentDefect) {
		this.paymentDefect = paymentDefect;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
}
