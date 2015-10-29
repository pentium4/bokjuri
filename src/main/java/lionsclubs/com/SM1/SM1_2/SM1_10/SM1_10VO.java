package lionsclubs.com.SM1.SM1_2.SM1_10;

import java.io.Serializable;
import java.util.List;

import lionsclubs.com.cmm.commoncode.CommonCodeVO;

public class SM1_10VO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String	paramOrgCode             ; //   APP_DESC_CODE          nvarchar         상세구분
	private String	paramAppDescCode             ; //   APP_DESC_CODE          nvarchar         상세구분              
	private List<CommonCodeVO> codeList;
	
	private List<Integer>	chkIdx					; //   체크박스번호
	private List<Integer> 	idnNo                 	; //   IDN_NO                 int              일련번호
	private List<String>	organCode               ; //   ORGAN_CODE             nvarchar         조직코드              
	private List<String>	appKindCode             ; //   APP_KIND_CODE          nvarchar         입력종류              
	private List<String>	appDescCode             ; //   APP_DESC_CODE          nvarchar         상세구분              
	private List<String>	memberNo                ; //   MEMBER_NO              nvarchar         회원번호              
	private List<String>	memberName              ; //   MEMBER_NAME            nvarchar         회원성명              
	private List<Integer>	ord                		; //   ORD                    int              조회순서              
	private List<String> 	fAgeCode                ; //   F_AGE_CODE             nvarchar         연대별사진출력회기    
	private List<String> 	fOrganCodeText          ; //   F_ORGAN_CODE_TEXT      nvarchar         연대별사진출력조직코드
	private List<String> 	fPos                	; //   F_POS                  nvarchar         연대별사진출력직책    
	private List<String> 	fClubName               ; //   F_CLUB_NAME            nvarchar         연대별사진출력클럽명  
	private List<String> 	fileId;
	
	private List<SM1_10VO_DATA> 	listData;
	
	public String getParamAppDescCode() {
		return paramAppDescCode;
	}
	public void setParamAppDescCode(String paramAppDescCode) {
		this.paramAppDescCode = paramAppDescCode;
	}
	
	public List<Integer> getChkIdx() {
		return chkIdx;
	}

	public List<Integer> getIdnNo() {
		return idnNo;
	}

	public List<String> getOrganCode() {
		return organCode;
	}

	public List<String> getAppKindCode() {
		return appKindCode;
	}

	public List<String> getAppDescCode() {
		return appDescCode;
	}

	public List<String> getMemberNo() {
		return memberNo;
	}

	public List<String> getMemberName() {
		return memberName;
	}

	public List<Integer> getOrd() {
		return ord;
	}

	public List<String> getfAgeCode() {
		return fAgeCode;
	}

	public List<String> getfOrganCodeText() {
		return fOrganCodeText;
	}

	public List<String> getfPos() {
		return fPos;
	}

	public List<String> getfClubName() {
		return fClubName;
	}

	public void setChkIdx(List<Integer> chkIdx) {
		this.chkIdx = chkIdx;
	}

	public void setIdnNo(List<Integer> idnNo) {
		this.idnNo = idnNo;
	}

	public void setOrganCode(List<String> organCode) {
		this.organCode = organCode;
	}

	public void setAppKindCode(List<String> appKindCode) {
		this.appKindCode = appKindCode;
	}

	public void setAppDescCode(List<String> appDescCode) {
		this.appDescCode = appDescCode;
	}

	public void setMemberNo(List<String> memberNo) {
		this.memberNo = memberNo;
	}

	public void setMemberName(List<String> memberName) {
		this.memberName = memberName;
	}

	public void setOrd(List<Integer> ord) {
		this.ord = ord;
	}

	public void setfAgeCode(List<String> fAgeCode) {
		this.fAgeCode = fAgeCode;
	}

	public void setfOrganCodeText(List<String> fOrganCodeText) {
		this.fOrganCodeText = fOrganCodeText;
	}

	public void setfPos(List<String> fPos) {
		this.fPos = fPos;
	}

	public void setfClubName(List<String> fClubName) {
		this.fClubName = fClubName;
	}
	public List<SM1_10VO_DATA> getListData() {
		return listData;
	}
	public void setListData(List<SM1_10VO_DATA> listData) {
		this.listData = listData;
	}
	public List<String> getFileId() {
		return fileId;
	}
	public void setFileId(List<String> fileId) {
		this.fileId = fileId;
	}

	public List<CommonCodeVO> getCodeList() {
		return codeList;
	}
	public void setCodeList(List<CommonCodeVO> codeList) {
		this.codeList = codeList;
	}
	public String getParamOrgCode() {
		return paramOrgCode;
	}
	public void setParamOrgCode(String paramOrgCode) {
		this.paramOrgCode = paramOrgCode;
	}

}
