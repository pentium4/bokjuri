package lionsclubs.com.MM3.MM3_10.MM3_36;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_36VO extends ComDefaultVO implements Serializable{
	private String organCode; 
	private String sessionYear;
	private String year;
	private String month;
	private String organName;
	private String organDivisionCode;	/* 조직구분 코드 */
	private Long prevMemberCnt;	/* 전월말 회원수 */
	private Long newMemberCnt;	/* 신입회원수 */
	private Long reMemberCnt;	/* 재입회원수 */
	private Long movingMemberCnt;	/* 전입회원수 */
	private Long quitMemberCnt;	/* 퇴회회원수 */
	private Long currentMemberCnt;	/* 현재월말 회원수 */
	private Long increaseMemberCnt; 	/* 순증가 회원수 */

	private Long cnt;	/* 건수 */
	private Long sessionYearCnt;	/* 회기건수 */
	private Long sessionYearAmount;	/* 회기금액 */
	private String name;	/* 성명 */
	private Long payment;	/* KRW */
	private Long dollar;	/* 달러 */
	
	private String detailItemName;	/* 세부항목 */
	private Long amount;
	private Long groupCnt;
	
	private Long maleClubCnt;	/* 남성클럽수 */
	private Long femaleClubCnt;	/* 여성클럽수 */
	private Long mixtrueClubCnt;	/* 혼성클럽수 */
	private Long maleMemberCnt;	/* 남성회원수 */
	private Long femaleMemberCnt;	/* 여성회원수 */
	private Long mixtrueMemberCnt;	/* 혼성회원수 */
	private Long prevClubCnt;	/* 전월말 클럽수 */
	private Long newClubCnt;	/* 신생 클럽수 */
	private Long abolishClubCnt;	/* 취소 클럽수 */
	private Long currentClubCnt;	/* 현재월말 클럽수 */
	private Date prevEndDate;	/* 전월말 날짜 */
	private Date endDate;	/* 현재월말 날짜 */	
	
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
	}
	public String getOrganDivisionCode() {
		return organDivisionCode;
	}
	public void setOrganDivisionCode(String organDivisionCode) {
		this.organDivisionCode = organDivisionCode;
	}
	public Long getPrevMemberCnt() {
		return prevMemberCnt;
	}
	public void setPrevMemberCnt(Long prevMemberCnt) {
		this.prevMemberCnt = prevMemberCnt;
	}
	public Long getNewMemberCnt() {
		return newMemberCnt;
	}
	public void setNewMemberCnt(Long newMemberCnt) {
		this.newMemberCnt = newMemberCnt;
	}
	public Long getReMemberCnt() {
		return reMemberCnt;
	}
	public void setReMemberCnt(Long reMemberCnt) {
		this.reMemberCnt = reMemberCnt;
	}
	public Long getMovingMemberCnt() {
		return movingMemberCnt;
	}
	public void setMovingMemberCnt(Long movingMemberCnt) {
		this.movingMemberCnt = movingMemberCnt;
	}
	public Long getQuitMemberCnt() {
		return quitMemberCnt;
	}
	public void setQuitMemberCnt(Long quitMemberCnt) {
		this.quitMemberCnt = quitMemberCnt;
	}
	public Long getCurrentMemberCnt() {
		return currentMemberCnt;
	}
	public void setCurrentMemberCnt(Long currentMemberCnt) {
		this.currentMemberCnt = currentMemberCnt;
	}
	public Long getIncreaseMemberCnt() {
		return increaseMemberCnt;
	}
	public void setIncreaseMemberCnt(Long increaseMemberCnt) {
		this.increaseMemberCnt = increaseMemberCnt;
	}
	public Long getCnt() {
		return cnt;
	}
	public void setCnt(Long cnt) {
		this.cnt = cnt;
	}
	public Long getSessionYearCnt() {
		return sessionYearCnt;
	}
	public void setSessionYearCnt(Long sessionYearCnt) {
		this.sessionYearCnt = sessionYearCnt;
	}
	public Long getSessionYearAmount() {
		return sessionYearAmount;
	}
	public void setSessionYearAmount(Long sessionYearAmount) {
		this.sessionYearAmount = sessionYearAmount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getPayment() {
		return payment;
	}
	public void setPayment(Long payment) {
		this.payment = payment;
	}
	public Long getDollar() {
		return dollar;
	}
	public void setDollar(Long dollar) {
		this.dollar = dollar;
	}
	public String getDetailItemName() {
		return detailItemName;
	}
	public void setDetailItemName(String detailItemName) {
		this.detailItemName = detailItemName;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public Long getGroupCnt() {
		return groupCnt;
	}
	public void setGroupCnt(Long groupCnt) {
		this.groupCnt = groupCnt;
	}
	public Long getMaleClubCnt() {
		return maleClubCnt;
	}
	public void setMaleClubCnt(Long maleClubCnt) {
		this.maleClubCnt = maleClubCnt;
	}
	public Long getFemaleClubCnt() {
		return femaleClubCnt;
	}
	public void setFemaleClubCnt(Long femaleClubCnt) {
		this.femaleClubCnt = femaleClubCnt;
	}
	public Long getMixtrueClubCnt() {
		return mixtrueClubCnt;
	}
	public void setMixtrueClubCnt(Long mixtrueClubCnt) {
		this.mixtrueClubCnt = mixtrueClubCnt;
	}
	public Long getMaleMemberCnt() {
		return maleMemberCnt;
	}
	public void setMaleMemberCnt(Long maleMemberCnt) {
		this.maleMemberCnt = maleMemberCnt;
	}
	public Long getFemaleMemberCnt() {
		return femaleMemberCnt;
	}
	public void setFemaleMemberCnt(Long femaleMemberCnt) {
		this.femaleMemberCnt = femaleMemberCnt;
	}
	public Long getMixtrueMemberCnt() {
		return mixtrueMemberCnt;
	}
	public void setMixtrueMemberCnt(Long mixtrueMemberCnt) {
		this.mixtrueMemberCnt = mixtrueMemberCnt;
	}
	public Long getPrevClubCnt() {
		return prevClubCnt;
	}
	public void setPrevClubCnt(Long prevClubCnt) {
		this.prevClubCnt = prevClubCnt;
	}
	public Long getNewClubCnt() {
		return newClubCnt;
	}
	public void setNewClubCnt(Long newClubCnt) {
		this.newClubCnt = newClubCnt;
	}
	public Long getAbolishClubCnt() {
		return abolishClubCnt;
	}
	public void setAbolishClubCnt(Long abolishClubCnt) {
		this.abolishClubCnt = abolishClubCnt;
	}
	public Long getCurrentClubCnt() {
		return currentClubCnt;
	}
	public void setCurrentClubCnt(Long currentClubCnt) {
		this.currentClubCnt = currentClubCnt;
	}
	public Date getPrevEndDate() {
		return prevEndDate;
	}
	public void setPrevEndDate(Date prevEndDate) {
		this.prevEndDate = prevEndDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
}
