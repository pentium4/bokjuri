package lionsclubs.com.MM3.MM3_4.MM3_19;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_19VO extends ComDefaultVO implements Serializable{
	private int idnNo;						//번호
	private String districtCode;			// 클럽코드 
	private String clubCode;				// 클럽코드 
	private String clubName;				// 클럽명 
	private String sessionYear;				// 회기년 
	private String sixMonth;				// 6월말 
	private String lifeTime;				// 평생
	private Date insertDate;				// 생성일자
	private String insertName;				// 생성자 
	private Date updateDate;				// 수정일자
	private String updateName;				// 수정자
	private String duesInsertvalues; 		//부과항목별 insert 값들
	private String itemCode;
	private String due;
	private String dueDollar;
	private String dollarKind;	/* 달러구분 */
	
	/*search option*/
	private String orgCode;
	private String prevYear;
	private String thisYear;
	private String thisOrganCode;
	private String firstOrSecond = "2000";
	
	/* appending ColumnNames*/
	private String columnNames;
	
	/* */
	private List<CODE_INFO> codeList;
	private List<String> idnList;
	private int maxIdnNo;
	private List<Map<String, Object>> resultList;
	
	
	public String getThisOrganCode() {
		return thisOrganCode;
	}
	public void setThisOrganCode(String thisOrganCode) {
		this.thisOrganCode = thisOrganCode;
	}
	public int getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(int idnNo) {
		this.idnNo = idnNo;
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
	public String getSixMonth() {
		return sixMonth;
	}
	public void setSixMonth(String sixMonth) {
		this.sixMonth = sixMonth;
	}
	public String getLifeTime() {
		return lifeTime;
	}
	public void setLifeTime(String lifeTime) {
		this.lifeTime = lifeTime;
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public String getPrevYear() {
		return prevYear;
	}
	public void setPrevYear(String prevYear) {
		this.prevYear = prevYear;
	}
	public String getThisYear() {
		return thisYear;
	}
	public void setThisYear(String thisYear) {
		this.thisYear = thisYear;
		this.prevYear = String.valueOf(Integer.parseInt(this.thisYear) - 1);
	}
	public String getFirstOrSecond() {
		return firstOrSecond;
	}
	public void setFirstOrSecond(String firstOrSecond) {
		this.firstOrSecond = firstOrSecond;
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
	
	public List<CODE_INFO> getCodeList() {
		return codeList;
	}
	public void setCodeList(List<CODE_INFO> codeList) {
		this.codeList = codeList;
		int[] tmpArray = new int[codeList.size()];
		String tmpStr = "";
		
		for(int i=0; i <  codeList.size(); i++){
			tmpArray[i] += Integer.parseInt(codeList.get(i).getCode());
			//System.out.println(codeList.get(i).getCode());
		}
		
		Arrays.sort(tmpArray);
		
		for(int i=0; i < tmpArray.length; i++){
			if(i == 0){
				tmpStr += "[" + tmpArray[i] + "]";
			}else{
				tmpStr += ", [" + tmpArray[i]+ "]";
			}
		}
		this.columnNames = tmpStr;
	}
	public String getColumnNames() {
		return columnNames;
	}
	public void setColumnNames(List<CODE_INFO> codeList) {
		this.codeList = codeList;
	}
	public void setColumnNames(String columnNames) {
		this.columnNames = columnNames;
	}
	public String getDuesInsertvalues() {
		return duesInsertvalues;
	}
	public void setDuesInsertvalues(String duesInsertvalues) {
		this.duesInsertvalues = duesInsertvalues;
	}
	public List<String> getIdnList() {
		return idnList;
	}
	public void setIdnList(List<String> idnList) {
		this.idnList = idnList;
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
	public String getDollarKind() {
		return dollarKind;
	}
	public void setDollarKind(String dollarKind) {
		this.dollarKind = dollarKind;
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
}
