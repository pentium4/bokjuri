package lionsclubs.com.SM1.SM1_1.SM1_03;

import java.io.Serializable;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class SM1_03VO extends ComDefaultVO implements Serializable {
	/*
	 * 시스템권한 그룹
	 */
	private String authGroupCode;
	private String groupName;
	private String useYn;
	private String insertName;
	private String updateName;
	
	/*
	 * 
	 */
	private String memberNo;
	private String titleCode;
	private String clubTitleCode;			/* 클럽 직책 코드 */
	private String districtTitleCode;		/* 지구 직책 코드 */
	
	/*
	 * 조직권한 
	 */
	private String organCode;
	private String koName;
	
	/*
	 * search box
	 */
	private String searchOrganCode;
	private String oName1;			/* 복합지구 */
	private String oName2;			/* 지구 */
	private String oName3;			/* 클럽 */
	private String oCode;			/* 조직 코드 */
	
	/*
	 * 화면권한
	 */
	private String uiNo;
	private String title;
	private String select;
	private String input;
	
	/*
	 * 추가권한 체크
	 */
	private String startDate;
	private String endDate;
	private String desc;
	
	/*
	 * etc
	 */
	private String menuId;
	private List<String> selectArray;
	private List<String> inputArray;
	private List<String> organArray;
	private List<String> uinoArray;
	
	private String authStartDate;	/* 추가권한 시작일 */
	private String authEndDate;	/* 추가권한 종료일 */
	private String authDesc;	/* 추가권한 내용 */
	
	public String getInsertName() {
		return insertName;
	}
	public void setInsertName(String insertName) {
		this.insertName = insertName;
	}
	public String getUpdateName() {
		return updateName;
	}
	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getTitleCode() {
		return titleCode;
	}
	public void setTitleCode(String titleCode) {
		this.titleCode = titleCode;
	}
	public String getUiNo() {
		return uiNo;
	}
	public void setUiNo(String uiNo) {
		this.uiNo = uiNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSelect() {
		return select;
	}
	public void setSelect(String select) {
		this.select = select;
	}
	public String getInput() {
		return input;
	}
	public void setInput(String input) {
		this.input = input;
	}
	public String getoName1() {
		return oName1;
	}
	public void setoName1(String oName1) {
		this.oName1 = oName1;
	}
	public String getoName2() {
		return oName2;
	}
	public void setoName2(String oName2) {
		this.oName2 = oName2;
	}
	public String getoName3() {
		return oName3;
	}
	public void setoName3(String oName3) {
		this.oName3 = oName3;
	}
	public String getoCode() {
		return oCode;
	}
	public void setoCode(String oCode) {
		this.oCode = oCode;
	}
	public String getSearchOrganCode() {
		return searchOrganCode;
	}
	public void setSearchOrganCode(String searchOrganCode) {
		this.searchOrganCode = searchOrganCode;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}	
	public String getKoName() {
		return koName;
	}
	public void setKoName(String koName) {
		this.koName = koName;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getAuthGroupCode() {
		return authGroupCode;
	}
	public void setAuthGroupCode(String authGroupCode) {
		this.authGroupCode = authGroupCode;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getClubTitleCode() {
		return clubTitleCode;
	}
	public void setClubTitleCode(String clubTitleCode) {
		this.clubTitleCode = clubTitleCode;
	}
	public String getDistrictTitleCode() {
		return districtTitleCode;
	}
	public void setDistrictTitleCode(String districtTitleCode) {
		this.districtTitleCode = districtTitleCode;
	}
	public List<String> getSelectArray() {
		return selectArray;
	}
	public void setSelectArray(List<String> selectArray) {
		this.selectArray = selectArray;
	}
	public List<String> getInputArray() {
		return inputArray;
	}
	public void setInputArray(List<String> inputArray) {
		this.inputArray = inputArray;
	}
	
	public List<String> getOrganArray() {
		return organArray;
	}
	public void setOrganArray(List<String> organArray) {
		this.organArray = organArray;
	}
	public List<String> getUinoArray() {
		return uinoArray;
	}
	public void setUinoArray(List<String> uinoArray) {
		this.uinoArray = uinoArray;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getAuthStartDate() {
		return authStartDate;
	}
	public void setAuthStartDate(String authStartDate) {
		this.authStartDate = authStartDate;
	}
	public String getAuthEndDate() {
		return authEndDate;
	}
	public void setAuthEndDate(String authEndDate) {
		this.authEndDate = authEndDate;
	}
	public String getAuthDesc() {
		return authDesc;
	}
	public void setAuthDesc(String authDesc) {
		this.authDesc = authDesc;
	}
}
