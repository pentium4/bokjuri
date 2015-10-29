package lionsmobile.com.MM6.MM6_1.MM6_03;

import java.io.Serializable;

public class MM6_03VO_MEMBER implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String memberName;
	private String pos;
	private String clubName;
	private String coPos;
	private String phone;
	private String chYear;
	private String picFile;
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getPos() {
		return pos;
	}
	public void setPos(String pos) {
		this.pos = pos;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getCoPos() {
		return coPos;
	}
	public void setCoPos(String coPos) {
		this.coPos = coPos;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getChYear() {
		return chYear;
	}
	public void setChYear(String chYear) {
		this.chYear = chYear;
	}
	public String getPicFile() {
		return picFile;
	}
	public void setPicFile(String picFile) {
		this.picFile = picFile;
	}
}
