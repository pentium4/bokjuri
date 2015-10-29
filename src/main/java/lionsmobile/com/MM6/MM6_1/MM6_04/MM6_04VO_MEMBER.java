package lionsmobile.com.MM6.MM6_1.MM6_04;

import java.io.Serializable;

public class MM6_04VO_MEMBER implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String memberName	;
	private String tPos			;
	private String tClubName	;
	private String tCoPos		;
	private String tPhone		;
	private String tAreaNo		;
	private String tBoundNo		;
	private String tClubFNo		;
	private String picFile	;
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String gettPos() {
		return tPos;
	}
	public void settPos(String tPos) {
		this.tPos = tPos;
	}
	public String gettClubName() {
		return tClubName;
	}
	public void settClubName(String tClubName) {
		this.tClubName = tClubName;
	}
	public String gettCoPos() {
		return tCoPos;
	}
	public void settCoPos(String tCoPos) {
		this.tCoPos = tCoPos;
	}
	public String gettPhone() {
		return tPhone;
	}
	public void settPhone(String tPhone) {
		this.tPhone = tPhone;
	}
	public String gettAreaNo() {
		return tAreaNo;
	}
	public void settAreaNo(String tAreaNo) {
		this.tAreaNo = tAreaNo;
	}
	public String gettBoundNo() {
		return tBoundNo;
	}
	public void settBoundNo(String tBoundNo) {
		this.tBoundNo = tBoundNo;
	}
	public String gettClubFNo() {
		return tClubFNo;
	}
	public void settClubFNo(String tClubFNo) {
		this.tClubFNo = tClubFNo;
	}
	public String getPicFile() {
		return picFile;
	}
	public void setPicFile(String memPicFile) {
		this.picFile = memPicFile;
	}
}
