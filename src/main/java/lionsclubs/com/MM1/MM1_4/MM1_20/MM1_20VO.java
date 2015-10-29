package lionsclubs.com.MM1.MM1_4.MM1_20;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM1_20VO extends ComDefaultVO implements Serializable {
	private String organCode;	/* 지구코드 */
	private String startDate;	/* 시작날짜 */
	private String endDate;	/* 종료날짜 */
	private String order = "1";	/* 조회순서 1 : 회원번호, 2 : 직책순, 3 : 성명순, 4 : 입회일자순 */
	private String activeMember;	/* 현회원 */
	private String quitMember;	/* 퇴회자 */
	
	private String memberNo;	/* 회번 */
	private String sectorDistrict;	/* 소속지구 */
	private String clubCode;	/* 클럽코드 */
	private String sectorClub;	/* 소속클럽 */
	private String area;  /* 지역번호 */
	private String zone;   /* 지대번호 */
	private String name;	/* 성명 */
	private String chinName;	/* 한자 */
	private String engName;	/* 영문 */
	private String districtTitle;	/* 지구직책 */
	private String division;	/* 회원구분 */
	private String birth;	/* 생년월일 */
	private String singDate;	/* 입회일자 */
	private String quitKind;	/* 재직구분 */
	private String quitDate;	/* 퇴회일자 */
	private String quitDivision;	/* 퇴회사유 */
	private String address;	/* 현주소 */
	private String zipCode;	/* 우편번호 */
	private String mobile;	/* 휴대전화 */
	private String workTel;	/* 직장전화 */
	private String homeTel;	/* 자택전화 */
	private String fax;	/* 팩스번호 */
	private String mailAddress;	/* 메일주소 */
	private String gmail;	/* HP/Gmail */
	private String businessClass;	/* 업종분류 */
	private String industry;	/* 업종 */
	private String companyTitle;	/* 업체직책 */
	private String companyName;	/* 업체명 */
	private String companyAddress;	/* 업체주소 */
	private String endEducation;	/* 최종학력 */
	private String nativeSchool;	/* 출신학교 */
	private String majorSubject;	/* 전공과목 */
	private String army;	/* 병력관계 */
	private String blood;	/* 혈액형 */
	private String hobby;	/* 취미활동 */
	private String height;	/* 신장 */
	private String recommMemberNo;	/* 추천자 회번 */
	private String recommMemberName;	/* 추천자 성명 */
	private String recommRealtionship;	/* 추천관계 */
	private String marryStatus;	/* 결혼여부 */
	private String gameteName;	/* 배우자 성명 */
	private String family;	/* 본인가족 */
	private String children;	/* 자녀 */
	private String clubTitle;	/* 현클럽직책 */
	private String divisionSector;	/* 현클럽분과소속 */
	private String firstSingDate;	/* 최초 입회일자 */
	
	private String kind;	/* 1 : 경력(선임/위촉)/조회, 2 : 포상, 3 : 교육 */
	private String appKindCode;	/* 선임구분 코드 */
	private String appDescCode;	/* 선임 직책 및 내용 코드 */
	private String appKindName;	/* 선임구분 */
	private String appDescName;	/* 선임 직책 및 내용 */
	private String sanctionStartDate;	/* 시작기간 */
	private String sanctionEndDate;	/* 종료기간 */
	private String educationName;	/* 주관 */
	private String itemName;	/* 항목 */
	private String awardGrantorName;	/* 포상수여자 */
	private String desc;	/* 내용 */	
	private String prizeEducationCode;	/* 포상 주관 */
	private String prizeItemCode;	/* 포상 항목 */
	private String prizeAwardGrantorCode;	/* 포상수여자 */
	private String educationEducationCode;	/* 교육 주관 */
	private String educationItemCode;	/* 교육 항목 */
	
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getActiveMember() {
		return activeMember;
	}
	public void setActiveMember(String activeMember) {
		this.activeMember = activeMember;
	}
	public String getQuitMember() {
		return quitMember;
	}
	public void setQuitMember(String quitMember) {
		this.quitMember = quitMember;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getSectorDistrict() {
		return sectorDistrict;
	}
	public void setSectorDistrict(String sectorDistrict) {
		this.sectorDistrict = sectorDistrict;
	}
	public String getClubCode() {
		return clubCode;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getSectorClub() {
		return sectorClub;
	}
	public void setSectorClub(String sectorClub) {
		this.sectorClub = sectorClub;
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
	public String getDistrictTitle() {
		return districtTitle;
	}
	public void setDistrictTitle(String districtTitle) {
		this.districtTitle = districtTitle;
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
	public String getQuitKind() {
		return quitKind;
	}
	public void setQuitKind(String quitKind) {
		this.quitKind = quitKind;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getWorkTel() {
		return workTel;
	}
	public void setWorkTel(String workTel) {
		this.workTel = workTel;
	}
	public String getHomeTel() {
		return homeTel;
	}
	public void setHomeTel(String homeTel) {
		this.homeTel = homeTel;
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
	public String getGmail() {
		return gmail;
	}
	public void setGmail(String gmail) {
		this.gmail = gmail;
	}
	public String getBusinessClass() {
		return businessClass;
	}
	public void setBusinessClass(String businessClass) {
		this.businessClass = businessClass;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getCompanyTitle() {
		return companyTitle;
	}
	public void setCompanyTitle(String companyTitle) {
		this.companyTitle = companyTitle;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyAddress() {
		return companyAddress;
	}
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	public String getEndEducation() {
		return endEducation;
	}
	public void setEndEducation(String endEducation) {
		this.endEducation = endEducation;
	}
	public String getNativeSchool() {
		return nativeSchool;
	}
	public void setNativeSchool(String nativeSchool) {
		this.nativeSchool = nativeSchool;
	}
	public String getMajorSubject() {
		return majorSubject;
	}
	public void setMajorSubject(String majorSubject) {
		this.majorSubject = majorSubject;
	}
	public String getArmy() {
		return army;
	}
	public void setArmy(String army) {
		this.army = army;
	}
	public String getBlood() {
		return blood;
	}
	public void setBlood(String blood) {
		this.blood = blood;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getRecommMemberNo() {
		return recommMemberNo;
	}
	public void setRecommMemberNo(String recommMemberNo) {
		this.recommMemberNo = recommMemberNo;
	}
	public String getRecommMemberName() {
		return recommMemberName;
	}
	public void setRecommMemberName(String recommMemberName) {
		this.recommMemberName = recommMemberName;
	}
	public String getRecommRealtionship() {
		return recommRealtionship;
	}
	public void setRecommRealtionship(String recommRealtionship) {
		this.recommRealtionship = recommRealtionship;
	}
	public String getMarryStatus() {
		return marryStatus;
	}
	public void setMarryStatus(String marryStatus) {
		this.marryStatus = marryStatus;
	}
	public String getGameteName() {
		return gameteName;
	}
	public void setGameteName(String gameteName) {
		this.gameteName = gameteName;
	}
	public String getFamily() {
		return family;
	}
	public void setFamily(String family) {
		this.family = family;
	}
	public String getChildren() {
		return children;
	}
	public void setChildren(String children) {
		this.children = children;
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
	public String getFirstSingDate() {
		return firstSingDate;
	}
	public void setFirstSingDate(String firstSingDate) {
		this.firstSingDate = firstSingDate;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getAppKindCode() {
		return appKindCode;
	}
	public void setAppKindCode(String appKindCode) {
		this.appKindCode = appKindCode;
	}
	public String getAppDescCode() {
		return appDescCode;
	}
	public void setAppDescCode(String appDescCode) {
		this.appDescCode = appDescCode;
	}
	public String getAppKindName() {
		return appKindName;
	}
	public void setAppKindName(String appKindName) {
		this.appKindName = appKindName;
	}
	public String getAppDescName() {
		return appDescName;
	}
	public void setAppDescName(String appDescName) {
		this.appDescName = appDescName;
	}
	public String getSanctionStartDate() {
		return sanctionStartDate;
	}
	public void setSanctionStartDate(String sanctionStartDate) {
		this.sanctionStartDate = sanctionStartDate;
	}
	public String getSanctionEndDate() {
		return sanctionEndDate;
	}
	public void setSanctionEndDate(String sanctionEndDate) {
		this.sanctionEndDate = sanctionEndDate;
	}
	public String getEducationName() {
		return educationName;
	}
	public void setEducationName(String educationName) {
		this.educationName = educationName;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getAwardGrantorName() {
		return awardGrantorName;
	}
	public void setAwardGrantorName(String awardGrantorName) {
		this.awardGrantorName = awardGrantorName;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getPrizeEducationCode() {
		return prizeEducationCode;
	}
	public void setPrizeEducationCode(String prizeEducationCode) {
		this.prizeEducationCode = prizeEducationCode;
	}
	public String getPrizeItemCode() {
		return prizeItemCode;
	}
	public void setPrizeItemCode(String prizeItemCode) {
		this.prizeItemCode = prizeItemCode;
	}
	public String getPrizeAwardGrantorCode() {
		return prizeAwardGrantorCode;
	}
	public void setPrizeAwardGrantorCode(String prizeAwardGrantorCode) {
		this.prizeAwardGrantorCode = prizeAwardGrantorCode;
	}
	public String getEducationEducationCode() {
		return educationEducationCode;
	}
	public void setEducationEducationCode(String educationEducationCode) {
		this.educationEducationCode = educationEducationCode;
	}
	public String getEducationItemCode() {
		return educationItemCode;
	}
	public void setEducationItemCode(String educationItemCode) {
		this.educationItemCode = educationItemCode;
	}
}