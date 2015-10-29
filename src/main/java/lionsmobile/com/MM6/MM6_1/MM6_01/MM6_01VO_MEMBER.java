package lionsmobile.com.MM6.MM6_1.MM6_01;

import java.io.Serializable;

public class MM6_01VO_MEMBER implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String memberNo			;
	private String name				;
	private String lvlName			;
	private String companyName		;
	private String companyTitle		;
	private String mobile			;
	private String memPicFile		;
	private String nesPicFile		;

	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLvlName() {
		return lvlName;
	}
	public void setLvlName(String lvlName) {
		this.lvlName = lvlName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyTitle() {
		return companyTitle;
	}
	public void setCompanyTitle(String companyTitle) {
		this.companyTitle = companyTitle;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getMemPicFile() {
		return memPicFile;
	}
	public void setMemPicFile(String memPicFile) {
		this.memPicFile = memPicFile;
	}
	public String getNesPicFile() {
		return nesPicFile;
	}
	public void setNesPicFile(String nesPicFile) {
		this.nesPicFile = nesPicFile;
	}

}
