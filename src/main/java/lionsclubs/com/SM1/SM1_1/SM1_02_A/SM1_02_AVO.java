package lionsclubs.com.SM1.SM1_1.SM1_02_A;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class SM1_02_AVO extends ComDefaultVO implements Serializable {
	private String searchComplexCode;	/* 복합지구 검색 */
	private String searchDistrictCode;	/* 지구 검색 */
	private String searchClubCode;	/* 클럽 검색 */
	private String searchName;	/* 성명 검색 */
	private String memberNo;	/* 멤버NO */
	private String complexName;	/* 복합지구명 */
	private String complexCode;	/* 복합지구 코드 */
	private String districtName;	/* 지구명 */
	private String districtCode;	/* 지구 코드 */
	private String sectorClubName;	/* 클럽명 */
	private String sectorClubCode;	/* 클럽코드 */
	private String clubTitle;	/* 현직책 */
	private String name;	/* 성명 */
	private String authStartDate;	/* 등록일 */
	private String authEndDate;	/* 종료일 */
	private String authDesc;	/* 내용 */
	private Date insertDate;	/* 생성일자 */
	private String insertName;	/* 생성자 */
	private Date updateDate;	/* 수정일자 */
	private String updateName;	/* 수정자 */

	private List<SM1_02_AVO> moreAuthArray;
	
	public String getSearchComplexCode() {
		return searchComplexCode;
	}
	public void setSearchComplexCode(String searchComplexCode) {
		this.searchComplexCode = searchComplexCode;
	}
	public String getSearchDistrictCode() {
		return searchDistrictCode;
	}
	public void setSearchDistrictCode(String searchDistrictCode) {
		this.searchDistrictCode = searchDistrictCode;
	}
	public String getSearchClubCode() {
		return searchClubCode;
	}
	public void setSearchClubCode(String searchClubCode) {
		this.searchClubCode = searchClubCode;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getComplexName() {
		return complexName;
	}
	public void setComplexName(String complexName) {
		this.complexName = complexName;
	}
	public String getComplexCode() {
		return complexCode;
	}
	public void setComplexCode(String complexCode) {
		this.complexCode = complexCode;
	}
	public String getDistrictName() {
		return districtName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	public String getDistrictCode() {
		return districtCode;
	}
	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}	
	public String getSectorClubName() {
		return sectorClubName;
	}
	public void setSectorClubName(String sectorClubName) {
		this.sectorClubName = sectorClubName;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthStartDate() {
		return authStartDate;
	}
	public void setAuthStartDate(String authStartDate) {
		this.authStartDate = authStartDate;
	}
	public String getAuthEndDate() {
		return authEndDate;
	}
	public void setAuthEndDate(String authEndDate) {
		this.authEndDate = authEndDate;
	}
	public String getAuthDesc() {
		return authDesc;
	}
	public void setAuthDesc(String authDesc) {
		this.authDesc = authDesc;
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
	public List<SM1_02_AVO> getMoreAuthArray() {
		return moreAuthArray;
	}
	public void setMoreAuthArray(List<SM1_02_AVO> moreAuthArray) {
		this.moreAuthArray = moreAuthArray;
	}
}
