package lionsclubs.com.MM2.MM2_3.MM2_19;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_19VO extends ComDefaultVO implements Serializable{
	private String idnNo;	/* 입력번호 */
	private String moneyIdnNo;	/* 부과및납부마스터번호 */
	private String caYm;	/* 회기년월 */
	private String memberNo;	/* 회원번호 */
	private String memberName;	/* 회원 */
	private String organCode;	/* 조직코드 */
	private String inexCode;	/* 수입/지출 구분 */
	private String inexDate;	/* 수입/지출 일자 */
	private String classItemCode;	/* 분류항목코드 */
	private String detailItemCode;	/* 세부항목코드 */
	private String detailGroupCode;	/* 세부항목그룹코드 */
	private String classItemName;	/* 분류항목명 */
	private String detailItemName;	/* 세부항목명 */
    private String unit;	/* 단위 */
	private String amount;	/* 금액 */
    private String atandAmount;	/* 기준금액 */
	private String inexDesc;	/* 수입/지출내용 */
	private String incomeInsertDate;	/* 입력일자 */
	private String lCode;	/* 입력일자 */
	private String lCodeName;	/* 입력일자 */
	private String mCode;	/* 입력일자 */
	private String mCodeName;	/* 입력일자 */
    private Date insertDate;	/* 생성일자 */
    private String insertName;	/* 생성자 */
    private Date updateDate;	/* 수정일자 */
    private String updateName;	/* 수정자 */
    private String s1;	/* s1 */
    private String s2;	/* s2 */
    private String s3;	/* s3 */
    private String s4;	/* s4 */
    private String confirmDate;	/*  */
    private String confirmCount;	/*  */
    private String confirmYn;	/*  */
    private String rOrder;	/*  */
    private String isExist;	/*  */
    private String isConfirm;	/*  */
    
	/*
	 * search
	 */
	private String thisYear;
	private String prevYear;
	private String thisMonth;
	private String prevMonth;
	private String nextMonth;
	
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getMoneyIdnNo() {
		return moneyIdnNo;
	}
	public void setMoneyIdnNo(String moneyIdnNo) {
		this.moneyIdnNo = moneyIdnNo;
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
	public String getInexCode() {
		return inexCode;
	}
	public void setInexCode(String inexCode) {
		this.inexCode = inexCode;
	}
	public String getInexDate() {
		return inexDate;
	}
	public void setInexDate(String inexDate) {
		this.inexDate = inexDate;
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
	public String getDetailGroupCode() {
		return detailGroupCode;
	}
	public void setDetailGroupCode(String detailGroupCode) {
		this.detailGroupCode = detailGroupCode;
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
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getAtandAmount() {
		return atandAmount;
	}
	public void setAtandAmount(String atandAmount) {
		this.atandAmount = atandAmount;
	}
	public String getInexDesc() {
		return inexDesc;
	}
	public void setInexDesc(String inexDesc) {
		this.inexDesc = inexDesc;
	}
	public String getIncomeInsertDate() {
		return incomeInsertDate;
	}
	public void setIncomeInsertDate(String incomeInsertDate) {
		this.incomeInsertDate = incomeInsertDate;
	}
	public String getlCode() {
		return lCode;
	}
	public void setlCode(String lCode) {
		this.lCode = lCode;
	}
	public String getlCodeName() {
		return lCodeName;
	}
	public void setlCodeName(String lCodeName) {
		this.lCodeName = lCodeName;
	}
	public String getmCode() {
		return mCode;
	}
	public void setmCode(String mCode) {
		this.mCode = mCode;
	}
	public String getmCodeName() {
		return mCodeName;
	}
	public void setmCodeName(String mCodeName) {
		this.mCodeName = mCodeName;
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
	public String getS2() {
		return s2;
	}
	public void setS2(String s2) {
		this.s2 = s2;
	}
	public String getS3() {
		return s3;
	}
	public void setS3(String s3) {
		this.s3 = s3;
	}
	public String getS4() {
		return s4;
	}
	public void setS4(String s4) {
		this.s4 = s4;
	}
	public String getConfirmDate() {
		return confirmDate;
	}
	public void setConfirmDate(String confirmDate) {
		this.confirmDate = confirmDate;
	}
	public String getConfirmCount() {
		return confirmCount;
	}
	public void setConfirmCount(String confirmCount) {
		this.confirmCount = confirmCount;
	}
	public String getConfirmYn() {
		return confirmYn;
	}
	public void setConfirmYn(String confirmYn) {
		this.confirmYn = confirmYn;
	}
	public String getrOrder() {
		return rOrder;
	}
	public void setrOrder(String rOrder) {
		this.rOrder = rOrder;
	}
	public String getIsExist() {
		return isExist;
	}
	public void setIsExist(String isExist) {
		this.isExist = isExist;
	}
	public String getIsConfirm() {
		return isConfirm;
	}
	public void setIsConfirm(String isConfirm) {
		this.isConfirm = isConfirm;
	}
	public String getThisYear() {
		return thisYear;
	}
	public void setThisYear(String thisYear) {
		this.thisYear = thisYear;
	}
	public String getPrevYear() {
		return prevYear;
	}
	public void setPrevYear(String prevYear) {
		this.prevYear = prevYear;
	}
	public String getThisMonth() {
		return thisMonth;
	}
	public void setThisMonth(String thisMonth) {
		this.thisMonth = thisMonth;
	}
	public String getPrevMonth() {
		return prevMonth;
	}
	public void setPrevMonth(String prevMonth) {
		this.prevMonth = prevMonth;
	}
	public String getNextMonth() {
		return nextMonth;
	}
	public void setNextMonth(String nextMonth) {
		this.nextMonth = nextMonth;
	}
}
