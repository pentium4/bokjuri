package lionsclubs.com.MM3.MM3_13.MM3_55;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_55VO extends ComDefaultVO implements Serializable{
	private String organCode;	/* 조직코드 */
	private String sessionYear;	/* 회기년도 */
	
	private String searchMemberNo;	/* 검색 회원번호 */
	private String memberNo;	/* 회원번호 */
	private String name;	/* 성명 */
	private String chinName;	/* 한자 */
	private String engName;	/* 영문 */
	private String sectorClub;	/* 소속클럽 */
	private String sectorClubCode;	/* 소속클럽코드 */
	private String division;	/* 구분 */
	private String birth;	/* 생년월일 */
	private String singDate;	/* 입회일자 */
	private String singYearTerm;	/* 입회일자차이(년) */
	private String singMonthTerm;	/* 입회일자차이(월) */	
	private String singDivisionDate;	/* 입회구분일 */
	private String singDivision;	/* 입회구분 */
	private String quitDate;	/* 퇴회일자 */
	private String quitDivision;	/* 퇴회구분 */
	private String clubTitle;	/* 클럽직책 */
	private String divisionSector;	/* 분과소속 */
	private String districtTitle;	/* 지구직책 */
	private String complexTitle;	/* 복합지구직책 */
	private String associationTitle;	/* 연합회직책 */
	private String memberPictureFile;	/* 회원사진파일 */
	private String nessPictureFile;	/* 네스사진파일 */
	private String year;	/* 회기년도 */
	private String yearMonth;	/* 회기년월 */
    private String prevMemberNo;	/* 이전 memberNo */
    private String nextMemberNo;	/* 다음 memberNo */
    
	private String idnNo;	/* 번호 */
    private String repOrganName;	/* 담당조직명 */
    private String repOrganCode;	/* 담당조직코드 */
    private String repStartDate;	/* 담당시작일 */
    private String repEndDate;	/* 담당종료일 */
    private String workPlace;	/* 근무지 */
    private String organOfficerMemberNo;	/* 조직책임자 회번 */
    private String organOfficerMemberName;	/* 조직책임자명 */
    private String hp;	/* 책임자 HP */
    private String tel;	/* 전화번호 */
    
	private Date insertDate;	/* 생성일자 */
	private String insertName;	/* 생성자 */
	private Date updateDate;	/* 수정일자 */
	private String updateName;	/* 수정자 */    
    
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
	public String getSearchMemberNo() {
		return searchMemberNo;
	}
	public void setSearchMemberNo(String searchMemberNo) {
		this.searchMemberNo = searchMemberNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getChinName() {
		return chinName;
	}
	public void setChinName(String chinName) {
		this.chinName = chinName;
	}
	public String getEngName() {
		return engName;
	}
	public void setEngName(String engName) {
		this.engName = engName;
	}
	public String getSectorClub() {
		return sectorClub;
	}
	public void setSectorClub(String sectorClub) {
		this.sectorClub = sectorClub;
	}
	public String getSectorClubCode() {
		return sectorClubCode;
	}
	public void setSectorClubCode(String sectorClubCode) {
		this.sectorClubCode = sectorClubCode;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getSingDate() {
		return singDate;
	}
	public void setSingDate(String singDate) {
		this.singDate = singDate;
	}
	public String getSingYearTerm() {
		return singYearTerm;
	}
	public void setSingYearTerm(String singYearTerm) {
		this.singYearTerm = singYearTerm;
	}
	public String getSingMonthTerm() {
		return singMonthTerm;
	}
	public void setSingMonthTerm(String singMonthTerm) {
		this.singMonthTerm = singMonthTerm;
	}
	public String getSingDivisionDate() {
		return singDivisionDate;
	}
	public void setSingDivisionDate(String singDivisionDate) {
		this.singDivisionDate = singDivisionDate;
	}
	public String getSingDivision() {
		return singDivision;
	}
	public void setSingDivision(String singDivision) {
		this.singDivision = singDivision;
	}
	public String getQuitDate() {
		return quitDate;
	}
	public void setQuitDate(String quitDate) {
		this.quitDate = quitDate;
	}
	public String getQuitDivision() {
		return quitDivision;
	}
	public void setQuitDivision(String quitDivision) {
		this.quitDivision = quitDivision;
	}
	public String getClubTitle() {
		return clubTitle;
	}
	public void setClubTitle(String clubTitle) {
		this.clubTitle = clubTitle;
	}
	public String getDivisionSector() {
		return divisionSector;
	}
	public void setDivisionSector(String divisionSector) {
		this.divisionSector = divisionSector;
	}
	public String getDistrictTitle() {
		return districtTitle;
	}
	public void setDistrictTitle(String districtTitle) {
		this.districtTitle = districtTitle;
	}
	public String getComplexTitle() {
		return complexTitle;
	}
	public void setComplexTitle(String complexTitle) {
		this.complexTitle = complexTitle;
	}
	public String getAssociationTitle() {
		return associationTitle;
	}
	public void setAssociationTitle(String associationTitle) {
		this.associationTitle = associationTitle;
	}
	public String getMemberPictureFile() {
		return memberPictureFile;
	}
	public void setMemberPictureFile(String memberPictureFile) {
		this.memberPictureFile = memberPictureFile;
	}
	public String getNessPictureFile() {
		return nessPictureFile;
	}
	public void setNessPictureFile(String nessPictureFile) {
		this.nessPictureFile = nessPictureFile;
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
	public String getPrevMemberNo() {
		return prevMemberNo;
	}
	public void setPrevMemberNo(String prevMemberNo) {
		this.prevMemberNo = prevMemberNo;
	}
	public String getNextMemberNo() {
		return nextMemberNo;
	}
	public void setNextMemberNo(String nextMemberNo) {
		this.nextMemberNo = nextMemberNo;
	}
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getRepOrganName() {
		return repOrganName;
	}
	public void setRepOrganName(String repOrganName) {
		this.repOrganName = repOrganName;
	}
	public String getRepOrganCode() {
		return repOrganCode;
	}
	public void setRepOrganCode(String repOrganCode) {
		this.repOrganCode = repOrganCode;
	}
	public String getRepStartDate() {
		return repStartDate;
	}
	public void setRepStartDate(String repStartDate) {
		this.repStartDate = repStartDate;
	}
	public String getRepEndDate() {
		return repEndDate;
	}
	public void setRepEndDate(String repEndDate) {
		this.repEndDate = repEndDate;
	}
	public String getWorkPlace() {
		return workPlace;
	}
	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}
	public String getOrganOfficerMemberNo() {
		return organOfficerMemberNo;
	}
	public void setOrganOfficerMemberNo(String organOfficerMemberNo) {
		this.organOfficerMemberNo = organOfficerMemberNo;
	}
	public String getOrganOfficerMemberName() {
		return organOfficerMemberName;
	}
	public void setOrganOfficerMemberName(String organOfficerMemberName) {
		this.organOfficerMemberName = organOfficerMemberName;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
}
