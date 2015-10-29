package lionsclubs.com.MM3.MM3_13.MM3_56;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_56VO extends ComDefaultVO implements Serializable{
	private String organCode;	/* 조직코드 */
	private String sessionYear;	/* 회기년도 */

	private String repOrganCode	;/* 담당조직 코드 */
	private String repOrganName;	/* 담당조직명 */
	private String memberNo;	/* 회원번호 */
	private String memberName;	/* 회원명 */
	private String sectorTitle;
	private String repStartDate;	/* 담당시작일 */
	private String workTel;
	private String mobile;
	private String fax;
	private String mailAddress;
	private String gmail;
	private String workPlace;
	private String ord = "1";
	
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getRepOrganCode() {
		return repOrganCode;
	}
	public void setRepOrganCode(String repOrganCode) {
		this.repOrganCode = repOrganCode;
	}
	public String getRepOrganName() {
		return repOrganName;
	}
	public void setRepOrganName(String repOrganName) {
		this.repOrganName = repOrganName;
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
	public String getSectorTitle() {
		return sectorTitle;
	}
	public void setSectorTitle(String sectorTitle) {
		this.sectorTitle = sectorTitle;
	}
	public String getRepStartDate() {
		return repStartDate;
	}
	public void setRepStartDate(String repStartDate) {
		this.repStartDate = repStartDate;
	}
	public String getWorkTel() {
		return workTel;
	}
	public void setWorkTel(String workTel) {
		this.workTel = workTel;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getMailAddress() {
		return mailAddress;
	}
	public void setMailAddress(String mailAddress) {
		this.mailAddress = mailAddress;
	}
	public String getGmail() {
		return gmail;
	}
	public void setGmail(String gmail) {
		this.gmail = gmail;
	}
	public String getWorkPlace() {
		return workPlace;
	}
	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}
	public String getOrd() {
		return ord;
	}
	public void setOrd(String ord) {
		this.ord = ord;
	}
}
