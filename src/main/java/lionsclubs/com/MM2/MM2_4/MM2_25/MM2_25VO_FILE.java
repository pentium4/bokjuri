package lionsclubs.com.MM2.MM2_4.MM2_25;

import java.io.Serializable;

public class MM2_25VO_FILE implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String chkIdx;
	private String inputSessionYyyy;
	private String inputSessionMm;
	private String inputOrganCode;
	private String inputConfKindCode;
	private Integer inputConfIdnNo;
	private Integer inputEventId;
	private String fileId;
	
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
	public Integer getInputEventId() {
		return inputEventId;
	}
	public void setInputEventId(Integer inputEventId) {
		this.inputEventId = inputEventId;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getChkIdx() {
		return chkIdx;
	}
	public void setChkIdx(String chkIdx) {
		this.chkIdx = chkIdx;
	}
}
