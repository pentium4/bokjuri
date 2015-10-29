package lionsclubs.com.SM1.SM1_4.SM1_13;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class SM1_13VO extends ComDefaultVO implements Serializable {
	private String sessionYear;
	private String organCode;
	
	private String memberNo;	/* 회원번호 */
	private String memberName;	/* 회원명 */
	private String signDate;	/* 입회 시작일 */
	private String sectorTitle;	/* 클럽직책 */
	private String sectorTitleOrd;	/* 클럽직책순서 */
	private String quitDate;	/* 퇴회일자 */
	private String quitCause;	/* 퇴회사유 */
	private String retire;	/* 퇴회자 구분코드 */	
	
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
	public String getSignDate() {
		return signDate;
	}
	public void setSignDate(String signDate) {
		this.signDate = signDate;
	}
	public String getSectorTitle() {
		return sectorTitle;
	}
	public void setSectorTitle(String sectorTitle) {
		this.sectorTitle = sectorTitle;
	}
	public String getSectorTitleOrd() {
		return sectorTitleOrd;
	}
	public void setSectorTitleOrd(String sectorTitleOrd) {
		this.sectorTitleOrd = sectorTitleOrd;
	}
	public String getQuitDate() {
		return quitDate;
	}
	public void setQuitDate(String quitDate) {
		this.quitDate = quitDate;
	}
	public String getQuitCause() {
		return quitCause;
	}
	public void setQuitCause(String quitCause) {
		this.quitCause = quitCause;
	}
	public String getRetire() {
		return retire;
	}
	public void setRetire(String retire) {
		this.retire = retire;
	}
}

