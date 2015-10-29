package lionsclubs.com.cmm.web.password;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class PasswordVO extends ComDefaultVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String memberNo;
	private String currentPassword;
	private String newPassword;
	private String confirmPassword;
	
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getCurrentPassword() {
		return currentPassword;
	}
	public void setCurrentPassword(String currentPassword) {
		this.currentPassword = currentPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
