package lionsclubs.com.SM1.SM1_2.SM1_12;

import java.io.Serializable;

public class SM1_12VO_DATA implements Serializable{
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
	private String 	tPos                    ; 
	private String 	tClubName               ; 
	private String 	tCoPos                	; 
	private String 	tPhone                  ; 
	private String 	tChYear                 ;
	private Integer	tAreaNo                 ;
	private Integer	tBoundNo                ;
	private Integer	tClubFNo                ;
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
	public String gettPos() {
		return tPos;
	}
	public void settPos(String tPos) {
		this.tPos = tPos;
	}
	public String gettClubName() {
		return tClubName;
	}
	public void settClubName(String tClubName) {
		this.tClubName = tClubName;
	}
	public String gettCoPos() {
		return tCoPos;
	}
	public void settCoPos(String tCoPos) {
		this.tCoPos = tCoPos;
	}
	public String gettPhone() {
		return tPhone;
	}
	public void settPhone(String tPhone) {
		this.tPhone = tPhone;
	}
	public String gettChYear() {
		return tChYear;
	}
	public void settChYear(String tChYear) {
		this.tChYear = tChYear;
	}
	public Integer gettAreaNo() {
		return tAreaNo;
	}
	public void settAreaNo(Integer tAreaNo) {
		this.tAreaNo = tAreaNo;
	}
	public Integer gettBoundNo() {
		return tBoundNo;
	}
	public void settBoundNo(Integer tBoundNo) {
		this.tBoundNo = tBoundNo;
	}
	public Integer gettClubFNo() {
		return tClubFNo;
	}
	public void settClubFNo(Integer tClubFYn) {
		this.tClubFNo = tClubFYn;
	}

}
