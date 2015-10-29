package lionsclubs.com.MM3.MM3_1.MM3_05;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_05VO extends ComDefaultVO implements Serializable{
	/*search option*/
	private String sessionYear;
	private String order = "2";
	private String outRemove;
	private String selDstTitleCd;

	/*select list*/
	private String organCodeDst;			//지구조직코드
	private String organCode;				//클럽조직코드
	private String organNm;					//클럽명
	private String memberNo;				//회원번호
	private String name;					//이름
	private String startDate;				//시작일
	private String endDate;					//종료일
	private String appDescCode;				//지구직책코드
	private String appDescNm;				//지구직책명
	private String appDescCode2;			//클럽직책코드
	private String appDescNm2;				//클럽직책명
	private String memberPictureFile;		//회원사진파일
	private String outDate;					//퇴회일
	private String outYN;					//퇴회유무
	private String birth;					//퇴회유무
	private String firstPresidentStartDate; //최초회장등록일
	private String regdate;					//입회일자
	private String dismissalDate;	/* 해임날짜 */
	
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getOutRemove() {
		return outRemove;
	}
	public void setOutRemove(String outRemove) {
		this.outRemove = outRemove;
	}
	public String getSelDstTitleCd() {
		return selDstTitleCd;
	}
	public void setSelDstTitleCd(String selDstTitleCd) {
		this.selDstTitleCd = selDstTitleCd;
	}
	public String getOrganCodeDst() {
		return organCodeDst;
	}
	public void setOrganCodeDst(String organCodeDst) {
		this.organCodeDst = organCodeDst;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getOrganNm() {
		return organNm;
	}
	public void setOrganNm(String organNm) {
		this.organNm = organNm;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getAppDescCode() {
		return appDescCode;
	}
	public void setAppDescCode(String appDescCode) {
		this.appDescCode = appDescCode;
	}
	public String getAppDescNm() {
		return appDescNm;
	}
	public void setAppDescNm(String appDescNm) {
		this.appDescNm = appDescNm;
	}
	public String getAppDescCode2() {
		return appDescCode2;
	}
	public void setAppDescCode2(String appDescCode2) {
		this.appDescCode2 = appDescCode2;
	}
	public String getAppDescNm2() {
		return appDescNm2;
	}
	public void setAppDescNm2(String appDescNm2) {
		this.appDescNm2 = appDescNm2;
	}
	public String getMemberPictureFile() {
		return memberPictureFile;
	}
	public void setMemberPictureFile(String memberPictureFile) {
		this.memberPictureFile = memberPictureFile;
	}
	public String getOutDate() {
		return outDate;
	}
	public void setOutDate(String outDate) {
		this.outDate = outDate;
	}
	public String getOutYN() {
		return outYN;
	}
	public void setOutYN(String outYN) {
		this.outYN = outYN;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getFirstPresidentStartDate() {
		return firstPresidentStartDate;
	}
	public void setFirstPresidentStartDate(String firstPresidentStartDate) {
		this.firstPresidentStartDate = firstPresidentStartDate;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getDismissalDate() {
		return dismissalDate;
	}
	public void setDismissalDate(String dismissalDate) {
		this.dismissalDate = dismissalDate;
	}
}
