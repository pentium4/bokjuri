package lionsclubs.com.MM2.MM2_2.MM2_17;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_17VO extends ComDefaultVO implements Serializable{

	private String idnNo;	/* 입력번호 */
	private String memberNo;	/* 회원번호 */
	private String organCode;	/* 조직코드 */
	private String genDate;		/* 발생일자 */
	private String classItemCode;	/* 분류항목코드 */
	private String detailItemCode;	/* 세부항목코드 */
	private String detailGroupCode;	/* 세부항목그룹코드 */
	private String classItemName;	/* 분류항목명 */
	private String detailItemName;	/* 세부항목명 */
	private String privatePay;	/* 개인부과금 */
	private String clubPay;	/* 클럽부과금 */
	private String clubTotalPay;	/* 클럽총부과금 */
	private String personalPay;	/* 개인별부과금 */
	private String memberName;	/* 회원 */
    private String targetMemberNo;	/* 지급처 */
    private String targetMemberName;	/* 지급처 */
    private String reference;	/* 참조 */
    private Date insertDate;	/* 생성일자 */
    private String insertName;	/* 생성자 */
    private Date updateDate;	/* 수정일자 */
    private String updateName;	/* 수정자 */
    private String s1;	/* s1 */
    private String s2;	/* s2 */
    
    private String caYm;	/*  */
    private String realAmount;	/*  */
    private String totalPayment;	/* 총수입 */
    private String incomePayment;	/* 총부과수입 */
    private String etcPayment;	/* 총기타수입 */
    private String expendPayment;	/* 총지출 */
    private String depoCnt;	/* 부과건수 */
    private String memberCnt;	/* 회원수 */
    private String impostCnt;	/* 총부과건수=부과건수*회원수 */
    private String impost;	/* 총부과금액 */
    private String clubImpost;	/* 총클럽부과금액 */
    private String tgtRegImpost;	/* 회비 부과금액 */
    private String tgtEtcImpost;	/* 기타 부과금액 */
    private String regPayment;	/* 총납부금액 */
    private String regPaymentCnt;	/* 총납부건수 */
    private String realRegPayment;	/* 총회비납부금액 */
    private String realEtcPayment;	/* 총기타납부금액 */
    private String notGetCnt;	/* 미수건수=부과건수*회원수 - 납부건수 */
    private String subTotImpost;	/* 당월총미수금 */
    private String subRegImpost;	/* 당월총회비미수금 */
    private String subEtcImpost;	/* 당월총기타미수금 */
    private String notgetImpost;	/* 당월총미수금 */
    private String notgetRegImpost;	/* 당월총회비미수금 */
    private String notgetEtcImpost;	/* 당월총기타미수금 */
    private String defectCnt;	/* 결손처리인원 */
    private String defectPayment;	/* 결손총금액 */
    private String defectRegPayment;	/* 회비결손금액 */
    private String defectEtcPayment;	/* 기타결손금액 */
    private String depAmount;	/* 예금액 */
    private String pastDepAmount;	/* 전월예금액 */
    private String inexDate;	/* 수입/지출일자 */
    private String inexDesc;	/* 수입/지출내용 */
    private String confirmDate;	/* 정산확정일 */
    private String confirmCount;	/* 정산확정횟수 */
    private String confirmYn;	/* 정산확정여부 */
    private String atandAmount;	/* 기준금액 */
    private String unit;	/* 단위 */
    private String kindCode;	/* 예금구분 */
    private String kindName;	/* 예금구분명 */
    private String startDate;	/* 예금시작일자 */
    private String endDate;	/* 예금종료일자 */
    private String expireAmount;	/* 만기금액 */
    private String financialIns;	/* 금융기관 */
    private String holder;	/* 예금주 */
    private String notGetGubun;	/* 미수구분 */
    private String deficitGubun;	/* 미수구분 */
    private String incomeInsertDate;	/* 입력일자 */
    private String chairMan;	/* 회장 */
    private String directorMan;	/* 총무 */
    private String financialMan;	/* 재무 */

    private String regTransferAmount;	/*이월회비미수*/
    private String etcTransferAmount;	/*이월기타미수*/
    private String transferNotGet;	/* 총이월미수금액 */
    private String transferAmount;	/* 총이월금액 */
    private String totalTransferAmount;	/* 전체이월금액 */
    
	/*
	 * search
	 */
	private String sessionYear;
	private String month;
	private String lastMonth;
	private String calMonth;
	private String title;
	
	/*
	 * sum
	 */
	private String privateSum;
	private String clubSum;
	private String personalSum;
	private String deficitSum;
	private String incomeSum;
	private String expendSum;
	private String depositSum;
	private String expireSum;
	private String notGetSum;	
	private String totCount;
	private String totalMonthlyAmount;	/*당월총계*/
	private String totalMonthlyRemain;	/*당월총잔액*/
	
	
	public String getNotgetImpost() {
		return notgetImpost;
	}
	public void setNotgetImpost(String notgetImpost) {
		this.notgetImpost = notgetImpost;
	}
	public String getNotgetRegImpost() {
		return notgetRegImpost;
	}
	public void setNotgetRegImpost(String notgetRegImpost) {
		this.notgetRegImpost = notgetRegImpost;
	}
	public String getNotgetEtcImpost() {
		return notgetEtcImpost;
	}
	public void setNotgetEtcImpost(String notgetEtcImpost) {
		this.notgetEtcImpost = notgetEtcImpost;
	}
	public String getDeficitGubun() {
		return deficitGubun;
	}
	public void setDeficitGubun(String deficitGubun) {
		this.deficitGubun = deficitGubun;
	}
	public String getLastMonth() {
		return lastMonth;
	}
	public void setLastMonth(String lastMonth) {
		this.lastMonth = lastMonth;
	}
	public String getCalMonth() {
		return calMonth;
	}
	public void setCalMonth(String calMonth) {
		this.calMonth = calMonth;
	}
	public String getChairMan() {
		return chairMan;
	}
	public void setChairMan(String chairMan) {
		this.chairMan = chairMan;
	}
	public String getDirectorMan() {
		return directorMan;
	}
	public void setDirectorMan(String directorMan) {
		this.directorMan = directorMan;
	}
	public String getFinancialMan() {
		return financialMan;
	}
	public void setFinancialMan(String financialMan) {
		this.financialMan = financialMan;
	}
	public String getTotalMonthlyRemain() {
		return totalMonthlyRemain;
	}
	public void setTotalMonthlyRemain(String totalMonthlyRemain) {
		this.totalMonthlyRemain = totalMonthlyRemain;
	}
	public String getConfirmDate() {
		return confirmDate;
	}
	public void setConfirmDate(String confirmDate) {
		this.confirmDate = confirmDate;
	}
	public String getConfirmCount() {
		return confirmCount;
	}
	public void setConfirmCount(String confirmCount) {
		this.confirmCount = confirmCount;
	}
	public String getTotalMonthlyAmount() {
		return totalMonthlyAmount;
	}
	public void setTotalMonthlyAmount(String totalMonthlyAmount) {
		this.totalMonthlyAmount = totalMonthlyAmount;
	}
	public String getTransferNotGet() {
		return transferNotGet;
	}
	public void setTransferNotGet(String transferNotGet) {
		this.transferNotGet = transferNotGet;
	}
	public String getRegTransferAmount() {
		return regTransferAmount;
	}
	public void setRegTransferAmount(String regTransferAmount) {
		this.regTransferAmount = regTransferAmount;
	}
	public String getEtcTransferAmount() {
		return etcTransferAmount;
	}
	public void setEtcTransferAmount(String etcTransferAmount) {
		this.etcTransferAmount = etcTransferAmount;
	}
	public String getTransferAmount() {
		return transferAmount;
	}
	public void setTransferAmount(String transferAmount) {
		this.transferAmount = transferAmount;
	}
	public String getTotalTransferAmount() {
		return totalTransferAmount;
	}
	public void setTotalTransferAmount(String totalTransferAmount) {
		this.totalTransferAmount = totalTransferAmount;
	}
	public String getIncomeInsertDate() {
		return incomeInsertDate;
	}
	public void setIncomeInsertDate(String incomeInsertDate) {
		this.incomeInsertDate = incomeInsertDate;
	}
	public String getNotGetSum() {
		return notGetSum;
	}
	public void setNotGetSum(String notGetSum) {
		this.notGetSum = notGetSum;
	}
	public String getNotGetGubun() {
		return notGetGubun;
	}
	public void setNotGetGubun(String notGetGubun) {
		this.notGetGubun = notGetGubun;
	}
	public String getDepositSum() {
		return depositSum;
	}
	public void setDepositSum(String depositSum) {
		this.depositSum = depositSum;
	}
	public String getExpireSum() {
		return expireSum;
	}
	public void setExpireSum(String expireSum) {
		this.expireSum = expireSum;
	}
	public String getExpireAmount() {
		return expireAmount;
	}
	public void setExpireAmount(String expireAmount) {
		this.expireAmount = expireAmount;
	}
	public String getFinancialIns() {
		return financialIns;
	}
	public void setFinancialIns(String financialIns) {
		this.financialIns = financialIns;
	}
	public String getHolder() {
		return holder;
	}
	public void setHolder(String holder) {
		this.holder = holder;
	}
	public String getKindCode() {
		return kindCode;
	}
	public void setKindCode(String kindCode) {
		this.kindCode = kindCode;
	}
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
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
	public String getDeficitSum() {
		return deficitSum;
	}
	public void setDeficitSum(String deficitSum) {
		this.deficitSum = deficitSum;
	}
	public String getIncomeSum() {
		return incomeSum;
	}
	public void setIncomeSum(String incomeSum) {
		this.incomeSum = incomeSum;
	}
	public String getExpendSum() {
		return expendSum;
	}
	public void setExpendSum(String expendSum) {
		this.expendSum = expendSum;
	}
	public String getAtandAmount() {
		return atandAmount;
	}
	public void setAtandAmount(String atandAmount) {
		this.atandAmount = atandAmount;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getConfirmYn() {
		return confirmYn;
	}
	public void setConfirmYn(String confirmYn) {
		this.confirmYn = confirmYn;
	}
	public String getInexDesc() {
		return inexDesc;
	}
	public void setInexDesc(String inexDesc) {
		this.inexDesc = inexDesc;
	}
	public String getInexDate() {
		return inexDate;
	}
	public void setInexDate(String inexDate) {
		this.inexDate = inexDate;
	}
	public String getTotalPayment() {
		return totalPayment;
	}
	public void setTotalPayment(String totalPayment) {
		this.totalPayment = totalPayment;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getTargetMemberNo() {
		return targetMemberNo;
	}
	public void setTargetMemberNo(String targetMemberNo) {
		this.targetMemberNo = targetMemberNo;
	}
	public String getTargetMemberName() {
		return targetMemberName;
	}
	public void setTargetMemberName(String targetMemberName) {
		this.targetMemberName = targetMemberName;
	}
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
	public String getGenDate() {
		return genDate;
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
	public String getDetailGroupCode() {
		return detailGroupCode;
	}
	public void setDetailGroupCode(String detailGroupCode) {
		this.detailGroupCode = detailGroupCode;
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
	public String getPrivatePay() {
		return privatePay;
	}
	public void setPrivatePay(String privatePay) {
		this.privatePay = privatePay;
	}
	public String getClubPay() {
		return clubPay;
	}
	public void setClubPay(String clubPay) {
		this.clubPay = clubPay;
	}
	public String getClubTotalPay() {
		return clubTotalPay;
	}
	public void setClubTotalPay(String clubTotalPay) {
		this.clubTotalPay = clubTotalPay;
	}
	
	public String getPersonalPay() {
		return personalPay;
	}
	public void setPersonalPay(String personalPay) {
		this.personalPay = personalPay;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
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
	public String getS1() {
		return s1;
	}
	public void setS1(String s1) {
		this.s1 = s1;
	}
	public String getS2() {
		return s2;
	}
	public void setS2(String s2) {
		this.s2 = s2;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getPrivateSum() {
		return privateSum;
	}
	public void setPrivateSum(String privateSum) {
		this.privateSum = privateSum;
	}
	public String getClubSum() {
		return clubSum;
	}
	public void setClubSum(String clubSum) {
		this.clubSum = clubSum;
	}
	public String getPersonalSum() {
		return personalSum;
	}
	public void setPersonalSum(String personalSum) {
		this.personalSum = personalSum;
	}
	public String getTotCount() {
		return totCount;
	}
	public void setTotCount(String totCount) {
		this.totCount = totCount;
	}
	public String getCaYm() {
		return caYm;
	}
	public void setCaYm(String caYm) {
		this.caYm = caYm;
	}
	public String getRealAmount() {
		return realAmount;
	}
	public void setRealAmount(String realAmount) {
		this.realAmount = realAmount;
	}
	public String getIncomePayment() {
		return incomePayment;
	}
	public void setIncomePayment(String incomePayment) {
		this.incomePayment = incomePayment;
	}
	public String getEtcPayment() {
		return etcPayment;
	}
	public void setEtcPayment(String etcPayment) {
		this.etcPayment = etcPayment;
	}
	public String getExpendPayment() {
		return expendPayment;
	}
	public void setExpendPayment(String expendPayment) {
		this.expendPayment = expendPayment;
	}
	public String getDepoCnt() {
		return depoCnt;
	}
	public void setDepoCnt(String depoCnt) {
		this.depoCnt = depoCnt;
	}
	public String getMemberCnt() {
		return memberCnt;
	}
	public void setMemberCnt(String memberCnt) {
		this.memberCnt = memberCnt;
	}
	public String getImpostCnt() {
		return impostCnt;
	}
	public void setImpostCnt(String impostCnt) {
		this.impostCnt = impostCnt;
	}
	public String getImpost() {
		return impost;
	}
	public void setImpost(String impost) {
		this.impost = impost;
	}
	public String getClubImpost() {
		return clubImpost;
	}
	public void setClubImpost(String clubImpost) {
		this.clubImpost = clubImpost;
	}
	public String getTgtRegImpost() {
		return tgtRegImpost;
	}
	public void setTgtRegImpost(String tgtRegImpost) {
		this.tgtRegImpost = tgtRegImpost;
	}
	public String getTgtEtcImpost() {
		return tgtEtcImpost;
	}
	public void setTgtEtcImpost(String tgtEtcImpost) {
		this.tgtEtcImpost = tgtEtcImpost;
	}
	public String getRegPayment() {
		return regPayment;
	}
	public void setRegPayment(String regPayment) {
		this.regPayment = regPayment;
	}
	public String getRegPaymentCnt() {
		return regPaymentCnt;
	}
	public void setRegPaymentCnt(String regPaymentCnt) {
		this.regPaymentCnt = regPaymentCnt;
	}
	public String getRealRegPayment() {
		return realRegPayment;
	}
	public void setRealRegPayment(String realRegPayment) {
		this.realRegPayment = realRegPayment;
	}
	public String getRealEtcPayment() {
		return realEtcPayment;
	}
	public void setRealEtcPayment(String realEtcPayment) {
		this.realEtcPayment = realEtcPayment;
	}
	public String getNotGetCnt() {
		return notGetCnt;
	}
	public void setNotGetCnt(String notGetCnt) {
		this.notGetCnt = notGetCnt;
	}
	public String getSubTotImpost() {
		return subTotImpost;
	}
	public void setSubTotImpost(String subTotImpost) {
		this.subTotImpost = subTotImpost;
	}
	public String getSubRegImpost() {
		return subRegImpost;
	}
	public void setSubRegImpost(String subRegImpost) {
		this.subRegImpost = subRegImpost;
	}
	public String getSubEtcImpost() {
		return subEtcImpost;
	}
	public void setSubEtcImpost(String subEtcImpost) {
		this.subEtcImpost = subEtcImpost;
	}
	public String getDefectCnt() {
		return defectCnt;
	}
	public void setDefectCnt(String defectCnt) {
		this.defectCnt = defectCnt;
	}
	public String getDefectPayment() {
		return defectPayment;
	}
	public void setDefectPayment(String defectPayment) {
		this.defectPayment = defectPayment;
	}
	public String getDefectRegPayment() {
		return defectRegPayment;
	}
	public void setDefectRegPayment(String defectRegPayment) {
		this.defectRegPayment = defectRegPayment;
	}
	public String getDefectEtcPayment() {
		return defectEtcPayment;
	}
	public void setDefectEtcPayment(String defectEtcPayment) {
		this.defectEtcPayment = defectEtcPayment;
	}
	public String getDepAmount() {
		return depAmount;
	}
	public void setDepAmount(String depAmount) {
		this.depAmount = depAmount;
	}
	public String getPastDepAmount() {
		return pastDepAmount;
	}
	public void setPastDepAmount(String pastDepAmount) {
		this.pastDepAmount = pastDepAmount;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
}
