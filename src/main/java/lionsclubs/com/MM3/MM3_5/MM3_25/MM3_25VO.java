package lionsclubs.com.MM3.MM3_5.MM3_25;

import java.io.Serializable;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_25VO extends ComDefaultVO implements Serializable{

	  private String thisYear;
	  
	  private String codeName;
	
	  private int idnNo;
	  
	  private String eventOrgan;
	  
	  private String organCode;
	  
	  private String districtEcode;
	  
	  private String hostClub;
	  
	  private String districtEventName;
	  
	  private String subjectCodeName;
	  
	  private String subjectCode;
	 
	  private String takeDate;
	 
	  private String location;
	 
	  private String insertDate;
	  
	  private String insertName;
	 
	  private String updateDate;
	 
	  private String updateName;
	  
	  private int scoreIdn;
	  
	  private String organName;
	  
	  private String subjectMember;
      
      private String subjectMod;
      
      private String subjectScore;
      
      private String entryMember;	
      
      private String  entryMod;
     
      private String  entryScore;
      
      private String serveAmount;
      
      private String serveAmountStand;
      
      private String serveAmountScore;
      
      private int scoreIdnNo;
      
      private int  sMemCount;
      
      private int  sModCount;
     
      private int  sScoreCount;
     
      private int  eMemCount;
    
      private int 	eModCount;
    
      private int 	eScoreCount;
    
      private int 	sAmount;
    
      private int 	sAmountScore;
   
      private int 	sAmountStand;
     
	  private int totalScore;	  
 
	  private String upperOrganCode;
	  
	  private String organCode1;
	  
	  private String organCode2; 
	  
	  private Object updateClub;
	  
	  private String upperCode;
	  
	  private String order = "1";
	  
	  private List<MM3_25VO> eventArray;
	  
	  private List<MM3_25VO> researchArray;

	public String getThisYear() {
		return thisYear;
	}

	public void setThisYear(String thisYear) {
		this.thisYear = thisYear;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public int getIdnNo() {
		return idnNo;
	}

	public void setIdnNo(int idnNo) {
		this.idnNo = idnNo;
	}

	public String getEventOrgan() {
		return eventOrgan;
	}

	public void setEventOrgan(String eventOrgan) {
		this.eventOrgan = eventOrgan;
	}

	public String getOrganCode() {
		return organCode;
	}

	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}

	public String getDistrictEcode() {
		return districtEcode;
	}

	public void setDistrictEcode(String districtEcode) {
		this.districtEcode = districtEcode;
	}

	public String getHostClub() {
		return hostClub;
	}

	public void setHostClub(String hostClub) {
		this.hostClub = hostClub;
	}

	public String getDistrictEventName() {
		return districtEventName;
	}

	public void setDistrictEventName(String districtEventName) {
		this.districtEventName = districtEventName;
	}

	public String getSubjectCodeName() {
		return subjectCodeName;
	}

	public void setSubjectCodeName(String subjectCodeName) {
		this.subjectCodeName = subjectCodeName;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getTakeDate() {
		return takeDate;
	}

	public void setTakeDate(String takeDate) {
		this.takeDate = takeDate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
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

	public int getScoreIdn() {
		return scoreIdn;
	}

	public void setScoreIdn(int scoreIdn) {
		this.scoreIdn = scoreIdn;
	}

	public String getOrganName() {
		return organName;
	}

	public void setOrganName(String organName) {
		this.organName = organName;
	}

	public String getSubjectMember() {
		return subjectMember;
	}

	public void setSubjectMember(String subjectMember) {
		this.subjectMember = subjectMember;
	}

	public String getSubjectMod() {
		return subjectMod;
	}

	public void setSubjectMod(String subjectMod) {
		this.subjectMod = subjectMod;
	}

	public String getSubjectScore() {
		return subjectScore;
	}

	public void setSubjectScore(String subjectScore) {
		this.subjectScore = subjectScore;
	}

	public String getEntryMember() {
		return entryMember;
	}

	public void setEntryMember(String entryMember) {
		this.entryMember = entryMember;
	}

	public String getEntryMod() {
		return entryMod;
	}

	public void setEntryMod(String entryMod) {
		this.entryMod = entryMod;
	}

	public String getEntryScore() {
		return entryScore;
	}

	public void setEntryScore(String entryScore) {
		this.entryScore = entryScore;
	}

	public String getServeAmount() {
		return serveAmount;
	}

	public void setServeAmount(String serveAmount) {
		this.serveAmount = serveAmount;
	}

	public String getServeAmountStand() {
		return serveAmountStand;
	}

	public void setServeAmountStand(String serveAmountStand) {
		this.serveAmountStand = serveAmountStand;
	}

	public String getServeAmountScore() {
		return serveAmountScore;
	}

	public void setServeAmountScore(String serveAmountScore) {
		this.serveAmountScore = serveAmountScore;
	}

	public int getScoreIdnNo() {
		return scoreIdnNo;
	}

	public void setScoreIdnNo(int scoreIdnNo) {
		this.scoreIdnNo = scoreIdnNo;
	}

	public int getsMemCount() {
		return sMemCount;
	}

	public void setsMemCount(int sMemCount) {
		this.sMemCount = sMemCount;
	}

	public int getsModCount() {
		return sModCount;
	}

	public void setsModCount(int sModCount) {
		this.sModCount = sModCount;
	}

	public int getsScoreCount() {
		return sScoreCount;
	}

	public void setsScoreCount(int sScoreCount) {
		this.sScoreCount = sScoreCount;
	}

	public int geteMemCount() {
		return eMemCount;
	}

	public void seteMemCount(int eMemCount) {
		this.eMemCount = eMemCount;
	}

	public int geteModCount() {
		return eModCount;
	}

	public void seteModCount(int eModCount) {
		this.eModCount = eModCount;
	}

	public int geteScoreCount() {
		return eScoreCount;
	}

	public void seteScoreCount(int eScoreCount) {
		this.eScoreCount = eScoreCount;
	}

	public int getsAmount() {
		return sAmount;
	}

	public void setsAmount(int sAmount) {
		this.sAmount = sAmount;
	}

	public int getsAmountScore() {
		return sAmountScore;
	}

	public void setsAmountScore(int sAmountScore) {
		this.sAmountScore = sAmountScore;
	}

	public int getsAmountStand() {
		return sAmountStand;
	}

	public void setsAmountStand(int sAmountStand) {
		this.sAmountStand = sAmountStand;
	}

	public int getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}

	public String getUpperOrganCode() {
		return upperOrganCode;
	}

	public void setUpperOrganCode(String upperOrganCode) {
		this.upperOrganCode = upperOrganCode;
	}

	public String getOrganCode1() {
		return organCode1;
	}

	public void setOrganCode1(String organCode1) {
		this.organCode1 = organCode1;
	}

	public String getOrganCode2() {
		return organCode2;
	}

	public void setOrganCode2(String organCode2) {
		this.organCode2 = organCode2;
	}

	public Object getUpdateClub() {
		return updateClub;
	}

	public void setUpdateClub(Object updateClub) {
		this.updateClub = updateClub;
	}

	public String getUpperCode() {
		return upperCode;
	}

	public void setUpperCode(String upperCode) {
		this.upperCode = upperCode;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public List<MM3_25VO> getEventArray() {
		return eventArray;
	}

	public void setEventArray(List<MM3_25VO> eventArray) {
		this.eventArray = eventArray;
	}

	public List<MM3_25VO> getResearchArray() {
		return researchArray;
	}

	public void setResearchArray(List<MM3_25VO> researchArray) {
		this.researchArray = researchArray;
	}
	
}
