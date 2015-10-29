package lionsclubs.com.MM3.MM3_1.MM3_04;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_04VO extends ComDefaultVO implements Serializable{
	private String organCdDst;					//지구조직코드
	private String organCdClub;					//클럽조직코드
	private String organNmClub;					//클럽조직명
	private String memberNoClub;			
	private String memberNoDst;
	private String name;						//회원명
	private String regDate;						//입회일자
	private String term;						//회기
	private String clubTitleCd;					//클럽직책코드
	private String dstTitleCd;					//지구직책코드
	private String dstTitleNm;					//지구직책명
	private String mobile;						//연락처
	private String outYn;						//퇴회유무
	private String startDate;					//
	private String firstPresidentStartDate;		//최초회장일자
    
    /* Search Option */
    private String prevYear;
    private String thisYear;
    private String order = "2";
    private String orgCode;
    private String outRemove;
    private String currThisYear;
    private String currPrevYear;
    private String termEnable;
    private String selDstTitleCd;
    private String selClubTitleCd;
    private String selTermDstTitleCd;
    private String chkbox_dstTitleOrClubTitle;
    
	public String getOrganCdDst() {
		return organCdDst;
	}
	public void setOrganCdDst(String organCdDst) {
		this.organCdDst = organCdDst;
	}
	public String getOrganCdClub() {
		return organCdClub;
	}
	public void setOrganCdClub(String organCdClub) {
		this.organCdClub = organCdClub;
	}
	public String getMemberNoClub() {
		return memberNoClub;
	}
	public void setMemberNoClub(String memberNoClub) {
		this.memberNoClub = memberNoClub;
	}
	public String getMemberNoDst() {
		return memberNoDst;
	}
	public void setMemberNoDst(String memberNoDst) {
		this.memberNoDst = memberNoDst;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getClubTitleCd() {
		return clubTitleCd;
	}
	public void setClubTitleCd(String clubTitleCd) {
		this.clubTitleCd = clubTitleCd;
	}
	public String getDstTitleCd() {
		return dstTitleCd;
	}
	public void setDstTitleCd(String dstTitleCd) {
		this.dstTitleCd = dstTitleCd;
	}
	public String getDstTitleNm() {
		return dstTitleNm;
	}
	public void setDstTitleNm(String dstTitleNm) {
		this.dstTitleNm = dstTitleNm;
	}
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getOutYn() {
		return outYn;
	}
	public void setOutYn(String outYn) {
		this.outYn = outYn;
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
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public String getOutRemove() {
		return outRemove;
	}
	public void setOutRemove(String outRemove) {
		this.outRemove = outRemove;
	}
	public String getOrganNmClub() {
		return organNmClub;
	}
	public void setOrganNmClub(String organNmClub) {
		this.organNmClub = organNmClub;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getCurrThisYear() {
		return currThisYear;
	}
	public void setCurrThisYear(String currThisYear) {
		this.currThisYear = currThisYear;
		this.currPrevYear = String.valueOf(Integer.parseInt(this.currThisYear) - 1);
	}
	public String getCurrPrevYear() {
		return currPrevYear;
	}
	public void setCurrPrevYear(String currPrevYear) {
		this.currPrevYear = currPrevYear;
	}
	public String getTermEnable() {
		return termEnable;
	}
	public void setTermEnable(String termEnable) {
		this.termEnable = termEnable;
	}
	public String getSelDstTitleCd() {
		return selDstTitleCd;
	}
	public void setSelDstTitleCd(String selDstTitleCd) {
		this.selDstTitleCd = selDstTitleCd;
	}
	public String getSelClubTitleCd() {
		return selClubTitleCd;
	}
	public void setSelClubTitleCd(String selClubTitleCd) {
		this.selClubTitleCd = selClubTitleCd;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getSelTermDstTitleCd() {
		return selTermDstTitleCd;
	}
	public void setSelTermDstTitleCd(String selTermDstTitleCd) {
		this.selTermDstTitleCd = selTermDstTitleCd;
	}
	public String getChkbox_dstTitleOrClubTitle() {
		return chkbox_dstTitleOrClubTitle;
	}
	public void setChkbox_dstTitleOrClubTitle(String chkbox_dstTitleOrClubTitle) {
		this.chkbox_dstTitleOrClubTitle = chkbox_dstTitleOrClubTitle;
	}
	public String getFirstPresidentStartDate() {
		return firstPresidentStartDate;
	}
	public void setFirstPresidentStartDate(String firstPresidentStartDate) {
		this.firstPresidentStartDate = firstPresidentStartDate;
	}
	
}
