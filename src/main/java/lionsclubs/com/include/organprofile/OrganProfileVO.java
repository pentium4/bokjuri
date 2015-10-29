package lionsclubs.com.include.organprofile;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class OrganProfileVO extends ComDefaultVO implements Serializable {
	private String lvl;
	private String lvlStart;
	private String lvlEnd;	
	private String idnNo;	/* 번호 */
	private String memberNo;	/* 회원번호 */
	private String associationCode;	/* 연합회코드 */
	private String complexCode;	/* 복합지구코드 */
	private String districtCode;	/* 지구코드 */
	private String organCode;	/* 클럽코드 */
	private String koName;	/* 클럽명 */
	private String chinName;	/* 한자 */
	private String enName;	/* 영문 */
	private String organMeeting;	/* 총회 */
	private String spotNight;	/* 헌장 */
	private String officerSolidCode;	/* 책임자연대 코드 */
	private String organOfficerMemberNo;	/* 조직책임자 회원번호 */
	private String organOfficerMemberPictureFile;	/* 조직책임자 회원사진 */
	private String organOfficerNessPictureFile;	/* 조직책임자 배우자사진 */
	private String organOfficerMemberName;	/* 조직책임자 이름 */
	private String organOfficerMemberModelCode;	/* 조직책임자 호칭 */
	private String organOffcerMemberBirth;	/* 생년월일 */
	private String organOffcerMemberSingDate;	/* 입회일자 */
	private String organOffcerMemberSingYearTerm;	/* 입회일자차이(년) */
	private String organOffcerMemberSingMonthTerm;	/* 입회일자차이(월) */		
	private String guidingMemeberNo;	/* 가이딩회원번호 */
	private String guidingClubCode;	/* 가이딩클럽코드 */
	private String guidingClubCodeName;	/* 가이딩클럽명 */
	private String guidingMemberName;	/* 가이딩회원 이름 */
	private String year;	/* 회기년도 */
	private String yearMonth;	/* 회기년월 */	
	private String prevOrganCode;	/* 이전 조직코드 */
	private String nextOrganCode;	/* 다음 조직코드 */
	
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
	}
	public String getLvlStart() {
		return lvlStart;
	}
	public void setLvlStart(String lvlStart) {
		this.lvlStart = lvlStart;
	}
	public String getLvlEnd() {
		return lvlEnd;
	}
	public void setLvlEnd(String lvlEnd) {
		this.lvlEnd = lvlEnd;
	}
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getAssociationCode() {
		return associationCode;
	}
	public void setAssociationCode(String associationCode) {
		this.associationCode = associationCode;
	}
	public String getComplexCode() {
		return complexCode;
	}
	public void setComplexCode(String complexCode) {
		this.complexCode = complexCode;
	}
	public String getDistrictCode() {
		return districtCode;
	}
	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getKoName() {
		return koName;
	}
	public void setKoName(String koName) {
		this.koName = koName;
	}
	public String getChinName() {
		return chinName;
	}
	public void setChinName(String chinName) {
		this.chinName = chinName;
	}
	public String getEnName() {
		return enName;
	}
	public void setEnName(String enName) {
		this.enName = enName;
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
	public String getOfficerSolidCode() {
		return officerSolidCode;
	}
	public void setOfficerSolidCode(String officerSolidCode) {
		this.officerSolidCode = officerSolidCode;
	}
	public String getOrganOfficerMemberNo() {
		return organOfficerMemberNo;
	}
	public void setOrganOfficerMemberNo(String organOfficerMemberNo) {
		this.organOfficerMemberNo = organOfficerMemberNo;
	}
	public String getOrganOfficerMemberPictureFile() {
		return organOfficerMemberPictureFile;
	}
	public void setOrganOfficerMemberPictureFile(
			String organOfficerMemberPictureFile) {
		this.organOfficerMemberPictureFile = organOfficerMemberPictureFile;
	}
	public String getOrganOfficerNessPictureFile() {
		return organOfficerNessPictureFile;
	}
	public void setOrganOfficerNessPictureFile(String organOfficerNessPictureFile) {
		this.organOfficerNessPictureFile = organOfficerNessPictureFile;
	}
	public String getOrganOfficerMemberName() {
		return organOfficerMemberName;
	}
	public void setOrganOfficerMemberName(String organOfficerMemberName) {
		this.organOfficerMemberName = organOfficerMemberName;
	}
	public String getOrganOfficerMemberModelCode() {
		return organOfficerMemberModelCode;
	}
	public void setOrganOfficerMemberModelCode(String organOfficerMemberModelCode) {
		this.organOfficerMemberModelCode = organOfficerMemberModelCode;
	}
	public String getOrganOffcerMemberBirth() {
		return organOffcerMemberBirth;
	}
	public void setOrganOffcerMemberBirth(String organOffcerMemberBirth) {
		this.organOffcerMemberBirth = organOffcerMemberBirth;
	}
	public String getOrganOffcerMemberSingDate() {
		return organOffcerMemberSingDate;
	}
	public void setOrganOffcerMemberSingDate(String organOffcerMemberSingDate) {
		this.organOffcerMemberSingDate = organOffcerMemberSingDate;
	}
	public String getOrganOffcerMemberSingYearTerm() {
		return organOffcerMemberSingYearTerm;
	}
	public void setOrganOffcerMemberSingYearTerm(
			String organOffcerMemberSingYearTerm) {
		this.organOffcerMemberSingYearTerm = organOffcerMemberSingYearTerm;
	}
	public String getOrganOffcerMemberSingMonthTerm() {
		return organOffcerMemberSingMonthTerm;
	}
	public void setOrganOffcerMemberSingMonthTerm(
			String organOffcerMemberSingMonthTerm) {
		this.organOffcerMemberSingMonthTerm = organOffcerMemberSingMonthTerm;
	}
	public String getGuidingMemeberNo() {
		return guidingMemeberNo;
	}
	public void setGuidingMemeberNo(String guidingMemeberNo) {
		this.guidingMemeberNo = guidingMemeberNo;
	}
	public String getGuidingClubCode() {
		return guidingClubCode;
	}
	public void setGuidingClubCode(String guidingClubCode) {
		this.guidingClubCode = guidingClubCode;
	}
	public String getGuidingClubCodeName() {
		return guidingClubCodeName;
	}
	public void setGuidingClubCodeName(String guidingClubCodeName) {
		this.guidingClubCodeName = guidingClubCodeName;
	}
	public String getGuidingMemberName() {
		return guidingMemberName;
	}
	public void setGuidingMemberName(String guidingMemberName) {
		this.guidingMemberName = guidingMemberName;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getYearMonth() {
		return yearMonth;
	}
	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}
	public String getPrevOrganCode() {
		return prevOrganCode;
	}
	public void setPrevOrganCode(String prevOrganCode) {
		this.prevOrganCode = prevOrganCode;
	}
	public String getNextOrganCode() {
		return nextOrganCode;
	}
	public void setNextOrganCode(String nextOrganCode) {
		this.nextOrganCode = nextOrganCode;
	}
}
