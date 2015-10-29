package lionsclubs.com.MM2.MM2_5.MM2_30;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_30VO extends ComDefaultVO implements Serializable{
	private String sessionYear;	/* 회기년 */
	private String idnNo;
	private String organCode;
	private String organName;
	private String eventStartDate = new SimpleDateFormat("yyyyMMdd").format(new Date());	/* 행사시작기간 */
	private String eventEndDate;	/* 행사종료기간 */
	private String eventStartTime;	/* 행사시작시간 */
	private String eventEndTime;	/* 행사종료시간 */
	private String eventNameCode;	/* 행사명코드 */
	private String eventName;	/* 행사명 */
	private String eventDesc;	/* 행사내용 및 장소 */
	private String memberNoCnt;	/* 인원수 */
	private String fileId;	/* 사진 */
	private String fileCnt;	/* 사진갯수 */
	private String order = "1";	/* 기간 : 1, 행사명 : 2 */
	private String eventOrganNames;		/* 행사 주최/주관/참석 조직 */
	
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
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
	public String getEventNameCode() {
		return eventNameCode;
	}
	public void setEventNameCode(String eventNameCode) {
		this.eventNameCode = eventNameCode;
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
	public String getMemberNoCnt() {
		return memberNoCnt;
	}
	public void setMemberNoCnt(String memberNoCnt) {
		this.memberNoCnt = memberNoCnt;
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
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getEventOrganNames() {
		return eventOrganNames;
	}
	public void setEventOrganNames(String eventOrganNames) {
		this.eventOrganNames = eventOrganNames;
	}
}
