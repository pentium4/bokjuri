package lionsclubs.com.MM1.MM1_2.MM1_08;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.include.profile.ProfileService;
import lionsclubs.com.include.profile.ProfileVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

@Controller
public class MM1_08Controller {
	@Resource private MM1_08Service service;
	@Resource private ProfileService serviceprofile;	
	@Resource MappingJacksonJsonView ajaxMainView;
	
	/**
	 * 회비납부현황 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_2/MM1_08/MM1_08.do")
	public String MM1_08(ModelMap model, @ModelAttribute("profileVO") ProfileVO pvo, @ModelAttribute("MM1_08VO") MM1_08VO vo) throws Exception{
		pvo = serviceprofile.profile(pvo);
		model.addAttribute("profile", pvo);
		vo.setMemberNo(pvo.getMemberNo());
		
		String sessionYear = StringUtils.isEmpty(vo.getSessionYear()) ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		
		vo.setSessionYear(String.valueOf(Integer.parseInt(sessionYear) - 2));
		model.addAttribute("twoYearAgoList", service.selectList(vo));
		
		vo.setSessionYear(String.valueOf(Integer.parseInt(sessionYear) - 1));
		model.addAttribute("oneYearAgoList", service.selectList(vo));
		
		vo.setSessionYear(sessionYear);
		model.addAttribute("resultList", service.selectList(vo));
		
		return "lionsclubs/com/MM1/MM1_2/MM1_08/MM1_08";
	}
	
	/**
	 * 납부금 리스트
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_2/MM1_08/listPayment.do")
	public ModelAndView listPayment(ModelMap model, @ModelAttribute("MM1_08VO") MM1_08VO vo) throws Exception{
		model.addAttribute("resultList", service.listPayment(vo));
		model.addAttribute("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}	
}
