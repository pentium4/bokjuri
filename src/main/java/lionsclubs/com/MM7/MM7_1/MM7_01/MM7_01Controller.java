package lionsclubs.com.MM7.MM7_1.MM7_01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.commoncode.CommonCodeService;
import lionsclubs.com.cmm.commoncode.CommonCodeVO;
import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM7_01Controller {
	@Resource private MM7_01Service service;
	@Resource private CommonCodeService commonCodeservice;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	/**
	 * 문서수신함
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM7/MM7_1/MM7_01/listReception.do")
	public String listReception(ModelMap model, @ModelAttribute("MM7_01VO") MM7_01VO vo) throws Exception{
		Page resultList = service.listReception(vo);
		
		model.addAttribute("listWriteOrganCode", service.listWriteOrganCode(vo));
        model.addAttribute("resultList", resultList.getResultList());
        model.addAttribute("paginationInfo", resultList.getPaginationInfo());
        model.addAttribute("totalCount", resultList.getTotalCount());		
		
		return "lionsclubs/com/MM7/MM7_1/MM7_01/reception";
	}
	
	/**
	 * 문서발신함
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM7/MM7_1/MM7_01/listOutgoing.do")
	public String listOutgoing(ModelMap model, @ModelAttribute("MM7_01VO") MM7_01VO vo) throws Exception{
		Page resultList = service.listOutgoing(vo);
		
		model.addAttribute("listWriteOrganCode", service.listWriteOrganCode(vo));
        model.addAttribute("resultList", resultList.getResultList());
        model.addAttribute("paginationInfo", resultList.getPaginationInfo());
        model.addAttribute("totalCount", resultList.getTotalCount());		
		
		return "lionsclubs/com/MM7/MM7_1/MM7_01/outgoing";
	}
	
	/**
	 * 내작성중 문서
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM7/MM7_1/MM7_01/listDuring.do")
	public String listDuring(ModelMap model, @ModelAttribute("MM7_01VO") MM7_01VO vo) throws Exception{
		Page resultList = service.listDuring(vo);
		
        model.addAttribute("resultList", resultList.getResultList());
        model.addAttribute("paginationInfo", resultList.getPaginationInfo());
        model.addAttribute("totalCount", resultList.getTotalCount());		
		
		return "lionsclubs/com/MM7/MM7_1/MM7_01/during";
	}	
	
	/**
	 * 문서만들기 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM7/MM7_1/MM7_01/docPopup.do")
	public String docPopup(ModelMap model, @ModelAttribute("MM7_01VO") MM7_01VO vo) throws Exception{
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		/** 회기년도 세팅 */
		vo.setSessionYear(CommonUtil.thisSessionYear());
		vo.setMemberNo(user.getId());
		vo.setClubCode(user.getClubCode());
		
		MM7_01VO result = service.objectDoc(vo);
		if(result != null){
			model.addAttribute("MM7_01VO", result);	
		}
		
		model.addAttribute("listWriteOrganCode", service.listWriteOrganCode(vo));
		model.addAttribute("listReceiveOrganCode", service.listReceiveOrganCode(vo));
		
		return "lionsclubs/com/MM7/MM7_1/MM7_01/docPopup";
	}
	
	/**
	 * 문서발신 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM7/MM7_1/MM7_01/docOutgoingDetailPopup.do")
	public String docOutgoingDetailPopup(ModelMap model, @ModelAttribute("MM7_01VO") MM7_01VO vo) throws Exception{
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMemberNo(user.getId());
		vo.setClubCode(user.getClubCode());
		
		/** 회기년도 세팅 */
		vo.setSessionYear(CommonUtil.thisSessionYear());
		
		model.addAttribute("MM7_01VO", service.objectDoc(vo));
		
		CommonCodeVO commonCodeVO = new CommonCodeVO();
		commonCodeVO.setGroupCode("9600");
		commonCodeVO.setCode("1000");
		model.addAttribute("outgoingDay", commonCodeservice.codetolabel(commonCodeVO));		
		
		return "lionsclubs/com/MM7/MM7_1/MM7_01/docOutgoingDetailPopup";
	}
	
	/**
	 * 문서수신 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM7/MM7_1/MM7_01/docReceptionDetailPopup.do")
	public String docReceiveDetailPopup(ModelMap model, @ModelAttribute("MM7_01VO") MM7_01VO vo) throws Exception{
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setMemberNo(user.getId());
		vo.setClubCode(user.getClubCode());
		
		/** 회기년도 세팅 */
		vo.setSessionYear(CommonUtil.thisSessionYear());	
		
		service.saveDocSearchMember(vo);
		model.addAttribute("MM7_01VO", service.objectDoc(vo));
		
		return "lionsclubs/com/MM7/MM7_1/MM7_01/docReceptionDetailPopup";
	}	
	
	@RequestMapping("/MM7/MM7_1/MM7_01/listOrganCode.do")
	public ModelAndView listOrganCode(HttpServletRequest request, @ModelAttribute("MM7_01VO") MM7_01VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("listOrganCode", service.listOrganCode(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM7/MM7_1/MM7_01/saveDoc.do")
	public ModelAndView saveDoc(HttpServletRequest request, @ModelAttribute("MM7_01VO") MM7_01VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("result", service.saveDoc(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM7/MM7_1/MM7_01/receivePopup.do")
	public String receivePopup(ModelMap model, @ModelAttribute("MM7_01VO") MM7_01VO vo) throws Exception{
		model.addAttribute("result", service.objectDoc(vo));
		
		List<MM7_01VO> resultList = service.listReceive(vo);
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());		
		
		return "lionsclubs/com/MM7/MM7_1/MM7_01/receivePopup";
	}
	
	@RequestMapping("/MM7/MM7_1/MM7_01/listReceiveMember.do")
	public ModelAndView listReceiveMember(HttpServletRequest request, @ModelAttribute("MM7_01VO") MM7_01VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("resultList", service.listReceiveMember(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}

	@RequestMapping("/MM7/MM7_1/MM7_01/outgoingCancel.do")
	public ModelAndView outgoingCancel(HttpServletRequest request, @ModelAttribute("MM7_01VO") MM7_01VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("result", service.updateOutgoingCancel(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM7/MM7_1/MM7_01/deleteDoc.do")
	public ModelAndView deleteDoc(HttpServletRequest request, @ModelAttribute("MM7_01VO") MM7_01VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("result", service.deleteDoc(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM7/MM7_1/MM7_01/previewPrintPopup.do")
	public String printPreviewPopup(ModelMap model, @ModelAttribute("MM7_01VO") MM7_01VO vo) throws Exception{
		model.addAttribute("result", service.objectDoc(vo));
		
		return "lionsclubs/com/MM7/MM7_1/MM7_01/previewPrintPopup";
	}
	
	/**
	 * 문서수신함
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM7/MM7_1/MM7_01/receptionAlermPopup.do")
	public String listReceptionAlermPopup(ModelMap model, @ModelAttribute("MM7_01VO") MM7_01VO vo) throws Exception{
		vo.setReadYn("N");
		Page resultList = service.listReception(vo);
		
		model.addAttribute("listWriteOrganCode", service.listWriteOrganCode(vo));
        model.addAttribute("resultList", resultList.getResultList());
        model.addAttribute("paginationInfo", resultList.getPaginationInfo());
        model.addAttribute("totalCount", resultList.getTotalCount());		
		
		return "lionsclubs/com/MM7/MM7_1/MM7_01/receptionAlermPopup";
	}	
}
