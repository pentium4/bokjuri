package lionsclubs.com.MM1.MM1_1.MM1_03;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.SM1.SM1_2.SM1_04.SM1_04Service;
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
public class MM1_03Controller {
	@Resource private MM1_03Service service;
	@Resource private ProfileService profileService;
	@Resource MappingJacksonJsonView ajaxMainView;
	@Resource private SM1_04Service sm104Service;
	
	@RequestMapping("/MM1/MM1_1/MM1_03/MM1_03.do")
	public String MM1_03(ModelMap model, @ModelAttribute("profileVO") ProfileVO pvo, @ModelAttribute("MM1_03VO") MM1_03VO vo) throws Exception{
		/* 개인기본사항 */
		pvo = profileService.profile(pvo);
		model.addAttribute("profile", pvo);
		
		/*
		 * 리스트
		 */
		vo.setMemberNo(pvo.getMemberNo());
		List<MM1_03VO> resultList = service.List(vo);
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
        
		return "lionsclubs/com/MM1/MM1_1/MM1_03/MM1_03";
	}
	
	@RequestMapping("/MM1/MM1_1/MM1_03/MM1_03_Popup.do")
	public String MM1_03_Popup(ModelMap model, HttpServletRequest request, @ModelAttribute("MM1_03VO") MM1_03VO vo) throws Exception{
		/*
         * 소속클럽 리스트
         */
        model.addAttribute("memberCount", service.memberCount(vo.getMemberNo()));	// 멤버카운트
        model.addAttribute("lastStat", service.lastStat(vo));	// 최신상태정보
        model.addAttribute("lastQuitDateStat", service.lastQuitDateStat(vo.getMemberNo()));	// 최신퇴회일자			

		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			model.addAttribute("MM1_03VO", service.Select(vo));	
		}
		
		return "lionsclubs/com/MM1/MM1_1/MM1_03/MM1_03_Popup";
	}
	
//	@RequestMapping("/MM1/MM1_1/MM1_03/MM1_03_Popup2.do")
//	public String MM1_03_Popup2(ModelMap model, HttpServletRequest request, @ModelAttribute("MM1_03VO") MM1_03VO vo) throws Exception{
//		
//		vo.setMemberNo(request.getParameter("mno"));
//		vo.setIdnNo(Integer.valueOf(request.getParameter("idn")));
//		
//		model.addAttribute("MM1_03VO", service.Select(vo));
//		return "lionsclubs/com/MM1/MM1_1/MM1_03/MM1_03_Popup_Modify";
//	}
	
	/**
	 * 입력
	 */
	@RequestMapping("/MM1/MM1_1/MM1_03/MM1_03_Insert.do")
	public ModelAndView insert(HttpServletRequest request, @ModelAttribute("MM1_03VO") MM1_03VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());


		MM1_03VO lastStat = service.lastStat(vo);
		
		// 입회시 입회가 존재하는지 체크한다. 
		if(vo.getAppKindCode().equals("1040") && vo.getAppDescCode().equals("1000")){
			if(service.singCount(vo.getMemberNo()) > 0){
				model.put("result", "singError");
				return new ModelAndView(ajaxMainView, model);
			}
		} else if(vo.getAppKindCode().equals("1040") && vo.getAppDescCode().equals("1020")){
			
			int lastQuitDate = Integer.parseInt(service.lastQuitDateStat(vo.getMemberNo()));
			int startDate = Integer.parseInt(vo.getStartDate().replaceAll("\\.", ""));
			
			// 재입회시 퇴회가 존재하는지 체크한다.
			if(StringUtils.isEmpty(service.lastQuitDateStat(vo.getMemberNo()))){
				model.put("result", "singDivisionError");
				return new ModelAndView(ajaxMainView, model);
			//  재입회시 퇴회일자 보다 앞에 날짜를 선택하면 안된다.
			} else if(startDate < lastQuitDate){
				model.put("result", "quitError");
				return new ModelAndView(ajaxMainView, model);
			}

		// 클럽변경시 가장최근 소속클럽이 같으면 변경안됨.
		} else if(vo.getAppKindCode().equals("1040") && vo.getAppDescCode().equals("1030")){
			if(lastStat.getOrganCode().equals(vo.getOrganCode())){
				model.put("result", "organCodeError");
				return new ModelAndView(ajaxMainView, model);
			}
		}
		service.Insert(vo);
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 수정
	 */
	@RequestMapping("/MM1/MM1_1/MM1_03/MM1_03_Update.do")
	public ModelAndView update(HttpServletRequest request, @ModelAttribute("MM1_03VO") MM1_03VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		service.Update(vo);
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 삭제
	 */
	@RequestMapping("/MM1/MM1_1/MM1_03/MM1_03_Delete.do")
	public ModelAndView delete(HttpServletRequest request, @ModelAttribute("MM1_03VO") MM1_03VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		service.Delete(vo);
		model.put("result", true);	
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * autocomplete - 선임소속코드
	 */
	@RequestMapping("/MM1/MM1_1/MM1_03/MM1_03_autocomplete.do")
	public ModelAndView autocomplete(ModelMap model, HttpServletRequest request, @ModelAttribute("MM1_03VO") MM1_03VO vo) throws Exception{
		/*
         * 소속클럽 리스트
         */
        Map<String, Object> map = new HashMap<String, Object>();
        String autoCode = request.getParameter("autoCode");
        map.put("autoCode", (autoCode.length()==3 ? autoCode+"-000":autoCode));
		model.addAttribute("autoList", service.autoList(map));
        
		return new ModelAndView(ajaxMainView, model);
	}
}
