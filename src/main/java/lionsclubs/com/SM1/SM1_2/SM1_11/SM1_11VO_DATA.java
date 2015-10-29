package lionsclubs.com.SM1.SM1_2.SM1_11;

import java.io.Serializable;

public class SM1_11VO_DATA implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer	chkIdx					; //   체크박스번호
	private Integer	idnNo                 	; //   IDN_NO                 int              일련번호
	private String	ageCode                	; //   AGE_CODE               nvarchar         회기                  
	private String	organCode               ; //   ORGAN_CODE             nvarchar         조직코드              
	private String	appKindCode             ; //   APP_KIND_CODE          nvarchar         입력종류              
	private String	appDescCode             ; //   APP_DESC_CODE          nvarchar         상세구분              
	private String	memberNo                ; //   MEMBER_NO              nvarchar         회원번호              
	private String	memberName              ; //   MEMBER_NAME            nvarchar         회원성명              
	private Integer	ord                		; //   ORD                    int              조회순서              
	private String  sPos1                ; //  
	private String  sOrganCode          ; //  
	private String  sPos2                	; //  
	private String  sClubName               ; //  
	public Integer getChkIdx() {
		return chkIdx;
	}
	public void setChkIdx(Integer chkIdx) {
		this.chkIdx = chkIdx;
	}
	public Integer getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(Integer idnNo) {
		this.idnNo = idnNo;
	}
	public String getAgeCode() {
		return ageCode;
	}
	public void setAgeCode(String ageCode) {
		this.ageCode = ageCode;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getAppKindCode() {
		return appKindCode;
	}
	public void setAppKindCode(String appKindCode) {
		this.appKindCode = appKindCode;
	}
	public String getAppDescCode() {
		return appDescCode;
	}
	public void setAppDescCode(String appDescCode) {
		this.appDescCode = appDescCode;
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
	public Integer getOrd() {
		return ord;
	}
	public void setOrd(Integer ord) {
		this.ord = ord;
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
