package lionsclubs.com.MM3.MM3_4.MM3_23;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_23VO extends ComDefaultVO implements Serializable{
	
	private String thisOrganCode;
	private String thisYear;
	private String order = "1";
	
	private String name;
	private String organCode;
	private String organName;
	private String genDate;
	private String detailItemCode;
	private String detailItemName;
	
	private int impostDollar;
	private int impost;
	private int paymentDollar;
	private int paymentSum;
	private int paymentNotDollar;
	private int paymentNotSum;
	
	
	
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getThisOrganCode() {
		return thisOrganCode;
	}
	public void setThisOrganCode(String thisOrganCode) {
		this.thisOrganCode = thisOrganCode;
	}
	public String getThisYear() {
		return thisYear;
	}
	public void setThisYear(String thisYear) {
		this.thisYear = thisYear;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
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
	public String getGenDate() {
		return genDate;
	}
	public void setGenDate(String genDate) {
		this.genDate = genDate;
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
	public int getImpostDollar() {
		return impostDollar;
	}
	public void setImpostDollar(int impostDollar) {
		this.impostDollar = impostDollar;
	}
	public int getImpost() {
		return impost;
	}
	public void setImpost(int impost) {
		this.impost = impost;
	}
	public int getPaymentDollar() {
		return paymentDollar;
	}
	public void setPaymentDollar(int paymentDollar) {
		this.paymentDollar = paymentDollar;
	}
	public int getPaymentSum() {
		return paymentSum;
	}
	public void setPaymentSum(int paymentSum) {
		this.paymentSum = paymentSum;
	}
	public int getPaymentNotDollar() {
		return paymentNotDollar;
	}
	public void setPaymentNotDollar(int paymentNotDollar) {
		this.paymentNotDollar = paymentNotDollar;
	}
	public int getPaymentNotSum() {
		return paymentNotSum;
	}
	public void setPaymentNotSum(int paymentNotSum) {
		this.paymentNotSum = paymentNotSum;
	}
	
	
	

}
