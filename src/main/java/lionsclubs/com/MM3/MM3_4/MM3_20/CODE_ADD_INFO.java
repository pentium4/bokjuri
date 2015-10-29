package lionsclubs.com.MM3.MM3_4.MM3_20;

import org.springframework.stereotype.Component;

@Component
public class CODE_ADD_INFO {
	private String duesDstCode;
	private String groupCode;
	private String code;
	private String codeName;
	private String useYn;
	private String dollarKind;	/* 달러구분 */
	
	public String getDuesDstCode() {
		return duesDstCode;
	}
	public void setDuesDstCode(String duesDstCode) {
		this.duesDstCode = duesDstCode;
	}
	public String getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
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
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getDollarKind() {
		return dollarKind;
	}
	public void setDollarKind(String dollarKind) {
		this.dollarKind = dollarKind;
	}
}
