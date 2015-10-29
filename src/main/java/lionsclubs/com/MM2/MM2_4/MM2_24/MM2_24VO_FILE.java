package lionsclubs.com.MM2.MM2_4.MM2_24;

import java.io.Serializable;

public class MM2_24VO_FILE implements Serializable{
	private String chkIdx;
	private static final long serialVersionUID = 1L;
	private String organCode;
	private String fileId;
	private String inIdnNo;
	
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getInIdnNo() {
		return inIdnNo;
	}
	public void setInIdnNo(String inIdnNo) {
		this.inIdnNo = inIdnNo;
	}
	public String getChkIdx() {
		return chkIdx;
	}
	public void setChkIdx(String chkIdx) {
		this.chkIdx = chkIdx;
	}
}
