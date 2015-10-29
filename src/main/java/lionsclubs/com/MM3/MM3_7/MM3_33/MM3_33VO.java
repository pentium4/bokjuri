package lionsclubs.com.MM3.MM3_7.MM3_33;

import java.io.Serializable;
import java.util.List;

import lionsclubs.com.cmm.commoncode.CommonCodeVO;
import egovframework.com.cmm.ComDefaultVO;

public class MM3_33VO extends ComDefaultVO implements Serializable{
	private static final long serialVersionUID = 1L;
	private String thisYear;
	private String thisOrganCode;
	
	private List<MM3_33VO_DATA> listData;
	
	private List<Integer> chkIdx; 
	private List<Integer> idnNo; 
	private List<String> memberNo;
	private List<String> memberName;
	private List<String> titleCode;
	private List<String> appointDate;
	private List<String> directorAnte;
	private List<String> sessionYear;
	private List<String> organCode;
	private List<String> organName;
	
	private String insertName;
	private String updateName;
	
	/*
	 * 코드 리스트
	 */
	private List<CommonCodeVO> codeList;
	
	public String getThisYear() {
		return thisYear;
	}
	public void setThisYear(String thisYear) {
		this.thisYear = thisYear;
	}
	public String getThisOrganCode() {
		return thisOrganCode;
	}
	public void setThisOrganCode(String thisOrganCode) {
		this.thisOrganCode = thisOrganCode;
	}
	public List<MM3_33VO_DATA> getListData() {
		return listData;
	}
	public void setListData(List<MM3_33VO_DATA> listData) {
		this.listData = listData;
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
	public List<String> getTitleCode() {
		return titleCode;
	}
	public void setTitleCode(List<String> titleCode) {
		this.titleCode = titleCode;
	}
	public List<String> getAppointDate() {
		return appointDate;
	}
	public void setAppointDate(List<String> appointDate) {
		this.appointDate = appointDate;
	}
	public List<String> getDirectorAnte() {
		return directorAnte;
	}
	public void setDirectorAnte(List<String> directorAnte) {
		this.directorAnte = directorAnte;
	}
	public List<String> getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(List<String> sessionYear) {
		this.sessionYear = sessionYear;
	}
	public List<String> getOrganCode() {
		return organCode;
	}
	public void setOrganCode(List<String> organCode) {
		this.organCode = organCode;
	}
	public List<String> getOrganName() {
		return organName;
	}
	public void setOrganName(List<String> organName) {
		this.organName = organName;
	}
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
	public List<CommonCodeVO> getCodeList() {
		return codeList;
	}
	public void setCodeList(List<CommonCodeVO> codeList) {
		this.codeList = codeList;
	}
}
