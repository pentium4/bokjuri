package lionsclubs.com.SM1.SM1_2.SM1_12;

import java.io.Serializable;
import java.util.List;

import lionsclubs.com.cmm.commoncode.CommonCodeVO;

public class SM1_12VO implements Serializable{
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
	private List<String> 	tPos                    ; 
	private List<String> 	tClubName               ; 
	private List<String> 	tCoPos                	; 
	private List<String> 	tPhone                  ; 
	private List<String> 	tChYear                 ;
	private List<Integer> 	tAreaNo                 ;
	private List<Integer> 	tBoundNo                ;
	private List<Integer> 	tClubFNo                ;
	
	private List<SM1_12VO_DATA> 	listData		;

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

	public List<SM1_12VO_DATA> getListData() {
		return listData;
	}

	public void setListData(List<SM1_12VO_DATA> listData) {
		this.listData = listData;
	}

	public List<String> gettPos() {
		return tPos;
	}

	public void settPos(List<String> tPos) {
		this.tPos = tPos;
	}

	public List<String> gettClubName() {
		return tClubName;
	}

	public void settClubName(List<String> tClubName) {
		this.tClubName = tClubName;
	}

	public List<String> gettCoPos() {
		return tCoPos;
	}

	public void settCoPos(List<String> tCoPos) {
		this.tCoPos = tCoPos;
	}

	public List<String> gettPhone() {
		return tPhone;
	}

	public void settPhone(List<String> tPhone) {
		this.tPhone = tPhone;
	}

	public List<String> gettChYear() {
		return tChYear;
	}

	public void settChYear(List<String> tChYear) {
		this.tChYear = tChYear;
	}

	public List<Integer> gettAreaNo() {
		return tAreaNo;
	}

	public void settAreaNo(List<Integer> tAreaNo) {
		this.tAreaNo = tAreaNo;
	}

	public List<Integer> gettBoundNo() {
		return tBoundNo;
	}

	public void settBoundNo(List<Integer> tBoundNo) {
		this.tBoundNo = tBoundNo;
	}

	public List<Integer> gettClubFNo() {
		return tClubFNo;
	}

	public void settClubFNo(List<Integer> tClubFYn) {
		this.tClubFNo = tClubFYn;
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
