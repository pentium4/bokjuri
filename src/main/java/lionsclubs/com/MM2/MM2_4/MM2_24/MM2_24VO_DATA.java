package lionsclubs.com.MM2.MM2_4.MM2_24;

import java.io.Serializable;

public class MM2_24VO_DATA implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer	chkIdx;
	private String inputOrganCode;
	private Integer	inputInIdnNo;
	private Integer	inputInOrder;
	private String inputProcessOrdDesc;
	private String inputHost1;
	private String inputHost2;
	private String inputFileId;
	private String fileCnt;
	private String memberNo;
	
	public Integer getChkIdx() {
		return chkIdx;
	}
	public void setChkIdx(Integer chkIdx) {
		this.chkIdx = chkIdx;
	}
	public String getInputOrganCode() {
		return inputOrganCode;
	}
	public void setInputOrganCode(String inputOrganCode) {
		this.inputOrganCode = inputOrganCode;
	}
	public Integer getInputInIdnNo() {
		return inputInIdnNo;
	}
	public void setInputInIdnNo(Integer inputInIdnNo) {
		this.inputInIdnNo = inputInIdnNo;
	}
	public Integer getInputInOrder() {
		return inputInOrder;
	}
	public void setInputInOrder(Integer inputInOrder) {
		this.inputInOrder = inputInOrder;
	}
	public String getInputProcessOrdDesc() {
		return inputProcessOrdDesc;
	}
	public void setInputProcessOrdDesc(String inputProcessOrdDesc) {
		this.inputProcessOrdDesc = inputProcessOrdDesc;
	}
	public String getInputHost1() {
		return inputHost1;
	}
	public void setInputHost1(String inputHost1) {
		this.inputHost1 = inputHost1;
	}
	public String getInputHost2() {
		return inputHost2;
	}
	public void setInputHost2(String inputHost2) {
		this.inputHost2 = inputHost2;
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
