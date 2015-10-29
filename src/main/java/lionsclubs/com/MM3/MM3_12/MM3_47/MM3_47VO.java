package lionsclubs.com.MM3.MM3_12.MM3_47;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_47VO extends ComDefaultVO implements Serializable{
	private String organCode;
	private String sessionYear;
	private String month;
	private String fullPayment = "1"; /* 완납 */
	private String defaultPayment ="1"; /* 미납 */
	
	private String order1;
	private String order2;
	private String id;
	private String parent;
	private String idnNo;
	private String memberNo;
	private String clubCode;
	private String type;
	private String classItemCode;
	private String detailItemCode;
	private String classItemName;
	private String detailItemName;
	private String genDate;
	private String impost;
	private String impostDollar;
	private String payment;
	private String paymentDollar;
	private String paymentDefect;
	private String paymentDefectDollar;
	private String balance;
	private String balanceDollar;
	private String dollarKind;
	private String reference;
	private String last;
	
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
	public String getOrder1() {
		return order1;
	}
	public void setOrder1(String order1) {
		this.order1 = order1;
	}
	public String getOrder2() {
		return order2;
	}
	public void setOrder2(String order2) {
		this.order2 = order2;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
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
	public String getClubCode() {
		return clubCode;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getGenDate() {
		return genDate;
	}
	public void setGenDate(String genDate) {
		this.genDate = genDate;
	}
	public String getImpost() {
		return impost;
	}
	public void setImpost(String impost) {
		this.impost = impost;
	}
	public String getImpostDollar() {
		return impostDollar;
	}
	public void setImpostDollar(String impostDollar) {
		this.impostDollar = impostDollar;
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
	public String getPaymentDefect() {
		return paymentDefect;
	}
	public void setPaymentDefect(String paymentDefect) {
		this.paymentDefect = paymentDefect;
	}
	public String getpaymentDefectDollar() {
		return paymentDefectDollar;
	}
	public void setpaymentDefectDollar(String paymentDefectDollar) {
		this.paymentDefectDollar = paymentDefectDollar;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;
	}
	public String getBalanceDollar() {
		return balanceDollar;
	}
	public void setBalanceDollar(String balanceDollar) {
		this.balanceDollar = balanceDollar;
	}
	public String getDollarKind() {
		return dollarKind;
	}
	public void setDollarKind(String dollarKind) {
		this.dollarKind = dollarKind;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getLast() {
		return last;
	}
	public void setLast(String last) {
		this.last = last;
	}
}
