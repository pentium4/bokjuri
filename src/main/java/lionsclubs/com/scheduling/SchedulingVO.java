package lionsclubs.com.scheduling;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class SchedulingVO extends ComDefaultVO implements Serializable{
	private String fileId;	/* 파일ID */

	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
}
