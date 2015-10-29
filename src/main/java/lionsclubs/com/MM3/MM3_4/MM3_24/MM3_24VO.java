package lionsclubs.com.MM3.MM3_4.MM3_24;

import java.io.Serializable;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_24VO extends ComDefaultVO implements Serializable{
	
	private String yyyyMm;
	private String dollar;
	private String won;
	
	private String insertDate;
	private String insertName;
	private String updateDate;
	private String updateName;
	
	private String orders;
	private String thisYear;
	private String prevYear;
	
	private List<String> dollarArray;
	private List<String> wonArray;
	private List<String> ordersArray;
	
	
	public List<String> getOrdersArray() {
		return ordersArray;
	}
	public void setOrdersArray(List<String> ordersArray) {
		this.ordersArray = ordersArray;
	}
	public List<String> getDollarArray() {
		return dollarArray;
	}
	public void setDollarArray(List<String> dollarArray) {
		this.dollarArray = dollarArray;
	}
	public List<String> getWonArray() {
		return wonArray;
	}
	public void setWonArray(List<String> wonArray) {
		this.wonArray = wonArray;
	}
	public String getYyyyMm() {
		return yyyyMm;
	}
	public void setYyyyMm(String yyyyMm) {
		this.yyyyMm = yyyyMm;
	}
	public String getDollar() {
		return dollar;
	}
	public void setDollar(String dollar) {
		this.dollar = dollar;
	}
	public String getWon() {
		return won;
	}
	public void setWon(String won) {
		this.won = won;
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
	public String getOrders() {
		return orders;
	}
	public void setOrders(String orders) {
		this.orders = orders;
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
	
	
}
