package lionsclubs.com.MM1.MM1_1.MM1_06;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM1_06VO extends ComDefaultVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String memberNo;
	private String sectorClub;	/* 소속클럽 */
	private String sectorClubCode;	/* 소속클럽코드 */
	private String name;
	private String endDate;
	private String workTel;
	private String companyTitle;
	private String companyName;
	private String companyAddress;
	private String businessClass;
	private String industry;
	
	private String order = "1";	/* 라디오 버튼 */
	private String orderName;
	private String orderCompanyName;
	private String orderSectorClub;
	private String orderCompanyAddress;
	
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getSectorClub() {
		return sectorClub;
	}
	public void setSectorClub(String sectorClub) {
		this.sectorClub = sectorClub;
	}
	public String getSectorClubCode() {
		return sectorClubCode;
	}
	public void setSectorClubCode(String sectorClubCode) {
		this.sectorClubCode = sectorClubCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getWorkTel() {
		return workTel;
	}
	public void setWorkTel(String workTel) {
		this.workTel = workTel;
	}
	public String getCompanyTitle() {
		return companyTitle;
	}
	public void setCompanyTitle(String companyTitle) {
		this.companyTitle = companyTitle;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyAddress() {
		return companyAddress;
	}
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	public String getBusinessClass() {
		return businessClass;
	}
	public void setBusinessClass(String businessClass) {
		this.businessClass = businessClass;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderCompanyName() {
		return orderCompanyName;
	}
	public void setOrderCompanyName(String orderCompanyName) {
		this.orderCompanyName = orderCompanyName;
	}
	public String getOrderSectorClub() {
		return orderSectorClub;
	}
	public void setOrderSectorClub(String orderSectorClub) {
		this.orderSectorClub = orderSectorClub;
	}
	public String getOrderCompanyAddress() {
		return orderCompanyAddress;
	}
	public void setOrderCompanyAddress(String orderCompanyAddress) {
		this.orderCompanyAddress = orderCompanyAddress;
	}
	
}
