package lionsclubs.com.MM1.MM1_2.MM1_12;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.include.profile.ProfileService;
import lionsclubs.com.include.profile.ProfileVO;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM1_12Controller {
	@Resource private MM1_12Service service;
	@Resource private ProfileService serviceprofile;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/MM1/MM1_2/MM1_12/MM1_12.do")
	public String MM1_12(ModelMap model, @ModelAttribute("profileVO") ProfileVO pvo, @ModelAttribute("MM1_12VO") MM1_12VO vo) throws Exception{
		
		/*
		 * 회원정보
		 */
		pvo.setMemberNo(vo.getMemberNo());
		pvo.setRnum(vo.getRnum());		
		pvo = serviceprofile.profile(pvo);
		model.addAttribute("profile", pvo);
		
		/*
		 * 수입분류 항목 : 4100
		 * 분류항목 코드 : 1030 (봉사금:약정금)
		 */
		vo.setClassItemCode("1030");
		
		/*
		 * ETC
		 */
		vo.setMemberNo(pvo.getMemberNo());
		vo.setOrganCode(service.SelectOrganCode(vo));
		
		/*
		 * 리스트
		 */
		List<MM1_12VO> resultList = service.List(vo);
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
        
		return "lionsclubs/com/MM1/MM1_2/MM1_12/MM1_12";
	}
	
	/**
	 * 약정금 - 입력
	 */
	@RequestMapping("/MM1/MM1_2/MM1_12/Insert.do")
	public ModelAndView insert(HttpServletRequest request, @ModelAttribute("MM1_12VO") MM1_12VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		/*
		 * 부과/납부 상태 : 8500
		 * 약정금은 무조건 부과상태로 저장 됨. [부과상태 저장 : 경조금,분담금,약정금]
		 */
		vo.setStampCode("1000");	
		
		vo.setCaYm(vo.getGenDate().substring(0,6));
		vo.setOrganCode(service.SelectOrganCode(vo));
		vo.setImpostMemberNo(user.getId());				/* 부과자 회원번호 */
		vo.setTargetMemberNo(vo.getMemberNo());			/* 부과대상자 회원번호 */
		model.put("result", service.Insert(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 약정금 - 내용 가져오기
	 */
	@RequestMapping("/MM1/MM1_2/MM1_12/Select.do")
	public ModelAndView select(HttpServletRequest request, @ModelAttribute("MM1_12VO") MM1_12VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("sdata", service.Select(vo));
		model.put("result", true);	
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 약정금 - 수정
	 */
	@RequestMapping("/MM1/MM1_2/MM1_12/Update.do")
	public ModelAndView update(HttpServletRequest request, @ModelAttribute("MM1_12VO") MM1_12VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		//vo.setOrganCode(service.SelectOrganCode(vo));
		String confirm_yn = service.Update(vo);
		if("N".equals(confirm_yn)){
			model.put("result", true);	
		}else if("E".equals(confirm_yn)){
			model.put("result", false);	
			model.put("message", vo.getCaYm()+ "(회기년월)의 환율데이터가 없으므로 입력이 불가합니다.");	
		}else{
			model.put("result", false);	
			model.put("message", vo.getCaYm()+ "(회기년월) 정산이 확정되어 입력이 불가합니다.");	
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 약정금 - 삭제
	 */
	@RequestMapping("/MM1/MM1_2/MM1_12/Delete.do")
	public ModelAndView delete(HttpServletRequest request, @ModelAttribute("MM1_12VO") MM1_12VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("result", service.Delete(vo));	
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 납부금 - 입력
	 */
	@RequestMapping("/MM1/MM1_2/MM1_12/InsertPayment.do")
	public ModelAndView insertpay(HttpServletRequest request, @ModelAttribute("MM1_12VO") MM1_12VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		/*
		 * 부과/납부 상태 : 8500
		 * 약정금은 무조건 부과상태로 저장 됨. [부과상태 저장 : 경조금,분담금,약정금]
		 */
		vo.setStampCode("1000");	
		
		String confirm_yn = service.InsertPayment(vo);
		if("N".equals(confirm_yn)){
			model.put("result", true);	
		}else{
			model.put("result", false);	
			if("Y".equals(confirm_yn)){
				model.put("message", vo.getCaYm()+ "(회기년월) 정산이 확정되어 입력이 불가합니다.");	
			}else if("A".equals(confirm_yn)){
				model.put("message", "납부할 금액이 초과되었습니다.");	
			}else{
				model.put("message", "이달의 환율 정보가 없습니다.\n 담당자에게 문의해주시기 바랍니다.");	
			}
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 납부금 - 수정
	 */
	@RequestMapping("/MM1/MM1_2/MM1_12/UpdatePayment.do")
	public ModelAndView updatepay(HttpServletRequest request, @ModelAttribute("MM1_12VO") MM1_12VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		String confirm_yn = service.UpdatePayment(vo);
		if("N".equals(confirm_yn)){
			model.put("result", true);	
		}else{
			model.put("result", false);	
			if("Y".equals(confirm_yn)){
				model.put("message", vo.getCaYm()+ "(회기년월) 정산이 확정되어 수정이 불가합니다.");	
			}else if("A".equals(confirm_yn)){
				model.put("message", "납부할 금액이 초과되었습니다.");	
			}else{
				model.put("message", "이달의 환율 정보가 없습니다.\n 담당자에게 문의해주시기 바랍니다.");	
			}
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 납부금 - 삭제
	 */
	@RequestMapping("/MM1/MM1_2/MM1_12/DeletePayment.do")
	public ModelAndView deletepay(HttpServletRequest request, @ModelAttribute("MM1_12VO") MM1_12VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		String confirm_yn = service.DeletePayment(vo);
		if("N".equals(confirm_yn)){
			model.put("result", true);	
		}else{
			model.put("result", false);	
			model.put("message", vo.getCaYm()+ "(회기년월) 정산이 확정되어 삭제가 불가합니다.");	
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
}
