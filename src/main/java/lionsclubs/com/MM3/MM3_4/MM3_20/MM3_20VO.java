package lionsclubs.com.MM3.MM3_4.MM3_20;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

import lionsclubs.com.MM3.MM3_4.MM3_20.CODE_ADD_INFO;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_20VO extends ComDefaultVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String districtCode;	/*지구코드 */
	private String clubCode;		/* 클럽코드 */ 
	private String clubName;		/* 클럽명 */ 
	private String sessionYear;	/* 회기년 */
	private Date insertDate;	/* 생성일자 */
	private String insertName;	/* 생성자 */
	private Date updateDate;	/* 수정일자 */
	private String updateName;	/* 수정자 */
	private String thisYear;	/*  */
	private String thisMonth;	/*  */
	private String memberNo;
	private String idnNo;
	private String sessionYYYYMM;				// 회기년 
	private String duesInsertvalues; 		//부과항목별 insert 값들
	private String itemCode;
	private String due;
	private String dueDollar;
	private String newComer;
	private String memberCnt;
	

	private List<CODE_ADD_INFO> codeList;
	private List<String> idnList;
	private int maxIdnNo;
	private List<Map<String, Object>> resultList;
	
	private String[] moneyCode;
	
	
	public String getMemberCnt() {
		return memberCnt;
	}
	public void setMemberCnt(String memberCnt) {
		this.memberCnt = memberCnt;
	}
	public String getNewComer() {
		return newComer;
	}
	public void setNewComer(String newComer) {
		this.newComer = newComer;
	}
	public String getClubCode() {
		return clubCode;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getSessionYYYYMM() {
		return sessionYYYYMM;
	}
	public void setSessionYYYYMM(String sessionYYYYMM) {
		this.sessionYYYYMM = sessionYYYYMM;
	}
	public String getDuesInsertvalues() {
		return duesInsertvalues;
	}
	public void setDuesInsertvalues(String duesInsertvalues) {
		this.duesInsertvalues = duesInsertvalues;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getDue() {
		return due;
	}
	public void setDue(String due) {
		this.due = due;
	}
	public String getDueDollar() {
		return dueDollar;
	}
	public void setDueDollar(String dueDollar) {
		this.dueDollar = dueDollar;
	}
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	
	public List<CODE_ADD_INFO> getCodeList() {
		return codeList;
	}
	public void setCodeList(List<CODE_ADD_INFO> codeList) {
		this.codeList = codeList;
	}
	public List<String> getIdnList() {
		return idnList;
	}
	public void setIdnList(List<String> idnList) {
		this.idnList = idnList;
	}
	public int getMaxIdnNo() {
		return maxIdnNo;
	}
	public void setMaxIdnNo(int maxIdnNo) {
		this.maxIdnNo = maxIdnNo;
	}
	public List<Map<String, Object>> getResultList() {
		return resultList;
	}
	public void setResultList(List<Map<String, Object>> resultList) {
		this.resultList = resultList;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getThisYear() {
		return thisYear;
	}
	public void setThisYear(String thisYear) {
		this.thisYear = thisYear;
	}
	public String getThisMonth() {
		return thisMonth;
	}
	public void setThisMonth(String thisMonth) {
		this.thisMonth = thisMonth;
	}
	public String getDistrictCode() {
		return districtCode;
	}
	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
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
	public String[] getMoneyCode() {
		return moneyCode;
	}
	public void setMoneyCode(String[] moneyCode) {
		this.moneyCode = moneyCode;
	}
	
}
