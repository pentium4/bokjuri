package lionsclubs.com.SM1.SM1_3.SM1_09;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class SM1_09VO extends ComDefaultVO implements Serializable {
	
	private Integer uiNo;	/* 화면NO */
	private Integer menu1;	/* 메뉴1 */
	private Integer menu2;	/* 메뉴2 */
	private Integer menu3;	/* 메뉴3 */
	private String title;	/* 제목 */
	private String mainTitle;	/* 제목 */
	private String subTitle;	/* 중제목 */
	private String programName;	/* 프로그램명 */
	private String noticeKindCode;	/* 게시판 종류코드 */
	private String url;	/* URL */
	private String memberNo;	/* memberNo */
	private String select;	/* 조회 */
	private String input;	/* 등록 */
	private Date insertDate;	/* 생성일자 */
	private String insertName;	/* 생성자 */
	private Date updateDate;	/* 수정일자 */
	private String updateName;	/* 수정자 */

	public Integer getUiNo() {
		return uiNo;
	}
	public void setUiNo(Integer uiNo) {
		this.uiNo = uiNo;
	}
	public Integer getMenu1() {
		return menu1;
	}
	public void setMenu1(Integer menu1) {
		this.menu1 = menu1;
	}
	public Integer getMenu2() {
		return menu2;
	}
	public void setMenu2(Integer menu2) {
		this.menu2 = menu2;
	}
	public Integer getMenu3() {
		return menu3;
	}
	public void setMenu3(Integer menu3) {
		this.menu3 = menu3;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMainTitle() {
		return mainTitle;
	}
	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	public String getProgramName() {
		return programName;
	}
	public void setProgramName(String programName) {
		this.programName = programName;
	}
	public String getNoticeKindCode() {
		return noticeKindCode;
	}
	public void setNoticeKindCode(String noticeKindCode) {
		this.noticeKindCode = noticeKindCode;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getSelect() {
		return select;
	}
	public void setSelect(String select) {
		this.select = select;
	}
	public String getInput() {
		return input;
	}
	public void setInput(String input) {
		this.input = input;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public String getInsertName() {
		return insertName;
	}
	public void setInsertName(String insertName) {
		this.insertName = insertName;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateName() {
		return updateName;
	}
	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}
}
