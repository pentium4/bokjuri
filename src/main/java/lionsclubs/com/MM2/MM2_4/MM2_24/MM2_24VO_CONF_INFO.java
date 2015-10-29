package lionsclubs.com.MM2.MM2_4.MM2_24;

import java.io.Serializable;

public class MM2_24VO_CONF_INFO extends MM2_24VO_PARAM implements Serializable{

	private static final long serialVersionUID = 1L;

	private String confPlaceCode;
	private String confTime;
	private String attendPerson;
	private String confDesc;
	
	public String getConfPlaceCode() {
		return confPlaceCode;
	}
	public void setConfPlaceCode(String confPlaceCode) {
		this.confPlaceCode = confPlaceCode;
	}
	public String getConfTime() {
		return confTime;
	}
	public void setConfTime(String confTime) {
		this.confTime = confTime;
	}
	public String getAttendPerson() {
		return attendPerson;
	}
	public void setAttendPerson(String attendPerson) {
		this.attendPerson = attendPerson;
	}
	public String getConfDesc() {
		return confDesc;
	}
	public void setConfDesc(String confDesc) {
		this.confDesc = confDesc;
	}
	
}
