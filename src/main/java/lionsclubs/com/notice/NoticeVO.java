package lionsclubs.com.notice;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class NoticeVO extends ComDefaultVO implements Serializable{
	private String menuId;	/* 메뉴ID */
	
	/* 게시판 관리 */
	private String noticeCode;	/* 게시판 코드 */
	private String noticeKindCode;	/* 게시판 종류 */
	
	/* 게시판 */
	private String idnNo;	/* 게시번호 */
	private String organCode;	/* 조직코드 */
	private String title;	/* 제목 */
	private String content;	/* 내용 */
	private String upperIdnNo;	/* 상위게시번호 */
	private String name;	/* 글쓴이 이름 */
	private String fileId;	/* 파일ID */
	private String fileCnt;	/* 파일갯수 */
	private String hit;	/* 조회수 */
	private String replyCnt;	/* 덧글갯수 */
	private String searchType;	/* 검색종류 */
	private String searchContent;	/* 검색내용 */
	
	/* 게시판 댓글 */
	private String replyIdnNo;	/* 게시판댓글번호 */
	private String upperReplyIdnNo;	/* 상위게시판댓글번호 */
	private String lvl;	/* 게시판 댓글 레벨 */
	private String replyUpperMemberNo;	/* 게시판 댓글 상위 회원번호  */
	private String groupIndex;	/* 게시판 댓글 그룹 index  */
	private String delReplyYn;	/* 댓글삭제여부 */
	private String replyMemberNo;	/* 해당 댓글의 글쓴이 회원번호 */
	private String replyMemberName;	/* 해당 댓글의 글쓴이 회원번호 */
	
	/* 다음글/이전글 페이징 */
	private String prevIdnNo;
	private String prevTitle;
	private String nextIdnNo;
	private String nextTitle;
	
	private Date insertDate;	/*	생성일자 */
	private String insertName;	/*	생성자 */
	private Date updateDate;	/*	수정일자 */
	private String updateName;	/*	수정자 */
	
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getNoticeCode() {
		return noticeCode;
	}
	public void setNoticeCode(String noticeCode) {
		this.noticeCode = noticeCode;
	}
	public String getNoticeKindCode() {
		return noticeKindCode;
	}
	public void setNoticeKindCode(String noticeKindCode) {
		this.noticeKindCode = noticeKindCode;
	}
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUpperIdnNo() {
		return upperIdnNo;
	}
	public void setUpperIdnNo(String upperIdnNo) {
		this.upperIdnNo = upperIdnNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(String fileCnt) {
		this.fileCnt = fileCnt;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(String replyCnt) {
		this.replyCnt = replyCnt;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	public String getReplyIdnNo() {
		return replyIdnNo;
	}
	public void setReplyIdnNo(String replyIdnNo) {
		this.replyIdnNo = replyIdnNo;
	}
	public String getUpperReplyIdnNo() {
		return upperReplyIdnNo;
	}
	public void setUpperReplyIdnNo(String upperReplyIdnNo) {
		this.upperReplyIdnNo = upperReplyIdnNo;
	}
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
	}
	public String getReplyUpperMemberNo() {
		return replyUpperMemberNo;
	}
	public void setReplyUpperMemberNo(String replyUpperMemberNo) {
		this.replyUpperMemberNo = replyUpperMemberNo;
	}
	public String getGroupIndex() {
		return groupIndex;
	}
	public void setGroupIndex(String groupIndex) {
		this.groupIndex = groupIndex;
	}
	public String getDelReplyYn() {
		return delReplyYn;
	}
	public void setDelReplyYn(String delReplyYn) {
		this.delReplyYn = delReplyYn;
	}
	public String getReplyMemberNo() {
		return replyMemberNo;
	}
	public void setReplyMemberNo(String replyMemberNo) {
		this.replyMemberNo = replyMemberNo;
	}
	public String getReplyMemberName() {
		return replyMemberName;
	}
	public void setReplyMemberName(String replyMemberName) {
		this.replyMemberName = replyMemberName;
	}
	public String getPrevIdnNo() {
		return prevIdnNo;
	}
	public void setPrevIdnNo(String prevIdnNo) {
		this.prevIdnNo = prevIdnNo;
	}
	public String getPrevTitle() {
		return prevTitle;
	}
	public void setPrevTitle(String prevTitle) {
		this.prevTitle = prevTitle;
	}
	public String getNextIdnNo() {
		return nextIdnNo;
	}
	public void setNextIdnNo(String nextIdnNo) {
		this.nextIdnNo = nextIdnNo;
	}
	public String getNextTitle() {
		return nextTitle;
	}
	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
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
