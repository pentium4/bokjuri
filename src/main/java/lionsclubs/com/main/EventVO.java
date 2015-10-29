package lionsclubs.com.main;

import java.io.Serializable;


public class EventVO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String idnNo;
	private String organCode;	/* 조직코드 */
	private String eventStartDate;	/* 행사시작기간 */
	private String eventEndDate;	/* 행사종료기간 */
	private String eventStartTime;	/* 행사시작시간 */
	private String eventEndTime;	/* 행사종료시간 */
	private String kindName;	/* 행사주관명 */
	private String eventName;	/* 행사명 */
	private String eventDesc;	/* 행사내용 및 장소 */
	private String fileId;	/* 사진 */
	private String fileCnt;	/* 사진갯수 */
	private String finishYn;	/* 마감여부 */
	private String clubName;	/* 작성자 클럽명 */
	private String insertName;		/* 작성자명 */
	private String title;		/* 작성자 타이틀 */
	
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
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
	public String getEventStartTime() {
		return eventStartTime;
	}
	public void setEventStartTime(String eventStartTime) {
		this.eventStartTime = eventStartTime;
	}
	public String getEventEndTime() {
		return eventEndTime;
	}
	public void setEventEndTime(String eventEndTime) {
		this.eventEndTime = eventEndTime;
	}
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
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
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(String fileCnt) {
		this.fileCnt = fileCnt;
	}
	public String getFinishYn() {
		return finishYn;
	}
	public void setFinishYn(String finishYn) {
		this.finishYn = finishYn;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getInsertName() {
		return insertName;
	}
	public void setInsertName(String insertName) {
		this.insertName = insertName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
