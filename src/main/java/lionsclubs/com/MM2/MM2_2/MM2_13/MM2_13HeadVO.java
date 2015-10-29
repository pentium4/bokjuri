package lionsclubs.com.MM2.MM2_2.MM2_13;

import java.io.Serializable;
import java.util.Date;

import egovframework.com.cmm.ComDefaultVO;

/**
 * @author user
 *
 */
public class MM2_13HeadVO extends ComDefaultVO implements Serializable{
	private String idnNo;	/* 입력번호 */
	private String memberNo;	/* 회원번호 */
	private String code;	/* 조직코드 */
	private String codeName;	/* 코드명 */
	private String codeDesc;	/* 코드상세*/
	private String code1;	/* 코드1*/
	private String code2;	/* 코드2*/
	private String code3;	/* 코드3*/
	private String useYn;	/* 사용여부*/
	private String groupCode;	/* 그룹코드 */
	private String ord;	/* ord */
	
	
	public String getOrd() {
		return ord;
	}
	public void setOrd(String ord) {
		this.ord = ord;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCodeDesc() {
		return codeDesc;
	}
	public void setCodeDesc(String codeDesc) {
		this.codeDesc = codeDesc;
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
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	
}
