package lionsclubs.com.MM3.MM3_7.MM3_33;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.commoncode.CommonCodeService;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_33Controller {
	@Resource private MM3_33Service service;
	@Resource private CommonCodeService codeService;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	private int size = 50;

	private List<MM3_33VO_DATA>initList(List<MM3_33VO_DATA> resultList,int size) throws Exception{
		if(resultList.size() < size) for(int i = resultList.size(); i < size; i++) resultList.add(i,new MM3_33VO_DATA());
		return resultList;
	}
	
	private void selectList(MM3_33VO vo) throws Exception {
		/*
		 * 직책코드 : titleCode
		 */
        vo.setCodeList(codeService.codelistSimple("2760"));
		vo.setListData(this.initList(service.selectList(vo), this.size));
	}
	
	@RequestMapping("/MM3/MM3_7/MM3_33/MM3_33.do")
	public String MM3_33(ModelMap model, @ModelAttribute("MM3_33VO") MM3_33VO vo) throws Exception{
		vo.setListData(this.initList(new ArrayList<MM3_33VO_DATA>(), this.size));
		
		if(vo.getThisYear() == null){
			vo.setThisYear(CommonUtil.thisSessionYear());
		}
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getThisOrganCode())){
			vo.setThisOrganCode(user.getSearchDistrictCode());
		}
		
		/*
		 * 직책코드 : titleCode
		 */
        vo.setCodeList(codeService.codelistSimple("2760"));        
		
        this.selectList(vo);
        return "lionsclubs/com/MM3/MM3_7/MM3_33/MM3_33";
	}	
	
	@RequestMapping("/MM3/MM3_7/MM3_33/selectList.do")
	public String selectList(ModelMap model, @ModelAttribute("MM3_33VO") MM3_33VO vo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		user.setSearchOrganCode(vo.getThisOrganCode());
		
		this.selectList(vo);
		return "lionsclubs/com/MM3/MM3_7/MM3_33/MM3_33";
	}
	
	@RequestMapping("/MM3/MM3_7/MM3_33/insertList.dox")
	public String insertList(ModelMap model, @ModelAttribute("MM3_33VO") MM3_33VO vo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		service.insertList(vo);
		this.selectList(vo);
		return "lionsclubs/com/MM3/MM3_7/MM3_33/MM3_33";
	}
	
	@RequestMapping("/MM3/MM3_7/MM3_33/updateList.dox")
	public String updateList(ModelMap model, @ModelAttribute("MM3_33VO") MM3_33VO vo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		service.updateList(vo);
		this.selectList(vo);
		return "lionsclubs/com/MM3/MM3_7/MM3_33/MM3_33";
	}
	
	@RequestMapping("/MM3/MM3_7/MM3_33/deleteList.dox")
	public String deleteList(ModelMap model, @ModelAttribute("MM3_33VO") MM3_33VO vo) throws Exception{
		service.deleteList(vo);
		this.selectList(vo);
		return "lionsclubs/com/MM3/MM3_7/MM3_33/MM3_33";
	}
	
	/**
	 * 발령적용
	 * 1. 임원선임
	 * 2. 분담금
	 */
	@RequestMapping("/MM3/MM3_7/MM3_33/insertPerson.do")
	public ModelAndView insertPerson(HttpServletRequest request, @ModelAttribute("MM3_33VO") MM3_33VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		String confirm_yn = service.insertPerson(vo);
		
		if("N".equals(confirm_yn)){
			model.put("result", true);	
		}else{
			model.put("result", false);	
			model.put("message", confirm_yn);
		}
		return new ModelAndView(ajaxMainView, model);
	}
	
	/*
	 * 회원 클럽정보 가져오기
	 */
	@RequestMapping("/MM3/MM3_7/MM3_33/selectOrgan.dox")
	public ModelAndView selectOrgan(HttpServletRequest request, @ModelAttribute("MM3_33VO") MM3_33VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		String memberNo = request.getParameter("memberNo");
		model.put("resultData", service.selectOrgan(memberNo));	
		model.put("result", true);	
		return new ModelAndView(ajaxMainView, model);
	}
}
