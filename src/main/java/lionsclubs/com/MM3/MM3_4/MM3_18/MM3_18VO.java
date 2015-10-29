package lionsclubs.com.MM3.MM3_4.MM3_18;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_18VO extends ComDefaultVO implements Serializable{
	private String districtCode;	/* 지구코드 */
	private String clubCode;	/* 클럽코드 */
	private String clubName;	/* 클럽명 */
	private String sessionYear;	/* 회기년 */
	private String julDue;	/* 7월 입주클럽관리비 */
	private String augDue;	/* 8월 입주클럽관리비 */
	private String sepDue;	/* 9월 입주클럽관리비 */
	private String octDue;	/* 10월 입주클럽관리비 */
	private String novDue;	/* 11월 입주클럽관리비 */
	private String decDue;	/* 12월 입주클럽관리비 */
	private String janDue;	/* 1월 입주클럽관리비 */
	private String febDue;	/* 2월 입주클럽관리비 */
	private String marDue;	/* 3월 입주클럽관리비 */
	private String aprDue;	/* 4월 입주클럽관리비 */
	private String mayDue;	/* 5월 입주클럽관리비 */
	private String junDue;	/* 6월 입주클럽관리비 */
	private Date insertDate;	/* 생성일자 */
	private String insertName;	/* 생성자 */
	private Date updateDate;	/* 수정일자 */
	private String updateName;	/* 수정자 */
	private String prevYear;
	
	public String getDistrictCode() {
		return districtCode;
	}
	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}
	public String getClubCode() {
		return clubCode;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
		this.prevYear = String.valueOf(Integer.parseInt(this.sessionYear) - 1);
	}
	public String getJulDue() {
		return julDue;
	}
	public void setJulDue(String julDue) {
		this.julDue = julDue;
	}
	public String getAugDue() {
		return augDue;
	}
	public void setAugDue(String augDue) {
		this.augDue = augDue;
	}
	public String getSepDue() {
		return sepDue;
	}
	public void setSepDue(String sepDue) {
		this.sepDue = sepDue;
	}
	public String getOctDue() {
		return octDue;
	}
	public void setOctDue(String octDue) {
		this.octDue = octDue;
	}
	public String getNovDue() {
		return novDue;
	}
	public void setNovDue(String novDue) {
		this.novDue = novDue;
	}
	public String getDecDue() {
		return decDue;
	}
	public void setDecDue(String decDue) {
		this.decDue = decDue;
	}
	public String getJanDue() {
		return janDue;
	}
	public void setJanDue(String janDue) {
		this.janDue = janDue;
	}
	public String getFebDue() {
		return febDue;
	}
	public void setFebDue(String febDue) {
		this.febDue = febDue;
	}
	public String getMarDue() {
		return marDue;
	}
	public void setMarDue(String marDue) {
		this.marDue = marDue;
	}
	public String getAprDue() {
		return aprDue;
	}
	public void setAprDue(String aprDue) {
		this.aprDue = aprDue;
	}
	public String getMayDue() {
		return mayDue;
	}
	public void setMayDue(String mayDue) {
		this.mayDue = mayDue;
	}
	public String getJunDue() {
		return junDue;
	}
	public void setJunDue(String junDue) {
		this.junDue = junDue;
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
	public String getPrevYear() {
		return prevYear;
	}
	public void setPrevYear(String prevYear) {
		this.prevYear = prevYear;
	}
	
	
}
