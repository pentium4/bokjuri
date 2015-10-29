package lionsclubs.com.MM4.MM4_1.MM4_02;

import java.io.Serializable;

public class MM4_02VO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String memberNo		; /* 회원번호 */
	private String memberName	; /* 성명		*/
	private String sPos1		; /* 직책		*/
	private String sOrganCode	; /* 출신지구	*/
	private String sPos2		; /* 지구직책	*/
	private String sClubName	; /* 소속클럽	*/
	
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
	public String getsPos1() {
		return sPos1;
	}
	public void setsPos1(String sPos1) {
		this.sPos1 = sPos1;
	}
	public String getsOrganCode() {
		return sOrganCode;
	}
	public void setsOrganCode(String sOrganCode) {
		this.sOrganCode = sOrganCode;
	}
	public String getsPos2() {
		return sPos2;
	}
	public void setsPos2(String sPos2) {
		this.sPos2 = sPos2;
	}
	public String getsClubName() {
		return sClubName;
	}
	public void setsClubName(String sClubName) {
		this.sClubName = sClubName;
	}
	
}
