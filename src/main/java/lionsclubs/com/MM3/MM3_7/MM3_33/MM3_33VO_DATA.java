package lionsclubs.com.MM3.MM3_7.MM3_33;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_33VO_DATA extends ComDefaultVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer	chkIdx;
	private Integer	idnNo;
	private String sessionYear;
	private String organCode;
	private String organName;
	private String memberNo;
	private String memberName;
	private String titleCode;
	private String directorAnte;
	private String appointDate;
	
	private String insertName;
	private String updateName;
	
	
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
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
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
	public String getTitleCode() {
		return titleCode;
	}
	public void setTitleCode(String titleCode) {
		this.titleCode = titleCode;
	}
	public String getDirectorAnte() {
		return directorAnte;
	}
	public void setDirectorAnte(String directorAnte) {
		this.directorAnte = directorAnte;
	}
	public String getAppointDate() {
		return appointDate;
	}
	public void setAppointDate(String appointDate) {
		if (appointDate == null || appointDate.trim().equals("")) {
			
		}else{
			appointDate = appointDate.replaceAll("\\.", "");
		}
		this.appointDate = appointDate;
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
	
}
