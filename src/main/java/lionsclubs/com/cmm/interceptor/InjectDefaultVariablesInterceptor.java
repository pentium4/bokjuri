package lionsclubs.com.cmm.interceptor;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lionsclubs.com.SM1.SM1_3.SM1_09.SM1_09Service;
import lionsclubs.com.cmm.ui.IVariablesService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * Spring MVC view model 에 기본 변수들 추가
 * @author uchung
 *
 */
public class InjectDefaultVariablesInterceptor extends HandlerInterceptorAdapter{
	private  static final Logger LOGGER = LoggerFactory.getLogger("sdp.log");
  
	private List<HandlerInterceptor> interceptors;
	@Resource private SM1_09Service sm109Service;
	@Autowired(required=false) private IVariablesService variablesService;
	
	/**
	 * handler interceptor 들을 set 함
	 * @param interceptors handler interceptor 들
	 */
	public void setInterceptors(List<HandlerInterceptor> interceptors) {
		this.interceptors = interceptors;
	}
  

	/**
	 * {@inheritDoc}
	 */
	@Override
	public void postHandle(final HttpServletRequest request,
		HttpServletResponse response, Object handler,
		ModelAndView modelAndView) throws Exception {
		
		if (modelAndView != null) {
			final ModelMap model = modelAndView.getModelMap();
//			String uri = request.getRequestURI();
			String contextPath = request.getContextPath();
			model.addAttribute("contextPath", contextPath);
//			model.addAttribute("request", request);
			
			if (variablesService != null) {
				variablesService.provideVariables(model, true, "springMVC.view", request);
			}			
		}
		if (interceptors!=null && !interceptors.isEmpty()) {
			for (HandlerInterceptor interceptor : interceptors) {
				interceptor.postHandle(request, response, handler, modelAndView);
			}
		} 
	}
	
	
	/**
	 * {@inheritDoc}
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		LOGGER.debug("Before Execute Controller {} " , handler.getClass().getName());
		String contextPath  =request.getContextPath();
		if (interceptors!=null && !interceptors.isEmpty()) {
			for (HandlerInterceptor interceptor : interceptors) {
				if (!interceptor.preHandle(request, response, handler)) {
					return false;
				}
			}
		}
		return true;
	}
}