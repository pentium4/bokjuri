package lionsclubs.com.MM2.MM2_6.MM2_33;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_33VO extends ComDefaultVO implements Serializable {
	private String organCode;
	private String organName;
	private String sessionYear;
	private String month;	
	private String nowDate = new SimpleDateFormat("yyyy.MM.dd").format(new Date());	/* 행사시작기간 */
	
	private float prevMonthTotal;	/* 전월이월금 */
	private float prevDepositTotal;	/* 전월예금 */
	private float duesAttempt;	/* 회비미수금 */
	private float notIncomeEtcTotal;	/* 기타미수금 */
	private float incomeTotal;	/* 금월수입 */
	private float expTotal;	/* 금월지출 */
	private float depTotal;	/* 결손총계 */
	
	private String classItemCode;	/* 분류항목코드 */	
	private String classItemName;	/* 수입분류항목 */
	private String detailItemName;	/* 수입세부항목 */
	private Long amount;	/* 금액 */
	private Date inexDate;	/* 지출일 */
	private String inexDesc;	/* 내용 */
	private List<MM2_33VO> list;
	
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
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
	public String getNowDate() {
		return nowDate;
	}
	public void setNowDate(String nowDate) {
		this.nowDate = nowDate;
	}
	public float getPrevMonthTotal() {
		return prevMonthTotal;
	}
	public void setPrevMonthTotal(float prevMonthTotal) {
		this.prevMonthTotal = prevMonthTotal;
	}
	public float getPrevDepositTotal() {
		return prevDepositTotal;
	}
	public void setPrevDepositTotal(float prevDepositTotal) {
		this.prevDepositTotal = prevDepositTotal;
	}
	public float getDuesAttempt() {
		return duesAttempt;
	}
	public void setDuesAttempt(float duesAttempt) {
		this.duesAttempt = duesAttempt;
	}
	public float getNotIncomeEtcTotal() {
		return notIncomeEtcTotal;
	}
	public void setNotIncomeEtcTotal(float notIncomeEtcTotal) {
		this.notIncomeEtcTotal = notIncomeEtcTotal;
	}
	public float getIncomeTotal() {
		return incomeTotal;
	}
	public void setIncomeTotal(float incomeTotal) {
		this.incomeTotal = incomeTotal;
	}
	public float getExpTotal() {
		return expTotal;
	}
	public void setExpTotal(float expTotal) {
		this.expTotal = expTotal;
	}
	public float getDepTotal() {
		return depTotal;
	}
	public void setDepTotal(float depTotal) {
		this.depTotal = depTotal;
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
	public String getDetailItemName() {
		return detailItemName;
	}
	public void setDetailItemName(String detailItemName) {
		this.detailItemName = detailItemName;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public Date getInexDate() {
		return inexDate;
	}
	public void setInexDate(Date inexDate) {
		this.inexDate = inexDate;
	}
	public String getInexDesc() {
		return inexDesc;
	}
	public void setInexDesc(String inexDesc) {
		this.inexDesc = inexDesc;
	}
	public List<MM2_33VO> getList() {
		return list;
	}
	public void setList(List<MM2_33VO> list) {
		this.list = list;
	}
}