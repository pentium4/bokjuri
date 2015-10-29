package lionsclubs.com.MM2.MM2_2.MM2_16;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_16VO extends ComDefaultVO implements Serializable{

	private String idnNo;	/* 입력번호 */
	private String caYm;	/* 회기년월 */
	private String memberNo;	/* 회원번호 */
	private String memberName;	/* 회원 */
	private String organCode;	/* 조직코드 */
	private String kindCode;	/* 예금구분 */
	private String kindName;	/* 예금구분명 */
    private String startDate;	/* 예금시작일 */
	private String endDate;	/* 예금종료일 */
    private String amount;	 /* 금액 */
	private String expireAmount;	/* 수입/지출내용 */
	private String financialIns;	/* 입력일자 */
	private String holder;	/* 예금주 */
	private String withdrawYn;	/* 출금여부 */
    private Date insertDate;	/* 생성일자 */
    private String insertName;	/* 생성자 */
    private Date updateDate;	/* 수정일자 */
    private String updateName;	/* 수정자 */
    private String s1 = "1";	/* s1 */
    private String rOrder;	/*  */
    private Integer dateTerm;
    
	/*
	 * search
	 */
	private String sessionYear;
	
	private String amountSum;
	private String expireAmountSum;
	
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
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
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getExpireAmount() {
		return expireAmount;
	}
	public void setExpireAmount(String expireAmount) {
		this.expireAmount = expireAmount;
	}
	public String getFinancialIns() {
		return financialIns;
	}
	public void setFinancialIns(String financialIns) {
		this.financialIns = financialIns;
	}
	public String getHolder() {
		return holder;
	}
	public void setHolder(String holder) {
		this.holder = holder;
	}
	public String getWithdrawYn() {
		return withdrawYn;
	}
	public void setWithdrawYn(String withdrawYn) {
		this.withdrawYn = withdrawYn;
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
	public String getS1() {
		return s1;
	}
	public void setS1(String s1) {
		this.s1 = s1;
	}
	public String getrOrder() {
		return rOrder;
	}
	public void setrOrder(String rOrder) {
		this.rOrder = rOrder;
	}
	public Integer getDateTerm() {
		return dateTerm;
	}
	public void setDateTerm(Integer dateTerm) {
		this.dateTerm = dateTerm;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getAmountSum() {
		return amountSum;
	}
	public void setAmountSum(String amountSum) {
		this.amountSum = amountSum;
	}
	public String getExpireAmountSum() {
		return expireAmountSum;
	}
	public void setExpireAmountSum(String expireAmountSum) {
		this.expireAmountSum = expireAmountSum;
	}
}
