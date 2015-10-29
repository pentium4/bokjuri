package lionsclubs.com.cmm.customtag.form;

import javax.servlet.jsp.JspWriter;

import lionsclubs.com.cmm.commoncode.CommonCodeService;
import lionsclubs.com.cmm.commoncode.CommonCodeVO;

import org.springframework.web.servlet.tags.RequestContextAwareTag;

public class LionsOrganCodeToName extends RequestContextAwareTag{
	private CommonCodeService service;
	
	private String organCode;
	private String nameKind = "1";	// 1 : 한글명, 2 : 한글약어, 3 : 한글약어(2)
	
	public CommonCodeService getService() {
		return service;
	}

	public void setService(CommonCodeService service) {
		this.service = service;
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

	@Override
	protected int doStartTagInternal() throws Exception {
		service = (CommonCodeService) getRequestContext().getWebApplicationContext().getBean(CommonCodeService.class);
		JspWriter out = pageContext.getOut();
		
		CommonCodeVO vo = new CommonCodeVO();
		vo.setOrganCode(organCode);
		vo.setNameKind(nameKind);
		
		String label = service.organCodeToName(vo);
		out.print(label == null ? "" : label);
		
		return SKIP_BODY;
	}
}
