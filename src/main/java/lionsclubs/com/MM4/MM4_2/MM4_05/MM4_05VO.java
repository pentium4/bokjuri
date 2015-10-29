package lionsclubs.com.MM4.MM4_2.MM4_05;

import java.io.Serializable;
import egovframework.com.cmm.ComDefaultVO;

public class MM4_05VO extends ComDefaultVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orgCode;
	private String orgName;
	private String presidentName;
	private String baseOrgCode;
	private Integer fromClubCnt;
	private Integer inClubCnt;
	private Integer outClubCnt;
	private Integer calClubCnt;
	private Integer toClubCnt;
	private Integer tmCnt;
	private Integer memberCntFrom;
	private Integer memberCntNew;
	private Integer memberCntOut;
	private Integer calMemberCnt;
	private Integer memberCntTo;
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getPresidentName() {
		return presidentName;
	}
	public void setPresidentName(String presidentName) {
		this.presidentName = presidentName;
	}
	public String getBaseOrgCode() {
		return baseOrgCode;
	}
	public void setBaseOrgCode(String baseOrgCode) {
		this.baseOrgCode = baseOrgCode;
	}
	public Integer getFromClubCnt() {
		return fromClubCnt;
	}
	public void setFromClubCnt(Integer fromClubCnt) {
		this.fromClubCnt = fromClubCnt;
	}
	public Integer getInClubCnt() {
		return inClubCnt;
	}
	public void setInClubCnt(Integer inClubCnt) {
		this.inClubCnt = inClubCnt;
	}
	public Integer getOutClubCnt() {
		return outClubCnt;
	}
	public void setOutClubCnt(Integer outClubCnt) {
		this.outClubCnt = outClubCnt;
	}
	public Integer getCalClubCnt() {
		return calClubCnt;
	}
	public void setCalClubCnt(Integer calClubCnt) {
		this.calClubCnt = calClubCnt;
	}
	public Integer getToClubCnt() {
		return toClubCnt;
	}
	public void setToClubCnt(Integer toClubCnt) {
		this.toClubCnt = toClubCnt;
	}
	public Integer getMemberCntFrom() {
		return memberCntFrom;
	}
	public void setMemberCntFrom(Integer memberCntFrom) {
		this.memberCntFrom = memberCntFrom;
	}
	public Integer getMemberCntNew() {
		return memberCntNew;
	}
	public void setMemberCntNew(Integer memberCntNew) {
		this.memberCntNew = memberCntNew;
	}
	public Integer getMemberCntOut() {
		return memberCntOut;
	}
	public void setMemberCntOut(Integer memberCntOut) {
		this.memberCntOut = memberCntOut;
	}
	public Integer getCalMemberCnt() {
		return calMemberCnt;
	}
	public void setCalMemberCnt(Integer calMemberCnt) {
		this.calMemberCnt = calMemberCnt;
	}
	public Integer getMemberCntTo() {
		return memberCntTo;
	}
	public void setMemberCntTo(Integer memberCntTo) {
		this.memberCntTo = memberCntTo;
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public Integer getTmCnt() {
		return tmCnt;
	}
	public void setTmCnt(Integer tmCnt) {
		this.tmCnt = tmCnt;
	}
	
}
