package lionsclubs.com.SM1.SM1_4.SM1_14;

import java.io.Serializable;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class SM1_14VO extends ComDefaultVO implements Serializable {
	private String idnNo;	/* 번호 */
	private String sessionYear;	/* 회기년도 */
	private String organLevelCode;	/* 조직레벨코드 */
	private String organCode;	/* 조직코드 */
	private String titleName;	/* 직책명칭 */
	private String titleCode;	/* 직책코드 */
	private String titleOrd;	/* 직책순서 */
	private String titleDesc;	/* 직책설명 */
	private String code;	/* 코드 */
	private String codeName;	/* 코드명 */
	private String codeDesc;	/* 코드설명 */
	private String ord;	/* 순서 */
	private List<SM1_14VO> districtTitleArray;
	private String insertDate;	/* 생성일자 */
	private String insertName;	/* 생성자 */
	private String updateDate;	/* 수정일자 */
	private String updateName;	/* 수정자 */
	
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getOrganLevelCode() {
		return organLevelCode;
	}
	public void setOrganLevelCode(String organLevelCode) {
		this.organLevelCode = organLevelCode;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getTitleName() {
		return titleName;
	}
	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}
	public String getTitleCode() {
		return titleCode;
	}
	public void setTitleCode(String titleCode) {
		this.titleCode = titleCode;
	}
	public String getTitleOrd() {
		return titleOrd;
	}
	public void setTitleOrd(String titleOrd) {
		this.titleOrd = titleOrd;
	}
	public String getTitleDesc() {
		return titleDesc;
	}
	public void setTitleDesc(String titleDesc) {
		this.titleDesc = titleDesc;
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
	public String getCodeDesc() {
		return codeDesc;
	}
	public void setCodeDesc(String codeDesc) {
		this.codeDesc = codeDesc;
	}
	public String getOrd() {
		return ord;
	}
	public void setOrd(String ord) {
		this.ord = ord;
	}
	public List<SM1_14VO> getDistrictTitleArray() {
		return districtTitleArray;
	}
	public void setDistrictTitleArray(List<SM1_14VO> districtTitleArray) {
		this.districtTitleArray = districtTitleArray;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getInsertName() {
		return insertName;
	}
	public void setInsertName(String insertName) {
		this.insertName = insertName;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateName() {
		return updateName;
	}
	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}
}

