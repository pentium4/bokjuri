package lionsclubs.com.MM4.MM4_2.MM4_10;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM4_10VO extends ComDefaultVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String orgCode;
	private String orgName;
	private Integer sum1;
	private Integer sum2;
	private Integer sum3;
	private Integer sum4;
	private Integer sum5;
	private Integer tot;
	
	public MM4_10VO() {
		super();
		setSum1(0);
		setSum2(0);
		setSum3(0);
		setSum4(0);
		setSum5(0);
		setTot(0);
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}	
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public Integer getSum1() {
		return sum1;
	}
	public void setSum1(Integer sum1) {
		this.sum1 = sum1;
	}
	public Integer getSum2() {
		return sum2;
	}
	public void setSum2(Integer sum2) {
		this.sum2 = sum2;
	}
	public Integer getSum3() {
		return sum3;
	}
	public void setSum3(Integer sum3) {
		this.sum3 = sum3;
	}
	public Integer getSum4() {
		return sum4;
	}
	public void setSum4(Integer sum4) {
		this.sum4 = sum4;
	}
	public Integer getSum5() {
		return sum5;
	}
	public void setSum5(Integer sum5) {
		this.sum5 = sum5;
	}
	public Integer getTot() {
		return tot;
	}
	public void setTot(Integer tot) {
		this.tot = tot;
	}

}
