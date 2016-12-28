package lionsclubs.com.cmm.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springbyexample.web.servlet.view.tiles2.DynamicTilesView;

public class DynamicTilesViewIntrceptor extends DynamicTilesView {

	@Override
	public void setTilesDefinitionName(String tilesDefinitionName) {
		super.setTilesDefinitionName(tilesDefinitionName);
	}

	@Override
	protected void renderMergedOutputModel(Map model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		if(request.getRequestURI().contains("/home/")){
			if(request.getRequestURI().contains("/home.do")){
				setTilesDefinitionName("homeMain");
			} else if(request.getRequestURI().contains("/governorsMsgHistory/")){
				setTilesDefinitionName("blank");	
			} else {
				setTilesDefinitionName("home");	
			}
		} else if(request.getRequestURI().contains("/m/")){
			if(request.getRequestURI().contains("/login.do")){
				setTilesDefinitionName("mobileLogin");
			} else if(request.getRequestURI().contains("/main/")){
				setTilesDefinitionName("mobileBlank");
			} else {
				setTilesDefinitionName("mobile");
			}
		} else if(request.getRequestURI().contains("/login/")) {
			setTilesDefinitionName("login");
		} else  if(request.getRequestURI().contains("presentation")){
			setTilesDefinitionName("presentation");
		} else  if(request.getRequestURI().contains("PrintPopup")){
			setTilesDefinitionName("printPopup");
		} else  if(request.getRequestURI().contains("Popup")){
			setTilesDefinitionName("popup");
		} else if(request.getRequestURI().contains("/jfile/")
				|| request.getRequestURI().contains("/include/")
				|| request.getRequestURI().contains("/header.do")){
			setTilesDefinitionName("blank");
		} else if(request.getRequestURI().contains("/main.do")){
			setTilesDefinitionName("main");
		}
		
		super.renderMergedOutputModel(model, request, response);
	}
}