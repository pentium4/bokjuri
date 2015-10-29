package home.com.lions355d.schedule;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class ScheduleVO implements Serializable{
	private String organCode;	/* 조직코드 */
	private String organName;	/* 조직명 */
	private String sessionYear;	/* 회기년도 */
	
	private String clubCode;	/* 클럽코드 */
	private String title;	/* 번호 */
	private String start;	/* 행사명 */
	private String end;	/* 행사내용 */
	
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
	public String getClubCode() {
		return clubCode;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
}
