package lionsclubs.com.MM2.MM2_1.MM2_08;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class MM2_08VO extends ComDefaultVO implements Serializable{
	private String organCode;	/* 클럽코드 */
	private String sessionYear;	/* 회기년도 */
	private String presidentName;	/* 회장명 */
	private String presidentPicture;	/* 회장사진 */
    private String vice1Name;	/* 1부회장명 */
    private String vice1Picture;	/* 1부회장사진 */
    private String vice2Name;	/* 2부회장명 */
    private String vice2Picture;	/* 2부회장사진 */
    private String vice3Name;	/* 3부회장명 */
    private String vice3Picture;	/* 3부회장사진 */
    private String managerName;	/* 총무명 */
    private String managerPicture;	/* 총무사진 */
    private String financialName;	/* 재무명 */
    private String financialPicture;	/* 재무사진 */
    
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
	public String getPresidentName() {
		return presidentName;
	}
	public void setPresidentName(String presidentName) {
		this.presidentName = presidentName;
	}
	public String getPresidentPicture() {
		return presidentPicture;
	}
	public void setPresidentPicture(String presidentPicture) {
		this.presidentPicture = presidentPicture;
	}
	public String getVice1Name() {
		return vice1Name;
	}
	public void setVice1Name(String vice1Name) {
		this.vice1Name = vice1Name;
	}
	public String getVice1Picture() {
		return vice1Picture;
	}
	public void setVice1Picture(String vice1Picture) {
		this.vice1Picture = vice1Picture;
	}
	public String getVice2Name() {
		return vice2Name;
	}
	public void setVice2Name(String vice2Name) {
		this.vice2Name = vice2Name;
	}
	public String getVice2Picture() {
		return vice2Picture;
	}
	public void setVice2Picture(String vice2Picture) {
		this.vice2Picture = vice2Picture;
	}
	public String getVice3Name() {
		return vice3Name;
	}
	public void setVice3Name(String vice3Name) {
		this.vice3Name = vice3Name;
	}
	public String getVice3Picture() {
		return vice3Picture;
	}
	public void setVice3Picture(String vice3Picture) {
		this.vice3Picture = vice3Picture;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getManagerPicture() {
		return managerPicture;
	}
	public void setManagerPicture(String managerPicture) {
		this.managerPicture = managerPicture;
	}
	public String getFinancialName() {
		return financialName;
	}
	public void setFinancialName(String financialName) {
		this.financialName = financialName;
	}
	public String getFinancialPicture() {
		return financialPicture;
	}
	public void setFinancialPicture(String financialPicture) {
		this.financialPicture = financialPicture;
	}
	
}
