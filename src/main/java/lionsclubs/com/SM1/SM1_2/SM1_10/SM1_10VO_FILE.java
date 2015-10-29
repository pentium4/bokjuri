package lionsclubs.com.SM1.SM1_2.SM1_10;

import java.io.Serializable;

public class SM1_10VO_FILE implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer	idnNoForUpload                 	; //   IDN_NO                 int              일련번호
	private String  fileIdForUpload					; //   사진파일 아이디
	private Integer	idxForUpload					;

	public Integer getIdnNoForUpload() {
		return idnNoForUpload;
	}
	public void setIdnNoForUpload(Integer idnNoForUpload) {
		this.idnNoForUpload = idnNoForUpload;
	}
	public String getFileIdForUpload() {
		return fileIdForUpload;
	}
	public void setFileIdForUpload(String fileIdForUpload) {
		this.fileIdForUpload = fileIdForUpload;
	}
	public Integer getIdxForUpload() {
		return idxForUpload;
	}
	public void setIdxForUpload(Integer idxForUpload) {
		this.idxForUpload = idxForUpload;
	}
}
