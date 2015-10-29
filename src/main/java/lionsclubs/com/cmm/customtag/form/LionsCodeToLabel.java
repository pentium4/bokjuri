package lionsclubs.com.cmm.customtag.form;

import javax.servlet.jsp.JspWriter;

import lionsclubs.com.cmm.commoncode.CommonCodeService;
import lionsclubs.com.cmm.commoncode.CommonCodeVO;

import org.springframework.web.servlet.tags.RequestContextAwareTag;

public class LionsCodeToLabel extends RequestContextAwareTag{
	private CommonCodeService service;
	
	private String groupCode;
	private String code;
	
	public CommonCodeService getService() {
		return service;
	}


	public void setService(CommonCodeService service) {
		this.service = service;
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

	
	@Override
	protected int doStartTagInternal() throws Exception {
		service = (CommonCodeService) getRequestContext().getWebApplicationContext().getBean(CommonCodeService.class);
		JspWriter out = pageContext.getOut();
		
		CommonCodeVO vo = new CommonCodeVO();
		vo.setGroupCode(groupCode);
		vo.setCode(code);
		
		String label = service.codetolabel(vo);
		out.print(label == null ? "" : label);
		
		return SKIP_BODY;
	}
	
//	@Override
//	public int doStartTag() throws JspException {
//		service = (CommonCodeService) getRequestContext().getWebApplicationContext().getBean(CommonCodeService.class);
//		
//        try {
//        	JspWriter out = pageContext.getOut();
//			out.print("커스텀 태그 출력 메시지 : Hello!!");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		return SKIP_BODY;
//	}
}
