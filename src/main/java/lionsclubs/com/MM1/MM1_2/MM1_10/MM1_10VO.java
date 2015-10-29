package lionsclubs.com.MM1.MM1_2.MM1_10;

import java.io.Serializable;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class MM1_10VO extends ComDefaultVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idnNo;
	private String organCode;
	private String genDate;
	private String stampCode;
	private String classItemCode;
	private String classItemName;
	private String detailItemCode;
	private String detailItemName;
	
	/*
	 * 경조금 부과금
	 */
	private String targetMemberNo;
	private int impost;
	private int clubImpost;
	private int personalImpost;
	
	/*
	 * 경조금 납부금 - 입력
	 */
	private String memberNo;
	private int payment;
	private int paymentCount;
	private String paymentFinish;	/* 납부완료 여부 */
	private String paymentDefect;	/* 결손처리 여부 */
	private String paymentDate;
	private String reference;
	
	private String insertDate;
	private String insertName;
	private String updateDate;
	private String updateName;
	
	
	public int getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(int idnNo) {
		this.idnNo = idnNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getGenDate() {
		return genDate;
	}
	public void setGenDate(String genDate) {
		if (genDate == null || genDate.trim().equals("")) {
			
		}else{
			genDate = genDate.replaceAll("\\.", "");
		}
		this.genDate = genDate;
	}
	public String getStampCode() {
		return stampCode;
	}
	public void setStampCode(String stampCode) {
		this.stampCode = stampCode;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getInsertName() {
		return insertName;
	}
	public void setInsertName(String insertName) {
		this.insertName = insertName;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateName() {
		return updateName;
	}
	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}	
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
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
	
	
	public int getImpost() {
		return impost;
	}
	public void setImpost(int impost) {
		this.impost = impost;
	}
	public int getClubImpost() {
		return clubImpost;
	}
	public void setClubImpost(int clubImpost) {
		this.clubImpost = clubImpost;
	}
	
	public String getPaymentDefect() {
		return paymentDefect;
	}
	public void setPaymentDefect(String paymentDefect) {
		this.paymentDefect = paymentDefect;
	}
	
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public int getPersonalImpost() {
		return personalImpost;
	}
	public void setPersonalImpost(int personalImpost) {
		this.personalImpost = personalImpost;
	}
	public int getPaymentCount() {
		return paymentCount;
	}
	public void setPaymentCount(int paymentCount) {
		this.paymentCount = paymentCount;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getPaymentFinish() {
		return paymentFinish;
	}
	public void setPaymentFinish(String paymentFinish) {
		this.paymentFinish = paymentFinish;
	}
	
	
}
