package lionsclubs.com.MM2.MM2_2.MM2_14;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_14VO extends ComDefaultVO implements Serializable{
	private String organCode;	/* 조직코드 */
	private String sessionYear;	/* 회기 */
	private String month;	/* 월 */
	
	private String idnNo;	/* 번호 */
	private String paymentCount;	/* 납부카운트 */
	private String genDate;	/* 부과일자 */
	private String paymentDate;	/* 납부일자 */
	private String classItemName;	/* 수입분류항목 */
	private String detailItemName;	/* 수입세부항목 */
	private String impostMemberCount;	/* 부과인원 */
	private String impost;	/* 부과금 */
	private String payment;	/* 납부금 */
	private String paymentDefect;	/* 결손금 */
	private String balance;	/* 잔액 */
	private String clubPayment;	/* 클럽부담금 */
	private String deliveryMemberNo;	/* 금액전달회원번호 */
	private String deliveryMemberName;	/* 금액전달회원명 */	
	private String memberNo;	/* 회원번호 */
	private String name;	/* 회원명 */
	private String monthDue;	/* 월회비 */
	private String classItemCode;	/* 분류항목 */
	private String detailItemCode;	/* 세부항목 */
	private String reference;	/* 참고사항 */
	private String inexDesc;	/* 방문지역 */
	private String order = "1";	/* 조회구분 */
	private List<MM2_14VO> insertImpostArray;
	private List<MM2_14VO> updateImpostArray;
	private List<MM2_14VO> deleteImpostArray;
	private List<MM2_14VO> paymentArray;
	private Date insertDate;	/* 생성일자 */
    private String insertName;	/* 생성자 */
    private Date updateDate;	/* 수정일자 */
    private String updateName;	/* 수정자 */
    
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
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getPaymentCount() {
		return paymentCount;
	}
	public void setPaymentCount(String paymentCount) {
		this.paymentCount = paymentCount;
	}
	public String getGenDate() {
		if(StringUtils.isEmpty(genDate)){
			return genDate;			
		} else {
			return genDate.replaceAll("\\.", "");	
		}
	}
	public void setGenDate(String genDate) {
		this.genDate = genDate;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
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
	public String getClubPayment() {
		return clubPayment;
	}
	public void setClubPayment(String clubPayment) {
		this.clubPayment = clubPayment;
	}
	public String getDeliveryMemberNo() {
		return deliveryMemberNo;
	}
	public void setDeliveryMemberNo(String deliveryMemberNo) {
		this.deliveryMemberNo = deliveryMemberNo;
	}
	public String getDeliveryMemberName() {
		return deliveryMemberName;
	}
	public void setDeliveryMemberName(String deliveryMemberName) {
		this.deliveryMemberName = deliveryMemberName;
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
	public String getMonthDue() {
		return monthDue;
	}
	public void setMonthDue(String monthDue) {
		this.monthDue = monthDue;
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
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getInexDesc() {
		return inexDesc;
	}
	public void setInexDesc(String inexDesc) {
		this.inexDesc = inexDesc;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public List<MM2_14VO> getInsertImpostArray() {
		return insertImpostArray;
	}
	public void setInsertImpostArray(List<MM2_14VO> insertImpostArray) {
		this.insertImpostArray = insertImpostArray;
	}
	public List<MM2_14VO> getUpdateImpostArray() {
		return updateImpostArray;
	}
	public void setUpdateImpostArray(List<MM2_14VO> updateImpostArray) {
		this.updateImpostArray = updateImpostArray;
	}
	public List<MM2_14VO> getDeleteImpostArray() {
		return deleteImpostArray;
	}
	public void setDeleteImpostArray(List<MM2_14VO> deleteImpostArray) {
		this.deleteImpostArray = deleteImpostArray;
	}
	public List<MM2_14VO> getPaymentArray() {
		return paymentArray;
	}
	public void setPaymentArray(List<MM2_14VO> paymentArray) {
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
