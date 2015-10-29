package lionsclubs.com.MM1.MM1_1.MM1_04;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.commoncode.CommonCodeService;
import lionsclubs.com.cmm.commoncode.CommonCodeVO;
import lionsclubs.com.include.profile.ProfileService;
import lionsclubs.com.include.profile.ProfileVO;
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
public class MM1_04Controller {
	@Resource private MM1_04Service service;
	@Resource private ProfileService serviceprofile;
	@Resource private CommonCodeService commonCodeService;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM1/MM1_1/MM1_04/MM1_04.do")
	public String MM1_04(ModelMap model, @ModelAttribute("profileVO") ProfileVO pvo, @ModelAttribute("MM1_04VO") MM1_04VO vo) throws Exception{
		pvo.setRnum(vo.getRnum());		
		pvo = serviceprofile.profile(pvo);
		model.addAttribute("profile", pvo);
		
		/*
		 * 리스트
		 */
		vo.setMemberNo(pvo.getMemberNo());
		List<MM1_04VO> resultList = service.List(vo);
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
		return "lionsclubs/com/MM1/MM1_1/MM1_04/MM1_04";
	}	
	
	@RequestMapping("/MM1/MM1_1/MM1_04/MM1_04_Popup.do")
	public String MM1_04_Popup(ModelMap model, @ModelAttribute("MM1_04VO") MM1_04VO vo) throws Exception{

		CommonCodeVO ccvo = new CommonCodeVO();
		ccvo.setGroupCode("3110");
		ccvo.setCode(vo.getKindCode());
		model.addAttribute("code1", commonCodeService.codetocode1(ccvo));
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			model.addAttribute("MM1_04VO", service.Select(vo));	
		}
		
		return "lionsclubs/com/MM1/MM1_1/MM1_04/MM1_04_Popup";
	}
	
	/**
	 * 경력 - 입력
	 */
	@RequestMapping("/MM1/MM1_1/MM1_04/MM1_04_Insert.do")
	public ModelAndView insert(HttpServletRequest request, @ModelAttribute("MM1_04VO") MM1_04VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		service.Insert(vo);
		model.put("result", true);	
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 경력 - 수정
	 */
	@RequestMapping("/MM1/MM1_1/MM1_04/MM1_04_Update.do")
	public ModelAndView update(HttpServletRequest request, @ModelAttribute("MM1_04VO") MM1_04VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		model.put("result", service.Update(vo));	
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 경력 - 삭제
	 */
	@RequestMapping("/MM1/MM1_1/MM1_04/MM1_04_Delete.do")
	public ModelAndView delete(HttpServletRequest request, @ModelAttribute("MM1_04VO") MM1_04VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("result", service.Delete(vo));	
		
		return new ModelAndView(ajaxMainView, model);
	}
}
