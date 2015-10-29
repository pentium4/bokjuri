package lionsclubs.com.cmm.ui;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public class VariablesServiceImpl implements IVariablesService{
	private List<IVariablesProvider> variablesProviders;
  
	@Resource
	public void setVariablesProviders(List<IVariablesProvider> variablesProviders){
		this.variablesProviders = variablesProviders;
	}
  
	public void destroy(){
		this.variablesProviders = null;
	}
  
  	@Override
	public Map<String, Object> provideVariables(Map<String, Object> vars,
		boolean ui, String context, HttpServletRequest request) {
  		if (vars == null) {
  			vars = new HashMap<String, Object>();
  		}
		Iterator<IVariablesProvider> iter;
		
		if (this.variablesProviders != null) {
			for (iter = this.variablesProviders.iterator(); iter.hasNext();){
				IVariablesProvider p = (IVariablesProvider)iter.next();
				p.provideVariables(vars, ui, context, request);
			}
		}
		return vars;
  	}
}
