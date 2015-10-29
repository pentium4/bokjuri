package lionsclubs.com.MM3.MM3_9.MM3_38;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_38VO extends ComDefaultVO implements Serializable{
	private String districtCode;	/* 지구코드 */
	private String clubCode;	/* 클럽코드 */
	private String sessionYear;	/* 회기년도 */
	private String eventCode;	/* 행사코드 */
	private String eventName;	/* 행사명 */
	private String eventDate;	/* 행사일자 */
	private String eventPlace;	/* 행사장소 */
	private String eventDesc;	/* 행사내용 */
	private String totalScore;	/* 점수계 */
	
	public String getDistrictCode() {
		return districtCode;
	}
	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}
	public String getClubCode() {
		return clubCode;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getEventCode() {
		return eventCode;
	}
	public void setEventCode(String eventCode) {
		this.eventCode = eventCode;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	public String getEventPlace() {
		return eventPlace;
	}
	public void setEventPlace(String eventPlace) {
		this.eventPlace = eventPlace;
	}
	public String getEventDesc() {
		return eventDesc;
	}
	public void setEventDesc(String eventDesc) {
		this.eventDesc = eventDesc;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
}
