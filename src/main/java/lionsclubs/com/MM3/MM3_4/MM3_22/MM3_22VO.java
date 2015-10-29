package lionsclubs.com.MM3.MM3_4.MM3_22;

import java.io.Serializable;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_22VO extends ComDefaultVO implements Serializable{
	private String sessionYear;	/* 회기년 */
	private String districtCode;	/* 지구코드 */
	private String clubCode;	/* 클럽코드 */
	private String paymentDate;	/* 납부일자 */
	private String firstSecKind;	/* 분기코드 */
	private String firstSecKindName;	/* 분기명 */
	private String itemKindCode;	/* 부과항목구분코드 */
	private String itemCode;	/* 부과항목명 */
	private String itemName;	/* 부과항목명 */
	private String dueDollar;	/* 부과금액 달러 */
	private String due;	/* 부과금액 */
	private String paymentDollar;	/* 납부금액 달러 */
	private String payment;	/* 납부금액 */
	private String paymentDollarBal; 	/* 납부금액 달러잔액 */
	private String paymentBal; 	/* 납부금액 잔액 */
	private String dollarYN;	/* 달러구분 */	
	private List<MM3_22VO> clubPaymentArray;
	private String insertName;	/* 입력자 */
	private String updateName;	/* 수정자 */
	
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getDistrictCode() {
		return districtCode;
	}
	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}
	public String getClubCode() {
		return clubCode;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getFirstSecKind() {
		return firstSecKind;
	}
	public void setFirstSecKind(String firstSecKind) {
		this.firstSecKind = firstSecKind;
	}
	public String getFirstSecKindName() {
		return firstSecKindName;
	}
	public void setFirstSecKindName(String firstSecKindName) {
		this.firstSecKindName = firstSecKindName;
	}
	public String getItemKindCode() {
		return itemKindCode;
	}
	public void setItemKindCode(String itemKindCode) {
		this.itemKindCode = itemKindCode;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getDueDollar() {
		return dueDollar;
	}
	public void setDueDollar(String dueDollar) {
		this.dueDollar = dueDollar;
	}
	public String getDue() {
		return due;
	}
	public void setDue(String due) {
		this.due = due;
	}
	public String getPaymentDollar() {
		return paymentDollar;
	}
	public void setPaymentDollar(String paymentDollar) {
		this.paymentDollar = paymentDollar;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getPaymentDollarBal() {
		return paymentDollarBal;
	}
	public void setPaymentDollarBal(String paymentDollarBal) {
		this.paymentDollarBal = paymentDollarBal;
	}
	public String getPaymentBal() {
		return paymentBal;
	}
	public void setPaymentBal(String paymentBal) {
		this.paymentBal = paymentBal;
	}
	public String getDollarYN() {
		return dollarYN;
	}
	public void setDollarYN(String dollarYN) {
		this.dollarYN = dollarYN;
	}
	public List<MM3_22VO> getClubPaymentArray() {
		return clubPaymentArray;
	}
	public void setClubPaymentArray(List<MM3_22VO> clubPaymentArray) {
		this.clubPaymentArray = clubPaymentArray;
	}
	public String getInsertName() {
		return insertName;
	}
	public void setInsertName(String insertName) {
		this.insertName = insertName;
	}
	public String getUpdateName() {
		return updateName;
	}
	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}
}
