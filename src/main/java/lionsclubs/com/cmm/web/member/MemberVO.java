package lionsclubs.com.cmm.web.member;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MemberVO extends ComDefaultVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String lvl;
	private String memberNo;	/* 회원번호 */
	private String name;	/* 성명 */
	private String birth;	/* 생년월일 */
	private String sectorDistrict;	/* 소속지구 */
	private String sectorClub;	/* 소속클럽 */
	private String sectorClubCode;	/* 소속클럽코드 */
	private String clubTitle;	/* 클럽직책 */
	private String divisionSector;	/* 분과소속 */
	private String districtTilte;	/* 지구직책 */ 
	private String quitDate; /* 퇴회일자 */
	private String quitDivision; /* 퇴회구분명 */
	private String expulsionFlag;	/* 제명구분 */
	private String quitYn;	/* 퇴회포함여부 */
	private String authYn = "Y";	/* 권한적용여부 */
	private String associationCode;	/* 연합회코드 */
	private String complexCode;	/* 복합지구코드 */
	private String districtCode;	/* 지구코드 */
	private String clubCode;	/* 지구코드 */
	private String homeTel;	/* 전화번호 */
	private String mobile;	/* HP번호 */
	private String fax;	/* 팩스번호 */
	private String mailAddress;	/* E-MAIL */	
	
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getSectorDistrict() {
		return sectorDistrict;
	}
	public void setSectorDistrict(String sectorDistrict) {
		this.sectorDistrict = sectorDistrict;
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
	public String getDistrictTilte() {
		return districtTilte;
	}
	public void setDistrictTilte(String districtTilte) {
		this.districtTilte = districtTilte;
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
	public String getExpulsionFlag() {
		return expulsionFlag;
	}
	public void setExpulsionFlag(String expulsionFlag) {
		this.expulsionFlag = expulsionFlag;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getQuitYn() {
		return quitYn;
	}
	public void setQuitYn(String quitYn) {
		this.quitYn = quitYn;
	}
	public String getAuthYn() {
		return authYn;
	}
	public void setAuthYn(String authYn) {
		this.authYn = authYn;
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
	public String getClubCode() {
		return clubCode;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getHomeTel() {
		return homeTel;
	}
	public void setHomeTel(String homeTel) {
		this.homeTel = homeTel;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getMailAddress() {
		return mailAddress;
	}
	public void setMailAddress(String mailAddress) {
		this.mailAddress = mailAddress;
	}
}
