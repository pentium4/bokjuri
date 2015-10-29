package lionsclubs.com.MM1.MM1_2.MM1_12;

import java.io.Serializable;

import org.apache.commons.lang.StringUtils;

import egovframework.com.cmm.ComDefaultVO;

public class MM1_12VO extends ComDefaultVO implements Serializable{
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
	
	private String insertDate;
	private String insertName;
	private String updateDate;
	private String updateName;
	
	/*
	 * 정산현황
	 */
	private String caYm;
	private String confirmYn;
	
	/*
	 * 약정금
	 */
	private float impost;			/* LCIF기금일경우 : 환율계산해서 들어감 */
	private float personalImpost;	/* LCIF기금일경우 : $ 금액 들어감 */
	private String impostMemberNo;	/* 부과자 회원번호 */
	private String targetMemberNo;	/* 부과대상자 회원번호 */
	private String kindCode;
	private String kindName;
	private String xdata;			/* $ 확인 */
	
	/*
	 * 납부금
	 */
	private String memberNo;
	private String paymentDate;		/* 납부일 */
	private String paymentDefect;	/* 결손처리 여부 */
	private String paymentFinish;	/* 납부완료 여부 */
	private String paymentCount;		/* 납부 카운트 */
	private float payment;			/* 납부금 */
	private float paymentSum;
	private float paymentTotal;
	private float paymentDollar;
	private float balance;			/* 잔액 */
	private float balanceDollar;
	private float dollar;
	private float pcount;
	private String reference;		/* 참고상항 - 납입금 달러 */
	
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
	public float getImpost() {
		return impost;
	}
	public void setImpost(float impost) {
		this.impost = impost;
	}
	public float getPersonalImpost() {
		return personalImpost;
	}
	public void setPersonalImpost(float personalImpost) {
		this.personalImpost = personalImpost;
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
	public String getKindCode() {
		return kindCode;
	}
	public void setKindCode(String kindCode) {
		this.kindCode = kindCode;
	}
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
	public String getXdata() {
		return xdata;
	}
	public void setXdata(String xdata) {
		this.xdata = xdata;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
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
	public String getPaymentCount() {
		return paymentCount;
	}
	public void setPaymentCount(String paymentCount) {
		this.paymentCount = paymentCount;
	}
	public float getPayment() {
		return payment;
	}
	public void setPayment(float payment) {
		this.payment = payment;
	}
	public float getPaymentSum() {
		return paymentSum;
	}
	public void setPaymentSum(float paymentSum) {
		this.paymentSum = paymentSum;
	}
	public float getPaymentTotal() {
		return paymentTotal;
	}
	public void setPaymentTotal(float paymentTotal) {
		this.paymentTotal = paymentTotal;
	}
	public float getPaymentDollar() {
		return paymentDollar;
	}
	public void setPaymentDollar(float paymentDollar) {
		this.paymentDollar = paymentDollar;
	}
	public float getBalance() {
		return balance;
	}
	public void setBalance(float balance) {
		this.balance = balance;
	}
	public float getBalanceDollar() {
		return balanceDollar;
	}
	public void setBalanceDollar(float balanceDollar) {
		this.balanceDollar = balanceDollar;
	}
	public float getDollar() {
		return dollar;
	}
	public void setDollar(float dollar) {
		this.dollar = dollar;
	}
	public float getPcount() {
		return pcount;
	}
	public void setPcount(float pcount) {
		this.pcount = pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
}
