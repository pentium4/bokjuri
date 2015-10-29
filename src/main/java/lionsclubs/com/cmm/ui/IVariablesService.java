package lionsclubs.com.cmm.ui;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public abstract interface IVariablesService{
	public abstract Map<String, Object> provideVariables(Map<String, Object> paramMap, boolean paramBoolean, String paramString, HttpServletRequest request);
}
