package lionsclubs.com.MM3.MM3_12.MM3_49;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_49VO extends ComDefaultVO implements Serializable{
	private String rnum;
	private String idnNo;	/* 번호 */
	private String paymentIdnNo;	/* 번호 */
	private String organCode;	/* 조직코드 */
	private String clubCode;	/* 클럽코드 */
	private String clubName;	/* 클럽명 */
	private String sessionYear;	/* 회기년도 */
	
	private String genDate;	/* 발생일자 */
	private String classItemCode;	/* 분류항목코드 */
	private String classItemName;	/* 분류항목명 */
	private String detailItemCode;	/* 세부항목코드 */
	private String detailItemName;	/* 세부항목명 */
	private String impost;	/* 부과금 */
	private String impostDollar;	/* 달러부과금 */
	private String paymentDate;	/* 납부일자 */
	private String payment;	/* 납부금 */
	private String paymentBal;	/* 납부 잔액 */
	private String paymentDollar;	/* 달러납부금 */
	private String paymentDollarBal;	/* 달러납부 잔액 */
	private String paymentDefect;	/* 결손여부 / 결손금 */
	private String paymentDollarDefect;	/* 달러결손금 */
	private String reference;	/* 참고사항 */
	private String dollarKind;	/* 달러구분 */
	private String order = "1";
	private List<MM3_49VO> saveImpostArray;
	private List<MM3_49VO> deleteImpostArray;
	private List<MM3_49VO> paymentArray;
	private Date insertDate;	/* 생성일자 */
	private String insertName;	/* 생성자 */
	private Date updateDate;	/* 수정일자 */
	private String updateName;	/* 수정자 */
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getPaymentIdnNo() {
		return paymentIdnNo;
	}
	public void setPaymentIdnNo(String paymentIdnNo) {
		this.paymentIdnNo = paymentIdnNo;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getClubCode() {
		return clubCode;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
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
	public String getClassItemName() {
		return classItemName;
	}
	public void setClassItemName(String classItemName) {
		this.classItemName = classItemName;
	}
	public String getDetailItemCode() {
		return detailItemCode;
	}
	public void setDetailItemCode(String detailItemCode) {
		this.detailItemCode = detailItemCode;
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
	public String getPaymentBal() {
		return paymentBal;
	}
	public void setPaymentBal(String paymentBal) {
		this.paymentBal = paymentBal;
	}
	public String getPaymentDollar() {
		return paymentDollar;
	}
	public void setPaymentDollar(String paymentDollar) {
		this.paymentDollar = paymentDollar;
	}
	public String getPaymentDollarBal() {
		return paymentDollarBal;
	}
	public void setPaymentDollarBal(String paymentDollarBal) {
		this.paymentDollarBal = paymentDollarBal;
	}
	public String getPaymentDefect() {
		return paymentDefect;
	}
	public void setPaymentDefect(String paymentDefect) {
		this.paymentDefect = paymentDefect;
	}
	public String getPaymentDollarDefect() {
		return paymentDollarDefect;
	}
	public void setPaymentDollarDefect(String paymentDollarDefect) {
		this.paymentDollarDefect = paymentDollarDefect;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getDollarKind() {
		return dollarKind;
	}
	public void setDollarKind(String dollarKind) {
		this.dollarKind = dollarKind;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public List<MM3_49VO> getSaveImpostArray() {
		return saveImpostArray;
	}
	public void setSaveImpostArray(List<MM3_49VO> saveImpostArray) {
		this.saveImpostArray = saveImpostArray;
	}
	public List<MM3_49VO> getDeleteImpostArray() {
		return deleteImpostArray;
	}
	public void setDeleteImpostArray(List<MM3_49VO> deleteImpostArray) {
		this.deleteImpostArray = deleteImpostArray;
	}
	public List<MM3_49VO> getPaymentArray() {
		return paymentArray;
	}
	public void setPaymentArray(List<MM3_49VO> paymentArray) {
		this.paymentArray = paymentArray;
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
}
