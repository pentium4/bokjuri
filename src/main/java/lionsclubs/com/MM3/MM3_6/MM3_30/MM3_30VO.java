package lionsclubs.com.MM3.MM3_6.MM3_30;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_30VO extends ComDefaultVO implements Serializable{
	private String sessionYear;	/* 회기선택 */
	private String upperCode;	/* 조직코드 */
	private String organCode;	/* 클럽코드 */
	private String organName;	/* 클럽명칭 */
	private String soptNight;	/* 헌장의밤 */
	private String prevArea;	/* 전회기 지역 */
	private String prevZone;	/* 전회기 지대 */
	private String thisArea;	/* 현회기 지역 */
	private String thisZone;	/* 현회기 지대 */
	private String uniqueness;	/* 특이사항 */
	private String order = "1";	/* 정렬 */
	private String insertDate;
	private String insertName;
	private String updateDate;
	private String updateName;

	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getUpperCode() {
		return upperCode;
	}
	public void setUpperCode(String upperCode) {
		this.upperCode = upperCode;
	}
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
	public String getSoptNight() {
		return soptNight;
	}
	public void setSoptNight(String soptNight) {
		this.soptNight = soptNight;
	}
	public String getPrevArea() {
		return prevArea;
	}
	public void setPrevArea(String prevArea) {
		this.prevArea = prevArea;
	}
	public String getPrevZone() {
		return prevZone;
	}
	public void setPrevZone(String prevZone) {
		this.prevZone = prevZone;
	}
	public String getThisArea() {
		return thisArea;
	}
	public void setThisArea(String thisArea) {
		this.thisArea = thisArea;
	}
	public String getThisZone() {
		return thisZone;
	}
	public void setThisZone(String thisZone) {
		this.thisZone = thisZone;
	}
	public String getUniqueness() {
		return uniqueness;
	}
	public void setUniqueness(String uniqueness) {
		this.uniqueness = uniqueness;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
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
	
//	private String organCode;
//	private String sessionStart;
//	private String sessionEnd;
//	private String area;
//	private String zone;
//	private String uniqs;
//	private String insertDate;
//	private String insertName;
//	private String updateDate;
//	private String updateName;
//	private String birthDate;
//	private String thisYear;
//	private String upperCode;
//	private Object updateClub;
//	private String prevArea;
//	private String thisArea;
//	private String prevZone;
//	private String thisZone;
//	private String organName;
//	private String order = "1";	/* 라디오 버튼 */
//	private String orderName;
//	private String orderKorean;
//	private String orderSector;
//	private List<MM3_30VO> researchArray;
}
