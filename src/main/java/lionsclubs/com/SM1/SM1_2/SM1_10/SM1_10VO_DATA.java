package lionsclubs.com.SM1.SM1_2.SM1_10;

import java.io.Serializable;

public class SM1_10VO_DATA implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer	chkIdx					; //   체크박스번호
	private Integer	idnNo                 	; //   IDN_NO                 int              일련번호
	private String	organCode               ; //   ORGAN_CODE             nvarchar         조직코드              
	private String	appKindCode             ; //   APP_KIND_CODE          nvarchar         입력종류              
	private String	appDescCode             ; //   APP_DESC_CODE          nvarchar         상세구분              
	private String	memberNo                ; //   MEMBER_NO              nvarchar         회원번호              
	private String	memberName              ; //   MEMBER_NAME            nvarchar         회원성명              
	private Integer	ord                		; //   ORD                    int              조회순서              
	private String  fAgeCode                ; //   F_AGE_CODE             nvarchar         연대별사진출력회기    
	private String  fOrganCodeText          ; //   F_ORGAN_CODE_TEXT      nvarchar         연대별사진출력조직코드
	private String  fPos                	; //   F_POS                  nvarchar         연대별사진출력직책    
	private String  fClubName               ; //   F_CLUB_NAME            nvarchar         연대별사진출력클럽명  
	private String  fileId					; //   사진파일 아이디
	private String  fileYn					;
	private String  orgFileYn					;

	public Integer getChkIdx() {
		return chkIdx;
	}
	public Integer getIdnNo() {
		return idnNo;
	}
	public String getOrganCode() {
		return organCode;
	}
	public String getAppKindCode() {
		return appKindCode;
	}
	public String getAppDescCode() {
		return appDescCode;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public Integer getOrd() {
		return ord;
	}
	public String getfAgeCode() {
		return fAgeCode;
	}
	public String getfOrganCodeText() {
		return fOrganCodeText;
	}
	public String getfPos() {
		return fPos;
	}
	public String getfClubName() {
		return fClubName;
	}
	public void setChkIdx(Integer chkIdx) {
		this.chkIdx = chkIdx;
	}
	public void setIdnNo(Integer idnNo) {
		this.idnNo = idnNo;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public void setAppKindCode(String appKindCode) {
		this.appKindCode = appKindCode;
	}
	public void setAppDescCode(String appDescCode) {
		this.appDescCode = appDescCode;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public void setOrd(Integer ord) {
		this.ord = ord;
	}
	public void setfAgeCode(String fAgeCode) {
		this.fAgeCode = fAgeCode;
	}
	public void setfOrganCodeText(String fOrganCodeText) {
		this.fOrganCodeText = fOrganCodeText;
	}
	public void setfPos(String fPos) {
		this.fPos = fPos;
	}
	public void setfClubName(String fClubName) {
		this.fClubName = fClubName;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileYn() {
		return fileYn;
	}
	public void setFileYn(String fileYn) {
		this.fileYn = fileYn;
	}
	public String getOrgFileYn() {
		return orgFileYn;
	}
	public void setOrgFileYn(String orgFileYn) {
		this.orgFileYn = orgFileYn;
	}

}
