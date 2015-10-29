package lionsclubs.com.cmm.web.jfile;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class JfileVO extends ComDefaultVO implements Serializable {
	private String fileId;
	private String fileSeq;
	
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileSeq() {
		return fileSeq;
	}
	public void setFileSeq(String fileSeq) {
		this.fileSeq = fileSeq;
	}
}
