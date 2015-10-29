package lionsclubs.com.SM1.SM1_1.SM1_02;

import java.io.Serializable;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class SM1_02VO extends ComDefaultVO implements Serializable {
	/*
	 * 시스템 권한그룹
	 */
	private String groupName;
	private int authGroupCode;
	private String authOrganCode;
	private String authOrganName;
	private String insertName;
	private String updateName;
	
	/*
	 * 권한 그룹 화면권한
	 */
	private String uiNo;
	private String title;
	private String select;
	private String input;
	private String sTotal;
	private String iTotal;
	
	/*
	 * 직책
	 */
	private String code;
	private String codeName;
	private String useYn;
	
	/*
	 * 직책 권한
	 */
	private String organ;
	private String titleCode;
	
	/*
	 * 기타
	 */
	private String menuId;
	private String scheck;
	private String icheck;
	private String tcheck;
	private List<String> selectArray;
	private List<String> inputArray;
	private List<String> titleArray;
	private List<String> uinoArray;	
	
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
	public String getsTotal() {
		return sTotal;
	}
	public void setsTotal(String sTotal) {
		this.sTotal = sTotal;
	}
	public String getiTotal() {
		return iTotal;
	}
	public void setiTotal(String iTotal) {
		this.iTotal = iTotal;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getTitleCode() {
		return titleCode;
	}
	public void setTitleCode(String titleCode) {
		this.titleCode = titleCode;
	}
	public String getOrgan() {
		return organ;
	}
	public void setOrgan(String organ) {
		this.organ = organ;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public int getAuthGroupCode() {
		return authGroupCode;
	}
	public void setAuthGroupCode(int authGroupCode) {
		this.authGroupCode = authGroupCode;
	}	
	public String getAuthOrganCode() {
		return authOrganCode;
	}
	public void setAuthOrganCode(String authOrganCode) {
		this.authOrganCode = authOrganCode;
	}	
	public String getAuthOrganName() {
		return authOrganName;
	}
	public void setAuthOrganName(String authOrganName) {
		this.authOrganName = authOrganName;
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
	public List<String> getTitleArray() {
		return titleArray;
	}
	public void setTitleArray(List<String> titleArray) {
		this.titleArray = titleArray;
	}
	public List<String> getUinoArray() {
		return uinoArray;
	}
	public void setUinoArray(List<String> uinoArray) {
		this.uinoArray = uinoArray;
	}
	public String getScheck() {
		return scheck;
	}
	public void setScheck(String scheck) {
		this.scheck = scheck;
	}
	public String getIcheck() {
		return icheck;
	}
	public void setIcheck(String icheck) {
		this.icheck = icheck;
	}
	public String getTcheck() {
		return tcheck;
	}
	public void setTcheck(String tcheck) {
		this.tcheck = tcheck;
	}
	
}
