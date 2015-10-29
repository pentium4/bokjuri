package lionsclubs.com.SM1.SM1_2.SM1_04;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.MM2.MM2_1.MM2_05.MM2_05Service;
import lionsclubs.com.MM2.MM2_1.MM2_05.MM2_05VO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.login.LoginVO;
import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class SM1_04Controller {
	@Resource private SM1_04Service service;
	@Resource private MM2_05Service mm205Service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/SM1/SM1_2/SM1_04/SM1_04.do")
	public String SM1_04(ModelMap model, @ModelAttribute("SM1_04VO") SM1_04VO vo) throws Exception{
		SM1_04VO result = service.SM1_04(vo);
		model.addAttribute("result", result);
		model.addAttribute("organCode", service.organCode(vo));	// 이전/다음 조직코드
		
		vo.setOrganCode(result.getOrganCode());
		JSONArray jarray = JSONArray.fromObject(service.memberDivisionMonthDueList(vo));
		
		model.addAttribute("memberDivisionMonthDueList", jarray);
		model.addAttribute("organHistoryCount", service.organHistoryCount(vo));
		model.addAttribute("history", service.organHistory(vo));
		model.addAttribute("organHistoryIdnNo", service.organHistoryIdnNo(vo));
		
		return "lionsclubs/com/SM1/SM1_2/SM1_04/SM1_04";
	}
	
	/**
	 * 신규조직 추가/수정 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_2/SM1_04/organPopup.do")
	public String organPopup(ModelMap model, @ModelAttribute("SM1_04VO") SM1_04VO vo) throws Exception{
		
		if(vo.getOrganCode() != null){
			model.addAttribute("SM1_04VO", service.SM1_04(vo));
		}

		model.addAttribute("memberDivisionMonthDueList", service.memberDivisionMonthDueList(vo));
		
		return "lionsclubs/com/SM1/SM1_2/SM1_04/organPopup";
	}
	
	/**
	 * 조직추가
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_2/SM1_04/organInsert.do")
	public ModelAndView organInsert(HttpServletRequest request, @ModelAttribute("SM1_04VO") SM1_04VO vo) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		// 등록번호가 존재하면
		if(service.registerNoCount(vo) > 0 && StringUtils.isNotEmpty(vo.getRegisterNo())){
			model.put("result", false);
		// 등록번호가 존재하지 않으면
		} else {
			// 회원구분별 월회비 삭제 및 입력
			service.memberDivisionMonthDueInsert(vo);
			
			service.organInsert(vo);
			model.put("result", true);
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 조직수정
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_2/SM1_04/organUpdate.do")
	public ModelAndView organUpdate(HttpServletRequest request, @ModelAttribute("SM1_04VO") SM1_04VO vo) throws Exception{

		
		Map<String, Object> model = new HashMap<String, Object>();
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		// 등록번호가 존재하면
		if(service.registerNoCount(vo) > 0 && StringUtils.isNotEmpty(vo.getRegisterNo())){
			model.put("result", false);
		// 등록번호가 존재하지 않으면
		} else {
			// 회원구분별 월회비 삭제 및 입력
			service.memberDivisionMonthDueInsert(vo);
			
			model.put("result", service.organUpdate(vo));
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 조직삭제
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_2/SM1_04/organDelete.do")
	public ModelAndView organDelete(HttpServletRequest request, @ModelAttribute("SM1_04VO") SM1_04VO vo) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		service.organDelete(vo);
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}	
	
	
	/**
	 * 조직코드 체크
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_2/SM1_04/organCodeCheck.do")
	public ModelAndView organCodeCheck(HttpServletRequest request, @ModelAttribute("SM1_04VO") SM1_04VO vo) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("result", service.organCodeCheck(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}	
	
	/**
	 * 조직변동 추가/수정 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_2/SM1_04/organHistotyPopup.do")
	public String organHistoryPopup(ModelMap model, @ModelAttribute("SM1_04VO") SM1_04VO vo) throws Exception{
		
		SM1_04VO history = service.organHistory(vo);
		if(history != null){
			model.addAttribute("SM1_04VO", history);	
		}
		
		return "lionsclubs/com/SM1/SM1_2/SM1_04/organHistotyPopup";
	}	
	
	/**
	 * 조직변동 추가
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_2/SM1_04/organHistoryInsert.do")
	public ModelAndView organHistoryInsert(HttpServletRequest request, @ModelAttribute("SM1_04VO") SM1_04VO vo) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		model.put("result", service.organHistoryInsert(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}	
	
	/**
	 * 조직변동 수정
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_2/SM1_04/organHistoryUpdate.do")
	public ModelAndView organHistoryUpdate(HttpServletRequest request, @ModelAttribute("SM1_04VO") SM1_04VO vo) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		model.put("result", service.organHistoryUpdate(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}	
	
	/**
	 * 조직검색
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_2/SM1_04/organSearchPopup.do")
	public String organSearchPopup(ModelMap model, @ModelAttribute("SM1_04VO") SM1_04VO vo) throws Exception{
		
		Page page = service.organSearchList(vo);
        model.addAttribute("resultList", page.getResultList());
        model.addAttribute("paginationInfo", page.getPaginationInfo());
        model.addAttribute("totalCount", page.getTotalCount());
		
		return "lionsclubs/com/SM1/SM1_2/SM1_04/organSearchPopup";
	}
	
	/**
	 * 조직변동이력 삭제
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_2/SM1_04/organHistoryDelete.do")
	public ModelAndView organHistoryDelete(HttpServletRequest request, @ModelAttribute("SM1_04VO") SM1_04VO vo) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("result", service.organHistoryDelete(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 대표수상리스트
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_2/SM1_04/organAward.do")
	public ModelAndView organAward(HttpServletRequest request, @ModelAttribute("SM1_04VO") SM1_04VO vo) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		MM2_05VO mm205vo = new MM2_05VO();
		mm205vo.setOrganCode(vo.getOrganCode());
		
		String year = CommonUtil.dateToSessionYear(vo.getChangeDate());
		mm205vo.setSessionYear(year);
		model.put("resultList", mm205Service.List(mm205vo));
		
		return new ModelAndView(ajaxMainView, model);
	}		
}
