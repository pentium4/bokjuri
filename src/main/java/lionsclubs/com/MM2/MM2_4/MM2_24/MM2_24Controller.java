package lionsclubs.com.MM2.MM2_4.MM2_24;

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
public class MM2_24Controller {
	@Resource private MM2_24Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	private int size = 20;

	private List<MM2_24VO_DATA>initList(List<MM2_24VO_DATA> resultList,int size) throws Exception{
		if(resultList.size() < size) for(int i = resultList.size(); i < size; i++) resultList.add(i,new MM2_24VO_DATA());
		return resultList;
	}	
	
	@RequestMapping("/MM2/MM2_4/MM2_24/MM2_24.do")
	public String MM2_24(ModelMap model, @ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM vo , @ModelAttribute("MM2_24VO_CONF_INFO_INSERT") MM2_24VO_CONF_INFO_INSERT insertVo , @ModelAttribute("MM2_24VO_CONF_INFO_UPDATE") MM2_24VO_CONF_INFO_UPDATE updateVo) throws Exception{
		
		if(vo.getOrganCode() == null) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setOrganCode(user.getSearchClubCode());
			user.setSearchOrganCode(vo.getOrganCode());
		}
		
		if(vo.getYearCode() == null) {
			vo.setYearCode(CommonUtil.thisSessionYear());
		}
		
		if(vo.getMonthCode() == null) {
			vo.setMonthCode(CommonUtil.thisMonth());			
		}
		
		if(vo.getConfIdnNo() != null && vo.getConfIdnNo() > 0) {
			MM2_24VO_CONF_INFO data = service.loadConferenceBasicInfo(vo);
			vo.setConfInfo(data);
		}
		
		selectList(vo);
		
		return "lionsclubs/com/MM2/MM2_4/MM2_24/MM2_24";
	}
	
	
	private void selectList(MM2_24VO_PARAM vo) throws Exception {
		List<MM2_24VO_DATA> resultList = service.selectList(vo);
		vo.setListData(this.initList(resultList, this.size));
	}
	
	
	/**
	 * 회의일자 콤보 option 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */              
	@RequestMapping("/MM2/MM2_4/MM2_24/loadConfIdnNo.do")
	public ModelAndView loadConfIdnNo(HttpServletRequest request, @ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		user.setSearchOrganCode(vo.getOrganCode());
		
		List<MM2_24VO_OPT> data = service.loadConfIdnNo(vo);
		model.put("data", data);
		model.put("result", true);

		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 회의 기본정보 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */              
	@RequestMapping("/MM2/MM2_4/MM2_24/loadConferenceBasicInfo.do")
	public ModelAndView loadConferenceBasicInfo(HttpServletRequest request, @ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		user.setSearchOrganCode(vo.getOrganCode());
		
		MM2_24VO_CONF_INFO data = service.loadConferenceBasicInfo(vo);
		
		if(data == null) data = new MM2_24VO_CONF_INFO();
		model.put("data", data);
		model.put("result", true);

		return new ModelAndView(ajaxMainView, model);
	}
	
	
	/**
	 * 회의추가
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */              
	@RequestMapping("/MM2/MM2_4/MM2_24/insertConferenceBasicInfo.do")
	public ModelAndView insertConferenceBasicInfo(HttpServletRequest request, @ModelAttribute("MM2_24VO_CONF_INFO_INSERT") MM2_24VO_CONF_INFO_INSERT vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMemberNo(user.getId()); // 작성자 회원번호 세팅

		try{
			String message = service.insertConferenceBasicInfo(vo);
			model.put("result", "".equals(message));
			model.put("message", message);
		}catch(Exception e){
			model.put("result", false);
			model.put("message", "회의 추가를 실패하였습니다.");
		}

		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 회의수정
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */              
	@RequestMapping("/MM2/MM2_4/MM2_24/updateConferenceBasicInfo.do")
	public ModelAndView updateConferenceBasicInfo(HttpServletRequest request, @ModelAttribute("MM2_24VO_CONF_INFO_UPDATE") MM2_24VO_CONF_INFO_UPDATE vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMemberNo(user.getId()); // 작성자 회원번호 세팅

		try{
			String message = service.updateConferenceBasicInfo(vo);
			model.put("result", "".equals(message));
			model.put("message", message);
		}catch(Exception e){
			model.put("result", false);
			model.put("message", "회의 수정을 실패하였습니다.");

		}
	
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 회의삭제
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */              
	@RequestMapping("/MM2/MM2_4/MM2_24/deleteConferenceBasicInfo.do")
	public ModelAndView deleteConferenceBasicInfo(HttpServletRequest request, @ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		try{
			String message = service.deleteConferenceBasicInfo(vo);
			model.put("result", "".equals(message));
			model.put("message", message);
		}catch(Exception e){
			model.put("result", false);
			model.put("message", "회의 삭제를 실패하였습니다.");
		}

		return new ModelAndView(ajaxMainView, model);
	}

	
	@RequestMapping("/MM2/MM2_4/MM2_24/insertList.dox")
	public String insertList(ModelMap model, @ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM vo , @ModelAttribute("MM2_24VO_CONF_INFO_INSERT") MM2_24VO_CONF_INFO_INSERT insertVo , @ModelAttribute("MM2_24VO_CONF_INFO_UPDATE") MM2_24VO_CONF_INFO_UPDATE updateVo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMemberNo(user.getId()); // 작성자 회원번호 세팅

		service.insertList(vo);
		selectList(vo);
		
		return "lionsclubs/com/MM2/MM2_4/MM2_24/MM2_24";
	}

	@RequestMapping("/MM2/MM2_4/MM2_24/updateList.dox")
	public String updateList(ModelMap model, @ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM vo , @ModelAttribute("MM2_24VO_CONF_INFO_INSERT") MM2_24VO_CONF_INFO_INSERT insertVo , @ModelAttribute("MM2_24VO_CONF_INFO_UPDATE") MM2_24VO_CONF_INFO_UPDATE updateVo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMemberNo(user.getId()); // 작성자 회원번호 세팅

		service.updateList(vo);
		selectList(vo);
		return "lionsclubs/com/MM2/MM2_4/MM2_24/MM2_24";
	}
	
	@RequestMapping("/MM2/MM2_4/MM2_24/deleteList.dox")
	public String deleteList(ModelMap model, @ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM vo , @ModelAttribute("MM2_24VO_CONF_INFO_INSERT") MM2_24VO_CONF_INFO_INSERT insertVo , @ModelAttribute("MM2_24VO_CONF_INFO_UPDATE") MM2_24VO_CONF_INFO_UPDATE updateVo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMemberNo(user.getId()); // 작성자 회원번호 세팅

		service.deleteList(vo);
		selectList(vo);
		return "lionsclubs/com/MM2/MM2_4/MM2_24/MM2_24";
	}
	
	@RequestMapping("/MM2/MM2_4/MM2_24/initList.dox")
	public String initList(ModelMap model, @ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM vo , @ModelAttribute("MM2_24VO_CONF_INFO_INSERT") MM2_24VO_CONF_INFO_INSERT insertVo , @ModelAttribute("MM2_24VO_CONF_INFO_UPDATE") MM2_24VO_CONF_INFO_UPDATE updateVo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMemberNo(user.getId()); // 작성자 회원번호 세팅

		service.initList(vo);
		selectList(vo);
		return "lionsclubs/com/MM2/MM2_4/MM2_24/MM2_24";
	}

	
	@RequestMapping("/MM2/MM2_4/MM2_24/fileInfoPopup.do")
	public String fileInfoPopup(ModelMap model, @ModelAttribute("MM2_24VO_FILE") MM2_24VO_FILE vo) throws Exception{
		return "lionsclubs/com/MM2/MM2_4/MM2_24/MM2_24_Popup_FileDownload";
	}
	
	@RequestMapping("/MM2/MM2_4/MM2_24/fileInfoUpload.dox")
	public ModelAndView fileInfoUpload(HttpServletRequest request, @ModelAttribute("MM2_24VO_FILE") MM2_24VO_FILE vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.fileInfoUpload(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	
	@RequestMapping("/MM2/MM2_4/MM2_24/mediaPopup.do")
	public String mediaPopup(ModelMap model) throws Exception{
		return "lionsclubs/com/MM2/MM2_4/MM2_24/MM2_24_mediaPopup";
	}
	
	@RequestMapping("/MM2/MM2_4/MM2_24/presentation.do")
	public String presentation(ModelMap model, @ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM vo) throws Exception{

		if(vo.getConfIdnNo() != null && vo.getConfIdnNo() > 0) {
			MM2_24VO_CONF_INFO data = service.loadConferenceBasicInfo(vo);
			vo.setConfInfo(data);
		}

		model.addAttribute("resultList", service.selectList(vo));
		
        return "lionsclubs/com/MM2/MM2_4/MM2_24/presentation";
	}	
}
