package lionsclubs.com.MM2.MM2_4.MM2_27;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.MM2.MM2_4.MM2_24.MM2_24Service;
import lionsclubs.com.MM2.MM2_4.MM2_24.MM2_24VO_CONF_INFO;
import lionsclubs.com.MM2.MM2_4.MM2_24.MM2_24VO_PARAM;
import lionsclubs.com.MM2.MM2_4.MM2_26.MM2_26VO_PARAM;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM2_27Controller {
	@Resource private MM2_24Service baseInfoService;
	@Resource private MM2_27Service service;
	@Resource MappingJacksonJsonView ajaxMainView;	

	private int size = 8;
	
	private void selectList(MM2_24VO_PARAM vo, MM2_27VO_PARAM dataVo) throws Exception {
		List<MM2_27VO_DATA> resultList = service.selectList(vo);
		dataVo.setListData(this.initList(resultList, this.size));
	}
	
	@RequestMapping("/MM2/MM2_4/MM2_27/MM2_27.do")
	public String MM2_27(ModelMap model, @ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM vo, @ModelAttribute("MM2_27VO_PARAM") MM2_27VO_PARAM dataVo) throws Exception{
		
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
			MM2_24VO_CONF_INFO data = baseInfoService.loadConferenceBasicInfo(vo);
			vo.setConfInfo(data);
		}
		
		selectList(vo, dataVo);
		
        return "lionsclubs/com/MM2/MM2_4/MM2_27/MM2_27";
	}	


	private List<MM2_27VO_DATA>initList(List<MM2_27VO_DATA> resultList,int size) throws Exception{
		if(resultList.size() < size) for(int i = resultList.size(); i < size; i++) resultList.add(i,new MM2_27VO_DATA());
		return resultList;
	}

	@RequestMapping("/MM2/MM2_4/MM2_27/deleteList.dox")
	public String deleteList(ModelMap model, @ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM vo , @ModelAttribute("MM2_27VO_PARAM") MM2_27VO_PARAM dataVo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		dataVo.setMemberNo(user.getId()); // 작성자 회원번호 세팅
	
		service.deleteList(dataVo);
		
		if(vo.getConfIdnNo() != null && vo.getConfIdnNo() > 0) {
			MM2_24VO_CONF_INFO data = baseInfoService.loadConferenceBasicInfo(vo);
			vo.setConfInfo(data);
		}

		selectList(vo,dataVo);
		return "lionsclubs/com/MM2/MM2_4/MM2_27/MM2_27";
	}

	@RequestMapping("/MM2/MM2_4/MM2_27/fileInfoPopup.do")
	public String fileInfoPopup(ModelMap model, @ModelAttribute("MM2_27VO_FILE") MM2_27VO_FILE vo) throws Exception{
		return "lionsclubs/com/MM2/MM2_4/MM2_27/MM2_27_Popup_FileDownload";
	}

	@RequestMapping("/MM2/MM2_4/MM2_27/fileInfoUpload.dox")
	public ModelAndView fileInfoUpload(HttpServletRequest request, @ModelAttribute("MM2_27VO_FILE") MM2_27VO_FILE vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
	
		model.put("result", service.fileInfoUpload(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}

	@RequestMapping("/MM2/MM2_4/MM2_27/insertList.dox")
	public String insertList(ModelMap model, @ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM vo , @ModelAttribute("MM2_27VO_PARAM") MM2_27VO_PARAM dataVo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		dataVo.setMemberNo(user.getId()); // 작성자 회원번호 세팅
	
		service.insertList(dataVo);

		if(vo.getConfIdnNo() != null && vo.getConfIdnNo() > 0) {
			MM2_24VO_CONF_INFO data = baseInfoService.loadConferenceBasicInfo(vo);
			vo.setConfInfo(data);
		}

		selectList(vo, dataVo);
		return "lionsclubs/com/MM2/MM2_4/MM2_27/MM2_27";
	}

	@RequestMapping("/MM2/MM2_4/MM2_27/updateList.dox")
	public String updateList(ModelMap model, @ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM vo , @ModelAttribute("MM2_27VO_PARAM") MM2_27VO_PARAM dataVo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		dataVo.setMemberNo(user.getId()); // 작성자 회원번호 세팅
	
		service.updateList(dataVo);
	
		if(vo.getConfIdnNo() != null && vo.getConfIdnNo() > 0) {
			MM2_24VO_CONF_INFO data = baseInfoService.loadConferenceBasicInfo(vo);
			vo.setConfInfo(data);
		}

		this.selectList(vo, dataVo);
		return "lionsclubs/com/MM2/MM2_4/MM2_27/MM2_27";
	}
	
	@RequestMapping("/MM2/MM2_4/MM2_27/presentation.do")
	public String presentation(ModelMap model, @ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM vo) throws Exception{

		if(vo.getConfIdnNo() != null && vo.getConfIdnNo() > 0) {
			MM2_24VO_CONF_INFO data = baseInfoService.loadConferenceBasicInfo(vo);
			vo.setConfInfo(data);
		}

		model.addAttribute("resultList", service.selectList(vo));
		
        return "lionsclubs/com/MM2/MM2_4/MM2_27/presentation";
	}
	
	@RequestMapping("/MM2/MM2_4/MM2_27/copyPopup.do")
	public String copyPopup(ModelMap model, @ModelAttribute("MM2_27VO_PARAM") MM2_27VO_PARAM vo) throws Exception{
		if(StringUtils.isEmpty(vo.getYearCode())) {
			vo.setYearCode(CommonUtil.thisSessionYear());
		}
		
		if(StringUtils.isEmpty(vo.getMonthCode())) {
			vo.setMonthCode(CommonUtil.thisMonth());
		}
		
        return "lionsclubs/com/MM2/MM2_4/MM2_27/copyPopup";
	}	
	
	@RequestMapping("/MM2/MM2_4/MM2_27/copy.do")
	public ModelAndView copy(ModelMap model, @ModelAttribute("MM2_27VO_PARAM") MM2_27VO_PARAM vo) throws Exception{
		model.put("result", service.copy(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}

	@RequestMapping("/MM2/MM2_4/MM2_27/excelDownload.do")
	public String excelDownload(@RequestParam Map<String, String> params
			,Map<String, Object> modelMap
			,@ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM vo) throws Exception {

		modelMap.put("resultList", service.selectList(vo));
		service.excelDownload(vo, modelMap);

		modelMap.put("info", baseInfoService.loadConferenceBasicInfo(vo));
		
		return "jxlsExcelView";
	}	
}
