package lionsclubs.com.MM3.MM3_3.MM3_15;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_15VO extends ComDefaultVO implements Serializable{
	private String organCodeDst;		//지구조직코드
	private String age;				//입회경력
	private int totCnt;					//총원
	
	/* search option */
	private String orgCode;
	private String thisYear;
	private String[] outCode;

	
	public String[] getOutCode() {
		return outCode;
	}

	public void setOutCode(String[] outCode) {
		this.outCode = outCode;
	}

	public String getOrganCodeDst() {
		return organCodeDst;
	}

	public void setOrganCodeDst(String organCodeDst) {
		this.organCodeDst = organCodeDst;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public int getTotCnt() {
		return totCnt;
	}

	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}

	public String getOrgCode() {
		return orgCode;
	}

	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	
	public String getThisYear() {
		return thisYear;
	}

	public void setThisYear(String thisYear) {
		this.thisYear = thisYear;
	}

	
}
