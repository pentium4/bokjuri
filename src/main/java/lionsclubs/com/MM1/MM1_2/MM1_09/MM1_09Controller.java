package lionsclubs.com.MM1.MM1_2.MM1_09;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.MM3.MM3_12.MM3_46.MM3_46VO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.include.profile.ProfileService;
import lionsclubs.com.include.profile.ProfileVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

@Controller
//@SessionAttributes("MM1_09VO")
public class MM1_09Controller {
	@Resource private MM1_09Service service;
	@Resource private ProfileService serviceprofile;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM1/MM1_2/MM1_09/MM1_09.do")
	public String MM1_09(ModelMap model, @ModelAttribute("profileVO") ProfileVO pvo, @ModelAttribute("MM1_09VO") MM1_09VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/*
		 * 회원정보
		 */
		pvo.setMemberNo(vo.getMemberNo());
		pvo.setRnum(vo.getRnum());		
		pvo = serviceprofile.profile(pvo);
		model.addAttribute("profile", pvo);
		
		/*
		 * ETC
		 */
		vo.setMemberNo(pvo.getMemberNo());
		vo.setOrganCode(pvo.getSectorClubCode());
		
		/*
		 * 리스트
		 */
		List<MM1_09VO> resultList = service.List(vo);
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
        model.addAttribute("paymentSum", service.SelectPaymentSum(vo));			/* 회기 누계 : 납부금 총금액이 출력되야해서 따로 SUM값을 가져옴 */
		/*
		 * 분류항목코드 : classItemCode
		 */
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("gubn", "A");
        model.addAttribute("classList", service.SelectClassList(map));
        
        map.put("organCode", vo.getOrganCode());
        model.addAttribute("cdate", service.SelectCDate(map));
        
		return "lionsclubs/com/MM1/MM1_2/MM1_09/MM1_09";
	}
	
	@RequestMapping("/MM1/MM1_2/MM1_09/Select.do")
	public ModelAndView select(HttpServletRequest request, @ModelAttribute("MM1_09VO") MM1_09VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("sdata", service.Select(vo));
		model.put("result", true);	
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 납부금 - 입력
	 */
	@RequestMapping("/MM1/MM1_2/MM1_09/insert.do")
	public ModelAndView insert(HttpServletRequest request, @ModelAttribute("MM1_09VO") MM1_09VO vo, SessionStatus status) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		/*
		 * 부과/납부 상태 : 8500
		 * 납부금은 무조건 납부상태로 저장 됨. (부과 상태가 없음)
		 */
//		vo.setStampCode("1010");	
		model.put("result", service.insert(vo));
		status.isComplete();
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 납부금 - 수정
	 */
	@RequestMapping("/MM1/MM1_2/MM1_09/update.do")
	public ModelAndView update(HttpServletRequest request, @ModelAttribute("MM1_09VO") MM1_09VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("result", service.update(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 납부금 - 삭제
	 */
	@RequestMapping("/MM1/MM1_2/MM1_09/delete.do")
	public ModelAndView delete(HttpServletRequest request, @ModelAttribute("MM1_09VO") MM1_09VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("result", service.delete(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * select list - 세부항목코드 리스트
	 * MM1_09 - 개인납부
	 * MM2_14 - 일괄부과
	 * MM2_19 - 연간수입예산 
	 * MM2_20 - 연간지출예산
	 */
	@RequestMapping("/MM1/MM1_2/MM1_09/Code.do")
	public ModelAndView selectcode(ModelMap model, HttpServletRequest request) throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", request.getParameter("code"));
        map.put("groupCode", request.getParameter("groupCode"));
        map.put("gubn", request.getParameter("gubn"));
		model.addAttribute("selectList", service.SelectDetailList(map));
		return new ModelAndView(ajaxMainView, model);
	}
	/**
	 * MM2_14 - 일괄부과
	 * MM1_12 - 약정금
	 */
	@RequestMapping("/MM1/MM1_2/MM1_09/CodeType.do")
	public ModelAndView selectcodeType(ModelMap model, HttpServletRequest request) throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", request.getParameter("code"));
        map.put("groupCode", request.getParameter("groupCode"));
        map.put("detailcode", request.getParameter("detailcode"));
        
        String rcode = (request.getParameter("returnCode") == null) ? "CODE1" : request.getParameter("returnCode");
        map.put("returnCode", rcode);
        
		model.addAttribute("selectData", service.SelectDetailType(map));
		return new ModelAndView(ajaxMainView, model);
	}	
	/**
	 * MM2_14 - 일괄부과
	 * 세부분류항목 - 회비 선택시 
	 */
	@RequestMapping("/MM1/MM1_2/MM1_14/MM1_09_MPay.do")
	public ModelAndView selectMemeberPay(ModelMap model, HttpServletRequest request) throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("memberNo", request.getParameter("memberNo"));
        map.put("organCode", request.getParameter("organCode"));
		model.addAttribute("selectData", service.SelectMemberPay(map));
		return new ModelAndView(ajaxMainView, model);
	}   

	/**
	 * 납부금 리스트
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_2/MM1_09/listPayment.do")
	public ModelAndView listPayment(ModelMap model, @ModelAttribute("MM1_09VO") MM1_09VO vo) throws Exception{
		model.put("sdata", service.Select(vo));
		model.addAttribute("resultList", service.listPayment(vo));
		model.addAttribute("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM1/MM1_2/MM1_09/payment.do")
	public ModelAndView payment(ModelMap model, @ModelAttribute("MM1_09VO") MM1_09VO vo) throws Exception{
		
//		model.addAttribute("resultList", service.payment(vo));
		model.addAttribute("result", service.payment(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}	
	
	@RequestMapping("/MM1/MM1_2/MM1_09/receiptPrintPopup.do")
	public String receiptPrintPopup(ModelMap model, @ModelAttribute("MM1_09VO") MM1_09VO vo) throws Exception{
		
		MM1_09VO result = service.objectPayment(vo);
		model.put("result", result);
		vo.setOrganCode(result.getOrganCode());
		model.put("treasurer", service.objectTreasurer(vo));
		
		return "lionsclubs/com/MM1/MM1_2/MM1_09/receiptPrintPopup";
	}
}
