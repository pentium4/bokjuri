package lionsclubs.com.MM3.MM3_5.MM3_25;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_25HeadVO extends ComDefaultVO implements Serializable {
	
	private String organCode;
	
	private int idnNo;
	
	private String districtEventCode;
	
	private String takeDate;
	
	private String location;
	
	private String upperCode;
	
	private String upperCodeName;
	
	private String eventOrgan; 

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

	public String getDistrictEventCode() {
		return districtEventCode;
	}

	public void setDistrictEventCode(String districtEventCode) {
		this.districtEventCode = districtEventCode;
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

	public String getUpperCodeName() {
		return upperCodeName;
	}
	public void setUpperCodeName(String upperCodeName) {
		this.upperCodeName = upperCodeName;
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

}

