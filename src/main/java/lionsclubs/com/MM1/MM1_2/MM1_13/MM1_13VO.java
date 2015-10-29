package lionsclubs.com.MM1.MM1_2.MM1_13;

import java.io.Serializable;

import org.apache.commons.lang.StringUtils;

import egovframework.com.cmm.ComDefaultVO;

public class MM1_13VO extends ComDefaultVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idnNo;
	private String organCode;
	private String stampCode;
	private String genDate;
	private String classItemCode;
	private String classItemName;
	private String detailItemCode;
	private String detailItemName;
	private String inexCode;
	
	/*
	 * 정산현황
	 */
	private String caYm;
	private String confirmYn;
	
	/*
	 * 분담금
	 */
	private int impost;
	private String reference;
	private String impostMemberNo;	/* 부과자 회원번호 */
	private String targetMemberNo;	/* 부과대상자 회원번호 */
	private String targetMemberName;
	private String targetPositionCode;
	private String targetPositionName;
	
	/*
	 * 납부금
	 */
	private String paymentDate;		/* 납부일 */
	private String paymentDefect;	/* 결손처리 여부 */
	private String paymentFinish;	/* 납부완료 여부 */
	private String memberNo;
	private String paymentCount;		/* 납부 카운트 */
	private int payment;			/* 납부금 */
	private int paymentSum;
	private int pcount;				/* 납부한 내용 COUNT */
	
	/*
	 * etc
	 */
	private int balance;			/* 잔액 */
	private int defect;				/* 결손금 */
	private int defectSumY;			/* 결손금 합계 */
	private int defectSumN;			/* 결손금 아닌 금액 합계 */
	
	/*
	 * 회기년월
	 */
	private String oneYear;
	private String thisYear;
	
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
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getStampCode() {
		return stampCode;
	}
	public void setStampCode(String stampCode) {
		this.stampCode = stampCode;
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
	public String getInexCode() {
		return inexCode;
	}
	public void setInexCode(String inexCode) {
		this.inexCode = inexCode;
	}
	public String getCaYm() {
		return caYm;
	}
	public void setCaYm(String caYm) {
		this.caYm = caYm;
	}
	public String getConfirmYn() {
		return confirmYn;
	}
	public void setConfirmYn(String confirmYn) {
		this.confirmYn = confirmYn;
	}
	public int getImpost() {
		return impost;
	}
	public void setImpost(int impost) {
		this.impost = impost;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getImpostMemberNo() {
		return impostMemberNo;
	}
	public void setImpostMemberNo(String impostMemberNo) {
		this.impostMemberNo = impostMemberNo;
	}
	public String getTargetMemberNo() {
		return targetMemberNo;
	}
	public void setTargetMemberNo(String targetMemberNo) {
		this.targetMemberNo = targetMemberNo;
	}
	public String getTargetMemberName() {
		return targetMemberName;
	}
	public void setTargetMemberName(String targetMemberName) {
		this.targetMemberName = targetMemberName;
	}
	public String getTargetPositionCode() {
		return targetPositionCode;
	}
	public void setTargetPositionCode(String targetPositionCode) {
		this.targetPositionCode = targetPositionCode;
	}
	public String getTargetPositionName() {
		return targetPositionName;
	}
	public void setTargetPositionName(String targetPositionName) {
		this.targetPositionName = targetPositionName;
	}
	public String getPaymentDate() {
		if(StringUtils.isEmpty(paymentDate)){
			return paymentDate;			
		} else {
			return paymentDate.replaceAll("\\.", "");	
		}
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
	public String getPaymentFinish() {
		return paymentFinish;
	}
	public void setPaymentFinish(String paymentFinish) {
		this.paymentFinish = paymentFinish;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getPaymentCount() {
		return paymentCount;
	}
	public void setPaymentCount(String paymentCount) {
		this.paymentCount = paymentCount;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public int getPaymentSum() {
		return paymentSum;
	}
	public void setPaymentSum(int paymentSum) {
		this.paymentSum = paymentSum;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public int getDefect() {
		return defect;
	}
	public void setDefect(int defect) {
		this.defect = defect;
	}
	public int getDefectSumY() {
		return defectSumY;
	}
	public void setDefectSumY(int defectSumY) {
		this.defectSumY = defectSumY;
	}
	public int getDefectSumN() {
		return defectSumN;
	}
	public void setDefectSumN(int defectSumN) {
		this.defectSumN = defectSumN;
	}
	public String getOneYear() {
		return oneYear;
	}
	public void setOneYear(String oneYear) {
		this.oneYear = oneYear;
	}
	public String getThisYear() {
		return thisYear;
	}
	public void setThisYear(String thisYear) {
		this.thisYear = thisYear;
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
}
