package lionsclubs.com.login;

import java.io.Serializable;

/**
 * @Class Name : LoginVO.java
 * @Description : Login VO class
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.03.03    박지욱          최초 생성
 *
 *  @author 공통서비스 개발팀 박지욱
 *  @since 2009.03.03
 *  @version 1.0
 *  @see
 *  
 */
public class LoginVO implements Serializable{
	private static final long serialVersionUID = -8274004534207618049L;
	
	/** 아이디 */
	private String id;
	/** 검색유지 아이디 */
	private String searchId;
	/** 이름 */
	private String name;
	/** 비밀번호 */
	private String password;
	/** 고유아이디 */
	private String uniqId;
	/** 사용자 IP정보 */
	private String ip;
	
	private String associationName;	/* 연합회명 */
	private String complexName;	/* 복합지구명 */
	private String districtName;	/* 지구명 */
	private String clubName;	/* 클럽명 */
	private String associationCode;	/* 연합회코드 */
	private String searchAssociationCode;	/* 검색유지 연합회코드 */
	private String complexCode;	/* 복합지구코드 */
	private String searchComplexCode;	/* 검색유지 복합지구코드 */
	private String districtCode;	/* 지구코드 */
	private String searchDistrictCode;	/* 검색유지 지구코드 */
	private String clubCode;	/* 클럽코드 */
	private String searchClubCode;	/* 검색유지 클럽코드 */
	private String clubTitleName;	/* 클럽직책명 */
	private String clubTitleCode;	/* 클럽직책코드 */
	private String districtTitleName;	/* 지구직책명 */
	private String districtTitleCode;	/* 직구직책코드 */
	private String mobile;	/* 휴대폰 번호 */
	
	private String searchOrganCode;
	private String searchSessionYear;
	private Object sessionChangeVO;
	private Boolean isSessionChange = false;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSearchId() {
		return searchId;
	}
	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUniqId() {
		return uniqId;
	}
	public void setUniqId(String uniqId) {
		this.uniqId = uniqId;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getAssociationName() {
		return associationName;
	}
	public void setAssociationName(String associationName) {
		this.associationName = associationName;
	}
	public String getComplexName() {
		return complexName;
	}
	public void setComplexName(String complexName) {
		this.complexName = complexName;
	}
	public String getDistrictName() {
		return districtName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getAssociationCode() {
		return associationCode;
	}
	public void setAssociationCode(String associationCode) {
		this.associationCode = associationCode;
	}
	public String getSearchAssociationCode() {
		return searchAssociationCode;
	}
	public void setSearchAssociationCode(String searchAssociationCode) {
		this.searchAssociationCode = searchAssociationCode;
	}
	public String getComplexCode() {
		return complexCode;
	}
	public void setComplexCode(String complexCode) {
		this.complexCode = complexCode;
	}
	public String getSearchComplexCode() {
		return searchComplexCode;
	}
	public void setSearchComplexCode(String searchComplexCode) {
		this.searchComplexCode = searchComplexCode;
	}
	public String getDistrictCode() {
		return districtCode;
	}
	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}
	public String getSearchDistrictCode() {
		return searchDistrictCode;
	}
	public void setSearchDistrictCode(String searchDistrictCode) {
		this.searchDistrictCode = searchDistrictCode;
	}
	public String getClubCode() {
		return clubCode;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getSearchClubCode() {
		return searchClubCode;
	}
	public void setSearchClubCode(String searchClubCode) {
		this.searchClubCode = searchClubCode;
	}
	public String getClubTitleName() {
		return clubTitleName;
	}
	public void setClubTitleName(String clubTitleName) {
		this.clubTitleName = clubTitleName;
	}
	public String getClubTitleCode() {
		return clubTitleCode;
	}
	public void setClubTitleCode(String clubTitleCode) {
		this.clubTitleCode = clubTitleCode;
	}
	public String getDistrictTitleName() {
		return districtTitleName;
	}
	public void setDistrictTitleName(String districtTitleName) {
		this.districtTitleName = districtTitleName;
	}
	public String getDistrictTitleCode() {
		return districtTitleCode;
	}
	public void setDistrictTitleCode(String districtTitleCode) {
		this.districtTitleCode = districtTitleCode;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getSearchOrganCode() {
		return searchOrganCode;
	}
	public void setSearchOrganCode(String searchOrganCode) {
		this.searchOrganCode = searchOrganCode;
	}
	public String getSearchSessionYear() {
		return searchSessionYear;
	}
	public void setSearchSessionYear(String searchSessionYear) {
		this.searchSessionYear = searchSessionYear;
	}
	public Object getSessionChangeVO() {
		return sessionChangeVO;
	}
	public void setSessionChangeVO(Object sessionChangeVO) {
		this.sessionChangeVO = sessionChangeVO;
	}
	public Boolean getIsSessionChange() {
		return isSessionChange;
	}
	public void setIsSessionChange(Boolean isSessionChange) {
		this.isSessionChange = isSessionChange;
	}
}
