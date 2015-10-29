package lionsclubs.com.MM2.MM2_5.MM2_31;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_31VO extends ComDefaultVO implements Serializable{
	private String organCode;	/* 조직코드 */
	private String sessionYear;	/* 회기년 */
	private String searchKind = "s1";	/* 조회구분 */
	
	private String idnNo;	/* 번호 */
	private String eventName;	/* 행사명 */
	private String eventDesc;	/* 행사내용 */
	private String organName;	/* 행사주최 조직명 */
	private String eventStartDate;	/* 행사시작기간 */
	private String eventEndDate;	/* 행사종료기간 */
	private String eventNameCode;	/* 행사명코드 */
	private String fileId;	/* 사진 */
	private String fileSeq;	/* 사진순서 */	
	
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getSearchKind() {
		return searchKind;
	}
	public void setSearchKind(String searchKind) {
		this.searchKind = searchKind;
	}
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEventDesc() {
		return eventDesc;
	}
	public void setEventDesc(String eventDesc) {
		this.eventDesc = eventDesc;
	}
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
	}
	public String getEventStartDate() {
		return eventStartDate;
	}
	public void setEventStartDate(String eventStartDate) {
		this.eventStartDate = eventStartDate;
	}
	public String getEventEndDate() {
		return eventEndDate;
	}
	public void setEventEndDate(String eventEndDate) {
		this.eventEndDate = eventEndDate;
	}
	public String getEventNameCode() {
		return eventNameCode;
	}
	public void setEventNameCode(String eventNameCode) {
		this.eventNameCode = eventNameCode;
	}
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
