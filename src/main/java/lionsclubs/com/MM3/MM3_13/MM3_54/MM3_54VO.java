package lionsclubs.com.MM3.MM3_13.MM3_54;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_54VO extends ComDefaultVO implements Serializable{
	private String organCode;
	private String startYearMonth;
	private String endYearMonth;
	private String memberNo;	/* 회원번호 */
	private String memberName;	/* 회원명 */
	private String signDate;	/* 입회 시작일 */
	private String sectorTitle;	/* 클럽직책 */
	private String groupCode;
	private String groupCodeCnt;
	private String groupCodeName;
	private String code;
	private String codeName;
	private String paymentYearMonth;	/* 지급년월 */
	private String paymentKindCode;	/* 급여구분 */	
	private String paymentMainCode;	/* 급여대분류코드 */
	private String paymentDetailCode;	/* 급여상세코드 */
	private String payment;	/* 급여 */
	private String ord = "1";	/* 정렬 */
	private List<MM3_54VO> deleteArray;
	private Date insertDate;	/* 생성일자 */
	private String insertName;	/* 생성자 */
	private Date updateDate;	/* 수정일자 */
	private String updateName;	/* 수정자 */
	
	
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getStartYearMonth() {
		return startYearMonth;
	}
	public void setStartYearMonth(String startYearMonth) {
		this.startYearMonth = startYearMonth;
	}
	public String getEndYearMonth() {
		return endYearMonth;
	}
	public void setEndYearMonth(String endYearMonth) {
		this.endYearMonth = endYearMonth;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getSignDate() {
		return signDate;
	}
	public void setSignDate(String signDate) {
		this.signDate = signDate;
	}
	public String getSectorTitle() {
		return sectorTitle;
	}
	public void setSectorTitle(String sectorTitle) {
		this.sectorTitle = sectorTitle;
	}
	public String getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	public String getGroupCodeCnt() {
		return groupCodeCnt;
	}
	public void setGroupCodeCnt(String groupCodeCnt) {
		this.groupCodeCnt = groupCodeCnt;
	}
	public String getGroupCodeName() {
		return groupCodeName;
	}
	public void setGroupCodeName(String groupCodeName) {
		this.groupCodeName = groupCodeName;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getPaymentYearMonth() {
		return paymentYearMonth;
	}
	public void setPaymentYearMonth(String paymentYearMonth) {
		this.paymentYearMonth = paymentYearMonth;
	}
	public String getPaymentKindCode() {
		return paymentKindCode;
	}
	public void setPaymentKindCode(String paymentKindCode) {
		this.paymentKindCode = paymentKindCode;
	}
	public String getPaymentMainCode() {
		return paymentMainCode;
	}
	public void setPaymentMainCode(String paymentMainCode) {
		this.paymentMainCode = paymentMainCode;
	}
	public String getPaymentDetailCode() {
		return paymentDetailCode;
	}
	public void setPaymentDetailCode(String paymentDetailCode) {
		this.paymentDetailCode = paymentDetailCode;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getOrd() {
		return ord;
	}
	public void setOrd(String ord) {
		this.ord = ord;
	}
	public List<MM3_54VO> getDeleteArray() {
		return deleteArray;
	}
	public void setDeleteArray(List<MM3_54VO> deleteArray) {
		this.deleteArray = deleteArray;
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
