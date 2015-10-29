package lionsclubs.com.MM3.MM3_9.MM3_37;

import java.io.Serializable;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_37VO extends ComDefaultVO implements Serializable{
	private String districtCode;	/* 지구코드 */
	private String eventCode;	/* 행사코드 */
	private String eventDate;	/* 행사일자 */
	private String eventPlace;	/* 행사장소 */
	private String eventDesc;	/* 행사내용 */
	private String clubCode;	/* 클럽코드 */
	private String clubName;	/* 클럽명 */
	private String clubPresidentName;	/* 클럽회장명 */
	private String subjectiveScore;	/* 주관점수 */
	private String joinScore;	/* 참가점수 */
	private String serviceScore;	/* 봉사금점수 */
	private String totalScore;	/* 점수계 */
	private List<MM3_37VO> meritArray;	/* 공적점수 */
	
	public String getDistrictCode() {
		return districtCode;
	}
	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}
	public String getEventCode() {
		return eventCode;
	}
	public void setEventCode(String eventCode) {
		this.eventCode = eventCode;
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
	public String getClubPresidentName() {
		return clubPresidentName;
	}
	public void setClubPresidentName(String clubPresidentName) {
		this.clubPresidentName = clubPresidentName;
	}
	public String getSubjectiveScore() {
		return subjectiveScore;
	}
	public void setSubjectiveScore(String subjectiveScore) {
		this.subjectiveScore = subjectiveScore;
	}
	public String getJoinScore() {
		return joinScore;
	}
	public void setJoinScore(String joinScore) {
		this.joinScore = joinScore;
	}
	public String getServiceScore() {
		return serviceScore;
	}
	public void setServiceScore(String serviceScore) {
		this.serviceScore = serviceScore;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	public List<MM3_37VO> getMeritArray() {
		return meritArray;
	}
	public void setMeritArray(List<MM3_37VO> meritArray) {
		this.meritArray = meritArray;
	}
}
