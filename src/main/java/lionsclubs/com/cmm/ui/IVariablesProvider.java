package lionsclubs.com.cmm.ui;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public abstract interface IVariablesProvider{
	public static final String SERVLET_REQUEST = "ServletRequest";
	public static final String SERVLET_RESPONSE = "ServletResponse";
	public static final String SERVLET_CONTEXT = "ServletContext";
  
	public abstract void provideVariables(Map<String, Object> paramMap, boolean paramBoolean, String paramString, HttpServletRequest request);
}
