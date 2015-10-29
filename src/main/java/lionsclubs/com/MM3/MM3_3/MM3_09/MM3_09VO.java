package lionsclubs.com.MM3.MM3_3.MM3_09;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_09VO extends ComDefaultVO implements Serializable{
	/*list*/
	private String organCodeDst;
	private String organCodeClub;
	private String organNmClub;
	private int totCnt;
	private int regCnt;
	private int outCnt;
	private int resultCnt;
	private String organMeeting;
	private String organAbolishDate;
	private String memberNo;
	private String memberNm;
	private String targetMember;
	
	/*searchOption*/
	private String orgCode;
	private String prevYear;
	private String thisYear;
	
	
	public String getTargetMember() {
		return targetMember;
	}
	public void setTargetMember(String targetMember) {
		this.targetMember = targetMember;
	}
	public String getOrganCodeDst() {
		return organCodeDst;
	}
	public void setOrganCodeDst(String organCodeDst) {
		this.organCodeDst = organCodeDst;
	}
	public String getOrganCodeClub() {
		return organCodeClub;
	}
	public void setOrganCodeClub(String organCodeClub) {
		this.organCodeClub = organCodeClub;
	}
	public String getOrganNmClub() {
		return organNmClub;
	}
	public void setOrganNmClub(String organNmClub) {
		this.organNmClub = organNmClub;
	}
	public int getTotCnt() {
		return totCnt;
	}
	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}
	public int getRegCnt() {
		return regCnt;
	}
	public void setRegCnt(int regCnt) {
		this.regCnt = regCnt;
	}
	public int getOutCnt() {
		return outCnt;
	}
	public void setOutCnt(int outCnt) {
		this.outCnt = outCnt;
	}
	public int getResultCnt() {
		return resultCnt;
	}
	public void setResultCnt(int resultCnt) {
		this.resultCnt = resultCnt;
	}
	public String getOrganMeeting() {
		return organMeeting;
	}
	public void setOrganMeeting(String organMeeting) {
		this.organMeeting = organMeeting;
	}
	public String getOrganAbolishDate() {
		return organAbolishDate;
	}
	public void setOrganAbolishDate(String organAbolishDate) {
		this.organAbolishDate = organAbolishDate;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberNm() {
		return memberNm;
	}
	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
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
	
}
