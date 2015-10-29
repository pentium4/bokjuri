package lionsclubs.com.MM3.MM3_12.MM3_52;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_52VO extends ComDefaultVO implements Serializable{
	private String sessionYear;
	private String organCode;	/* 조직코드 */
	private String order = "1";	/* 조회구분 : 1-클럽순, 2-순위순 */
	
	private String clubCode;	/* 조직코드 */
	private String clubName;	/* 조직명 */
	private String impostCnt;	/* 부과수 */
	private String impost;	/* 부과금액 */
	private String payment;	/* 납부금액 */
	private String paymentDefect;	/* 결손금 */
	private String paymentBal;	/* 미납액 */
	private String exchangeLoss;	/* 환차손 */
	private String paymentRate;	/* 미납율 */
	private String clubRank;	/* 순위 */
	
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getClubCode() {
		return clubCode;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getImpostCnt() {
		return impostCnt;
	}
	public void setImpostCnt(String impostCnt) {
		this.impostCnt = impostCnt;
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
	public String getPaymentBal() {
		return paymentBal;
	}
	public void setPaymentBal(String paymentBal) {
		this.paymentBal = paymentBal;
	}
	public String getExchangeLoss() {
		return exchangeLoss;
	}
	public void setExchangeLoss(String exchangeLoss) {
		this.exchangeLoss = exchangeLoss;
	}
	public String getPaymentRate() {
		return paymentRate;
	}
	public void setPaymentRate(String paymentRate) {
		this.paymentRate = paymentRate;
	}
	public String getClubRank() {
		return clubRank;
	}
	public void setClubRank(String clubRank) {
		this.clubRank = clubRank;
	}
}
