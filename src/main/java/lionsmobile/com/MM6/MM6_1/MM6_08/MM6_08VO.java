package lionsmobile.com.MM6.MM6_1.MM6_08;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM6_08VO extends ComDefaultVO implements Serializable{
	private String organCode;	/* 조직코드 */
	private String memberNo;
	private String sessionYear;
	private String month;
	
	private String name;
	private String type;
	private String rnum;
	private String pcount;
	private String genDate;	/* 부과일자 */
	private String classItemCode;
	private String detailItemCode;
	private String classItemName;	/* 수입분류항목 */	
	private String detailItemName;	/* 수입세부항목 */
	private String impost;	/* 부과금 */
	private String impostDollar;
	private String paymentDate ;	/* 납부일 */
	private String payment;	/* 납부금 */
	private String paymentDollar;
	private String defect;	/* 결손금 */
	private String defectDollar;
	private String balance;	/* 미수금 */
	private String balanceDollar;
	private String dollarKind;
	private String reference;	/* 참고사항 */
    private String plusItemCode;
    private String classItemType = "1";
    
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getPcount() {
		return pcount;
	}
	public void setPcount(String pcount) {
		this.pcount = pcount;
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
	public String getImpostDollar() {
		return impostDollar;
	}
	public void setImpostDollar(String impostDollar) {
		this.impostDollar = impostDollar;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
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
	public String getDefect() {
		return defect;
	}
	public void setDefect(String defect) {
		this.defect = defect;
	}
	public String getDefectDollar() {
		return defectDollar;
	}
	public void setDefectDollar(String defectDollar) {
		this.defectDollar = defectDollar;
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
	public String getPlusItemCode() {
		return plusItemCode;
	}
	public void setPlusItemCode(String plusItemCode) {
		this.plusItemCode = plusItemCode;
	}
	public String getClassItemType() {
		return classItemType;
	}
	public void setClassItemType(String classItemType) {
		this.classItemType = classItemType;
	}
}
