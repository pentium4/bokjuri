package lionsclubs.com.MM2.MM2_6.MM2_32;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_32VO extends ComDefaultVO implements Serializable {
	private String organCode;
	private String organName;
	private String sessionYear;
	private String month;	
	private String nowDate = new SimpleDateFormat("yyyy.MM.dd").format(new Date());	/* 행사시작기간 */
	
	private Long prevMonthTotal;	/* 전월이월금 */
	private Long prevDepositTotal;	/* 전월예금 */
	private Long duesAttempt;	/* 회비미수금 */
	private Long notIncomeEtcTotal;	/* 기타미수금 */
	private Long incomeTotal;	/* 금월수입 */
	private Long expTotal;	/* 금월지출 */
	private Double depTotal;	/* 결손총계 */
	
	private String classItemCode;	/* 분류항목코드 */
	private String classItemName;	/* 분류항목명 */
	private String detailItemName;	/* 세부항목명 */
	private Long payment;	/* 납부금 */
	private String memberNo;	/* 납부자 */
	private String name;	/* 납부자 */
	private Date genDate;	/* 부과일 */
	private Date paymentDate;	/* 납부일 */
	private String reference;	/* 참고사항 */
	private List<MM2_32VO> list;
	
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
	public Long getPrevMonthTotal() {
		return prevMonthTotal;
	}
	public void setPrevMonthTotal(Long prevMonthTotal) {
		this.prevMonthTotal = prevMonthTotal;
	}
	public Long getPrevDepositTotal() {
		return prevDepositTotal;
	}
	public void setPrevDepositTotal(Long prevDepositTotal) {
		this.prevDepositTotal = prevDepositTotal;
	}
	public Long getDuesAttempt() {
		return duesAttempt;
	}
	public void setDuesAttempt(Long duesAttempt) {
		this.duesAttempt = duesAttempt;
	}
	public Long getNotIncomeEtcTotal() {
		return notIncomeEtcTotal;
	}
	public void setNotIncomeEtcTotal(Long notIncomeEtcTotal) {
		this.notIncomeEtcTotal = notIncomeEtcTotal;
	}
	public Long getIncomeTotal() {
		return incomeTotal;
	}
	public void setIncomeTotal(Long incomeTotal) {
		this.incomeTotal = incomeTotal;
	}
	public Long getExpTotal() {
		return expTotal;
	}
	public void setExpTotal(Long expTotal) {
		this.expTotal = expTotal;
	}
	public Double getDepTotal() {
		return depTotal;
	}
	public void setDepTotal(Double depTotal) {
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
	public Long getPayment() {
		return payment;
	}
	public void setPayment(Long payment) {
		this.payment = payment;
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
	public Date getGenDate() {
		return genDate;
	}
	public void setGenDate(Date genDate) {
		this.genDate = genDate;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public List<MM2_32VO> getList() {
		return list;
	}
	public void setList(List<MM2_32VO> list) {
		this.list = list;
	}
}