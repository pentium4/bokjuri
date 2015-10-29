package lionsclubs.com.MM7.MM7_1.MM7_01;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class MM7_01VO extends ComDefaultVO implements Serializable{
	private String idnNo;	/* 번호 */
	private String sessionYear;	/* 회기년도 */
	private String organCode;	/* 조직코드 */
	private String organName;	/* 조직코드 */
	private String outgoingOrganCode;	/* 보내는 조직코드 */
	private String outgoingOrganName;	/* 보내는 조직명 */
	private String outgoingLvl;	/* 보내는 조직코드 레벨 - 1:연합회, 2: 복합지구, 3:지구, 4:클럽 */
	private String lvl;	/* 조직코드 레벨 - 1:연합회, 2: 복합지구, 3:지구, 4:클럽 */
	private String clubCode;	/* 클럽코드 */
	private String storageDate;	/* 보존년한 */
	private String docNo;	/* 문서번호 */
	private String docTitle;	/* 문서제목 */
	private String docContent;	/* 문서내용 */
	private String docCreateKind;	/* 작성중구분 */
	private String fileId;	/* 파일ID */
	
	private String receiveOrganCode;	/* 받는조직코드 */
	private String receiveOrganName;	/* 받는조직명 */
	private String receiveKind;	/* 수신(R)/참조(S)/숨은참조(B) 구분 */
	private String receive;	/* 수/발 신처 */
	private String docKind;	/* 문서구분(D:작성중, O:발신, R:수신) */
	private String docKindName;	/* 문서구분명 */
	private String memberNo;	/* 회원번호 */
	private String mobile;	/* 휴대전화 */
	private String receiveMember;	/* 받는사람 */
	private String name;	/* 이름 */
	
	private String searchMemberNo;	/* 조회자회원번호 */
	private String searchDate;	/* 조회일시 */
	private Date outgoingDate;	/* 발신일 */
	private Date receiveDate;	/* 수신일 */
	private String docCreateDay;	/* 문서를 발신한 일자로부터 일수 */
	private String readYn;	/* 문서읽음체크 Y: 읽음, N: 안읽음 */
	
	private List<MM7_01VO> receiveArray;
	
	private Date insertDate;	/* 생성일자 */
	private String insertName;	/* 생성자 */
	private Date updateDate;	/* 수정일자 */
	private String updateName;	/* 수정자 */
	
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
	}
	public String getOutgoingOrganCode() {
		return outgoingOrganCode;
	}
	public void setOutgoingOrganCode(String outgoingOrganCode) {
		this.outgoingOrganCode = outgoingOrganCode;
	}
	public String getOutgoingOrganName() {
		return outgoingOrganName;
	}
	public void setOutgoingOrganName(String outgoingOrganName) {
		this.outgoingOrganName = outgoingOrganName;
	}
	public String getOutgoingLvl() {
		return outgoingLvl;
	}
	public void setOutgoingLvl(String outgoingLvl) {
		this.outgoingLvl = outgoingLvl;
	}
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
	}
	public String getClubCode() {
		return clubCode;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getStorageDate() {
		return storageDate;
	}
	public void setStorageDate(String storageDate) {
		this.storageDate = storageDate;
	}
	public String getDocNo() {
		return docNo;
	}
	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}
	public String getDocTitle() {
		return docTitle;
	}
	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}
	public String getDocContent() {
		return docContent;
	}
	public void setDocContent(String docContent) {
		this.docContent = docContent;
	}
	public String getDocCreateKind() {
		return docCreateKind;
	}
	public void setDocCreateKind(String docCreateKind) {
		this.docCreateKind = docCreateKind;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getReceiveOrganCode() {
		return receiveOrganCode;
	}
	public void setReceiveOrganCode(String receiveOrganCode) {
		this.receiveOrganCode = receiveOrganCode;
	}
	public String getReceiveOrganName() {
		return receiveOrganName;
	}
	public void setReceiveOrganName(String receiveOrganName) {
		this.receiveOrganName = receiveOrganName;
	}
	public String getReceiveKind() {
		return receiveKind;
	}
	public void setReceiveKind(String receiveKind) {
		this.receiveKind = receiveKind;
	}
	public String getReceive() {
		return receive;
	}
	public void setReceive(String receive) {
		this.receive = receive;
	}
	public String getDocKind() {
		return docKind;
	}
	public void setDocKind(String docKind) {
		this.docKind = docKind;
	}
	public String getDocKindName() {
		return docKindName;
	}
	public void setDocKindName(String docKindName) {
		this.docKindName = docKindName;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getReceiveMember() {
		return receiveMember;
	}
	public void setReceiveMember(String receiveMember) {
		this.receiveMember = receiveMember;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSearchMemberNo() {
		return searchMemberNo;
	}
	public void setSearchMemberNo(String searchMemberNo) {
		this.searchMemberNo = searchMemberNo;
	}
	public String getSearchDate() {
		return searchDate;
	}
	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}
	public Date getOutgoingDate() {
		return outgoingDate;
	}
	public void setOutgoingDate(Date outgoingDate) {
		this.outgoingDate = outgoingDate;
	}
	public Date getReceiveDate() {
		return receiveDate;
	}
	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}
	public String getDocCreateDay() {
		return docCreateDay;
	}
	public void setDocCreateDay(String docCreateDay) {
		this.docCreateDay = docCreateDay;
	}
	public String getReadYn() {
		return readYn;
	}
	public void setReadYn(String readYn) {
		this.readYn = readYn;
	}
	public List<MM7_01VO> getReceiveArray() {
		return receiveArray;
	}
	public void setReceiveArray(List<MM7_01VO> receiveArray) {
		this.receiveArray = receiveArray;
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
