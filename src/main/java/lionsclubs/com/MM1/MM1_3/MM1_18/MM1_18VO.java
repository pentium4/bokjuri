package lionsclubs.com.MM1.MM1_3.MM1_18;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM1_18VO extends ComDefaultVO implements Serializable {
	private String organCode;	/* 클럽코드 */
	private String sessionYear;	/* 회기선택 */
	
	private String idnNo;
	private String kind;
	private String memberNo;
	private String newMemberCnt;	/* 신입회원 */
	private String retireMemberCnt;	/* 퇴회회원 */
	private String reinductMemberCnt;	/* 재입회원 */
	private String moveinMemberCnt;	/* 전입회원 */	
	
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
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getNewMemberCnt() {
		return newMemberCnt;
	}
	public void setNewMemberCnt(String newMemberCnt) {
		this.newMemberCnt = newMemberCnt;
	}
	public String getRetireMemberCnt() {
		return retireMemberCnt;
	}
	public void setRetireMemberCnt(String retireMemberCnt) {
		this.retireMemberCnt = retireMemberCnt;
	}
	public String getReinductMemberCnt() {
		return reinductMemberCnt;
	}
	public void setReinductMemberCnt(String reinductMemberCnt) {
		this.reinductMemberCnt = reinductMemberCnt;
	}
	public String getMoveinMemberCnt() {
		return moveinMemberCnt;
	}
	public void setMoveinMemberCnt(String moveinMemberCnt) {
		this.moveinMemberCnt = moveinMemberCnt;
	}
}