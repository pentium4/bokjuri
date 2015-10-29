package lionsclubs.com.MM3.MM3_4.MM3_21;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

public class MM3_21VO extends ComDefaultVO implements Serializable{

	private String districtCode;	/*지구코드 */
	private String sessionYear;	/* 회기년 */
	private String clubCode;		/* 클럽코드 */ 
	private String clubName;		/* 클럽명 */ 
	private String firstUnPaid;	/* 상반기 미납 부과금 */
	private String firstMyDues;	/* 상반기 제의무금 부과금 */
	private String firstExpenses;	/* 상반기 지구 입주 관리비 부과금 */
	private String secUnPaid;	/* 하반기 미납 부과금 */
	private String secMyDues;	/* 하반기 제의무금 부과금 */
	private String secExpenses;	/* 하반기 지구 입주 관리비 부과금 */
	private String totDue;	/* 총금액 */
	private String balance;	/* 잔액 */	
	
	private String confirmDate;	/* 정산일 */
	private String confirmYn;	/* 정산여부 */
	private Integer confirmCount;	/* 정산횟수 */
	private String confirmLockDate;	/* 정산확정일 */
	private String confirmLockYn;	/* 정산확정여부 */	
	
	private Date insertDate;	/* 생성일자 */
	private String insertName;	/* 생성자 */
	private Date updateDate;	/* 수정일자 */
	private String updateName;	/* 수정자 */
	
	public String getDistrictCode() {
		return districtCode;
	}
	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}
	public String getSessionYear() {
		return sessionYear;
	}
	public void setSessionYear(String sessionYear) {
		this.sessionYear = sessionYear;
	}
	public String getClubCode() {
		return clubCode;
	}
	public void setClubCode(String clubCode) {
		this.clubCode = clubCode;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getFirstUnPaid() {
		return firstUnPaid;
	}
	public void setFirstUnPaid(String firstUnPaid) {
		this.firstUnPaid = firstUnPaid;
	}
	public String getFirstMyDues() {
		return firstMyDues;
	}
	public void setFirstMyDues(String firstMyDues) {
		this.firstMyDues = firstMyDues;
	}
	public String getFirstExpenses() {
		return firstExpenses;
	}
	public void setFirstExpenses(String firstExpenses) {
		this.firstExpenses = firstExpenses;
	}
	public String getSecUnPaid() {
		return secUnPaid;
	}
	public void setSecUnPaid(String secUnPaid) {
		this.secUnPaid = secUnPaid;
	}
	public String getSecMyDues() {
		return secMyDues;
	}
	public void setSecMyDues(String secMyDues) {
		this.secMyDues = secMyDues;
	}
	public String getSecExpenses() {
		return secExpenses;
	}
	public void setSecExpenses(String secExpenses) {
		this.secExpenses = secExpenses;
	}
	public String getTotDue() {
		return totDue;
	}
	public void setTotDue(String totDue) {
		this.totDue = totDue;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;
	}
	public String getConfirmDate() {
		return confirmDate;
	}
	public void setConfirmDate(String confirmDate) {
		this.confirmDate = confirmDate;
	}
	public String getConfirmYn() {
		return confirmYn;
	}
	public void setConfirmYn(String confirmYn) {
		this.confirmYn = confirmYn;
	}
	public Integer getConfirmCount() {
		return confirmCount;
	}
	public void setConfirmCount(Integer confirmCount) {
		this.confirmCount = confirmCount;
	}
	public String getConfirmLockDate() {
		return confirmLockDate;
	}
	public void setConfirmLockDate(String confirmLockDate) {
		this.confirmLockDate = confirmLockDate;
	}
	public String getConfirmLockYn() {
		return confirmLockYn;
	}
	public void setConfirmLockYn(String confirmLockYn) {
		this.confirmLockYn = confirmLockYn;
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
