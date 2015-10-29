package lionsclubs.com.cmm.customtag.form;

import javax.servlet.jsp.JspWriter;

import lionsclubs.com.SM1.SM1_3.SM1_09.SM1_09Service;
import lionsclubs.com.SM1.SM1_3.SM1_09.SM1_09VO;

import org.springframework.web.servlet.tags.RequestContextAwareTag;

public class LionsMenuTitle extends RequestContextAwareTag{
	private SM1_09Service service;
	
	private String menuId;
	private String kind;

	public SM1_09Service getService() {
		return service;
	}

	public void setService(SM1_09Service service) {
		this.service = service;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	
	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	@Override
	protected int doStartTagInternal() throws Exception {
		service = (SM1_09Service) getRequestContext().getWebApplicationContext().getBean(SM1_09Service.class);
		JspWriter out = pageContext.getOut();
		
		SM1_09VO vo = service.menuTitle(getMenuId());
		
		if(getKind().equals("subtitle")){
			if(vo != null){
				out.print(vo.getSubTitle() == null ? "" : vo.getSubTitle());
			} else {
				out.print("");
			}
			
		} else {
			if(vo != null){
				out.print(vo.getMainTitle() == null ? "" : vo.getMainTitle());	
			} else {
				out.print("");
			}
			
		}
		
		return SKIP_BODY;
	}
}
