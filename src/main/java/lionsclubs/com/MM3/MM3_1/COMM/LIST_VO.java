package lionsclubs.com.MM3.MM3_1.COMM;

import java.io.Serializable;
import java.util.List;

public class LIST_VO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orgCode;
	private String appKindCode;
	private String appDescCode;
	
	private List<LIST_VO_DATA> list;
	
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public List<LIST_VO_DATA> getList() {
		return list;
	}
	public void setList(List<LIST_VO_DATA> list) {
		this.list = list;
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
}
