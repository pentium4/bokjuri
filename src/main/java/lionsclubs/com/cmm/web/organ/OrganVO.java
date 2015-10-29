package lionsclubs.com.cmm.web.organ;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class OrganVO extends ComDefaultVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String sessionYear;	/* 회기년도 */
	private String associationCode;	/* 연합회코드 */
	private String complexCode;	/* 복합지구코드 */
	private String districtCode;	/* 지구코드 */
	private String clubCode;	/* 지구코드 */
	
	private String lvl;
	private String lvlStart;
	private String lvlEnd;
	private String organCode;	/* 조직코드 */
	private String upperOrganCode;	/* 상위조직코드 */
	private String shortenName;
	private String koName;	/* 한글명 */
	private String organOfficerMemberNo;	/* 조직책임자 회원번호 */
	private String organOfficerMemberName;	/* 조직책임자명 */
	private String forMobileOrder;
	private String searchOrganCode;	/* 검색유지 조직코드 */
	private String auth;	/* 권한 적용여부 */
	private Date insertDate;	/* 생성일자 */
	private String insertName;	/* 생성자 */
	private Date updateDate;	/* 수정일자 */
	private String updateName;	/* 수정자 */
	
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
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
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getUpperOrganCode() {
		return upperOrganCode;
	}
	public void setUpperOrganCode(String upperOrganCode) {
		this.upperOrganCode = upperOrganCode;
	}
	public String getShortenName() {
		return shortenName;
	}
	public void setShortenName(String shortenName) {
		this.shortenName = shortenName;
	}
	public String getKoName() {
		return koName;
	}
	public void setKoName(String koName) {
		this.koName = koName;
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
	public String getForMobileOrder() {
		return forMobileOrder;
	}
	public void setForMobileOrder(String forMobileOrder) {
		this.forMobileOrder = forMobileOrder;
	}
	public String getSearchOrganCode() {
		return searchOrganCode;
	}
	public void setSearchOrganCode(String searchOrganCode) {
		this.searchOrganCode = searchOrganCode;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
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
