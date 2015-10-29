package lionsclubs.com.SM1.SM1_4.SM1_14;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
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
public class SM1_14Controller {
	@Resource private SM1_14Service service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/SM1/SM1_4/SM1_14/SM1_14.do")
	public String selectList(ModelMap model, @ModelAttribute("SM1_14VO") SM1_14VO vo) throws Exception{
        
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		List<SM1_14VO> resultList = service.SM1_14(vo);
		model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());		
		
		return "lionsclubs/com/SM1/SM1_4/SM1_14/SM1_14";
	}
	
	@RequestMapping("/SM1/SM1_4/SM1_14/districtTitleMangePopup.do")
	public String districtTitleMangePopup(ModelMap model, @ModelAttribute("SM1_14VO") SM1_14VO vo) throws Exception{
		
		model.addAttribute("resultList", service.listDistrictTitle(vo));
		
		return "lionsclubs/com/SM1/SM1_4/SM1_14/districtTitleMangePopup";
	}
	
	@RequestMapping("/SM1/SM1_4/SM1_14/saveDistrictTitle.do")
	public ModelAndView saveDistrictTitle(ModelMap model, @ModelAttribute("SM1_14VO") SM1_14VO vo) throws Exception{
		
		model.put("result", service.saveDistrictTitleMange(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}

	@RequestMapping("/SM1/SM1_4/SM1_14/saveDistrictTitleMangeOrd.do")
	public ModelAndView saveDistrictTitleMangeOrd(ModelMap model, @ModelAttribute("SM1_14VO") SM1_14VO vo) throws Exception{
		
		model.put("result", service.saveDistrictTitleMangeOrd(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/SM1/SM1_4/SM1_14/deleteDistrictTitleMange.do")
	public ModelAndView deleteDistrictTitleMange(ModelMap model, @ModelAttribute("SM1_14VO") SM1_14VO vo) throws Exception{
		
		model.put("result", service.deleteDistrictTitleMange(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}	
}
