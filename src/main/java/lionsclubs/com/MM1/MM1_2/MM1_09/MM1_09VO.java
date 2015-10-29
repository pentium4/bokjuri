package lionsclubs.com.MM1.MM1_2.MM1_09;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import egovframework.com.cmm.ComDefaultVO;

public class MM1_09VO extends ComDefaultVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String idnNo;
	private String organCode;
	private String organName;
	private String stampCode;
	private String genDate;
	private String classItemCode;
	private String classItemName;
	private String detailItemCode;
	private String detailItemName;
	
	/*
	 * 납부금
	 */
	private String memberNo;
	private String reference;
	private String paymentDate;
	private String paymentDefect;
	private String paymentFinish;	/* 납부완료 여부 */
	private String paymentCount;
	private String payment;	
	private String paymentDollar;
	private int paymentSum;
	
	/*
     * 부과금
     */
    private String impost;
    private String clubImpost;
    private String personalImpost;
    private String impostText;		/* 금액전달처 출력 */
    private String targetMemberNo;	/* 부과대상자 회원번호 */
	private String targetName;		/* 부과대상자 회원명 */
	private String impostMemberNo;	/* 부과자 회원번호 */
	
	private String name;
	private String districtName;
	
	private String insertDate;
	private String insertName;
	private String updateDate;
	private String updateName;
	
	/*
	 * search
	 */
	private String sessionYear;
	
	/*
	 * 정산현황
	 */
	private String caYm;
	private String confirmYn;
	
	/*
	 * 분류항목코드 및 세부항목코드
	 */
	private String code;
	private String groupCode;
	private String codeName;
	private String code1;
	private String code2;
	private String code3;
	
	private List<MM1_09VO> insertPaymentArray;
	private List<MM1_09VO> updatePaymentArray;
	private List<MM1_09VO> deletePaymentArray;
	private List<MM1_09VO> paymentArray;
	
	public String getIdnNo() {
		return idnNo;
	}
	public void setIdnNo(String idnNo) {
		this.idnNo = idnNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
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
	public String getGenDate() {
		if(StringUtils.isEmpty(genDate)){
			return genDate;			
		} else {
			return genDate.replaceAll("\\.", "");	
		}
	}
	public void setGenDate(String genDate) {
		this.genDate = genDate;
	}
	public String getClassItemCode() {
		return classItemCode;
	}
	public void setClassItemCode(String classItemCode) {
		this.classItemCode = classItemCode;
	}
	public String getDetailItemCode() {
		return detailItemCode;
	}
	public void setDetailItemCode(String detailItemCode) {
		this.detailItemCode = detailItemCode;
	}
	
	public String getClubImpost() {
		return clubImpost;
	}
	public void setClubImpost(String clubImpost) {
		this.clubImpost = clubImpost;
	}
	public String getPersonalImpost() {
		return personalImpost;
	}
	public void setPersonalImpost(String personalImpost) {
		this.personalImpost = personalImpost;
	}
	public String getImpostText() {
		return impostText;
	}
	public void setImpostText(String impostText) {
		this.impostText = impostText;
	}
	public String getTargetMemberNo() {
		return targetMemberNo;
	}
	public void setTargetMemberNo(String targetMemberNo) {
		this.targetMemberNo = targetMemberNo;
	}
	public String getTargetName() {
		return targetName;
	}
	public void setTargetName(String targetName) {
		this.targetName = targetName;
	}
	public String getImpostMemberNo() {
		return impostMemberNo;
	}
	public void setImpostMemberNo(String impostMemberNo) {
		this.impostMemberNo = impostMemberNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDistrictName() {
		return districtName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getPaymentSum() {
		return paymentSum;
	}
	public void setPaymentSum(int paymentSum) {
		this.paymentSum = paymentSum;
	}
	public String getImpost() {
		return impost;
	}
	public void setImpost(String impost) {
		this.impost = impost;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	
	public String getPaymentDefect() {
		return paymentDefect;
	}
	public void setPaymentDefect(String paymentDefect) {
		this.paymentDefect = paymentDefect;
	}
	
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		if (paymentDate == null || paymentDate.trim().equals("")) {
			
		}else{
			paymentDate = paymentDate.replaceAll("\\.", "");
		}
		this.paymentDate = paymentDate;
	}
	public String getPaymentCount() {
		return paymentCount;
	}
	public void setPaymentCount(String paymentCount) {
		this.paymentCount = paymentCount;
	}
	
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getPaymentDollar() {
		return paymentDollar;
	}
	public void setPaymentDollar(String paymentDollar) {
		this.paymentDollar = paymentDollar;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getInsertName() {
		return insertName;
	}
	public void setInsertName(String insertName) {
		this.insertName = insertName;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateName() {
		return updateName;
	}
	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCode1() {
		return code1;
	}
	public void setCode1(String code1) {
		this.code1 = code1;
	}
	public String getCode2() {
		return code2;
	}
	public void setCode2(String code2) {
		this.code2 = code2;
	}
	public String getCode3() {
		return code3;
	}
	public void setCode3(String code3) {
		this.code3 = code3;
	}
	public String getClassItemName() {
		return classItemName;
	}
	public void setClassItemName(String classItemName) {
		this.classItemName = classItemName;
	}
	public String getDetailItemName() {
		return detailItemName;
	}
	public void setDetailItemName(String detailItemName) {
		this.detailItemName = detailItemName;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getCaYm() {
		return caYm;
	}
	public void setCaYm(String caYm) {
		this.caYm = caYm;
	}
	public String getConfirmYn() {
		return confirmYn;
	}
	public void setConfirmYn(String confirmYn) {
		this.confirmYn = confirmYn;
	}
	public String getStampCode() {
		return stampCode;
	}
	public void setStampCode(String stampCode) {
		this.stampCode = stampCode;
	}
	public String getPaymentFinish() {
		return paymentFinish;
	}
	public void setPaymentFinish(String paymentFinish) {
		this.paymentFinish = paymentFinish;
	}
	public List<MM1_09VO> getInsertPaymentArray() {
		return insertPaymentArray;
	}
	public void setInsertPaymentArray(List<MM1_09VO> insertPaymentArray) {
		this.insertPaymentArray = insertPaymentArray;
	}
	public List<MM1_09VO> getUpdatePaymentArray() {
		return updatePaymentArray;
	}
	public void setUpdatePaymentArray(List<MM1_09VO> updatePaymentArray) {
		this.updatePaymentArray = updatePaymentArray;
	}
	public List<MM1_09VO> getDeletePaymentArray() {
		return deletePaymentArray;
	}
	public void setDeletePaymentArray(List<MM1_09VO> deletePaymentArray) {
		this.deletePaymentArray = deletePaymentArray;
	}
	public List<MM1_09VO> getPaymentArray() {
		return paymentArray;
	}
	public void setPaymentArray(List<MM1_09VO> paymentArray) {
		this.paymentArray = paymentArray;
	}
}
