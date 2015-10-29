package lionsclubs.com.cmm.commoncode;

import java.io.Serializable;

public class CommonCodeVO implements Serializable {
	private String code;	/* 코드 */
	private String groupCode;	/* 그룹코드 */
	private String codeName;	/* 코드명칭 */
	private String code1;	/* 옵션1 */
	private String code2;	/* 옵션2 */
	private String code3;	/* 옵션3 */
	private String organCode;	/* 조직코드 */
	private String nameKind = "1";	// 1 : 한글명, 2 : 한글약어, 3 : 한글약어(2)
	
	private String[] code1s;	/* 옵션1 조건 배열 */
	
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
	public String[] getCode1s() {
		return code1s;
	}
	public void setCode1s(String[] code1s) {
		this.code1s = code1s;
	}
	public String getOrganCode() {
		return organCode;
	}
	public void setOrganCode(String organCode) {
		this.organCode = organCode;
	}
	public String getNameKind() {
		return nameKind;
	}
	public void setNameKind(String nameKind) {
		this.nameKind = nameKind;
	}
}
