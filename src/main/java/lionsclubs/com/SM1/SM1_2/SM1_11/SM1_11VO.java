package lionsclubs.com.SM1.SM1_2.SM1_11;

import java.io.Serializable;
import java.util.List;

import lionsclubs.com.cmm.commoncode.CommonCodeVO;

public class SM1_11VO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String	paramYearCode                   ;   
	private String	paramAppDescCode                ; 
	private String	paramOrgCode					;
	private List<CommonCodeVO> codeList;

	private List<Integer>	chkIdx					; 
	private List<Integer> 	idnNo                 	; 
	private List<String>	ageCode                	; 
	private List<String>	organCode               ; 
	private List<String>	appKindCode             ; 
	private List<String>	appDescCode             ; 
	private List<String>	memberNo                ; 
	private List<String>	memberName              ; 
	private List<Integer>	ord                		; 
	private List<String> 	sPos1                   ; 
	private List<String> 	sOrganCode              ; 
	private List<String> 	sPos2                	; 
	private List<String> 	sClubName               ; 
	
	private List<SM1_11VO_DATA> 	listData;

	public String getParamYearCode() {
		return paramYearCode;
	}

	public void setParamYearCode(String paramYearCode) {
		this.paramYearCode = paramYearCode;
	}

	public String getParamAppDescCode() {
		return paramAppDescCode;
	}

	public void setParamAppDescCode(String paramAppDescCode) {
		this.paramAppDescCode = paramAppDescCode;
	}

	public List<Integer> getChkIdx() {
		return chkIdx;
	}

	public void setChkIdx(List<Integer> chkIdx) {
		this.chkIdx = chkIdx;
	}

	public List<Integer> getIdnNo() {
		return idnNo;
	}

	public void setIdnNo(List<Integer> idnNo) {
		this.idnNo = idnNo;
	}

	public List<String> getAgeCode() {
		return ageCode;
	}

	public void setAgeCode(List<String> ageCode) {
		this.ageCode = ageCode;
	}

	public List<String> getOrganCode() {
		return organCode;
	}

	public void setOrganCode(List<String> organCode) {
		this.organCode = organCode;
	}

	public List<String> getAppKindCode() {
		return appKindCode;
	}

	public void setAppKindCode(List<String> appKindCode) {
		this.appKindCode = appKindCode;
	}

	public List<String> getAppDescCode() {
		return appDescCode;
	}

	public void setAppDescCode(List<String> appDescCode) {
		this.appDescCode = appDescCode;
	}

	public List<String> getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(List<String> memberNo) {
		this.memberNo = memberNo;
	}

	public List<String> getMemberName() {
		return memberName;
	}

	public void setMemberName(List<String> memberName) {
		this.memberName = memberName;
	}

	public List<Integer> getOrd() {
		return ord;
	}

	public void setOrd(List<Integer> ord) {
		this.ord = ord;
	}

	public List<String> getsPos1() {
		return sPos1;
	}

	public void setsPos1(List<String> sPos1) {
		this.sPos1 = sPos1;
	}

	public List<String> getsOrganCode() {
		return sOrganCode;
	}

	public void setsOrganCode(List<String> sOrganCode) {
		this.sOrganCode = sOrganCode;
	}

	public List<String> getsPos2() {
		return sPos2;
	}

	public void setsPos2(List<String> sPos2) {
		this.sPos2 = sPos2;
	}

	public List<String> getsClubName() {
		return sClubName;
	}

	public void setsClubName(List<String> sClubName) {
		this.sClubName = sClubName;
	}

	public List<SM1_11VO_DATA> getListData() {
		return listData;
	}

	public void setListData(List<SM1_11VO_DATA> listData) {
		this.listData = listData;
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
