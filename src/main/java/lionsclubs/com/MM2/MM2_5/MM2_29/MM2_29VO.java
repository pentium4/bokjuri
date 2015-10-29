package lionsclubs.com.MM2.MM2_5.MM2_29;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_29VO extends ComDefaultVO implements Serializable{
	private Integer idnNo;	/* 번호 */
	private String organCode;	/* 조직코드 */
	private String organName;	/* 조직명 */
	private String sessionYear;	/* 회기년 */
	private String eventStartDate;	/* 행사시작일자 */
	private String eventEndDate;	/* 행사종료일자 */
	private String eventStartTime;	/* 행사시작시간 */
	private String eventEndTime;	/* 행사종료시간 */
	private String eventNameCode;	/* 행사명코드 */
	private String eventName;	/* 행사명 */
	private String eventDesc;	/* 행사내용 */
	private String fileId;	/* 첨부파일ID */
	private String fileSeq;	/* 첨부파일Seq */
	private String fileCnt;	/* 파일갯수 */
	private String finishYn;	/* 마감여부 */
	
	private String eventClubIdnNo;	/* 클럽행사 번호 */
	private String clubCode;	/* 클럽코드 */
	private String clubName;	/* 클럽명 */
	private String memberNo;	/* 회원번호 */
	private String memberNoCnt;	/* 회원수 */
	private String name;	/* 이름 */
	private String kindCode;	/* 구분코드 */
	private String kindName;	/* 구분명 */
	private String eventOrganNames;		/* 행사 주최/주관/참석 조직 */
	private String eventMemberNo;	/* 행사인원 회원번호 */
	private String time;	/* 봉사시간 */
	private String score;	/* 점수 */
	private String merit;	/* 공적 */

	
	private String eventMemberIdnNo;	/* 행사인원 번호 */
	private List<MM2_29VO> eventMemberArray;	/* 행사인원 */

	private Date insertDate;	/* 생성일자 */
	private String insertName;	/* 생성자 */
	private Date updateDate;	/* 수정일자 */
	private String updateName;	/* 수정자 */
	
	private String searchKind = "s1";	/* 조회구분 */
	
	public Integer getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(Integer idnNo) {
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
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
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
	public String getEventClubIdnNo() {
		return eventClubIdnNo;
	}
	public void setEventClubIdnNo(String eventClubIdnNo) {
		this.eventClubIdnNo = eventClubIdnNo;
	}
	public String getClubCode() {
		return clubCode;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberNoCnt() {
		return memberNoCnt;
	}
	public void setMemberNoCnt(String memberNoCnt) {
		this.memberNoCnt = memberNoCnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKindCode() {
		return kindCode;
	}
	public void setKindCode(String kindCode) {
		this.kindCode = kindCode;
	}
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
	public String getEventOrganNames() {
		return eventOrganNames;
	}
	public void setEventOrganNames(String eventOrganNames) {
		this.eventOrganNames = eventOrganNames;
	}
	public String getEventMemberNo() {
		return eventMemberNo;
	}
	public void setEventMemberNo(String eventMemberNo) {
		this.eventMemberNo = eventMemberNo;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getMerit() {
		return merit;
	}
	public void setMerit(String merit) {
		this.merit = merit;
	}
	public String getEventMemberIdnNo() {
		return eventMemberIdnNo;
	}
	public void setEventMemberIdnNo(String eventMemberIdnNo) {
		this.eventMemberIdnNo = eventMemberIdnNo;
	}
	public List<MM2_29VO> getEventMemberArray() {
		return eventMemberArray;
	}
	public void setEventMemberArray(List<MM2_29VO> eventMemberArray) {
		this.eventMemberArray = eventMemberArray;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public String getInsertName() {
		return insertName;
	}
	public void setInsertName(String insertName) {
		this.insertName = insertName;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateName() {
		return updateName;
	}
	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}
	public String getSearchKind() {
		return searchKind;
	}
	public void setSearchKind(String searchKind) {
		this.searchKind = searchKind;
	}
}
