package lionsclubs.com.MM1.MM1_1.MM1_07;

import java.io.Serializable;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class MM1_07VO extends ComDefaultVO implements Serializable {
	private static final long serialVersionUID = 1L;
	/*
	 * 행사출석현황
	 */
	private int idnNo;
	private String memberNo;
	private String attendDate;
	private String monthMeeting;
	private String directorMeeting;
	private String event1Check;
	private String event2Check;
	private String event3Check;
	
	/*
	 * 행사명 등록
	 */
	private String organCode;
	private String eventYyyymm;
	private String event1;
	private String event2;
	private String event3;
	
	private String insertDate;
	private String insertName;
	private String updateDate;
	private String updateName;
	
	/*
	 * search
	 */
	private String sessionYear;
	
	/*
	 * insert
	 */
	private List<MM1_07VO> eventArray;

	public int getIdnNo() {
		return idnNo;
	}

	public void setIdnNo(int idnNo) {
		this.idnNo = idnNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getAttendDate() {
		return attendDate;
	}

	public void setAttendDate(String attendDate) {
		this.attendDate = attendDate;
	}

	public String getMonthMeeting() {
		return monthMeeting;
	}

	public void setMonthMeeting(String monthMeeting) {
		this.monthMeeting = monthMeeting;
	}

	public String getDirectorMeeting() {
		return directorMeeting;
	}

	public void setDirectorMeeting(String directorMeeting) {
		this.directorMeeting = directorMeeting;
	}

	public String getEvent1Check() {
		return event1Check;
	}

	public void setEvent1Check(String event1Check) {
		this.event1Check = event1Check;
	}

	public String getEvent2Check() {
		return event2Check;
	}

	public void setEvent2Check(String event2Check) {
		this.event2Check = event2Check;
	}

	public String getEvent3Check() {
		return event3Check;
	}

	public void setEvent3Check(String event3Check) {
		this.event3Check = event3Check;
	}

	public String getOrganCode() {
		return organCode;
	}

	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}

	public String getEventYyyymm() {
		return eventYyyymm;
	}

	public void setEventYyyymm(String eventYyyymm) {
		this.eventYyyymm = eventYyyymm;
	}

	public String getEvent1() {
		return event1;
	}

	public void setEvent1(String event1) {
		this.event1 = event1;
	}

	public String getEvent2() {
		return event2;
	}

	public void setEvent2(String event2) {
		this.event2 = event2;
	}

	public String getEvent3() {
		return event3;
	}

	public void setEvent3(String event3) {
		this.event3 = event3;
	}

	public String getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}

	public String getInsertName() {
		return insertName;
	}

	public void setInsertName(String insertName) {
		this.insertName = insertName;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getUpdateName() {
		return updateName;
	}

	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}

	public String getSessionYear() {
		return sessionYear;
	}

	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}

	public List<MM1_07VO> getEventArray() {
		return eventArray;
	}

	public void setEventArray(List<MM1_07VO> eventArray) {
		this.eventArray = eventArray;
	}
}
