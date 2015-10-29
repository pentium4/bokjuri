package lionsclubs.com.MM3.MM3_5.MM3_27;

import java.io.Serializable;
import java.util.List;

public class MM3_27VO_PARAM implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String upperCode;
	private String thisYear;
	private String order;
	private String memberNo;
	
	private List<MM3_27VO_DATA> listData;

	public String getUpperCode() {
		return upperCode;
	}

	public void setUpperCode(String upperCode) {
		this.upperCode = upperCode;
	}

	public String getThisYear() {
		return thisYear;
	}

	public void setThisYear(String thisYear) {
		this.thisYear = thisYear;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public List<MM3_27VO_DATA> getListData() {
		return listData;
	}

	public void setListData(List<MM3_27VO_DATA> list) {
		this.listData = list;
	}
}
