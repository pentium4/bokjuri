package lionsclubs.com.MM3.MM3_3.MM3_10;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_10VO extends ComDefaultVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int    idx;
	private String orgCode;
	private String orgName;
	private String orgMeeting;
	private String lvl;
	private int    cnt1;
	private int    cnt2;
	private int    cnt3;
	private int    cnt4;
	private int    cnt5;
	private int    avgs;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	
	public String getOrgMeeting() {
		return orgMeeting;
	}
	public void setOrgMeeting(String orgMeeting) {
		this.orgMeeting = orgMeeting;
	}
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
	}
	public int getCnt1() {
		return cnt1;
	}
	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}
	public int getCnt2() {
		return cnt2;
	}
	public void setCnt2(int cnt2) {
		this.cnt2 = cnt2;
	}
	public int getCnt3() {
		return cnt3;
	}
	public void setCnt3(int cnt3) {
		this.cnt3 = cnt3;
	}
	public int getCnt4() {
		return cnt4;
	}
	public void setCnt4(int cnt4) {
		this.cnt4 = cnt4;
	}
	public int getCnt5() {
		return cnt5;
	}
	public void setCnt5(int cnt5) {
		this.cnt5 = cnt5;
	}
	public int getAvgs() {
		return avgs;
	}
	public void setAvgs(int avgs) {
		this.avgs = avgs;
	}

}
