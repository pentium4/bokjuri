package lionsclubs.com.MM2.MM2_5.MM2_29;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
public class MM2_29Controller {
	@Resource private MM2_29Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	/**
	 * 행사 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_5/MM2_29/MM2_29.do")
	public String MM2_29(ModelMap model, @ModelAttribute("MM2_29VO") MM2_29VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(vo.getOrganCode())){
			vo.setOrganCode(user.getSearchOrganCode());	
		}
		
		List<MM2_29VO> resultList = service.list(vo);
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		model.addAttribute("total", service.total(vo));
		
		return "lionsclubs/com/MM2/MM2_5/MM2_29/MM2_29";
	}
	
	/**
	 * 행사삭제
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_5/MM2_29/delete.do")
	public ModelAndView delete(ModelMap model, @ModelAttribute("MM2_29VO") MM2_29VO vo) throws Exception{
		
		model.put("result", service.delete(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 행사 입력 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_5/MM2_29/inputEventPopup.do")
	public String inputEventPopup(ModelMap model, @ModelAttribute("MM2_29VO") MM2_29VO vo) throws Exception{
		return "lionsclubs/com/MM2/MM2_5/MM2_29/eventPopup";
	}
	
	/**
	 * 행사입력 
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_5/MM2_29/insertEventSponsor.do")
	public ModelAndView insertEventSponsor(HttpServletRequest request, @ModelAttribute("MM2_29VO") MM2_29VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		model.put("result", service.insertEventSponsor(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 행사 수정팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_5/MM2_29/updateEventPopup.do")
	public String updateEventPopup(ModelMap model, @ModelAttribute("MM2_29VO") MM2_29VO vo) throws Exception{
		model.addAttribute("MM2_29VO", service.detail(vo));
		
		return "lionsclubs/com/MM2/MM2_5/MM2_29/eventPopup";
	}
	
	/**
	 * 행사 수정
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_5/MM2_29/updateEventSponsor.do")
	public ModelAndView updateEventSponsor(HttpServletRequest request, @ModelAttribute("MM2_29VO") MM2_29VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		model.put("result", service.updateEventSponsor(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}		
	
	/**
	 * 행사 인원추가 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_5/MM2_29/eventMemberAddPopup.do")
	public String eventMemberAddPopup(ModelMap model, @ModelAttribute("MM2_29VO") MM2_29VO vo) throws Exception{
		model.addAttribute("detail", service.detail(vo));
		
		return "lionsclubs/com/MM2/MM2_5/MM2_29/eventMemberAddPopup";
	}
	
	/**
	 * 행사 인원조회 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_5/MM2_29/eventMemberPopup.do")
	public String eventMemberPopup(ModelMap model, @ModelAttribute("MM2_29VO") MM2_29VO vo) throws Exception{
		model.addAttribute("detail", service.detail(vo));
		model.addAttribute("resultList", service.eventMemberList(vo));
		model.addAttribute("eventMemberTotal", service.eventMemberTotal(vo));
		
		return "lionsclubs/com/MM2/MM2_5/MM2_29/eventMemberPopup";
	}

	/**
	 * 행사사진 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_5/MM2_29/eventPhotoPopup.do")
	public String eventPhotoPopup(ModelMap model, @ModelAttribute("MM2_29VO") MM2_29VO vo) throws Exception{
		model.addAttribute("resultList", service.eventPhotoList(vo));
		
		return "lionsclubs/com/MM2/MM2_5/MM2_29/eventPhotoPopup";
	}
	
	/**
	 * 행사인원 저장
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_5/MM2_29/saveEventMemberProcess.do")
	public ModelAndView saveEventMember(HttpServletRequest request, @ModelAttribute("MM2_29VO") MM2_29VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		model.put("result", service.saveEventMemberProcess(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 조직하위 클럽코드 리스트
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_5/MM2_29/subTreeYearClubCodeList.do")
	public ModelAndView subTreeYearClubCodeList(HttpServletRequest request, @ModelAttribute("MM2_29VO") MM2_29VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("clubCodeList", service.subTreeYearClubCodeList(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 클럽하위 멤버 리스트
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_5/MM2_29/eventClubMemberList.do")
	public ModelAndView clubMemberList(HttpServletRequest request, @ModelAttribute("MM2_29VO") MM2_29VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("eventClubObject", service.eventClubObject(vo));
		model.put("eventClubMemberList", service.eventClubMemberList(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}	
	
	/**
	 * 입력한 행사클럽 리스트
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_5/MM2_29/eventClubList.do")
	public ModelAndView eventClubList(HttpServletRequest request, @ModelAttribute("MM2_29VO") MM2_29VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("eventClubList", service.eventClubList(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 행사클럽 삭제
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_5/MM2_29/deleteEventClub.do")
	public ModelAndView deleteEventClub(HttpServletRequest request, @ModelAttribute("MM2_29VO") MM2_29VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.deleteEventClub(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
}
