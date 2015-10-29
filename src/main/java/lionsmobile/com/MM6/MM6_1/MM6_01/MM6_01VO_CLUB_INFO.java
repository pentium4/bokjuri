package lionsmobile.com.MM6.MM6_1.MM6_01;

import java.io.Serializable;

public class MM6_01VO_CLUB_INFO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String clubName			; /* 클럽명 */
	private String clubNameEng		; /* 클럽명 영어 */
	private String area				; /* 지역번호 */
	private String zone				; /* 지대번호 */
	private String organMeeting		; /* 조직총회일 */
	private String spotNight		; /* 현장의밤 */
	private String registerNo		; /* 국제본부NO */
	private String tel				; /* 전화 */
	private String fax				; /* 팩스 */
	private String monthlyMeeting	; /* 월례회 */ 
	private String executiveMeeting	; /* 이사회 */
	private String sponserClubName	; /* 스폰스 클럽 */
	
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getOrganMeeting() {
		return organMeeting;
	}
	public void setOrganMeeting(String organMeeting) {
		this.organMeeting = organMeeting;
	}
	public String getSpotNight() {
		return spotNight;
	}
	public void setSpotNight(String spotNight) {
		this.spotNight = spotNight;
	}
	public String getRegisterNo() {
		return registerNo;
	}
	public void setRegisterNo(String registerNo) {
		this.registerNo = registerNo;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getMonthlyMeeting() {
		return monthlyMeeting;
	}
	public void setMonthlyMeeting(String monthlyMeeting) {
		this.monthlyMeeting = monthlyMeeting;
	}
	public String getExecutiveMeeting() {
		return executiveMeeting;
	}
	public void setExecutiveMeeting(String executiveMeeting) {
		this.executiveMeeting = executiveMeeting;
	}
	public String getSponserClubName() {
		return sponserClubName;
	}
	public void setSponserClubName(String sponserClubName) {
		this.sponserClubName = sponserClubName;
	}
	public String getClubNameEng() {
		return clubNameEng;
	}
	public void setClubNameEng(String clubNameEng) {
		this.clubNameEng = clubNameEng;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}	
}
