package lionsclubs.com.MM2.MM2_4.MM2_27;

import java.io.Serializable;

public class MM2_27VO_DATA implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer	chkIdx;
	private String inputSessionYyyy;
	private String inputSessionMm;
	private String inputOrganCode;
	private String inputConfKindCode;
	private Integer inputConfIdnNo;
	private Integer inputIdnNo;
	private String inputInDate;
	private String inputInDesc;
	private String inputInPerson;
	private String inputTakeStatus;
	private String inputFileId;
	private String fileCnt;
	private String memberNo;
	
	public Integer getChkIdx() {
		return chkIdx;
	}
	public void setChkIdx(Integer chkIdx) {
		this.chkIdx = chkIdx;
	}
	public String getInputSessionYyyy() {
		return inputSessionYyyy;
	}
	public void setInputSessionYyyy(String inputSessionYyyy) {
		this.inputSessionYyyy = inputSessionYyyy;
	}
	public String getInputSessionMm() {
		return inputSessionMm;
	}
	public void setInputSessionMm(String inputSessionMm) {
		this.inputSessionMm = inputSessionMm;
	}
	public String getInputOrganCode() {
		return inputOrganCode;
	}
	public void setInputOrganCode(String inputOrganCode) {
		this.inputOrganCode = inputOrganCode;
	}
	public String getInputConfKindCode() {
		return inputConfKindCode;
	}
	public void setInputConfKindCode(String inputConfKindCode) {
		this.inputConfKindCode = inputConfKindCode;
	}
	public Integer getInputConfIdnNo() {
		return inputConfIdnNo;
	}
	public void setInputConfIdnNo(Integer inputConfIdnNo) {
		this.inputConfIdnNo = inputConfIdnNo;
	}
	public Integer getInputIdnNo() {
		return inputIdnNo;
	}
	public void setInputIdnNo(Integer inputIdnNo) {
		this.inputIdnNo = inputIdnNo;
	}
	public String getInputInDate() {
		return inputInDate;
	}
	public void setInputInDate(String inputInDate) {
		this.inputInDate = inputInDate.replace(".", "");
	}
	public String getInputInDesc() {
		return inputInDesc;
	}
	public void setInputInDesc(String inputInDesc) {
		this.inputInDesc = inputInDesc;
	}
	public String getInputInPerson() {
		return inputInPerson;
	}
	public void setInputInPerson(String inputInPerson) {
		this.inputInPerson = inputInPerson;
	}
	public String getInputTakeStatus() {
		return inputTakeStatus;
	}
	public void setInputTakeStatus(String inputTakeStatue) {
		this.inputTakeStatus = inputTakeStatue;
	}
	public String getInputFileId() {
		return inputFileId;
	}
	public void setInputFileId(String inputFileId) {
		this.inputFileId = inputFileId;
	}
	public String getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(String fileCnt) {
		this.fileCnt = fileCnt;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}


}
