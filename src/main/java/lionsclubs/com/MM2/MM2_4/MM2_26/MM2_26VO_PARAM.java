package lionsclubs.com.MM2.MM2_4.MM2_26;

import java.io.Serializable;
import java.util.List;

public class MM2_26VO_PARAM implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String yearCode;
	private String monthCode;
	private String organCode;
	private String confKindCode;
	private Integer confIdnNo;
	private String confDate;
	private String memberNo;
	
	private String copyYearCode;
	private String copyMonthCode;
	private String copyOrganCode;
	private String copyConfKindCode;
	private Integer copyConfIdnNo;
	
	private List<Integer> chkIdx;
	private List<String> inputSessionYyyy;
	private List<String> inputSessionMm;
	private List<String> inputOrganCode;
	private List<String> inputConfKindCode;
	private List<Integer> inputConfIdnNo;
	private List<Integer> inputAgendaIdnNo;
	private List<Integer> inputAgendaOrder;
	private List<String> inputAgendaDesc;
	private List<String> inputApprovalPerson;
	private List<String> inputDeliberationDesc;
	private List<MM2_26VO_DATA> listData;
	
	private String insertName;
	private String updateName;
	
	public String getYearCode() {
		return yearCode;
	}
	public void setYearCode(String yearCode) {
		this.yearCode = yearCode;
	}
	public String getMonthCode() {
		return monthCode;
	}
	public void setMonthCode(String monthCode) {
		this.monthCode = monthCode;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getConfKindCode() {
		return confKindCode;
	}
	public void setConfKindCode(String confKindCode) {
		this.confKindCode = confKindCode;
	}
	public Integer getConfIdnNo() {
		return confIdnNo;
	}
	public void setConfIdnNo(Integer confIdnNo) {
		this.confIdnNo = confIdnNo;
	}
	public String getConfDate() {
		return confDate;
	}
	public void setConfDate(String confDate) {
		this.confDate = confDate;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getCopyYearCode() {
		return copyYearCode;
	}
	public void setCopyYearCode(String copyYearCode) {
		this.copyYearCode = copyYearCode;
	}
	public String getCopyMonthCode() {
		return copyMonthCode;
	}
	public void setCopyMonthCode(String copyMonthCode) {
		this.copyMonthCode = copyMonthCode;
	}
	public String getCopyOrganCode() {
		return copyOrganCode;
	}
	public void setCopyOrganCode(String copyOrganCode) {
		this.copyOrganCode = copyOrganCode;
	}
	public String getCopyConfKindCode() {
		return copyConfKindCode;
	}
	public void setCopyConfKindCode(String copyConfKindCode) {
		this.copyConfKindCode = copyConfKindCode;
	}
	public Integer getCopyConfIdnNo() {
		return copyConfIdnNo;
	}
	public void setCopyConfIdnNo(Integer copyConfIdnNo) {
		this.copyConfIdnNo = copyConfIdnNo;
	}
	public List<Integer> getChkIdx() {
		return chkIdx;
	}
	public void setChkIdx(List<Integer> chkIdx) {
		this.chkIdx = chkIdx;
	}
	public List<String> getInputSessionYyyy() {
		return inputSessionYyyy;
	}
	public void setInputSessionYyyy(List<String> inputSessionYyyy) {
		this.inputSessionYyyy = inputSessionYyyy;
	}
	public List<String> getInputSessionMm() {
		return inputSessionMm;
	}
	public void setInputSessionMm(List<String> inputSessionMm) {
		this.inputSessionMm = inputSessionMm;
	}
	public List<String> getInputOrganCode() {
		return inputOrganCode;
	}
	public void setInputOrganCode(List<String> inputOrganCode) {
		this.inputOrganCode = inputOrganCode;
	}
	public List<String> getInputConfKindCode() {
		return inputConfKindCode;
	}
	public void setInputConfKindCode(List<String> inputConfKindCode) {
		this.inputConfKindCode = inputConfKindCode;
	}
	public List<Integer> getInputConfIdnNo() {
		return inputConfIdnNo;
	}
	public void setInputConfIdnNo(List<Integer> inputConfIdnNo) {
		this.inputConfIdnNo = inputConfIdnNo;
	}
	public List<Integer> getInputAgendaIdnNo() {
		return inputAgendaIdnNo;
	}
	public void setInputAgendaIdnNo(List<Integer> inputAgendaIdnNo) {
		this.inputAgendaIdnNo = inputAgendaIdnNo;
	}
	public List<Integer> getInputAgendaOrder() {
		return inputAgendaOrder;
	}
	public void setInputAgendaOrder(List<Integer> inputAgendaOrder) {
		this.inputAgendaOrder = inputAgendaOrder;
	}
	public List<String> getInputAgendaDesc() {
		return inputAgendaDesc;
	}
	public void setInputAgendaDesc(List<String> inputAgendaDesc) {
		this.inputAgendaDesc = inputAgendaDesc;
	}
	public List<String> getInputApprovalPerson() {
		return inputApprovalPerson;
	}
	public void setInputApprovalPerson(List<String> inputApprovalPerson) {
		this.inputApprovalPerson = inputApprovalPerson;
	}
	public List<String> getInputDeliberationDesc() {
		return inputDeliberationDesc;
	}
	public void setInputDeliberationDesc(List<String> inputDeliberationDesc) {
		this.inputDeliberationDesc = inputDeliberationDesc;
	}
	public List<MM2_26VO_DATA> getListData() {
		return listData;
	}
	public void setListData(List<MM2_26VO_DATA> listData) {
		this.listData = listData;
	}
	public String getInsertName() {
		return insertName;
	}
	public void setInsertName(String insertName) {
		this.insertName = insertName;
	}
	public String getUpdateName() {
		return updateName;
	}
	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}
}
