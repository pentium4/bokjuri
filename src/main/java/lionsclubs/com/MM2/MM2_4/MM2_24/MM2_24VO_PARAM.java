package lionsclubs.com.MM2.MM2_4.MM2_24;

import java.io.Serializable;
import java.util.List;

public class MM2_24VO_PARAM implements Serializable{
	private static final long serialVersionUID = 1L;
	private String yearCode;
	private String monthCode;
	private String organCode;
	private String organName;
	private String confKindCode;
	private String confKindName;
	private Integer confIdnNo;
	private String confDate;
	private String memberNo;
	private List<Integer> chkIdx;
	private List<String> inputOrganCode;
	private List<Integer> inputInIdnNo;
	private List<Integer> inputInOrder;
	private List<String> inputProcessOrdDesc;
	private List<String> inputHost1;
	private List<String> inputHost2;
	private List<String> inputFileId;
	private MM2_24VO_CONF_INFO confInfo;
	private List<MM2_24VO_DATA> listData;
	
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
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
	}
	public String getConfKindCode() {
		return confKindCode;
	}
	public void setConfKindCode(String confKindCode) {
		this.confKindCode = confKindCode;
	}
	public String getConfKindName() {
		return confKindName;
	}
	public void setConfKindName(String confKindName) {
		this.confKindName = confKindName;
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
		this.confDate = confDate.replace(".", "");
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public List<Integer> getChkIdx() {
		return chkIdx;
	}
	public void setChkIdx(List<Integer> chkIdx) {
		this.chkIdx = chkIdx;
	}
	public List<String> getInputOrganCode() {
		return inputOrganCode;
	}
	public void setInputOrganCode(List<String> inputOrganCode) {
		this.inputOrganCode = inputOrganCode;
	}
	public List<Integer> getInputInIdnNo() {
		return inputInIdnNo;
	}
	public void setInputInIdnNo(List<Integer> inputInIdnNo) {
		this.inputInIdnNo = inputInIdnNo;
	}
	public List<Integer> getInputInOrder() {
		return inputInOrder;
	}
	public void setInputInOrder(List<Integer> inputInOrder) {
		this.inputInOrder = inputInOrder;
	}
	public List<String> getInputProcessOrdDesc() {
		return inputProcessOrdDesc;
	}
	public void setInputProcessOrdDesc(List<String> inputProcessOrdDesc) {
		this.inputProcessOrdDesc = inputProcessOrdDesc;
	}
	public List<String> getInputHost1() {
		return inputHost1;
	}
	public void setInputHost1(List<String> inputHost1) {
		this.inputHost1 = inputHost1;
	}
	public List<String> getInputHost2() {
		return inputHost2;
	}
	public void setInputHost2(List<String> inputHost2) {
		this.inputHost2 = inputHost2;
	}
	public List<String> getInputFileId() {
		return inputFileId;
	}
	public void setInputFileId(List<String> inputFileId) {
		this.inputFileId = inputFileId;
	}
	public MM2_24VO_CONF_INFO getConfInfo() {
		return confInfo;
	}
	public void setConfInfo(MM2_24VO_CONF_INFO confInfo) {
		this.confInfo = confInfo;
	}
	public List<MM2_24VO_DATA> getListData() {
		return listData;
	}
	public void setListData(List<MM2_24VO_DATA> listData) {
		this.listData = listData;
	}
	
}
