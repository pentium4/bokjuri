package lionsclubs.com.MM3.MM3_5.MM3_25;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_25Controller {
	@Resource
	private MM3_25Service service;
	
	@Resource 
	MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_5/MM3_25/MM3_25.do")
	public String MM3_25(ModelMap model, @ModelAttribute("MM3_25VO") MM3_25VO vo) throws Exception{
		
		/** 현재년월 세팅 */
		String thisyear = vo.getThisYear()==null ? CommonUtil.thisSessionYear() : vo.getThisYear(); //년도를 구한다
		vo.setThisYear(thisyear);
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());

		if(vo.getUpperCode()==null || "".equals(vo.getUpperCode())) {
			vo.setUpperCode(user.getSearchDistrictCode());
		}
		return "lionsclubs/com/MM3/MM3_5/MM3_25/MM3_25";		
	}	
	
	@RequestMapping("/MM3/MM3_5/MM3_25/MM3_25_List.do")
	public String MM3_25_List(ModelMap model, @ModelAttribute("MM3_25VO") MM3_25VO vo) throws Exception{
		List<MM3_25VO> resultList = service.mList(vo);
		model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());		
		return "lionsclubs/com/MM3/MM3_5/MM3_25/MM3_25";		
	}	
		
	//메인화면 추가창
	@RequestMapping("/MM3/MM3_5/MM3_25/Popup_Event_Input.do")
	public String MM3_25_Popup1(ModelMap model, HttpServletRequest request, @ModelAttribute("MM3_25VO") MM3_25VO vo) throws Exception{
		vo.setOrganCode(request.getParameter("org"));
		return "lionsclubs/com/MM3/MM3_5/MM3_25/Popup_Event_Input";
	}
	
	//메인화면 행사 기본사항 수정창
	@RequestMapping("/MM3/MM3_5/MM3_25/Popup_Event_Modify.do")
	public String MM3_25_Popup3(ModelMap model, HttpServletRequest request, @ModelAttribute("MM3_25VO") MM3_25VO vo) throws Exception{
		
		vo.setIdnNo(Integer.valueOf(request.getParameter("idn")));			
		model.addAttribute("MM3_25VO", service.SelectEvent(vo));
		
		return "lionsclubs/com/MM3/MM3_5/MM3_25/Popup_Event_Modify";
	}
	
	/**
	 * 삭제
	 */
	@RequestMapping("/MM3/MM3_5/MM3_25/MM3_25_Delete.do")
	public ModelAndView MM3_25_delete(HttpServletRequest request, @ModelAttribute("MM3_25VO") MM3_25VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		if(service.mDelete(vo) == 1){			
			model.put("result", true);	
		} else {
			model.put("result", false);
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
		
	// 메인화면 추가 팝업창 입력
	@RequestMapping("/MM3/MM3_5/MM3_25/MM3_25_Insert.do")
	public ModelAndView MM3_25_insert(HttpServletRequest request, @ModelAttribute("MM3_25VO") MM3_25VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());  
		
		service.mInsert(vo);
		model.put("result", true);	
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	// 메인화면 추가 팝업창 입력
	@RequestMapping("/MM3/MM3_5/MM3_25/MM3_25_Update.do")
	public ModelAndView MM3_25_updateM(HttpServletRequest request, @ModelAttribute("MM3_25VO") MM3_25VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();			
		vo.setUpdateName(user.getId());  
		
		service.mUpdate(vo);
		model.put("result", true);	
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/*
	 * 더블클릭 한 팝업창 
	 */
	@RequestMapping("/MM3/MM3_5/MM3_25/MM3_25_Popup_Detail.do")
	public String MM3_25_detailPopup(ModelMap model, HttpServletRequest request, @ModelAttribute("MM3_25VO") MM3_25VO vo) throws Exception{
		MM3_25HeadVO headVO = new MM3_25HeadVO();	
		headVO.setIdnNo(Integer.valueOf(request.getParameter("idn")));		
		model.addAttribute("resultHead", service.HeadList(headVO));	
		
		/** 현재년월 세팅 */
		String thisyear = vo.getThisYear()==null ? CommonUtil.thisSessionYear() : vo.getThisYear(); //년도를 구한다
		vo.setThisYear(thisyear);
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();			
		vo.setUpdateName(user.getId()); 
		
		vo.setIdnNo(Integer.valueOf(request.getParameter("idn")));
		vo.setEventOrgan(request.getParameter("org"));
		
		if(vo.getUpperCode()==null || "".equals(vo.getUpperCode())) {
				vo.setUpperCode(user.getDistrictCode());
		}
		 
		List<MM3_25VO> resultList = service.dList(vo);
		model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
        
        return "lionsclubs/com/MM3/MM3_5/MM3_25/MM3_25_Popup_Detail";
	}
	
	@RequestMapping("/MM3/MM3_5/MM3_25/MM3_25_Popup_Modify.do")
	public String MM3_25_Popup(ModelMap model, HttpServletRequest request, @ModelAttribute("MM3_25VO") MM3_25VO vo) throws Exception{
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();			
		vo.setUpdateName(user.getId());  
		
		vo.setScoreIdnNo(Integer.valueOf(request.getParameter("sidn")));
		vo.setIdnNo(Integer.valueOf(request.getParameter("idn")));
		vo.setOrganCode(request.getParameter("org"));
		if(vo.getScoreIdnNo() > 0){
			model.addAttribute("MM3_25VO", service.Select(vo));
		}
		return "lionsclubs/com/MM3/MM3_5/MM3_25/MM3_25_Popup_Modify";
	}
	
	/*
	 * 클럽행사 점수 입력및수정
	 */
	@RequestMapping("/MM3/MM3_5/MM3_25/MM3_25_Save.do")
	public ModelAndView MM3_25_update(HttpServletRequest request, @ModelAttribute("MM3_25VO") MM3_25VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());	

		service.clubSave(vo);		
		model.put("result", true);	
		
		return new ModelAndView(ajaxMainView, model);
	}
		
	
}
