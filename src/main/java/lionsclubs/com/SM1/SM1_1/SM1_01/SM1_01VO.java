package lionsclubs.com.SM1.SM1_1.SM1_01;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class SM1_01VO extends ComDefaultVO implements Serializable {
	private String name;
	private String tel;
	
	private String memberNo;
	private String authGroupCode;
	private String useYn;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getMemberNo(){
		return memberNo;
	}
	public void setMemberNo(String memberNo){
		this.memberNo = memberNo;
	}
	public String getAuthGroupCode() {
		return authGroupCode;
	}
	public void setAuthGroupCode(String authGroupCode) {
		this.authGroupCode = authGroupCode;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	
	
}
